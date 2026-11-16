/// Response models for the Bank Lookup API.

/// API Response wrapper.
class BanklookupResponse {
  final String status;
  final dynamic error;
  final BanklookupData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  BanklookupResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory BanklookupResponse.fromJson(Map<String, dynamic> json) => BanklookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? BanklookupData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Bank Lookup API.

class BanklookupData {
  num? count;
  num? totalMatches;
  List<BanklookupDataBanksItem>? banks;
  dynamic routingCheck;
  dynamic ibanCheck;

  BanklookupData({
    this.count,
    this.totalMatches,
    this.banks,
    this.routingCheck,
    this.ibanCheck,
  });

  factory BanklookupData.fromJson(Map<String, dynamic> json) => BanklookupData(
      count: json['count'],
      totalMatches: json['totalMatches'],
      banks: (json['banks'] as List?)?.map((e) => BanklookupDataBanksItem.fromJson(e)).toList(),
      routingCheck: json['routingCheck'],
      ibanCheck: json['ibanCheck'],
    );
}

class BanklookupDataBanksItem {
  String? id;
  String? name;
  List<String>? aliases;
  String? type;
  String? charterClass;
  String? status;
  dynamic statusDate;
  dynamic successor;
  String? establishedDate;
  num? foundedYear;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? county;
  String? country;
  num? latitude;
  num? longitude;
  String? coordinatesSource;
  String? website;
  String? domain;
  dynamic phone;
  String? regulator;
  String? insurer;
  num? fdicCert;
  dynamic ncuaCharter;
  num? rssdId;
  String? lei;
  String? holdingCompany;
  List<String>? routingNumbers;
  List<String>? swiftCodes;
  num? branchCount;
  num? totalAssets;
  num? totalDeposits;
  num? netIncomeYtd;
  dynamic members;
  String? financialsAsOf;
  dynamic failure;

  BanklookupDataBanksItem({
    this.id,
    this.name,
    this.aliases,
    this.type,
    this.charterClass,
    this.status,
    this.statusDate,
    this.successor,
    this.establishedDate,
    this.foundedYear,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.county,
    this.country,
    this.latitude,
    this.longitude,
    this.coordinatesSource,
    this.website,
    this.domain,
    this.phone,
    this.regulator,
    this.insurer,
    this.fdicCert,
    this.ncuaCharter,
    this.rssdId,
    this.lei,
    this.holdingCompany,
    this.routingNumbers,
    this.swiftCodes,
    this.branchCount,
    this.totalAssets,
    this.totalDeposits,
    this.netIncomeYtd,
    this.members,
    this.financialsAsOf,
    this.failure,
  });

  factory BanklookupDataBanksItem.fromJson(Map<String, dynamic> json) => BanklookupDataBanksItem(
      id: json['id'],
      name: json['name'],
      aliases: (json['aliases'] as List?)?.cast<String>(),
      type: json['type'],
      charterClass: json['charterClass'],
      status: json['status'],
      statusDate: json['statusDate'],
      successor: json['successor'],
      establishedDate: json['establishedDate'],
      foundedYear: json['foundedYear'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      county: json['county'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      coordinatesSource: json['coordinatesSource'],
      website: json['website'],
      domain: json['domain'],
      phone: json['phone'],
      regulator: json['regulator'],
      insurer: json['insurer'],
      fdicCert: json['fdicCert'],
      ncuaCharter: json['ncuaCharter'],
      rssdId: json['rssdId'],
      lei: json['lei'],
      holdingCompany: json['holdingCompany'],
      routingNumbers: (json['routingNumbers'] as List?)?.cast<String>(),
      swiftCodes: (json['swiftCodes'] as List?)?.cast<String>(),
      branchCount: json['branchCount'],
      totalAssets: json['totalAssets'],
      totalDeposits: json['totalDeposits'],
      netIncomeYtd: json['netIncomeYtd'],
      members: json['members'],
      financialsAsOf: json['financialsAsOf'],
      failure: json['failure'],
    );
}

class BanklookupRequest {
  String? name;
  String? id;
  String? fdicCert;
  String? ncuaCharter;
  String? routing;
  String? swift;
  String? lei;
  String? domain;
  String? iban;
  String? state;
  String? type;
  String? status;
  String? country;
  bool? branches;
  int? limit;

  BanklookupRequest({
    this.name,
    this.id,
    this.fdicCert,
    this.ncuaCharter,
    this.routing,
    this.swift,
    this.lei,
    this.domain,
    this.iban,
    this.state,
    this.type,
    this.status,
    this.country,
    this.branches,
    this.limit,
  });

  Map<String, dynamic> toJson() => {
      if (name != null) 'name': name,
      if (id != null) 'id': id,
      if (fdicCert != null) 'fdicCert': fdicCert,
      if (ncuaCharter != null) 'ncuaCharter': ncuaCharter,
      if (routing != null) 'routing': routing,
      if (swift != null) 'swift': swift,
      if (lei != null) 'lei': lei,
      if (domain != null) 'domain': domain,
      if (iban != null) 'iban': iban,
      if (state != null) 'state': state,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (country != null) 'country': country,
      if (branches != null) 'branches': branches,
      if (limit != null) 'limit': limit,
    };
}
