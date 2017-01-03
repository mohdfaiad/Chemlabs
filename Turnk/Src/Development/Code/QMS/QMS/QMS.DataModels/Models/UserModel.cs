using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QMS.DataModels
{
    // Created date contains initial user creation date.
    // Updated date contains user password changed or user deletion. 
    // Comments - User added, updated, deleted.
    public class Users
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public string password { get; set; }
        public string GUID { get; set; }
        public bool IsUserDeleted { get; set; }
        public bool IsUserActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime UpdatedDate { get; set; }
        public UserRegisteredCompany company { get; set; }
        public string Comments { get; set; }
    }
}
