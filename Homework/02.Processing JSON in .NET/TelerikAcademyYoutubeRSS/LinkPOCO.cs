using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TelerikAcademyYoutubeRSS
{
    public class LinkPOCO
    {
        [JsonProperty("@rel")]
        public string Rel { get; set; }
        [JsonProperty("@href")]
        public string Href { get; set; }
    }
}
