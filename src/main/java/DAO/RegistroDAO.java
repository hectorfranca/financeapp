package DAO;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import Beans.RegistroBean;

public class RegistroDAO {
    public void save(RegistroBean registro) {

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();
            entityManager.persist(registro);
            entityManager.getTransaction().commit();
        } catch (Exception exception) {
            System.out.println("Erro ao salvar o registro: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
    }

    public void update(RegistroBean registro) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        
        Query query = entityManager.createQuery("UPDATE RegistroBean r SET r.nome = '" + registro.getNome()
            + "', r.tipo = '" + registro.getData() + "', r.data = '" 
            + registro.getData() +  ", r.valor = '" + registro.getValor()
            + ", r.categoria = '" + registro.getCategoria() + "' WHERE r.id = '" + registro.getId() + "'");

        try {
            entityManager.getTransaction().begin();
            query.executeUpdate();
            entityManager.getTransaction().commit();
        } catch (Exception exception) {
            System.out.println("Erro ao atualizar o registro: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }

    }

    public RegistroBean delete(long id) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            RegistroBean registro = entityManager.find(RegistroBean.class, id);
            entityManager.getTransaction().begin();
            entityManager.remove(registro);
            entityManager.getTransaction().commit();
            
            return registro;
        } catch (Exception exception) {
            System.out.println("Erro ao excluir o registro: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }
    
    public List<RegistroBean> getAllReceitas() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            Query query = entityManager.createQuery("SELECT r FROM RegistroBean r WHERE r.tipo = 'R'");
            return query.getResultList();
        } catch (Exception exception) {
            System.out.println("Erro ao listar os registros: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }
    
    public List<RegistroBean> getAllDespesas() {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            Query query = entityManager.createQuery("SELECT r FROM RegistroBean r WHERE r.tipo = 'D'");
            return query.getResultList();
        } catch (Exception exception) {
            System.out.println("Erro ao listar os registros: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }

}
