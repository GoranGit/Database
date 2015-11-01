using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _09.EntityFramework
{
    class Program
    {
        static void Main(string[] args)
        {
            var customers = GetAllCustomersWithOrderMadeIn1997ShipedToCanada();
            foreach (var item in customers)
            {
                Console.WriteLine(item.CompanyName);
            }

            var customers2 = GetAllCustomersWithOrderMadeIn1997ShipedToCanadaSQL();
            foreach (var customer in customers2)
            {
                Console.WriteLine(customer.CompanyName);
            }
        }

        public static IEnumerable<Customer> GetAllCustomersWithOrderMadeIn1997ShipedToCanada()
        {
            CustomerRepository repository = new CustomerRepository();
            var result = repository.Customers.Where(
                x => x.Orders.Any(y => y.OrderDate.Value.Year == 1997 && y.ShipCountry == "Canada"));
            return result;
        }

        public static IEnumerable<Customer> GetAllCustomersWithOrderMadeIn1997ShipedToCanadaSQL()
        {
            string sqlQuery = "SELECT DISTINCT c.CompanyName FROM dbo.Customers c INNER JOIN dbo.Orders o ON o.CustomerID = c.CustomerID  WHERE o.OrderDate BETWEEN '1997-01-01 00:00:00' AND '1998-01-01 00:00:00' AND o.ShipCountry = 'Canada'";
            
            NorthwindEntities context = new NorthwindEntities();
            var result = context.Database.SqlQuery<Customer>(sqlQuery);
            return result;
        }
    }
}
