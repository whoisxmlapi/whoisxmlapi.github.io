public class EmailAPIQuery {
        public static void main(String[]args){
            String API_URL = 
                "https://emailverification.whoisxmlapi.com/api/v1";
            String email = "support@whoisxmlapi.com";
            String apiKey="Your email verification api API_KEY";
            String url = API_URL + "?emailAddress=" + email
                + "&apiKey=" + apiKey;
            try (java.util.Scanner s =
                new java.util.Scanner(new java.net.URL(url).openStream())) {
                System.out.println(s.useDelimiter("\\A").next());

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
}