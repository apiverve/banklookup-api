/**
 * Basic Example - Bank Lookup API
 *
 * This example demonstrates how to use the Bank Lookup API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const banklookupAPI = require('../index.js');

// Initialize the API client
const api = new banklookupAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
var query = {
  name: "Wells Fargo",
  id: "fdic-3511",
  fdicCert: "3511",
  ncuaCharter: "5536",
  routing: "256074974",
  swift: "WFBIUS6S",
  lei: "KB1H1DSPRFMYMCUFXT09",
  domain: "wellsfargo.com",
  iban: "GB29NWBK60161331926819",
  state: "CA",
  type: "credit_union",
  status: "any",
  country: "GB",
  branches: false,
  limit: 10
};

// Make the API request using callback
console.log('Making request to Bank Lookup API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});
