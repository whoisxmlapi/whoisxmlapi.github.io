using System;
using System.Net;
using System.IO;

class Program {
    public const string EMAIL = "support@whoisxmlapi.com";
    public const string API_KEY = "Your email verification api API_KEY";

    static void Main() {
        string url = "https://emailverification.whoisxmlapi.com/api/v1?"
                   + $"emailAddress={DOMAIN}&apiKey={API_KEY}";
        string resultDataData = string.Empty;

        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);

        using (HttpWebResponse response = (HttpWebResponse)req.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream)) {
            whoisData = reader.ReadToEnd();
        }
        Console.WriteLine(whoisData);
    }
}