/**
 * Bank Lookup API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Bank Lookup API.
 * API Documentation: https://docs.apiverve.com/ref/banklookup
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/banklookup';

/**
 * Make a GET request to the Bank Lookup API
 */
async function callBankLookupAPI() {
  try {
    // Query parameters
    const params &#x3D; new URLSearchParams({
            name: &#x27;Wells Fargo&#x27;,
            id: &#x27;fdic-3511&#x27;,
            fdicCert: &#x27;3511&#x27;,
            ncuaCharter: &#x27;5536&#x27;,
            routing: &#x27;256074974&#x27;,
            swift: &#x27;WFBIUS6S&#x27;,
            lei: &#x27;KB1H1DSPRFMYMCUFXT09&#x27;,
            domain: &#x27;wellsfargo.com&#x27;,
            iban: &#x27;GB29NWBK60161331926819&#x27;,
            state: &#x27;CA&#x27;,
            type: &#x27;credit_union&#x27;,
            status: &#x27;any&#x27;,
            country: &#x27;GB&#x27;,
            limit: 10
        });

    const response = await fetch(`${API_URL}?${params}`, {
      method: 'GET',
      headers: {
        'x-api-key': API_KEY
      }
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callBankLookupAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
