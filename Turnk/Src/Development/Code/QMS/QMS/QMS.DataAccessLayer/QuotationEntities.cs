using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QMS.DataModels;

namespace QMS.DataAccessLayer
{
    public class QuotationEntities : DbContext
    {
        public QuotationEntities() : base("Qutotation")
        { }

        public DbSet<ProductFeatures> ProductFeatures { get; set; }
        public DbSet<ProductLicense> ProductLicense { get; set; }
        public DbSet<UserRegisteredCompany> UserRegisteredCompany { get; set; }
        public DbSet<Users> Users { get; set; }
        public DbSet<Quotations> Quotations { get; set; }
        public DbSet<QuotationsDetails> QuotationDetails { get; set; }
        public DbSet<Taxes> Taxes { get; set; }

        public virtual void Commit()
        {
            base.SaveChanges();
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new QuotationConfiguration());
            //modelBuilder.Configurations.Add(new );
        }

    }
}
