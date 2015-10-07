using System;
using System.Xml;

namespace _11.ExtractPricesForAllAlbumsPublishedBefore5Years
{
    public class Program
    {
        public static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalogue.xml");

            var year = DateTime.Now.Year - 5;

            string xPathQuery = String.Format("catalogue/album[year<{0}]/price", year);

            XmlNodeList artists = doc.SelectNodes(xPathQuery);

            foreach (XmlNode artist in artists)
            {
                Console.WriteLine(artist.InnerText);
            }
        }
    }
}
