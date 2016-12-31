using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QMS.DataModels
{
    
    public class QuotationListViewModel : CompanyModel
    {
        public string QuotationId { get; set; }
        public int TotalValue { get; set; }
        public string Status { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    }

    public class QuotationDetailsView : QuotationListViewModel
    {
        public string CatNo { get; set; }
        public string Make { get; set; }
        public int Unit { get; set; }
        public int UnitPrice { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
        public int ExactPrice { get; set; }
        public int Tax { get; set; }
        public int TaxValue { get; set; }
        public int TotalValue { get; set; }
        public string LeadTime { get; set; }
        public DateTime UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }
    }
}
