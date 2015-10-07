using System;
using System.Collections;
using System.Runtime.CompilerServices;
using System.Xml;

namespace ExtractsAllDifferentArtists
{
    public class Program
    {
        private static void Main(string[] args)
        {
            Hashtable storage = new Hashtable();

            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalogue.xml");

            XmlNodeList artists = doc.GetElementsByTagName("artist");

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

