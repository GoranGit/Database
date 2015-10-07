//using System;

using System;
using System.CodeDom;
using System.Xml;

namespace _08.ExtractAlbumsInfoFromCatalogueInNewXML
{
    public class Program
    {
        public static void Main(string[] args)
        {
            using (XmlWriter writer = XmlWriter.Create("../../albums.xml"))
            {
                writer.WriteStartDocument();
                writer.WriteStartElement("albums");
                using (XmlReader reader = XmlReader.Create("../../../catalogue.xml"))
                {
                    while (reader.Read())
                    {
                        if (reader.NodeType == XmlNodeType.Element)
                        {
                            if (reader.Name == "name")
                            {
                                writer.WriteStartElement("album");
                                writer.WriteElementString("name", reader.ReadElementString());
                            }
                            if (reader.Name == "artist")
                            {
                                writer.WriteElementString("artist", reader.ReadElementString());
                                writer.WriteEndElement();
                            }
                        }
                    }
                }

                writer.WriteEndElement();
            }
            Console.WriteLine("The albums info is saved in albums.xml file");

        }
    }
}

