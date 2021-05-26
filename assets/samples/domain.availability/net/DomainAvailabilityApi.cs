using System;
using System.IO;
using System.Net;
using System.Text;

class Program {
    public const string domain = "example.com";
    public const string apiKey = "Your Domain Availability API Key";

    static void Main() {
        string url="https://domain-availability.whoisxmlapi.com/api/v1?"
                  + $"apiKey={apiKey}&domainName={domain}";
        string whoisData = string.Empty;

        HttpWebRequest rq = (HttpWebRequest)WebRequest.Create(url);

        using (HttpWebResponse response = (HttpWebResponse)rq.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream)) {
            whoisData = reader.ReadToEnd();
        }
        Console.WriteLine(whoisData);
    }
}
