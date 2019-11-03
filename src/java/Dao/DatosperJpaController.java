/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Dao.exceptions.IllegalOrphanException;
import Dao.exceptions.NonexistentEntityException;
import Dao.exceptions.PreexistingEntityException;
import Dto.Datosper;
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
public class DatosperJpaController implements Serializable {

    public DatosperJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Datosper datosper) throws IllegalOrphanException, PreexistingEntityException, Exception {
        List<String> illegalOrphanMessages = null;
        Usuario usuarioOrphanCheck = datosper.getUsuario();
        if (usuarioOrphanCheck != null) {
            Datosper oldDatosperOfUsuario = usuarioOrphanCheck.getDatosper();
            if (oldDatosperOfUsuario != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Usuario " + usuarioOrphanCheck + " already has an item of type Datosper whose usuario column cannot be null. Please make another selection for the usuario field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuario = datosper.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getUsuario());
                datosper.setUsuario(usuario);
            }
            em.persist(datosper);
            if (usuario != null) {
                usuario.setDatosper(datosper);
                usuario = em.merge(usuario);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findDatosper(datosper.getUsuarioUsuario()) != null) {
                throw new PreexistingEntityException("Datosper " + datosper + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Datosper datosper) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Datosper persistentDatosper = em.find(Datosper.class, datosper.getUsuarioUsuario());
            Usuario usuarioOld = persistentDatosper.getUsuario();
            Usuario usuarioNew = datosper.getUsuario();
            List<String> illegalOrphanMessages = null;
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                Datosper oldDatosperOfUsuario = usuarioNew.getDatosper();
                if (oldDatosperOfUsuario != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Usuario " + usuarioNew + " already has an item of type Datosper whose usuario column cannot be null. Please make another selection for the usuario field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getUsuario());
                datosper.setUsuario(usuarioNew);
            }
            datosper = em.merge(datosper);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.setDatosper(null);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.setDatosper(datosper);
                usuarioNew = em.merge(usuarioNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = datosper.getUsuarioUsuario();
                if (findDatosper(id) == null) {
                    throw new NonexistentEntityException("The datosper with id " + id + " no longer exists.");
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
            Datosper datosper;
            try {
                datosper = em.getReference(Datosper.class, id);
                datosper.getUsuarioUsuario();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The datosper with id " + id + " no longer exists.", enfe);
            }
            Usuario usuario = datosper.getUsuario();
            if (usuario != null) {
                usuario.setDatosper(null);
                usuario = em.merge(usuario);
            }
            em.remove(datosper);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Datosper> findDatosperEntities() {
        return findDatosperEntities(true, -1, -1);
    }

    public List<Datosper> findDatosperEntities(int maxResults, int firstResult) {
        return findDatosperEntities(false, maxResults, firstResult);
    }

    private List<Datosper> findDatosperEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Datosper.class));
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

    public Datosper findDatosper(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Datosper.class, id);
        } finally {
            em.close();
        }
    }

     public Datosper buscarporusuario(String user) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Datosper.class, user);
        } finally {
            em.close();
        }
    }
     
     public boolean vacio(String user) {
        EntityManager em = getEntityManager();
        boolean b=false;
        try {
            if((em.find(Datosper.class, user))!=null){
                 return b;
            }else{
                b=true;
            }
        } finally {
            em.close();
        }
        
        return b;
    }
    
    public int getDatosperCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Datosper> rt = cq.from(Datosper.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
