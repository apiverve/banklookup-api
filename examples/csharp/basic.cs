/*
 * Bank Lookup API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Bank Lookup API.
 * API Documentation: https://docs.apiverve.com/ref/banklookup
 */

using System;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Linq;

namespace APIVerve.Examples
{
    class BankLookupExample
    {
        private static readonly string API_KEY = Environment.GetEnvironmentVariable("APIVERVE_API_KEY") ?? "YOUR_API_KEY_HERE";
        private static readonly string API_URL = "https://api.apiverve.com/v1/banklookup";

        /// <summary>
        /// Make a GET request to the Bank Lookup API
        /// </summary>
        static async Task<JsonDocument> CallBankLookupAPI()
        {
            try
            {
                using var client = new HttpClient();
                client.DefaultRequestHeaders.Add("x-api-key", API_KEY);

                // Query parameters
                var queryParams &#x3D; new Dictionary&lt;string, string&gt; { [&quot;name&quot;] &#x3D; &quot;Wells Fargo&quot;, [&quot;id&quot;] &#x3D; &quot;fdic-3511&quot;, [&quot;fdicCert&quot;] &#x3D; &quot;3511&quot;, [&quot;ncuaCharter&quot;] &#x3D; &quot;5536&quot;, [&quot;routing&quot;] &#x3D; &quot;256074974&quot;, [&quot;swift&quot;] &#x3D; &quot;WFBIUS6S&quot;, [&quot;lei&quot;] &#x3D; &quot;KB1H1DSPRFMYMCUFXT09&quot;, [&quot;domain&quot;] &#x3D; &quot;wellsfargo.com&quot;, [&quot;iban&quot;] &#x3D; &quot;GB29NWBK60161331926819&quot;, [&quot;state&quot;] &#x3D; &quot;CA&quot;, [&quot;type&quot;] &#x3D; &quot;credit_union&quot;, [&quot;status&quot;] &#x3D; &quot;any&quot;, [&quot;country&quot;] &#x3D; &quot;GB&quot;, [&quot;limit&quot;] &#x3D; 10 };

                var queryString = string.Join("&",
                    queryParams.Select(kvp => $"{kvp.Key}={Uri.EscapeDataString(kvp.Value)}"));
                var url = $"{API_URL}?{queryString}";

                var response = await client.GetAsync(url);

                // Check if response is successful
                response.EnsureSuccessStatusCode();

                var responseBody = await response.Content.ReadAsStringAsync();
                var data = JsonDocument.Parse(responseBody);

                // Check API response status
                if (data.RootElement.GetProperty("status").GetString() == "ok")
                {
                    Console.WriteLine("✓ Success!");
                    Console.WriteLine("Response data: " + data.RootElement.GetProperty("data"));
                    return data;
                }
                else
                {
                    var error = data.RootElement.TryGetProperty("error", out var errorProp)
                        ? errorProp.GetString()
                        : "Unknown error";
                    Console.WriteLine($"✗ API Error: {error}");
                    return null;
                }
            }
            catch (HttpRequestException e)
            {
                Console.WriteLine($"✗ Request failed: {e.Message}");
                return null;
            }
        }

        static async Task Main(string[] args)
        {
            Console.WriteLine("📤 Calling Bank Lookup API...\n");

            var result = await CallBankLookupAPI();

            if (result != null)
            {
                Console.WriteLine("\n📊 Final Result:");
                Console.WriteLine(result.RootElement.GetProperty("data"));
            }
            else
            {
                Console.WriteLine("\n✗ API call failed");
            }
        }
    }
}
