using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QMS.DataModels
{
    public class CompanyModel
    {
        [ReadOnly(true)]
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string CompanyAddress { get; set; }
        public string KintAttn { get; set; }
    }
}
