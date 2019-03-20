public class BrandAlertApiRequest {
    public static void main(String[]args){
        String API_URL="https://brand-alert-api.whoisxmlapi.com/api/v2";
        String body="{\"apiKey\": \"Your Brand Alert 2.0 API key\","
		+ "\"mode\": \"preview\","
		+ "\"includeSearchTerms\": [\"facebook\"]}";
        try {
            java.net.URL url = new java.net.URL(API_URL);
            java.net.HttpURLConnection http =
                (java.net.HttpURLConnection)url.openConnection();
            http.setRequestMethod("POST");
            http.setDoOutput(true);
            http.setDoInput(true);
            byte[] data = body.getBytes("UTF-8");
            http.setFixedLengthStreamingMode(data.length);
            http.setRequestProperty("Content-Type",
                "application/json; charset=UTF-8");
            http.connect();
            http.getOutputStream().write(data);
            byte[] response = new byte[1024];
            http.getInputStream().read(response, 0, 1024);
            System.out.print(new String(response, "UTF-8"));
        } catch (Exception ex) {
    		ex.printStackTrace();
        }
    }
}