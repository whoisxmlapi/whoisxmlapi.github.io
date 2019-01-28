import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;

public class DomainAvailabilityApi {
    public static final String DOMAIN = "example.com";
    public static final String KEY = "your domain availability api key";
    public static final String SECRET =
        "your domain availability api secret key";
    public static final String USERNAME =
        "your domain availability api username";

    public static void main(String[] args) throws Exception {
        long time = System.currentTimeMillis();

        String json = "{\"t\":" + time + ",\"u\":\"" + USERNAME + "\"}";
        String req=new String(new Base64(true).encodeBase64(json.getBytes()));

        String algo = "HmacMD5";
        String data = USERNAME + time + KEY;
        SecretKeySpec spec = new SecretKeySpec(SECRET.getBytes("UTF-8"),algo);
        Mac mac = Mac.getInstance(spec.getAlgorithm());
        mac.init(spec);
        String hmac =
            new String(Hex.encodeHex(mac.doFinal(data.getBytes("UTF-8"))));

        String url = "http://www.whoisxmlapi.com/whoisserver/WhoisService"
                   + "?requestObject=" + req + "&digest=" + hmac
                   + "&domainName=" + DOMAIN + "&cmd=GET_DN_AVAILABILITY"
                   + "&getMode=DNS_AND_WHOIS";

        try (java.util.Scanner s =
                new java.util.Scanner(new java.net.URL(url).openStream())) {
            System.out.println(s.useDelimiter("\\A").next());
        }
    }
}