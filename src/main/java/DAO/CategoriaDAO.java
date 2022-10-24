package DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import Beans.CategoriaBean;

public class CategoriaDAO {

    private EntityManager entityManager = null;

    public void save(CategoriaBean categoria) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        entityManager.getTransaction().begin();
        entityManager.persist(categoria);
        entityManager.getTransaction().commit();

        entityManager.close();
        entityManagerFactory.close();
    }

    public void update(CategoriaBean categoria) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        entityManager.getTransaction().begin();
        entityManager.merge(categoria);
        entityManager.getTransaction().commit();

        entityManager.close();
        entityManagerFactory.close();

    }

    public CategoriaBean removeProject(Integer id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            CategoriaBean registro = entityManager.find(CategoriaBean.class, id);
            entityManager.getTransaction().begin();
            entityManager.remove(registro);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        return null;
    }
    
    public List<CategoriaBean> getAll() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            Query query = entityManager.createQuery("SELECT categoria FROM CategoriaBean categoria");
            return query.getResultList();
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
    }

}
