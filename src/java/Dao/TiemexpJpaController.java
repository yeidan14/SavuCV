/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Dao.exceptions.IllegalOrphanException;
import Dao.exceptions.NonexistentEntityException;
import Dao.exceptions.PreexistingEntityException;
import Dto.Tiemexp;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Dto.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author PC
 */
public class TiemexpJpaController implements Serializable {

    public TiemexpJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Tiemexp tiemexp) throws IllegalOrphanException, PreexistingEntityException, Exception {
        List<String> illegalOrphanMessages = null;
        Usuario usuarioOrphanCheck = tiemexp.getUsuario();
        if (usuarioOrphanCheck != null) {
            Tiemexp oldTiemexpOfUsuario = usuarioOrphanCheck.getTiemexp();
            if (oldTiemexpOfUsuario != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Usuario " + usuarioOrphanCheck + " already has an item of type Tiemexp whose usuario column cannot be null. Please make another selection for the usuario field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuario = tiemexp.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getUsuario());
                tiemexp.setUsuario(usuario);
            }
            em.persist(tiemexp);
            if (usuario != null) {
                usuario.setTiemexp(tiemexp);
                usuario = em.merge(usuario);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findTiemexp(tiemexp.getUsuarioUsuario()) != null) {
                throw new PreexistingEntityException("Tiemexp " + tiemexp + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Tiemexp tiemexp) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Tiemexp persistentTiemexp = em.find(Tiemexp.class, tiemexp.getUsuarioUsuario());
            Usuario usuarioOld = persistentTiemexp.getUsuario();
            Usuario usuarioNew = tiemexp.getUsuario();
            List<String> illegalOrphanMessages = null;
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                Tiemexp oldTiemexpOfUsuario = usuarioNew.getTiemexp();
                if (oldTiemexpOfUsuario != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Usuario " + usuarioNew + " already has an item of type Tiemexp whose usuario column cannot be null. Please make another selection for the usuario field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getUsuario());
                tiemexp.setUsuario(usuarioNew);
            }
            tiemexp = em.merge(tiemexp);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.setTiemexp(null);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.setTiemexp(tiemexp);
                usuarioNew = em.merge(usuarioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = tiemexp.getUsuarioUsuario();
                if (findTiemexp(id) == null) {
                    throw new NonexistentEntityException("The tiemexp with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Tiemexp tiemexp;
            try {
                tiemexp = em.getReference(Tiemexp.class, id);
                tiemexp.getUsuarioUsuario();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The tiemexp with id " + id + " no longer exists.", enfe);
            }
            Usuario usuario = tiemexp.getUsuario();
            if (usuario != null) {
                usuario.setTiemexp(null);
                usuario = em.merge(usuario);
            }
            em.remove(tiemexp);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Tiemexp> findTiemexpEntities() {
        return findTiemexpEntities(true, -1, -1);
    }

    public List<Tiemexp> findTiemexpEntities(int maxResults, int firstResult) {
        return findTiemexpEntities(false, maxResults, firstResult);
    }

    private List<Tiemexp> findTiemexpEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Tiemexp.class));
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

    public Tiemexp findTiemexp(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Tiemexp.class, id);
        } finally {
            em.close();
        }
    }
    
public boolean vacio(String user) {
        EntityManager em = getEntityManager();
        boolean b=false;
        try {
            if((em.find(Tiemexp.class, user))!=null){
                 return b;
            }else{
                b=true;
            }
        } finally {
            em.close();
        }
        
        return b;
    }

    public int getTiemexpCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Tiemexp> rt = cq.from(Tiemexp.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
