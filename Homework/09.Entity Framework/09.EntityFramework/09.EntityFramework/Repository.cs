namespace _09.EntityFramework
{
    using System.Data.Entity;
    using System.Linq;

    public class CustomerRepository
    {
        private int disposeCounte;
        private IDbSet<Customer> entities;
        private NorthwindEntities context;

        public CustomerRepository()
        {
            this.context = new NorthwindEntities();
            this.disposeCounte = 0;
        }

        public IDbSet<Customer> Customers
        {
            get
            {
                if (this.entities == null)
                {
                    this.entities = this.context.Set<Customer>();
                }

                return this.entities;
            }
        }

        public void Insert(Customer entity)
        {

            this.context.Customers.Add(entity);
            this.context.SaveChanges();
            disposeCounte++;

            if (disposeCounte % 100 == 0)
            {
                disposeCounte = 0;
                this.context.Dispose();
                this.context = new NorthwindEntities();
            }
        }

        public void Update(Customer entity)
        {
            context.Customers.Add(entity);
            context.SaveChanges();
        }

        public void Delete(Customer entity)
        {
            var itemToDelete = this.context.Customers.Where(x => x.CustomerID == entity.CustomerID).FirstOrDefault();
            if (itemToDelete != null)
            {
                this.context.Customers.Remove(itemToDelete);
                this.context.SaveChanges();
            }
        }
    }
}
