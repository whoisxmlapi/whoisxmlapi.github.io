import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;


public class WhoisApiSample {
    private Logger logger = Logger.getLogger(WhoisApiSample.class.getName());

    public static void main(String[]args) {
        new WhoisApiSample().getWhoisRecordUsingApiKey();
    }

    private void getWhoisRecordUsingApiKey() {

        String apiKey = "Your API key";

        String domainName = "whoisxmlapi.com";
        getWhoisInfo(domainName, apiKey);
    }

    private String executeURL(String url) {
        HttpClient c = new HttpClient();
        System.out.println(url);
        HttpMethod m = new GetMethod(url);
        String res = null;
        try {
            c.executeMethod(m);
            res = new String(m.getResponseBody());
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Cannot get url", e);
        } finally {
            m.releaseConnection();
        }
        return res;
    }

    public void getWhoisInfo(String domainName, String apiKey) {
        StringBuilder sb = new StringBuilder();
        sb.append("https://www.whoisxmlapi.com/whoisserver/WhoisService?");
        sb.append("apiKey=");
        sb.append(apiKey);
        sb.append("&domainName=");
        sb.append(domainName);
        String url = sb.toString();

        String result = executeURL(url);
        if (result != null) {
            logger.log(Level.INFO, "result: " + result);
        }
    }
}
