/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Dao.exceptions.NonexistentEntityException;
import Dto.Expelab;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Dto.Usuario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author PC
 */
public class ExpelabJpaController implements Serializable {

    public ExpelabJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Expelab expelab) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuarioUsuario = expelab.getUsuarioUsuario();
            if (usuarioUsuario != null) {
                usuarioUsuario = em.getReference(usuarioUsuario.getClass(), usuarioUsuario.getUsuario());
                expelab.setUsuarioUsuario(usuarioUsuario);
            }
            em.persist(expelab);
            if (usuarioUsuario != null) {
                usuarioUsuario.getExpelabList().add(expelab);
                usuarioUsuario = em.merge(usuarioUsuario);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Expelab expelab) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Expelab persistentExpelab = em.find(Expelab.class, expelab.getIdExplaboral());
            Usuario usuarioUsuarioOld = persistentExpelab.getUsuarioUsuario();
            Usuario usuarioUsuarioNew = expelab.getUsuarioUsuario();
            if (usuarioUsuarioNew != null) {
                usuarioUsuarioNew = em.getReference(usuarioUsuarioNew.getClass(), usuarioUsuarioNew.getUsuario());
                expelab.setUsuarioUsuario(usuarioUsuarioNew);
            }
            expelab = em.merge(expelab);
            if (usuarioUsuarioOld != null && !usuarioUsuarioOld.equals(usuarioUsuarioNew)) {
                usuarioUsuarioOld.getExpelabList().remove(expelab);
                usuarioUsuarioOld = em.merge(usuarioUsuarioOld);
            }
            if (usuarioUsuarioNew != null && !usuarioUsuarioNew.equals(usuarioUsuarioOld)) {
                usuarioUsuarioNew.getExpelabList().add(expelab);
                usuarioUsuarioNew = em.merge(usuarioUsuarioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = expelab.getIdExplaboral();
                if (findExpelab(id) == null) {
                    throw new NonexistentEntityException("The expelab with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Expelab expelab;
            try {
                expelab = em.getReference(Expelab.class, id);
                expelab.getIdExplaboral();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The expelab with id " + id + " no longer exists.", enfe);
            }
            Usuario usuarioUsuario = expelab.getUsuarioUsuario();
            if (usuarioUsuario != null) {
                usuarioUsuario.getExpelabList().remove(expelab);
                usuarioUsuario = em.merge(usuarioUsuario);
            }
            em.remove(expelab);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Expelab> findExpelabEntities() {
        return findExpelabEntities(true, -1, -1);
    }

    public List<Expelab> findExpelabEntities(int maxResults, int firstResult) {
        return findExpelabEntities(false, maxResults, firstResult);
    }

    private List<Expelab> findExpelabEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Expelab.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Expelab findExpelab(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Expelab.class, id);
        } finally {
            em.close();
        }
    }

    public int getExpelabCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Expelab> rt = cq.from(Expelab.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
