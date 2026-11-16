# Bank Lookup API - PHP Package

Bank Lookup is a bank and credit union lookup API covering every FDIC-insured institution ever chartered and every federally insured credit union. Search by name, FDIC certificate, NCUA charter, routing number, SWIFT code, LEI, website domain or IBAN and get the status, headquarters, regulator and identifiers, while paid plans add the successor of merged charters, failure details, the LEI, assets, deposits, members and full branch lists.

## Installation

Install via Composer:

```bash
composer require apiverve/banklookup
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Banklookup\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'name' => 'Wells Fargo',
    'id' => 'fdic-3511',
    'fdicCert' => '3511',
    'ncuaCharter' => '5536',
    'routing' => '256074974',
    'swift' => 'WFBIUS6S',
    'lei' => 'KB1H1DSPRFMYMCUFXT09',
    'domain' => 'wellsfargo.com',
    'iban' => 'GB29NWBK60161331926819',
    'state' => 'CA',
    'type' => 'credit_union',
    'status' => 'any',
    'country' => 'GB',
    'branches' => true,
    'limit' => 10
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Banklookup\Client;
use APIVerve\Banklookup\Exceptions\APIException;
use APIVerve\Banklookup\Exceptions\ValidationException;

try {
    $response = $client->execute(['name' => 'Wells Fargo', 'id' => 'fdic-3511', 'fdicCert' => '3511', 'ncuaCharter' => '5536', 'routing' => '256074974', 'swift' => 'WFBIUS6S', 'lei' => 'KB1H1DSPRFMYMCUFXT09', 'domain' => 'wellsfargo.com', 'iban' => 'GB29NWBK60161331926819', 'state' => 'CA', 'type' => 'credit_union', 'status' => 'any', 'country' => 'GB', 'branches' => true, 'limit' => 10]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "count": 1,
    "totalMatches": 3,
    "banks": [
      {
        "id": "fdic-3511",
        "name": "Wells Fargo Bank, National Association",
        "aliases": [
          "Crocker National Bank",
          "Crocker-Citizens National Bank",
          "Crocker-Anglo National Bank",
          "Crocker First National Bank of San Francisco"
        ],
        "type": "bank",
        "charterClass": "National bank (OCC)",
        "status": "active",
        "statusDate": null,
        "successor": null,
        "establishedDate": "1870-01-01",
        "foundedYear": 1870,
        "address": "3201 N 4th Ave",
        "city": "Sioux Falls",
        "state": "SD",
        "zip": "57104",
        "county": "Minnehaha",
        "country": "US",
        "latitude": 43.580844403981,
        "longitude": -96.722917126828,
        "coordinatesSource": "fdic",
        "website": "https://www.wellsfargo.com",
        "domain": "wellsfargo.com",
        "phone": null,
        "regulator": "OCC",
        "insurer": "FDIC",
        "fdicCert": 3511,
        "ncuaCharter": null,
        "rssdId": 451965,
        "lei": "KB1H1DSPRFMYMCUFXT09",
        "holdingCompany": "WELLS FARGO&COMPANY",
        "routingNumbers": [
          "121000248"
        ],
        "swiftCodes": [
          "WFBIUS6S"
        ],
        "branchCount": 4161,
        "totalAssets": 1907928000000,
        "totalDeposits": 1563534000000,
        "netIncomeYtd": 12808000000,
        "members": null,
        "financialsAsOf": "2026-06-30",
        "failure": null
      }
    ],
    "routingCheck": null,
    "ibanCheck": null
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/banklookup?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/banklookup?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/banklookup?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
