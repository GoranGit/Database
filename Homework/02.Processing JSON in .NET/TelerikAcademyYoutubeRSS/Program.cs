using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace TelerikAcademyYoutubeRSS
{
    public class Program
    {
        public static void Main()
        {
            string savePath = "../../videos.xml";
            string downloadPath = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLC-vbm7OWvpbqzXaoAMGGw";

            DownloadXml(downloadPath, savePath);

            var jObject = GetJsonFromXML(savePath);

            var titles = jObject["feed"]["entry"].Select(x => x["title"]);//.Select(y=>y["entry"]);//.Select(x => x["entry"]).Select(y=>y["title"]);

            foreach (var title in titles)
            {
                Console.WriteLine(title);
            }

            Console.WriteLine("-", 60);

            var videos = jObject["feed"]["entry"].Select(x => JsonConvert.DeserializeObject<VideoPOCO>(x.ToString()));

            string html = CreateHtmlFromPOCOs(videos);

            using (StreamWriter writer = new StreamWriter("../../videos.html"))
            {
                writer.Write(html);
            }
        }

        private static void DownloadXml(string fromPath, string toPath)
        {
            WebClient webClient = new WebClient();
            webClient.Encoding = Encoding.UTF8;
            webClient.DownloadFile(fromPath, toPath);
        }

        private static string CreateHtmlFromPOCOs(IEnumerable<VideoPOCO> videos)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("<!DOCTYPE html><html>  <meta charset=\"utf-8\"/> <body>");
            foreach (var video in videos)
            {
                builder.AppendFormat("<div style=\"float:left; width: 400px; height: 400px; margin-right:20px; margin-top:70px\">" +
                                   "<h3>{1}</h3><a href=\"{0}\">YouTube Link</a>" +
                                  "<iframe width=\"400\" height=\"400\" " +
                                  "src=\"http://www.youtube.com/embed/{1}?autoplay=0\" " +
                                  "frameborder=\"0\" allowfullscreen></iframe>" +
                                  "</div>",
                                  video.link.Href, video.Title);
            }
            builder.Append("</body></html>");
            return builder.ToString();
        }

        public static JObject GetJsonFromXML(string xmlPath)
        {
            var doc = XDocument.Load(xmlPath);
            string json = JsonConvert.SerializeXNode(doc, Newtonsoft.Json.Formatting.Indented);
            var jObject = JObject.Parse(json);
            return jObject;
        }
    }
}
