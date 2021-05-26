import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.*;
import org.json.JSONObject;

public class BulkWhoisApiSample {
    static String url = "https://whoisxmlapi.com/BulkWhoisLookup/bulkServices";
    static String apiKey = "Bulk Whois API Key", fmt = "json";
    static String[] dom = {
        "threatintelligenceplatform.com",
        "google.com"
    };

    public static void main(String[] args) throws Exception {
        JSONObject arg = new JSONObject().put("maxRecords", dom.length);
        int err;
        JSONObject r = api("/bulkWhois", new JSONObject().put("domains", dom));
        if ((err = r.getInt("messageCode")) != 200) throw new Exception("" + err);
        arg.put("requestId", r.getString("requestId")).put("startIndex", 1);
        while (api("/getRecords", arg).getInt("recordsLeft") > 0)
            Thread.sleep(3000);
        System.out.println(api("/getRecords", arg).toString(2));
    }
    private static JSONObject api(String uri, JSONObject arg) throws Exception {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost rq = new HttpPost(url + uri);
        arg.put("apiKey", apiKey).put("outputFormat", fmt);
        rq.setEntity(new org.apache.http.entity.StringEntity(arg.toString()));
        String r = client.execute(rq, new BasicResponseHandler());
        client.close();
        return new JSONObject(r);
    }
}
