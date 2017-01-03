using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QMS.DataModels
{

    // Quotation primary details with calculated values
    // 1. QuotationId (ex:"QTN/Orbit/001/10-11-16") 2. Status ("In-Progress","Completed","Track")
    // Total value will be 
    public class Quotations
    {
        public int Id { get; set; }
        public string QuotationId { get; set; }
        public string CompanyName { get; set; }
        public string CompanyAddress { get; set; }
        public string KintAttn { get; set; }
        public string TaxType { get; set; }
        public int TotalValue { get; set; }
        public string Status { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public Users user { get; set; }
        public Taxes taxes { get; set; }
        public ICollection<QuotationsDetails> QuotationDetails { get; set; }
    }
    // List of products added to quotation
    public class QuotationsDetails
    {
        public int Id { get; set; }
        public string CatNo { get; set; }
        public string Make { get; set; }
        public int Unit { get; set; }
        public int UnitPrice { get; set; }
        public string Description { get; set; }
        public int Quantity { get; set; }
        public int ExactPrice { get; set; }
        public int Tax { get; set; }
        public int TaxValue { get; set; }
        public string LeadTime { get; set; }
        public DateTime UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }
        //Navigation to Company table                
        public UserRegisteredCompany company { get; set; }
    }
}
