using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace _12.ExtractAlbumPricesLINQ
{
    class Program
    {
        static void Main(string[] args)
        {
            XDocument doc = XDocument.Load("../../../catalogue.xml");

            var albumPrices =
                from album in doc.Descendants("album")
                where int.Parse(album.Element("year").Value) < DateTime.Now.Year - 5
                select new
                {
                    price = album.Element("price").Value,
                    name = album.Element("name").Value
                };

            foreach (var pair in albumPrices)
            {
                Console.WriteLine("The album {0} is published 5 years ago or earlier and has price of ", pair.name, pair.price);
            }
        }
    }
}
