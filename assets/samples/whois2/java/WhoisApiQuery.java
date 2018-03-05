public class WhoisApiQuery {
    public static final String DOMAIN = "example.com";
    public static final String API_KEY = "your whois api api key";

    public static void main(String[] args) throws Exception {
        String url = "http://www.whoisxmlapi.com/whoisserver/WhoisService"
                   + "?domainName=" + DOMAIN + "&apiKey=" + API_KEY;
        try (java.util.Scanner s =
                new java.util.Scanner(new java.net.URL(url).openStream())) {
            System.out.println(s.useDelimiter("\\A").next());
        }
    }
}
