using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QMS.WebAPI.Models
{
    public class Quotation
    {
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string ProductCode { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Status { get; set; }
    }

    public class QuotationDetails : Quotation
    {
        public string CatNo { get; set; }        
        public string LeadTime { get; set; }
        public string Make { get; set; }
        public string ExtPrice { get; set; }
        public int Quantity { get; set; }
        public string TotalValue { get; set; }
        public string Unit { get; set; }
        public string UnitPrice { get; set; }
        public string Vat { get; set; }
    }
}