using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Xsl;

namespace _13.XSLSheet
{
    class Program
    {
        static void Main(string[] args)
        {
            XslCompiledTransform xslt = new XslCompiledTransform();
            xslt.Load("../../catalogue.xsl");
            xslt.Transform("../../../catalogue.xml", "../../catalogue.html");
            Console.WriteLine("Catalogue.html saved");
        }
    }
}
