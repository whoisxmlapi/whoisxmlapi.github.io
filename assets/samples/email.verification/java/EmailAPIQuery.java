public class EmailAPIQuery {
    public static void main(String[]args){
        String EMAIL = "support@whoisxmlapi.com";
        String API_KEY = "your_api_key";
        String API_URL = "https://emailverification.whoisxmlapi.com/api/v1?";
        String url = API_URL + "&apiKey=" + API_KEY +
                     "&emailAddress=" + EMAIL;
        try (java.util.Scanner s =
            new java.util.Scanner(new java.net.URL(url).openStream())) {
            System.out.println(s.useDelimiter("\\A").next());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
