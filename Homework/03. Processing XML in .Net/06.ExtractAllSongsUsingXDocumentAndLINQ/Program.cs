using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace _06.ExtractAllSongsUsingXDocumentAndLINQ
{
    public class Program
    {
        static void Main(string[] args)
        {
            List<string> titlesOfSongs = new List<string>();

            XDocument doc = XDocument.Load("../../../catalogue.xml");
            var albums = doc.Descendants("catalogue").Elements("album");
            var titles= albums.Descendants("title");

            var titlesList =
                from title in titles select title.Value;

            foreach (var title in titlesList)
            {
                titlesOfSongs.Add(title);
                Console.WriteLine(title);
            }
        }
    }
}
