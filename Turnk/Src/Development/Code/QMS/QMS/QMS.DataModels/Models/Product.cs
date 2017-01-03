using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QMS.DataModels
{
    public class Taxes
    {
        public string Id { get; set; }
        public string TaxType { get; set; }
        public string TaxCalculation { get; set; }
        public string Comments { get; set; }
    }

    //Pre-defined table with data.
    //Produce featuers
    public class ProductFeatures
    {
        public string Id { get; set; }
        public string FeatureName { get; set; }
    }

    //Pre-defined table with data.
    //User license details
    public class ProductLicense
    {
        public string Id { get; set; }
        public string LicenseName { get; set; }
        public Int16 NumberOfUsersAllowed { get; set; }
        public Int16 LicensePrice { get; set; }
        public ProductFeatures feature { get; set; }
    }
}
