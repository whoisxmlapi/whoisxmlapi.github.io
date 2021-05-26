﻿using System;
using System.IO;
using System.Net;
using System.Text;

class Program {
    public const string domain = "example.com";
    public const string apiKey = "Your DNS Lookup API Key";
    public const string type = "_all";

    static void Main() {
        string url="https://www.whoisxmlapi.com/whoisserver/DNSService?"
                  + $"apiKey={apiKey}&domainName={domain}&type={type}";
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
