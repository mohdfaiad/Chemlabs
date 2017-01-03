using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QMS.DataModels
{
    // User company details with expiration dates.
    // Calculate expiry data on daily basis.
    // License applicable to companay. License expires all users of that company will loose access to product 
    // even though user is added recently.
    // Comments : 
    //  1. To store about enquiry customer from register screen.
    //  2. Company approved by Administrator
    public class UserRegisteredCompany
    {
        public string Id { get; set; }
        public string CompanyName { get; set; }
        //Alias required to generate Quotation Number format.
        public string CompanyAlias { get; set; }
        public string CompanyAddress { get; set; }
        public byte[] CompanyLogo { get; set; }
        public bool IsLicenseExpired { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ExpiryDate { get; set; }
        public ProductLicense license { get; set; }
        public string Comments { get; set; }
    }
}
