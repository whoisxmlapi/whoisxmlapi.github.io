{%raw%}
using Hs = System.Collections.Hashtable;
using Js = System.Web.Script.Serialization.JavaScriptSerializer;

namespace brandAlertApiExample
{
    internal class BrandAlertApiExample
    {
        public static void Main(string[] args)
        {
            string key = "Your Brand Alert 2.0 API key";
            string[] terms = {"facebook"};
            string mode = "preview";
            string url = "https://brand-alert.whoisxmlapi.com/api/v2";

            var data = new Hs {{"apiKey", key},{"mode", mode},
                {"includeSearchTerms", terms}};

            try {
                var request = System.Net.WebRequest.Create(url);
                request.Method = "POST";
                var arg =System.Text.Encoding.UTF8.GetBytes(new Js().Serialize(data));
                request.GetRequestStream().Write(arg, 0, arg.Length);
                System.Console.WriteLine(new System.IO.StreamReader(
                    request.GetResponse().GetResponseStream()).ReadToEnd());
            }
            catch (System.Exception e) {
                System.Console.WriteLine("An error has occurred!");
            }
        }
    }
}
{%endraw%}
