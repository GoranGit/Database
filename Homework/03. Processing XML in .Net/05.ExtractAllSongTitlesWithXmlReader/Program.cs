using System;
using System.Collections;
using System.Collections.Generic;
using System.Xml;

namespace _05.ExtractAllSongTitlesWithXmlReader
{
    public class Program
    {
        public static void Main()
        {
            IList<string> listOfTitles = new List<string>();

            using (XmlReader reader = XmlReader.Create("../../../catalogue.xml"))
            {
                while (reader.Read())
                {
                    if ((reader.NodeType == XmlNodeType.Element) &&
                        (reader.Name == "title"))
                    {
                        listOfTitles.Add(reader.ReadElementString());
                    }
                }
            }

            foreach (var title in listOfTitles)
            {
                Console.WriteLine(title);
            }
        }
    }
}
