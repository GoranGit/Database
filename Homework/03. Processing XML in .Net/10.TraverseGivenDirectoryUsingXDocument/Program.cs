using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace _10.TraverseGivenDirectoryUsingXDocument
{
    class Program
    {
        static void Main(string[] args)
        {
            string dirPath = "../../";

            XElement element = new XElement("directories",
               GetTraverseElement(dirPath));
            element.Save("../../directories.xml");

        }

        public static XElement GetTraverseElement(string path)
        {
            var directories = Directory.GetDirectories(path);
            var files = Directory.GetFiles(path);

            XElement element = new XElement("dir", new XAttribute("path",path));
            foreach (var directory in directories)
            {
                element.Add(GetTraverseElement(directory));
            }

            foreach (var file in files)
            {
                element.Add(new XElement("file", new XElement("name",file)));
            }
            return element;
        }
    }
}
