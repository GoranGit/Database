using System;
using System.Collections.Generic;
using System.Xml;

namespace _04.DeleteAlbumsWithPriceGratherThan20
{
    public class Program
    {
        public static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalogue.xml");
            var root = doc.DocumentElement;

            var albums = doc.GetElementsByTagName("album");
            var albumsToDelete = new List<XmlNode>();

            foreach (XmlNode album in albums)
            {
                if (double.Parse(album["price"].InnerText) > 20)
                {
                    albumsToDelete.Add(album);
                }
            }

            foreach (XmlNode album in albumsToDelete)
            {
                root.RemoveChild(album);
                Console.WriteLine("Album " + album["name"].InnerText + " has been deleted!");
            }

            doc.Save("../../deletedAlbumsCatalogue.xml");
        }
    }
}
