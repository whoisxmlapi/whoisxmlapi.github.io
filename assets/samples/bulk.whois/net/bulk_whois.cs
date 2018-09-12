using Hs = System.Collections.Hashtable; using System.Threading;
using Js = System.Web.Script.Serialization.JavaScriptSerializer;

internal static class BulkWhoisApiSample {
    const string Url = "https://whoisxmlapi.com/BulkWhoisLookup/bulkServices";
    const string User="Bulk Whois Api login", Pass="password", Id="requestId";
    static readonly string[] Dom = {"whoisxmlapi.com", "google.com"};
    //{%raw%}
    private static void Main() {
        var r = Api("/bulkWhois", new Hs{{"domains", Dom}});
        if (r["messageCode"] != 200) throw new System.Exception(r["message"]);
        var p = new Hs{{"startIndex",1},{"maxRecords",Dom.Length},{Id,r[Id]}};
        while (Api("/getRecords", p)["recordsLeft"] > 0) Thread.Sleep(3000);
        System.Console.Write(new Js().Serialize(Api("/getRecords", p)));
    }//{%endraw%}
    private static dynamic Api(string path, Hs data, string fm="json") {
        data["username"]=User; data["password"]=Pass; data["outputFormat"]=fm;
        var req = System.Net.WebRequest.Create(Url + path); req.Method="POST";
        var arg =System.Text.Encoding.UTF8.GetBytes(new Js().Serialize(data));
        req.GetRequestStream().Write(arg, 0, arg.Length);
        return new Js().Deserialize<dynamic>(new System.IO.StreamReader(
            req.GetResponse().GetResponseStream()).ReadToEnd());
    }
}