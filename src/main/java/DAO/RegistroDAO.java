package DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import Beans.RegistroBean;

public class RegistroDAO {

    private EntityManager entityManager = null;

    public void save(RegistroBean registro) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        entityManager.getTransaction().begin();
        entityManager.persist(registro);
        entityManager.getTransaction().commit();

        entityManager.close();
        entityManagerFactory.close();
    }

    public void update(RegistroBean registro) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        entityManager.getTransaction().begin();
        entityManager.merge(registro);
        entityManager.getTransaction().commit();

        entityManager.close();
        entityManagerFactory.close();

    }

    public RegistroBean removeProject(Integer id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            RegistroBean registro = entityManager.find(RegistroBean.class, id);
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
    
    public List<RegistroBean> getAll() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            Query query = entityManager.createQuery("SELECT registro FROM RegistroBean registro");
            return query.getResultList();
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
    }

}
