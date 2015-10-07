using System;
using System.Collections;
using System.Xml;

namespace _03.ExtractAllDifferentArtistsXPatx
{
    public class Program
    {
        public static void Main()
        {
            Hashtable storage = new Hashtable();

            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalogue.xml");

            string xPathQuery = "catalogue/album/artist";

            XmlNodeList artists = doc.SelectNodes(xPathQuery);

            foreach (XmlNode artist in artists)
            {
                if (!storage.Contains(artist.InnerText))
                {
                    storage.Add(artist.InnerText, 1);
                }
                else
                {
                    storage[artist.InnerText] = (int)storage[artist.InnerText] + 1;
                }


            }
            foreach (DictionaryEntry entry in storage)
            {
                Console.WriteLine("Artist: {0} has {1} albums", entry.Key, entry.Value);
            }
        }
    }
}
