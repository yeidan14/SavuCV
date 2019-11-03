/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Dao.exceptions.NonexistentEntityException;
import Dto.EdSuperior;
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
public class EdSuperiorJpaController implements Serializable {

    public EdSuperiorJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(EdSuperior edSuperior) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuarioUsuario = edSuperior.getUsuarioUsuario();
            if (usuarioUsuario != null) {
                usuarioUsuario = em.getReference(usuarioUsuario.getClass(), usuarioUsuario.getUsuario());
                edSuperior.setUsuarioUsuario(usuarioUsuario);
            }
            em.persist(edSuperior);
            if (usuarioUsuario != null) {
                usuarioUsuario.getEdSuperiorList().add(edSuperior);
                usuarioUsuario = em.merge(usuarioUsuario);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(EdSuperior edSuperior) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            EdSuperior persistentEdSuperior = em.find(EdSuperior.class, edSuperior.getId());
            Usuario usuarioUsuarioOld = persistentEdSuperior.getUsuarioUsuario();
            Usuario usuarioUsuarioNew = edSuperior.getUsuarioUsuario();
            if (usuarioUsuarioNew != null) {
                usuarioUsuarioNew = em.getReference(usuarioUsuarioNew.getClass(), usuarioUsuarioNew.getUsuario());
                edSuperior.setUsuarioUsuario(usuarioUsuarioNew);
            }
            edSuperior = em.merge(edSuperior);
            if (usuarioUsuarioOld != null && !usuarioUsuarioOld.equals(usuarioUsuarioNew)) {
                usuarioUsuarioOld.getEdSuperiorList().remove(edSuperior);
                usuarioUsuarioOld = em.merge(usuarioUsuarioOld);
            }
            if (usuarioUsuarioNew != null && !usuarioUsuarioNew.equals(usuarioUsuarioOld)) {
                usuarioUsuarioNew.getEdSuperiorList().add(edSuperior);
                usuarioUsuarioNew = em.merge(usuarioUsuarioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = edSuperior.getId();
                if (findEdSuperior(id) == null) {
                    throw new NonexistentEntityException("The edSuperior with id " + id + " no longer exists.");
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
            EdSuperior edSuperior;
            try {
                edSuperior = em.getReference(EdSuperior.class, id);
                edSuperior.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The edSuperior with id " + id + " no longer exists.", enfe);
            }
            Usuario usuarioUsuario = edSuperior.getUsuarioUsuario();
            if (usuarioUsuario != null) {
                usuarioUsuario.getEdSuperiorList().remove(edSuperior);
                usuarioUsuario = em.merge(usuarioUsuario);
            }
            em.remove(edSuperior);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<EdSuperior> findEdSuperiorEntities() {
        return findEdSuperiorEntities(true, -1, -1);
    }

    public List<EdSuperior> findEdSuperiorEntities(int maxResults, int firstResult) {
        return findEdSuperiorEntities(false, maxResults, firstResult);
    }

    private List<EdSuperior> findEdSuperiorEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(EdSuperior.class));
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

    public EdSuperior findEdSuperior(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(EdSuperior.class, id);
        } finally {
            em.close();
        }
    }

    public int getEdSuperiorCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<EdSuperior> rt = cq.from(EdSuperior.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
