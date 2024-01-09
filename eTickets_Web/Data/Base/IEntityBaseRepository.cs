

using System.Linq.Expressions;

namespace eTickets_Web.Data.Base
{
    // Ortak metotlar
    public interface IEntityBaseRepository<T> where T : class, IEntityBase, new()
    {
        // return type method
        IEnumerable<T> GetAll(); // Tümünü getirme

        IEnumerable<T> GetAll(params Expression<Func<T, object>>[] includeProperties); // Tümünü getirme parametreli olarak

        T GetById(int id); // tek bir kayıt getirme

        void Add(T entity); // ekleme

        void Update(int id, T entity); // Güncelleme

        void Delete(int id);    // silme
    }
}
