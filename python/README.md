Bank Lookup API
============

Bank Lookup is a bank and credit union lookup API covering every FDIC-insured institution ever chartered and every federally insured credit union. Search by name, FDIC certificate, NCUA charter, routing number, SWIFT code, LEI, website domain or IBAN and get the status, headquarters, regulator and identifiers, while paid plans add the successor of merged charters, failure details, the LEI, assets, deposits, members and full branch lists.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-banklookup.svg)](https://pypi.org/project/apiverve-banklookup/)

This is a Python wrapper for the [Bank Lookup API](https://apiverve.com/marketplace/banklookup?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-banklookup
```

Using `pip3`:

```bash
pip3 install apiverve-banklookup
```

---

## Configuration

Before using the Bank Lookup API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_banklookup.apiClient import BanklookupAPIClient

# Initialize the client with your APIVerve API key
api = BanklookupAPIClient("[YOUR_API_KEY]")

query = {
    "name": "Wells Fargo",
    "id": "fdic-3511",
    "fdicCert": "3511",
    "ncuaCharter": "5536",
    "routing": "256074974",
    "swift": "WFBIUS6S",
    "lei": "KB1H1DSPRFMYMCUFXT09",
    "domain": "wellsfargo.com",
    "iban": "GB29NWBK60161331926819",
    "state": "CA",
    "type": "credit_union",
    "status": "any",
    "country": "GB",
    "branches": true,
    "limit": 10
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Bank Lookup API documentation is found here: [https://docs.apiverve.com/ref/banklookup](https://docs.apiverve.com/ref/banklookup?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_banklookup.apiClient import BanklookupAPIClient

# Initialize the client with your APIVerve API key
api = BanklookupAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "name": "Wells Fargo",
    "id": "fdic-3511",
    "fdicCert": "3511",
    "ncuaCharter": "5536",
    "routing": "256074974",
    "swift": "WFBIUS6S",
    "lei": "KB1H1DSPRFMYMCUFXT09",
    "domain": "wellsfargo.com",
    "iban": "GB29NWBK60161331926819",
    "state": "CA",
    "type": "credit_union",
    "status": "any",
    "country": "GB",
    "branches": true,
    "limit": 10
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

## Error Handling

The API client provides comprehensive error handling through the `BanklookupAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_banklookup.apiClient import BanklookupAPIClient, BanklookupAPIClientError

api = BanklookupAPIClient("[YOUR_API_KEY]")

query = {
    "name": "Wells Fargo",
    "id": "fdic-3511",
    "fdicCert": "3511",
    "ncuaCharter": "5536",
    "routing": "256074974",
    "swift": "WFBIUS6S",
    "lei": "KB1H1DSPRFMYMCUFXT09",
    "domain": "wellsfargo.com",
    "iban": "GB29NWBK60161331926819",
    "state": "CA",
    "type": "credit_union",
    "status": "any",
    "country": "GB",
    "branches": true,
    "limit": 10
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except BanklookupAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_banklookup.apiClient import BanklookupAPIClient, BanklookupAPIClientError

api = BanklookupAPIClient("[YOUR_API_KEY]")

query = {
    "name": "Wells Fargo",
    "id": "fdic-3511",
    "fdicCert": "3511",
    "ncuaCharter": "5536",
    "routing": "256074974",
    "swift": "WFBIUS6S",
    "lei": "KB1H1DSPRFMYMCUFXT09",
    "domain": "wellsfargo.com",
    "iban": "GB29NWBK60161331926819",
    "state": "CA",
    "type": "credit_union",
    "status": "any",
    "country": "GB",
    "branches": true,
    "limit": 10
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except BanklookupAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_banklookup.apiClient import BanklookupAPIClient, BanklookupAPIClientError

query = {
    "name": "Wells Fargo",
    "id": "fdic-3511",
    "fdicCert": "3511",
    "ncuaCharter": "5536",
    "routing": "256074974",
    "swift": "WFBIUS6S",
    "lei": "KB1H1DSPRFMYMCUFXT09",
    "domain": "wellsfargo.com",
    "iban": "GB29NWBK60161331926819",
    "state": "CA",
    "type": "credit_union",
    "status": "any",
    "country": "GB",
    "branches": true,
    "limit": 10
}

# Using context manager ensures proper cleanup
with BanklookupAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except BanklookupAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_banklookup.apiClient import BanklookupAPIClient

# Enable debug mode
api = BanklookupAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "name": "Wells Fargo",
    "id": "fdic-3511",
    "fdicCert": "3511",
    "ncuaCharter": "5536",
    "routing": "256074974",
    "swift": "WFBIUS6S",
    "lei": "KB1H1DSPRFMYMCUFXT09",
    "domain": "wellsfargo.com",
    "iban": "GB29NWBK60161331926819",
    "state": "CA",
    "type": "credit_union",
    "status": "any",
    "country": "GB",
    "branches": true,
    "limit": 10
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_banklookup.apiClient import BanklookupAPIClient

api = BanklookupAPIClient("[YOUR_API_KEY]")

query = {
    "name": "Wells Fargo",
    "id": "fdic-3511",
    "fdicCert": "3511",
    "ncuaCharter": "5536",
    "routing": "256074974",
    "swift": "WFBIUS6S",
    "lei": "KB1H1DSPRFMYMCUFXT09",
    "domain": "wellsfargo.com",
    "iban": "GB29NWBK60161331926819",
    "state": "CA",
    "type": "credit_union",
    "status": "any",
    "country": "GB",
    "branches": true,
    "limit": 10
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
