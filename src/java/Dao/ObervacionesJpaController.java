/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Dao.exceptions.IllegalOrphanException;
import Dao.exceptions.NonexistentEntityException;
import Dao.exceptions.PreexistingEntityException;
import Dto.Obervaciones;
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
public class ObervacionesJpaController implements Serializable {

    public ObervacionesJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Obervaciones obervaciones) throws IllegalOrphanException, PreexistingEntityException, Exception {
        List<String> illegalOrphanMessages = null;
        Usuario usuarioOrphanCheck = obervaciones.getUsuario();
        if (usuarioOrphanCheck != null) {
            Obervaciones oldObervacionesOfUsuario = usuarioOrphanCheck.getObervaciones();
            if (oldObervacionesOfUsuario != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Usuario " + usuarioOrphanCheck + " already has an item of type Obervaciones whose usuario column cannot be null. Please make another selection for the usuario field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuario = obervaciones.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getUsuario());
                obervaciones.setUsuario(usuario);
            }
            em.persist(obervaciones);
            if (usuario != null) {
                usuario.setObervaciones(obervaciones);
                usuario = em.merge(usuario);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findObervaciones(obervaciones.getUsuarioUsuario()) != null) {
                throw new PreexistingEntityException("Obervaciones " + obervaciones + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Obervaciones obervaciones) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Obervaciones persistentObervaciones = em.find(Obervaciones.class, obervaciones.getUsuarioUsuario());
            Usuario usuarioOld = persistentObervaciones.getUsuario();
            Usuario usuarioNew = obervaciones.getUsuario();
            List<String> illegalOrphanMessages = null;
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                Obervaciones oldObervacionesOfUsuario = usuarioNew.getObervaciones();
                if (oldObervacionesOfUsuario != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Usuario " + usuarioNew + " already has an item of type Obervaciones whose usuario column cannot be null. Please make another selection for the usuario field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getUsuario());
                obervaciones.setUsuario(usuarioNew);
            }
            obervaciones = em.merge(obervaciones);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.setObervaciones(null);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.setObervaciones(obervaciones);
                usuarioNew = em.merge(usuarioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = obervaciones.getUsuarioUsuario();
                if (findObervaciones(id) == null) {
                    throw new NonexistentEntityException("The obervaciones with id " + id + " no longer exists.");
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
            Obervaciones obervaciones;
            try {
                obervaciones = em.getReference(Obervaciones.class, id);
                obervaciones.getUsuarioUsuario();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The obervaciones with id " + id + " no longer exists.", enfe);
            }
            Usuario usuario = obervaciones.getUsuario();
            if (usuario != null) {
                usuario.setObervaciones(null);
                usuario = em.merge(usuario);
            }
            em.remove(obervaciones);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Obervaciones> findObervacionesEntities() {
        return findObervacionesEntities(true, -1, -1);
    }

    public List<Obervaciones> findObervacionesEntities(int maxResults, int firstResult) {
        return findObervacionesEntities(false, maxResults, firstResult);
    }

    private List<Obervaciones> findObervacionesEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Obervaciones.class));
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

    public Obervaciones findObervaciones(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Obervaciones.class, id);
        } finally {
            em.close();
        }
    }
    
    public boolean vacio(String user) {
        EntityManager em = getEntityManager();
        boolean b=false;
        try {
            if((em.find(Obervaciones.class, user))!=null){
                 return b;
            }else{
                b=true;
            }
        } finally {
            em.close();
        }
        
        return b;
    }

    public int getObervacionesCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Obervaciones> rt = cq.from(Obervaciones.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
