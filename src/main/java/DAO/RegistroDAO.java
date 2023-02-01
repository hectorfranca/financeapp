package DAO;

import Beans.ContaBean;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import Beans.RegistroBean;
import Beans.RegistroResumidoBean;
import java.util.ArrayList;
import java.util.Date;

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
        
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(registro);
            entityManager.getTransaction().commit();
        } catch (Exception exception) {
            System.out.println("Erro ao atualizar o registro: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }

    }

    public RegistroBean delete(Long id) {
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

    public List<RegistroBean> filtroDataListaReceitas(Date dataInicial, Date dataFinal, Long contaId) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            Query query = entityManager.createQuery(
                    "SELECT r FROM RegistroBean r JOIN r.conta c WHERE r.tipo = 'R' AND r.data >= " + dataInicial.getTime()
                            + " AND r.data <= " + dataFinal.getTime() + " AND c.id = '" + contaId + "'");
            return query.getResultList();
        } catch (Exception exception) {
            System.out.println("Erro ao listar os registros: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }
    
    public List<RegistroResumidoBean> filtroDataListaReceitasResumida(Date dataInicial, Date dataFinal, Long contaId) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            Query query = entityManager.createQuery(
                    "SELECT c.nome, SUM(r.valor) FROM RegistroBean r JOIN r.categoria c JOIN r.conta cont"
                            + " WHERE r.tipo = 'R' AND r.data >= " + dataInicial.getTime()
                            + " AND r.data <= " + dataFinal.getTime() + " AND cont.id = '" + contaId + "' GROUP BY c");
            
            List<RegistroResumidoBean> registrosResumidos = new ArrayList<RegistroResumidoBean>();          
            List<Object[]> result = query.getResultList();
            
            for (Object[] row : result) {
                registrosResumidos.add(new RegistroResumidoBean(row[0].toString(), 
                    Float.parseFloat(row[1].toString()), 'R'));
            }
            
            return registrosResumidos;
        } catch (Exception exception) {
            System.out.println("Erro ao listar os registros: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }
    
      public List<RegistroBean> filtroDataListaDespesas(Date dataInicial, Date dataFinal, Long contaId) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            Query query = entityManager.createQuery(
                    "SELECT r FROM RegistroBean r JOIN r.conta c WHERE r.tipo = 'D' AND r.data >= " + dataInicial.getTime()
                            + " AND r.data <= " + dataFinal.getTime() + " AND c.id = '" + contaId + "'");
            return query.getResultList();
        } catch (Exception exception) {
            System.out.println("Erro ao listar os registros: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }
      
    public List<RegistroResumidoBean> filtroDataListaDespesasResumida(Date dataInicial, Date dataFinal, Long contaId) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("persistenceUnit");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            Query query = entityManager.createQuery(
                    "SELECT c.nome, SUM(r.valor) FROM RegistroBean r JOIN r.categoria c JOIN r.conta cont"
                            + " WHERE r.tipo = 'D' AND r.data >= " + dataInicial.getTime()
                            + " AND r.data <= " + dataFinal.getTime() + " AND cont.id = '" + contaId + "' GROUP BY c");
            
            List<RegistroResumidoBean> registrosResumidos = new ArrayList<RegistroResumidoBean>();          
            List<Object[]> result = query.getResultList();
            
            for (Object[] row : result) {
                registrosResumidos.add(new RegistroResumidoBean(row[0].toString(), 
                    Float.parseFloat(row[1].toString()), 'D'));
            }
            
            return registrosResumidos;
        } catch (Exception exception) {
            System.out.println("Erro ao listar os registros: " + exception.getMessage());
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
        
        return null;
    }

}
