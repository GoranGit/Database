using System;
using System.IO;
using System.Xml.Linq;

namespace _07.CreateXMLDocumentFromTXT
{
    public class Program
    {
        public static void Main()
        {
            string name;
            string address;
            string phoneNumber;

            using (StreamReader reader = new StreamReader("../../phoneBook.txt"))
            {
                name = reader.ReadLine();
                address = reader.ReadLine();
                phoneNumber = reader.ReadLine();
            }

            XElement phoneBook = new XElement("person",
           new XElement("name",name),
           new XElement("address",address),
           new XElement("phone-number",phoneNumber)
       );

            Console.WriteLine(phoneBook);

            phoneBook.Save("../../phoneBook.xml");
        }
    }
}
