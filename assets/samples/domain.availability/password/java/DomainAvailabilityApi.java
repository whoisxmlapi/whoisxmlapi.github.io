public class DomainAvailabilityApi {
    public static final String DOMAIN = "example.com";
    public static final String PASSWORD =
        "Your domain availability api password";
    public static final String USERNAME =
        "Your domain availability api username";

    public static void main(String[] args) throws Exception {
        String url = "http://www.whoisxmlapi.com/whoisserver/WhoisService"
                   + "?domainName=" + DOMAIN + "&userName=" + USERNAME
                   + "&password=" + PASSWORD + "&cmd=GET_DN_AVAILABILITY"
                   + "&getMode=DNS_AND_WHOIS";
        try (java.util.Scanner s =
                new java.util.Scanner(new java.net.URL(url).openStream())) {
            System.out.println(s.useDelimiter("\\A").next());
        }
    }
}