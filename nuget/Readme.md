Bank Lookup API
============

Bank Lookup is a bank and credit union lookup API covering every FDIC-insured institution ever chartered and every federally insured credit union. Search by name, FDIC certificate, NCUA charter, routing number, SWIFT code, LEI, website domain or IBAN and get the status, headquarters, regulator and identifiers, while paid plans add the successor of merged charters, failure details, the LEI, assets, deposits, members and full branch lists.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.BankLookup.svg)](https://www.nuget.org/packages/APIVerve.API.BankLookup)

This is a .NET wrapper for the [Bank Lookup API](https://apiverve.com/marketplace/banklookup?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.BankLookup
```

Using the Package Manager:
```
nuget install APIVerve.API.BankLookup
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.BankLookup
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.BankLookup"
5. Click on the APIVerve.API.BankLookup package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Bank Lookup API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.BankLookup;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]");

        var queryOptions = new BankLookupQueryOptions {
            Name = "Wells Fargo",
            Id = "fdic-3511",
            FdicCert = "3511",
            NcuaCharter = "5536",
            Routing = "256074974",
            Swift = "WFBIUS6S",
            Lei = "KB1H1DSPRFMYMCUFXT09",
            Domain = "wellsfargo.com",
            Iban = "GB29NWBK60161331926819",
            State = "CA",
            Type = "credit_union",
            Status = "any",
            Country = "GB",
            Branches = true,
            Limit = 10
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Bank Lookup API documentation is found here: [https://docs.apiverve.com/ref/banklookup](https://docs.apiverve.com/ref/banklookup?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Bank Lookup API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.BankLookup;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]");

        var queryOptions = new BankLookupQueryOptions {
            Name = "Wells Fargo",
            Id = "fdic-3511",
            FdicCert = "3511",
            NcuaCharter = "5536",
            Routing = "256074974",
            Swift = "WFBIUS6S",
            Lei = "KB1H1DSPRFMYMCUFXT09",
            Domain = "wellsfargo.com",
            Iban = "GB29NWBK60161331926819",
            State = "CA",
            Type = "credit_union",
            Status = "any",
            Country = "GB",
            Branches = true,
            Limit = 10
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.BankLookup;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]");

        var queryOptions = new BankLookupQueryOptions {
            Name = "Wells Fargo",
            Id = "fdic-3511",
            FdicCert = "3511",
            NcuaCharter = "5536",
            Routing = "256074974",
            Swift = "WFBIUS6S",
            Lei = "KB1H1DSPRFMYMCUFXT09",
            Domain = "wellsfargo.com",
            Iban = "GB29NWBK60161331926819",
            State = "CA",
            Type = "credit_union",
            Status = "any",
            Country = "GB",
            Branches = true,
            Limit = 10
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.BankLookup;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]");

        var queryOptions = new BankLookupQueryOptions {
            Name = "Wells Fargo",
            Id = "fdic-3511",
            FdicCert = "3511",
            NcuaCharter = "5536",
            Routing = "256074974",
            Swift = "WFBIUS6S",
            Lei = "KB1H1DSPRFMYMCUFXT09",
            Domain = "wellsfargo.com",
            Iban = "GB29NWBK60161331926819",
            State = "CA",
            Type = "credit_union",
            Status = "any",
            Country = "GB",
            Branches = true,
            Limit = 10
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.BankLookup;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new BankLookupQueryOptions {
            Name = "Wells Fargo",
            Id = "fdic-3511",
            FdicCert = "3511",
            NcuaCharter = "5536",
            Routing = "256074974",
            Swift = "WFBIUS6S",
            Lei = "KB1H1DSPRFMYMCUFXT09",
            Domain = "wellsfargo.com",
            Iban = "GB29NWBK60161331926819",
            State = "CA",
            Type = "credit_union",
            Status = "any",
            Country = "GB",
            Branches = true,
            Limit = 10
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new BankLookupQueryOptions {
    Name = "Wells Fargo",
    Id = "fdic-3511",
    FdicCert = "3511",
    NcuaCharter = "5536",
    Routing = "256074974",
    Swift = "WFBIUS6S",
    Lei = "KB1H1DSPRFMYMCUFXT09",
    Domain = "wellsfargo.com",
    Iban = "GB29NWBK60161331926819",
    State = "CA",
    Type = "credit_union",
    Status = "any",
    Country = "GB",
    Branches = true,
    Limit = 10
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new BankLookupQueryOptions {
    Name = "Wells Fargo",
    Id = "fdic-3511",
    FdicCert = "3511",
    NcuaCharter = "5536",
    Routing = "256074974",
    Swift = "WFBIUS6S",
    Lei = "KB1H1DSPRFMYMCUFXT09",
    Domain = "wellsfargo.com",
    Iban = "GB29NWBK60161331926819",
    State = "CA",
    Type = "credit_union",
    Status = "any",
    Country = "GB",
    Branches = true,
    Limit = 10
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new BankLookupQueryOptions {
    Name = "Wells Fargo",
    Id = "fdic-3511",
    FdicCert = "3511",
    NcuaCharter = "5536",
    Routing = "256074974",
    Swift = "WFBIUS6S",
    Lei = "KB1H1DSPRFMYMCUFXT09",
    Domain = "wellsfargo.com",
    Iban = "GB29NWBK60161331926819",
    State = "CA",
    Type = "credit_union",
    Status = "any",
    Country = "GB",
    Branches = true,
    Limit = 10
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new BankLookupQueryOptions {
    Name = "Wells Fargo",
    Id = "fdic-3511",
    FdicCert = "3511",
    NcuaCharter = "5536",
    Routing = "256074974",
    Swift = "WFBIUS6S",
    Lei = "KB1H1DSPRFMYMCUFXT09",
    Domain = "wellsfargo.com",
    Iban = "GB29NWBK60161331926819",
    State = "CA",
    Type = "credit_union",
    Status = "any",
    Country = "GB",
    Branches = true,
    Limit = 10
};

using (var apiClient = new BankLookupAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
