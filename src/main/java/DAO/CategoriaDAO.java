package DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import Beans.CategoriaBean;

public class CategoriaDAO {
    public void save(CategoriaBean categoria) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();
            entityManager.persist(categoria);
            entityManager.getTransaction().commit();
        } catch (Exception exception) {
            System.out.println("Erro ao salvar a categoria: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
    }

    public void update(CategoriaBean categoria) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();
            entityManager.merge(categoria);
            entityManager.getTransaction().commit();
        } catch (Exception exception) {
            System.out.println("Erro ao atualizar a categoria: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }

    }

    public CategoriaBean delete(Long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            CategoriaBean categoria = entityManager.find(CategoriaBean.class, id);
            entityManager.getTransaction().begin();
            entityManager.remove(categoria);
            entityManager.getTransaction().commit();
            
            return categoria;
        } catch (Exception exception) {
            System.out.println("Erro ao excluir a categoria: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }
    
    public CategoriaBean find(Long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            return entityManager.find(CategoriaBean.class, id);
        } catch (Exception exception) {
            System.out.println("Erro ao buscar o registro: " + exception.getMessage());
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
            Query query = entityManager.createQuery("SELECT c FROM CategoriaBean c");
            return query.getResultList();
        } catch (Exception exception) {
            System.out.println("Erro ao listar a categoria: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }

}
