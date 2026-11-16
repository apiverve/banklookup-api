import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class BanklookupValidationException implements Exception {
  final List<String> errors;

  BanklookupValidationException(this.errors);

  @override
  String toString() => 'BanklookupValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Bank Lookup API client.
///
/// For more information, visit: https://apiverve.com/marketplace/banklookup?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [name] - Institution name or part of it; former and trade names match too [maxLength: 120]
/// * [id] - Our institution id, e.g. fdic-3511 or ncua-5536 [maxLength: 30]
/// * [fdicCert] - FDIC certificate number [maxLength: 10]
/// * [ncuaCharter] - NCUA credit union charter number [maxLength: 10]
/// * [routing] - Nine-digit ABA routing number [minLength: 9, maxLength: 9]
/// * [swift] - SWIFT/BIC code (8 or 11 characters); non-US codes answer from our SWIFT directory [minLength: 8, maxLength: 11]
/// * [lei] - Legal Entity Identifier (20 characters) [minLength: 20, maxLength: 20]
/// * [domain] - Website domain, URL or email address of the institution [maxLength: 253]
/// * [iban] - IBAN; names the bank where the IBAN carries a BIC-style bank code (GB, IE, NL and others) [maxLength: 42]
/// * [state] - Two-letter US state of the headquarters, to narrow a name search [minLength: 2, maxLength: 2]
/// * [type] - Narrow a name search to one institution type
/// * [status] - active, inactive (merged, failed or closed) or any; any searches active institutions first and falls back to closed ones
/// * [country] - Two-letter country code; a non-US country searches banks by name in our SWIFT directory [minLength: 2, maxLength: 2]
/// * [branches] - Include the branch list for the first five institutions
/// * [limit] - Maximum institutions to return (1-50) [min: 1, max: 50]
class BanklookupClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'name': ValidationRule(type: 'string', required: false, maxLength: 120),
    'id': ValidationRule(type: 'string', required: false, maxLength: 30),
    'fdicCert': ValidationRule(type: 'string', required: false, maxLength: 10),
    'ncuaCharter': ValidationRule(type: 'string', required: false, maxLength: 10),
    'routing': ValidationRule(type: 'string', required: false, minLength: 9, maxLength: 9),
    'swift': ValidationRule(type: 'string', required: false, minLength: 8, maxLength: 11),
    'lei': ValidationRule(type: 'string', required: false, minLength: 20, maxLength: 20),
    'domain': ValidationRule(type: 'string', required: false, maxLength: 253),
    'iban': ValidationRule(type: 'string', required: false, maxLength: 42),
    'state': ValidationRule(type: 'string', required: false, minLength: 2, maxLength: 2),
    'type': ValidationRule(type: 'string', required: false),
    'status': ValidationRule(type: 'string', required: false),
    'country': ValidationRule(type: 'string', required: false, minLength: 2, maxLength: 2),
    'branches': ValidationRule(type: 'boolean', required: false),
    'limit': ValidationRule(type: 'integer', required: false, min: 1, max: 50),
  };

  BanklookupClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/banklookup',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [BanklookupValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw BanklookupValidationException(errors);
    }
  }

  /// Execute a request to the Bank Lookup API.
  ///
  /// Parameters are validated before sending the request.
  Future<BanklookupResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw BanklookupException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return BanklookupResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw BanklookupException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw BanklookupException('Resource not found');
      } else {
        throw BanklookupException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is BanklookupException) rethrow;
      throw BanklookupException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Bank Lookup API client.
class BanklookupException implements Exception {
  final String message;

  BanklookupException(this.message);

  @override
  String toString() => 'BanklookupException: $message';
}
