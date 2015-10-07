using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace TelerikAcademyYoutubeRSS
{
    public class VideoPOCO
    {
        [JsonProperty("id")]
        public string Id { get; set; }
        [JsonProperty("title")]
        public string Title { get; set; }
        [JsonProperty("author")]
        public AuthorPOCO Author { get; set; }
        [JsonProperty("link")]
        public LinkPOCO link { get; set; }
    }
}
