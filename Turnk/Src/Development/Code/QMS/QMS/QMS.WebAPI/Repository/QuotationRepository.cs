using System;
using System.Collections.Generic;
using System.Linq;
using QMS.WebAPI.Models;
using Newtonsoft.Json;
using System.Web.Hosting;

namespace QMS.WebAPI.Repository
{
    /// <summary>
    /// Stores the data in a json file so that no database is required for this
    /// sample application
    /// </summary>
    public class QuotationRepository
    {
        /// <summary>
        /// Creates a new product with default values
        /// </summary>
        /// <returns></returns>
        internal Quotation Create()
        {
            Quotation quotation = new Quotation
            {
                
            };
            return quotation;
        }

        /// <summary>
        /// Retrieves the list of quotations.
        /// </summary>
        /// <returns></returns>
        internal List<Quotation> Retrieve()
        {
            var filePath = HostingEnvironment.MapPath(@"~/App_Data/product.json");

            var json = System.IO.File.ReadAllText(filePath);

            var products = JsonConvert.DeserializeObject<List<Quotation>>(json);

            return products;
        }

        /// <summary>
        /// Retrieves the list of quotation details.
        /// </summary>
        /// <returns></returns>
        internal List<QuotationDetails> RetrieveAll()
        {
            var filePath = HostingEnvironment.MapPath(@"~/App_Data/productdetail.json");

            var json = System.IO.File.ReadAllText(filePath);

            var products = JsonConvert.DeserializeObject<List<QuotationDetails>>(json);

            return products;
        }

        /// <summary>
        /// Saves a new product.
        /// </summary>
        /// <param name="quotation"></param>
        /// <returns></returns>
        internal Quotation Save(Quotation quotation)
        {
            // Read in the existing products
            var products = this.Retrieve();

            // Assign a new Id
            var maxId = products.Max(p => p.ProductId);
            quotation.ProductId = maxId + 1;
            products.Add(quotation);

            WriteData(products);
            return quotation;
        }

        /// <summary>
        /// Updates an existing product
        /// </summary>
        /// <param name="id"></param>
        /// <param name="quotation"></param>
        /// <returns></returns>
        internal Quotation Save(int id, Quotation quotation)
        {
            // Read in the existing products
            var products = this.Retrieve();

            // Locate and replace the item
            var itemIndex = products.FindIndex(p => p.ProductId == quotation.ProductId);
            if (itemIndex > 0)
            {
                products[itemIndex] = quotation;
            }
            else
            {
                return null;
            }

            WriteData(products);
            return quotation;
        }

        private bool WriteData(List<Quotation> quotations)
        {
            // Write out the Json
            var filePath = HostingEnvironment.MapPath(@"~/App_Data/product.json");

            var json = JsonConvert.SerializeObject(quotations, Formatting.Indented);
            System.IO.File.WriteAllText(filePath, json);

            return true;
        }

    }
}