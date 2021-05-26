using System;
namespace WhoisApiSample
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            string apiKey = "Your API Key";

            string domain = "whoisxmlapi.com";
            string url = "https://www.whoisxmlapi.com/whoisserver/WhoisService?"
                         + "domainName=" + domain
                         + "&apiKey=" + apiKey
                         + "&outputFormat=" + "JSON";

            try
            {
                // Download JSON into a dynamic object
                dynamic result = new System.Net.WebClient().DownloadString(url);

                // Print a nice informative string
                Console.WriteLine("JSON:\n");
                Console.WriteLine(result);
            }
            catch (Exception e)
            {
                Console.WriteLine("An unkown error has occurred!");
            }

        }
    }
}
