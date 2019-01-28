using System;
using System.Net;
using System.IO;

class Program {
    public const string DOMAIN = "example.com";
    public const string PASSWORD = "your domain availability api password";
    public const string USERNAME = "your domain availability api username";

    static void Main() {
        string url = "http://www.whoisxmlapi.com/whoisserver/WhoisService?"
                   + $"domainName={DOMAIN}&username={USERNAME}"
                   + $"&password={PASSWORD}&cmd=GET_DN_AVAILABILITY"
                   + $"&getMode=DNS_AND_WHOIS";
        string whoisData = string.Empty;

        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);

        using (HttpWebResponse response = (HttpWebResponse)req.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream)) {
            whoisData = reader.ReadToEnd();
        }
        Console.WriteLine(whoisData);
    }
}