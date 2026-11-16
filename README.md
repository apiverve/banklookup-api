# [Bank Lookup API](https://apiverve.com/marketplace/banklookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

Bank Lookup is a bank and credit union lookup API covering every FDIC-insured institution ever chartered and every federally insured credit union. Search by name, FDIC certificate, NCUA charter, routing number, SWIFT code, LEI, website domain or IBAN and get the status, headquarters, regulator and identifiers, while paid plans add the successor of merged charters, failure details, the LEI, assets, deposits, members and full branch lists.

The Bank Lookup API provides a simple, reliable way to integrate bank lookup functionality into your applications. Built for developers who need production-ready bank lookup capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/banklookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/banklookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/banklookup)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.BankLookup)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-banklookup/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_banklookup)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/banklookup)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_banklookup)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callBankLookupAPI() {
    try {
        const params = new URLSearchParams({
            name: 'Wells Fargo',
            id: 'fdic-3511',
            fdicCert: '3511',
            ncuaCharter: '5536',
            routing: '256074974',
            swift: 'WFBIUS6S',
            lei: 'KB1H1DSPRFMYMCUFXT09',
            domain: 'wellsfargo.com',
            iban: 'GB29NWBK60161331926819',
            state: 'CA',
            type: 'credit_union',
            status: 'any',
            country: 'GB',
            limit: 10
        });

        const response = await fetch(`https://api.apiverve.com/v1/banklookup?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callBankLookupAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/banklookup?name=Wells%20Fargo&id=fdic-3511&fdicCert=3511&ncuaCharter=5536&routing=256074974&swift=WFBIUS6S&lei=KB1H1DSPRFMYMCUFXT09&domain=wellsfargo.com&iban=GB29NWBK60161331926819&state=CA&type=credit_union&status=any&country=GB&limit=10" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/banklookup
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/banklookup) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.BankLookup
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.BankLookup) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-banklookup
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-banklookup/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_banklookup
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_banklookup) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/banklookup
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/banklookup) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_banklookup
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_banklookup) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:banklookup-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/banklookup-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Bank Lookup API](https://apiverve.com/marketplace/banklookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/banklookup](https://docs.apiverve.com/ref/banklookup)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Bank Lookup API is commonly used for:

- **Web Applications** - Add bank lookup features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with bank lookup capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Bank Lookup API:

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

---

## Support & Community

- 🏠 **API Home**: [Bank Lookup API](https://apiverve.com/marketplace/banklookup?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
