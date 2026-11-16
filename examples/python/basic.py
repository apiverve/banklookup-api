"""
Bank Lookup API - Basic Usage Example

This example demonstrates the basic usage of the Bank Lookup API.
API Documentation: https://docs.apiverve.com/ref/banklookup
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/banklookup'

def call_banklookup_api():
    """
    Make a GET request to the Bank Lookup API
    """
    try:
        # Query parameters
        params &#x3D; {&#x27;name&#x27;: &#x27;Wells Fargo&#x27;, &#x27;id&#x27;: &#x27;fdic-3511&#x27;, &#x27;fdicCert&#x27;: &#x27;3511&#x27;, &#x27;ncuaCharter&#x27;: &#x27;5536&#x27;, &#x27;routing&#x27;: &#x27;256074974&#x27;, &#x27;swift&#x27;: &#x27;WFBIUS6S&#x27;, &#x27;lei&#x27;: &#x27;KB1H1DSPRFMYMCUFXT09&#x27;, &#x27;domain&#x27;: &#x27;wellsfargo.com&#x27;, &#x27;iban&#x27;: &#x27;GB29NWBK60161331926819&#x27;, &#x27;state&#x27;: &#x27;CA&#x27;, &#x27;type&#x27;: &#x27;credit_union&#x27;, &#x27;status&#x27;: &#x27;any&#x27;, &#x27;country&#x27;: &#x27;GB&#x27;, &#x27;limit&#x27;: 10}

        headers = {
            'x-api-key': API_KEY
        }

        response = requests.get(API_URL, headers=headers, params=params)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Bank Lookup API...\n')

    result = call_banklookup_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
