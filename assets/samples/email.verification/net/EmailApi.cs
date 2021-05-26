using System;
using System.Net;
using System.IO;

class Program {
    public const string EMAIL = "support@whoisxmlapi.com";
    public const string API_KEY = "your_api_key";
    public const string API_URL = "https://emailverification.whoisxmlapi.com/api/v1?";

    static void Main() {
        string url = API_URL + $"apiKey={API_KEY}&emailAddress={EMAIL}";
        string resultData = string.Empty;

        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);

        using (HttpWebResponse response = (HttpWebResponse)req.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream)) {
            resultData = reader.ReadToEnd();
        }

        Console.WriteLine(resultData);
    }
}
