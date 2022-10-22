package DAO;

import Beans.CategoriaBean;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author Hector
 */
public class CategoriaDAO {
    public List<CategoriaBean> getAll() {
        EntityManagerFactory entityManagerFactory = 
                Persistence.createEntityManagerFactory("persistenceUnit");
        
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        
        Query query;
        
        try {
            query = entityManager.createQuery("SELECT categoria FROM CategoriaBean categoria");
            return query.getResultList();
        } catch(Exception exception) {
            System.out.println("Erro ao buscar os registros" + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }
}
