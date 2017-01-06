using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QMS.DataModels;
using System.Data.Entity.ModelConfiguration;
using System.ComponentModel.DataAnnotations.Schema;

namespace QMS.DataAccessLayer
{
    public class QuotationConfiguration : EntityTypeConfiguration<Quotations>
    {
        public QuotationConfiguration()
        {
            ToTable(TableNames.Quotations);

            Property(c => c.Id).HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            Property(c => c.QuotationId).IsRequired();
            Property(c => c.CompanyName).IsRequired().HasMaxLength(150);
            Property(c => c.CompanyAddress).IsOptional();
            Property(c => c.KintAttn).IsRequired().HasMaxLength(50);
            Property(c => c.Status).IsRequired().HasMaxLength(32);

            HasKey(c => c.Id);
            HasMany(c => c.Addresses);

        }
    }
}
