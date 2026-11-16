import com.apiverve.banklookup.BankLookupAPIClient;
import com.apiverve.banklookup.APIResponse;
import com.apiverve.banklookup.APIException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class BasicExample {
    public static void main(String[] args) {
        // Initialize the API client with your API key
        BankLookupAPIClient client = new BankLookupAPIClient("YOUR_API_KEY_HERE");

        try {
            // Query parameters
            Map&lt;String, Object&gt; parameters &#x3D; new HashMap&lt;&gt;();
        parameters.put(&quot;name&quot;, &quot;Wells Fargo&quot;);
        parameters.put(&quot;id&quot;, &quot;fdic-3511&quot;);
        parameters.put(&quot;fdicCert&quot;, &quot;3511&quot;);
        parameters.put(&quot;ncuaCharter&quot;, &quot;5536&quot;);
        parameters.put(&quot;routing&quot;, &quot;256074974&quot;);
        parameters.put(&quot;swift&quot;, &quot;WFBIUS6S&quot;);
        parameters.put(&quot;lei&quot;, &quot;KB1H1DSPRFMYMCUFXT09&quot;);
        parameters.put(&quot;domain&quot;, &quot;wellsfargo.com&quot;);
        parameters.put(&quot;iban&quot;, &quot;GB29NWBK60161331926819&quot;);
        parameters.put(&quot;state&quot;, &quot;CA&quot;);
        parameters.put(&quot;type&quot;, &quot;credit_union&quot;);
        parameters.put(&quot;status&quot;, &quot;any&quot;);
        parameters.put(&quot;country&quot;, &quot;GB&quot;);
        parameters.put(&quot;limit&quot;, 10);

            // Execute the API request
            APIResponse response = client.execute(parameters);

            // Check if the request was successful
            if (response.isSuccess()) {
                System.out.println("✅ Success!");

                // Get the response data
                JSONObject data = response.getData();
                if (data != null) {
                    System.out.println("Response data:");
                    System.out.println(data.toString(2)); // Pretty print with 2-space indent
                }

                // Or get specific fields from the data
                // String value = data.optString("fieldName");

            } else {
                // Handle API errors
                System.err.println("❌ API Error: " + response.getError());
                System.err.println("Status: " + response.getStatus());
                System.err.println("Code: " + response.getCode());
            }

        } catch (APIException e) {
            // Handle exceptions
            System.err.println("❌ Error: " + e.getMessage());

            // Handle specific error types
            if (e.isAuthenticationError()) {
                System.err.println("Invalid API key. Get your key at: https://apiverve.com");
            } else if (e.isRateLimitError()) {
                System.err.println("Rate limit exceeded. Please try again later.");
            } else if (e.isServerError()) {
                System.err.println("Server error (5xx). Please try again later.");
            } else if (e.isClientError()) {
                System.err.println("Client error (4xx). Check your request parameters.");
            }

            // Get HTTP status code if available
            if (e.getStatusCode() > 0) {
                System.err.println("HTTP Status Code: " + e.getStatusCode());
            }
        }
    }
}
