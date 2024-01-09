using eTickets_Web.Models;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace eTickets_Web.Data.Base
{
    // CRUD metotları buraya toplayacağız
    public class EntityBaseRepository<T> : IEntityBaseRepository<T> where T : class, IEntityBase, new()
    {
        private readonly AppDbContext _context;

        public EntityBaseRepository(AppDbContext context)
        {
            _context = context;
        }

        //public void Add(T entity)
        //{
        //    _context.Set<T>().Add(entity);
        //}

        public void Add(T entity)
        {
            _context.Set<T>().Add(entity);

            _context.SaveChanges();
        }       

        public void Delete(int id)
        {
            var entity = _context.Set<T>().FirstOrDefault(n => n.Id == id);

            EntityEntry entityEntry = _context.Entry<T>(entity);
            entityEntry.State = EntityState.Deleted;
            _context.SaveChanges();

        }

        //public IEnumerable<T> GetAll()
        //{
        //    var result = _context.Set<T>().ToList();

        //    return result;
        //}

        public IEnumerable<T> GetAll() => _context.Set<T>().ToList();

        public IEnumerable<T> GetAll(params Expression<Func<T, object>>[] includeProperties) // Parametreli yapı
        {
            IQueryable<T> query = _context.Set<T>();
            
            query = includeProperties.Aggregate(query, (current, includeProperty) => current.Include(includeProperty));
            
            return query.ToList();

        }

        public T GetById(int id) => _context.Set<T>().FirstOrDefault(n => n.Id == id);


        public void Update(int id, T entity)
        {
            EntityEntry entityEntry = _context.Entry<T>(entity);
            entityEntry.State = EntityState.Modified;
            _context.SaveChanges();
        }

        //


    }
}
