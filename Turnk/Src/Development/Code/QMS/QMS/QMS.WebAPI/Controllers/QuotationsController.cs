using QMS.WebAPI.Models;
using QMS.WebAPI.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace QMS.WebAPI.Controllers
{
    [EnableCorsAttribute("http://localhost:62357", "*","*")]
    public class QuotationsController : ApiController
    {
        // GET: api/Quotations
        public IEnumerable<Quotation> Get()
        {
            var quotationRepository = new QuotationRepository();
            return quotationRepository.Retrieve();
        }

        public IEnumerable<Quotation> Get(string search, string quoteid)
        {            
            var quotationRepository = new QuotationRepository();
            if (search==null && quoteid == null)
            {
                return Get();
            }
            // Fetch quotation details based quotation id.
            if (!string.IsNullOrEmpty(quoteid))
            {
                return quotationRepository.Retrieve()
                    .Where(p => p.ProductCode.Equals(quoteid));
            }
            // Fetch quotation search records on quotation id or quotation name.
            return quotationRepository.Retrieve()
                .Where(p => p.ProductCode.Contains(search) || p.ProductName.Contains(search));            
        }

        public IEnumerable<QuotationDetails> Get(string quoteid)
        {
            var quotationRepository = new QuotationRepository();
            return quotationRepository.RetrieveAll()
                    .Where(p => p.ProductCode.Equals(quoteid));
        }

        // GET: api/Quotations/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Quotations
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Quotations/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Quotations/5
        public void Delete(int id)
        {
        }
    }
}
