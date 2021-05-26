import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;

public class DomainAvailabilityApi {
    public static final String DOMAIN = "example.com";
    public static final String API_KEY = "Your Domain Availability API Key";

    public static void main(String[] args) throws Exception {
        long time = System.currentTimeMillis();

        String url = "https://domain-availability.whoisxmlapi.com/api/v1?"
                   + "apiKey=" + API_KEY + "&domainName=" + DOMAIN;

        try (java.util.Scanner s =
                new java.util.Scanner(new java.net.URL(url).openStream())) {
            System.out.println(s.useDelimiter("\\A").next());
        }
    }
}
