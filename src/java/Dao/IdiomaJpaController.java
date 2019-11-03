/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Dao.exceptions.NonexistentEntityException;
import Dto.Idioma;
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
public class IdiomaJpaController implements Serializable {

    public IdiomaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Idioma idioma) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuarioUsuario = idioma.getUsuarioUsuario();
            if (usuarioUsuario != null) {
                usuarioUsuario = em.getReference(usuarioUsuario.getClass(), usuarioUsuario.getUsuario());
                idioma.setUsuarioUsuario(usuarioUsuario);
            }
            em.persist(idioma);
            if (usuarioUsuario != null) {
                usuarioUsuario.getIdiomaList().add(idioma);
                usuarioUsuario = em.merge(usuarioUsuario);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Idioma idioma) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Idioma persistentIdioma = em.find(Idioma.class, idioma.getIdlengua());
            Usuario usuarioUsuarioOld = persistentIdioma.getUsuarioUsuario();
            Usuario usuarioUsuarioNew = idioma.getUsuarioUsuario();
            if (usuarioUsuarioNew != null) {
                usuarioUsuarioNew = em.getReference(usuarioUsuarioNew.getClass(), usuarioUsuarioNew.getUsuario());
                idioma.setUsuarioUsuario(usuarioUsuarioNew);
            }
            idioma = em.merge(idioma);
            if (usuarioUsuarioOld != null && !usuarioUsuarioOld.equals(usuarioUsuarioNew)) {
                usuarioUsuarioOld.getIdiomaList().remove(idioma);
                usuarioUsuarioOld = em.merge(usuarioUsuarioOld);
            }
            if (usuarioUsuarioNew != null && !usuarioUsuarioNew.equals(usuarioUsuarioOld)) {
                usuarioUsuarioNew.getIdiomaList().add(idioma);
                usuarioUsuarioNew = em.merge(usuarioUsuarioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = idioma.getIdlengua();
                if (findIdioma(id) == null) {
                    throw new NonexistentEntityException("The idioma with id " + id + " no longer exists.");
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
            Idioma idioma;
            try {
                idioma = em.getReference(Idioma.class, id);
                idioma.getIdlengua();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The idioma with id " + id + " no longer exists.", enfe);
            }
            Usuario usuarioUsuario = idioma.getUsuarioUsuario();
            if (usuarioUsuario != null) {
                usuarioUsuario.getIdiomaList().remove(idioma);
                usuarioUsuario = em.merge(usuarioUsuario);
            }
            em.remove(idioma);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Idioma> findIdiomaEntities() {
        return findIdiomaEntities(true, -1, -1);
    }

    public List<Idioma> findIdiomaEntities(int maxResults, int firstResult) {
        return findIdiomaEntities(false, maxResults, firstResult);
    }

    private List<Idioma> findIdiomaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Idioma.class));
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

    public Idioma findIdioma(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Idioma.class, id);
        } finally {
            em.close();
        }
    }

    public int getIdiomaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Idioma> rt = cq.from(Idioma.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
