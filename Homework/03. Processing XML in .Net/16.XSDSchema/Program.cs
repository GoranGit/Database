using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Xml.Schema;

namespace _16.XSDSchema
{
    class Program
    {
        private static void Main(string[] args)
        {
            XmlSchemaSet schemas = new XmlSchemaSet();
            schemas.Add(string.Empty, "../../catalogue.xsd");

            XDocument validDoc = XDocument.Load("../../../catalogue.xml");
            XDocument invalidDoc = XDocument.Load("../../invalidCatalogue.xml");
            ValidateXml(validDoc, schemas, "catalogue.xml");
            ValidateXml(invalidDoc, schemas, "invalidCatalogue.xml");
        }

        public static void ValidateXml(XDocument doc, XmlSchemaSet schema, string file)
        {
            doc.Validate(schema, (obj, ev) =>
            {
                Console.WriteLine("{0} - {1}", file, ev.Message);
            });

        }
    }
}
