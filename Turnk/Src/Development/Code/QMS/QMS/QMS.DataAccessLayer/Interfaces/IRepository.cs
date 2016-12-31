using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace QMS.DataAccessLayer.Interfaces
{
    public interface IRepository<T>
    {
        /// <summary> 
        /// Add entity to the repository 
        /// </summary> 
        /// <param name="entity">the entity to add</param> 
        /// <returns>The added entity</returns> 
        void Add(T entity);

        /// <summary> 
        /// Add entity to the repository 
        /// </summary> 
        /// <param name="entity">the entity to add</param> 
        /// <returns>The added entity</returns> 
        void Update(T entity);

        /// <summary> 
        /// Mark entity to be deleted within the repository 
        /// </summary> 
        /// <param name="entity">The entity to delete</param> 
        void Delete(T entity);

        /// <summary> 
        /// Load the entities using a linq expression filter
        /// </summary> 
        /// <typeparam name="E">the entity type to load</typeparam> 
        /// <param name="where">where condition</param> 
        /// <returns>the loaded entity</returns> 
        IList<T> GetAll(Expression<Func<T, bool>> whereCondition);

        /// <summary>
        /// Get all the element of this repository
        /// </summary>
        /// <returns></returns>
        IList<T> GetAll();

        /// <summary> 
        /// Query entities from the repository that match the linq expression selection criteria
        /// </summary> 
        /// <typeparam name="E">the entity type to load</typeparam> 
        /// <param name="where">where condition</param> 
        /// <returns>the loaded entity</returns> 
        IQueryable<T> GetQueryable();
    }
}
