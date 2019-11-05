/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Controller.Conexion;
import Dao.exceptions.IllegalOrphanException;
import Dao.exceptions.NonexistentEntityException;
import Dao.exceptions.PreexistingEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Dto.Tiemexp;
import Dto.Datosper;
import Dto.Obervaciones;
import Dto.Fbasica;
import Dto.Expelab;
import java.util.ArrayList;
import java.util.List;
import Dto.EdSuperior;
import Dto.Idioma;
import Dto.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

/**
 *
 * @author PC
 */
public class UsuarioJpaController implements Serializable {

    public UsuarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Usuario usuario) throws PreexistingEntityException, Exception {
        if (usuario.getExpelabList() == null) {
            usuario.setExpelabList(new ArrayList<Expelab>());
        }
        if (usuario.getEdSuperiorList() == null) {
            usuario.setEdSuperiorList(new ArrayList<EdSuperior>());
        }
        if (usuario.getIdiomaList() == null) {
            usuario.setIdiomaList(new ArrayList<Idioma>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Tiemexp tiemexp = usuario.getTiemexp();
            if (tiemexp != null) {
                tiemexp = em.getReference(tiemexp.getClass(), tiemexp.getUsuarioUsuario());
                usuario.setTiemexp(tiemexp);
            }
            Datosper datosper = usuario.getDatosper();
            if (datosper != null) {
                datosper = em.getReference(datosper.getClass(), datosper.getUsuarioUsuario());
                usuario.setDatosper(datosper);
            }
            Obervaciones obervaciones = usuario.getObervaciones();
            if (obervaciones != null) {
                obervaciones = em.getReference(obervaciones.getClass(), obervaciones.getUsuarioUsuario());
                usuario.setObervaciones(obervaciones);
            }
            Fbasica fbasica = usuario.getFbasica();
            if (fbasica != null) {
                fbasica = em.getReference(fbasica.getClass(), fbasica.getUsuarioUsuario());
                usuario.setFbasica(fbasica);
            }
            List<Expelab> attachedExpelabList = new ArrayList<Expelab>();
            for (Expelab expelabListExpelabToAttach : usuario.getExpelabList()) {
                expelabListExpelabToAttach = em.getReference(expelabListExpelabToAttach.getClass(), expelabListExpelabToAttach.getIdExplaboral());
                attachedExpelabList.add(expelabListExpelabToAttach);
            }
            usuario.setExpelabList(attachedExpelabList);
            List<EdSuperior> attachedEdSuperiorList = new ArrayList<EdSuperior>();
            for (EdSuperior edSuperiorListEdSuperiorToAttach : usuario.getEdSuperiorList()) {
                edSuperiorListEdSuperiorToAttach = em.getReference(edSuperiorListEdSuperiorToAttach.getClass(), edSuperiorListEdSuperiorToAttach.getId());
                attachedEdSuperiorList.add(edSuperiorListEdSuperiorToAttach);
            }
            usuario.setEdSuperiorList(attachedEdSuperiorList);
            List<Idioma> attachedIdiomaList = new ArrayList<Idioma>();
            for (Idioma idiomaListIdiomaToAttach : usuario.getIdiomaList()) {
                idiomaListIdiomaToAttach = em.getReference(idiomaListIdiomaToAttach.getClass(), idiomaListIdiomaToAttach.getIdlengua());
                attachedIdiomaList.add(idiomaListIdiomaToAttach);
            }
            usuario.setIdiomaList(attachedIdiomaList);
            em.persist(usuario);
            if (tiemexp != null) {
                Usuario oldUsuarioOfTiemexp = tiemexp.getUsuario();
                if (oldUsuarioOfTiemexp != null) {
                    oldUsuarioOfTiemexp.setTiemexp(null);
                    oldUsuarioOfTiemexp = em.merge(oldUsuarioOfTiemexp);
                }
                tiemexp.setUsuario(usuario);
                tiemexp = em.merge(tiemexp);
            }
            if (datosper != null) {
                Usuario oldUsuarioOfDatosper = datosper.getUsuario();
                if (oldUsuarioOfDatosper != null) {
                    oldUsuarioOfDatosper.setDatosper(null);
                    oldUsuarioOfDatosper = em.merge(oldUsuarioOfDatosper);
                }
                datosper.setUsuario(usuario);
                datosper = em.merge(datosper);
            }
            if (obervaciones != null) {
                Usuario oldUsuarioOfObervaciones = obervaciones.getUsuario();
                if (oldUsuarioOfObervaciones != null) {
                    oldUsuarioOfObervaciones.setObervaciones(null);
                    oldUsuarioOfObervaciones = em.merge(oldUsuarioOfObervaciones);
                }
                obervaciones.setUsuario(usuario);
                obervaciones = em.merge(obervaciones);
            }
            if (fbasica != null) {
                Usuario oldUsuarioOfFbasica = fbasica.getUsuario();
                if (oldUsuarioOfFbasica != null) {
                    oldUsuarioOfFbasica.setFbasica(null);
                    oldUsuarioOfFbasica = em.merge(oldUsuarioOfFbasica);
                }
                fbasica.setUsuario(usuario);
                fbasica = em.merge(fbasica);
            }
            for (Expelab expelabListExpelab : usuario.getExpelabList()) {
                Usuario oldUsuarioUsuarioOfExpelabListExpelab = expelabListExpelab.getUsuarioUsuario();
                expelabListExpelab.setUsuarioUsuario(usuario);
                expelabListExpelab = em.merge(expelabListExpelab);
                if (oldUsuarioUsuarioOfExpelabListExpelab != null) {
                    oldUsuarioUsuarioOfExpelabListExpelab.getExpelabList().remove(expelabListExpelab);
                    oldUsuarioUsuarioOfExpelabListExpelab = em.merge(oldUsuarioUsuarioOfExpelabListExpelab);
                }
            }
            for (EdSuperior edSuperiorListEdSuperior : usuario.getEdSuperiorList()) {
                Usuario oldUsuarioUsuarioOfEdSuperiorListEdSuperior = edSuperiorListEdSuperior.getUsuarioUsuario();
                edSuperiorListEdSuperior.setUsuarioUsuario(usuario);
                edSuperiorListEdSuperior = em.merge(edSuperiorListEdSuperior);
                if (oldUsuarioUsuarioOfEdSuperiorListEdSuperior != null) {
                    oldUsuarioUsuarioOfEdSuperiorListEdSuperior.getEdSuperiorList().remove(edSuperiorListEdSuperior);
                    oldUsuarioUsuarioOfEdSuperiorListEdSuperior = em.merge(oldUsuarioUsuarioOfEdSuperiorListEdSuperior);
                }
            }
            for (Idioma idiomaListIdioma : usuario.getIdiomaList()) {
                Usuario oldUsuarioUsuarioOfIdiomaListIdioma = idiomaListIdioma.getUsuarioUsuario();
                idiomaListIdioma.setUsuarioUsuario(usuario);
                idiomaListIdioma = em.merge(idiomaListIdioma);
                if (oldUsuarioUsuarioOfIdiomaListIdioma != null) {
                    oldUsuarioUsuarioOfIdiomaListIdioma.getIdiomaList().remove(idiomaListIdioma);
                    oldUsuarioUsuarioOfIdiomaListIdioma = em.merge(oldUsuarioUsuarioOfIdiomaListIdioma);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findUsuario(usuario.getUsuario()) != null) {
                throw new PreexistingEntityException("Usuario " + usuario + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Usuario usuario) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario persistentUsuario = em.find(Usuario.class, usuario.getUsuario());
            Tiemexp tiemexpOld = persistentUsuario.getTiemexp();
            Tiemexp tiemexpNew = usuario.getTiemexp();
            Datosper datosperOld = persistentUsuario.getDatosper();
            Datosper datosperNew = usuario.getDatosper();
            Obervaciones obervacionesOld = persistentUsuario.getObervaciones();
            Obervaciones obervacionesNew = usuario.getObervaciones();
            Fbasica fbasicaOld = persistentUsuario.getFbasica();
            Fbasica fbasicaNew = usuario.getFbasica();
            List<Expelab> expelabListOld = persistentUsuario.getExpelabList();
            List<Expelab> expelabListNew = usuario.getExpelabList();
            List<EdSuperior> edSuperiorListOld = persistentUsuario.getEdSuperiorList();
            List<EdSuperior> edSuperiorListNew = usuario.getEdSuperiorList();
            List<Idioma> idiomaListOld = persistentUsuario.getIdiomaList();
            List<Idioma> idiomaListNew = usuario.getIdiomaList();
            List<String> illegalOrphanMessages = null;
            if (tiemexpOld != null && !tiemexpOld.equals(tiemexpNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain Tiemexp " + tiemexpOld + " since its usuario field is not nullable.");
            }
            if (datosperOld != null && !datosperOld.equals(datosperNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain Datosper " + datosperOld + " since its usuario field is not nullable.");
            }
            if (obervacionesOld != null && !obervacionesOld.equals(obervacionesNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain Obervaciones " + obervacionesOld + " since its usuario field is not nullable.");
            }
            if (fbasicaOld != null && !fbasicaOld.equals(fbasicaNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain Fbasica " + fbasicaOld + " since its usuario field is not nullable.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (tiemexpNew != null) {
                tiemexpNew = em.getReference(tiemexpNew.getClass(), tiemexpNew.getUsuarioUsuario());
                usuario.setTiemexp(tiemexpNew);
            }
            if (datosperNew != null) {
                datosperNew = em.getReference(datosperNew.getClass(), datosperNew.getUsuarioUsuario());
                usuario.setDatosper(datosperNew);
            }
            if (obervacionesNew != null) {
                obervacionesNew = em.getReference(obervacionesNew.getClass(), obervacionesNew.getUsuarioUsuario());
                usuario.setObervaciones(obervacionesNew);
            }
            if (fbasicaNew != null) {
                fbasicaNew = em.getReference(fbasicaNew.getClass(), fbasicaNew.getUsuarioUsuario());
                usuario.setFbasica(fbasicaNew);
            }
            List<Expelab> attachedExpelabListNew = new ArrayList<Expelab>();
            for (Expelab expelabListNewExpelabToAttach : expelabListNew) {
                expelabListNewExpelabToAttach = em.getReference(expelabListNewExpelabToAttach.getClass(), expelabListNewExpelabToAttach.getIdExplaboral());
                attachedExpelabListNew.add(expelabListNewExpelabToAttach);
            }
            expelabListNew = attachedExpelabListNew;
            usuario.setExpelabList(expelabListNew);
            List<EdSuperior> attachedEdSuperiorListNew = new ArrayList<EdSuperior>();
            for (EdSuperior edSuperiorListNewEdSuperiorToAttach : edSuperiorListNew) {
                edSuperiorListNewEdSuperiorToAttach = em.getReference(edSuperiorListNewEdSuperiorToAttach.getClass(), edSuperiorListNewEdSuperiorToAttach.getId());
                attachedEdSuperiorListNew.add(edSuperiorListNewEdSuperiorToAttach);
            }
            edSuperiorListNew = attachedEdSuperiorListNew;
            usuario.setEdSuperiorList(edSuperiorListNew);
            List<Idioma> attachedIdiomaListNew = new ArrayList<Idioma>();
            for (Idioma idiomaListNewIdiomaToAttach : idiomaListNew) {
                idiomaListNewIdiomaToAttach = em.getReference(idiomaListNewIdiomaToAttach.getClass(), idiomaListNewIdiomaToAttach.getIdlengua());
                attachedIdiomaListNew.add(idiomaListNewIdiomaToAttach);
            }
            idiomaListNew = attachedIdiomaListNew;
            usuario.setIdiomaList(idiomaListNew);
            usuario = em.merge(usuario);
            if (tiemexpNew != null && !tiemexpNew.equals(tiemexpOld)) {
                Usuario oldUsuarioOfTiemexp = tiemexpNew.getUsuario();
                if (oldUsuarioOfTiemexp != null) {
                    oldUsuarioOfTiemexp.setTiemexp(null);
                    oldUsuarioOfTiemexp = em.merge(oldUsuarioOfTiemexp);
                }
                tiemexpNew.setUsuario(usuario);
                tiemexpNew = em.merge(tiemexpNew);
            }
            if (datosperNew != null && !datosperNew.equals(datosperOld)) {
                Usuario oldUsuarioOfDatosper = datosperNew.getUsuario();
                if (oldUsuarioOfDatosper != null) {
                    oldUsuarioOfDatosper.setDatosper(null);
                    oldUsuarioOfDatosper = em.merge(oldUsuarioOfDatosper);
                }
                datosperNew.setUsuario(usuario);
                datosperNew = em.merge(datosperNew);
            }
            if (obervacionesNew != null && !obervacionesNew.equals(obervacionesOld)) {
                Usuario oldUsuarioOfObervaciones = obervacionesNew.getUsuario();
                if (oldUsuarioOfObervaciones != null) {
                    oldUsuarioOfObervaciones.setObervaciones(null);
                    oldUsuarioOfObervaciones = em.merge(oldUsuarioOfObervaciones);
                }
                obervacionesNew.setUsuario(usuario);
                obervacionesNew = em.merge(obervacionesNew);
            }
            if (fbasicaNew != null && !fbasicaNew.equals(fbasicaOld)) {
                Usuario oldUsuarioOfFbasica = fbasicaNew.getUsuario();
                if (oldUsuarioOfFbasica != null) {
                    oldUsuarioOfFbasica.setFbasica(null);
                    oldUsuarioOfFbasica = em.merge(oldUsuarioOfFbasica);
                }
                fbasicaNew.setUsuario(usuario);
                fbasicaNew = em.merge(fbasicaNew);
            }
            for (Expelab expelabListOldExpelab : expelabListOld) {
                if (!expelabListNew.contains(expelabListOldExpelab)) {
                    expelabListOldExpelab.setUsuarioUsuario(null);
                    expelabListOldExpelab = em.merge(expelabListOldExpelab);
                }
            }
            for (Expelab expelabListNewExpelab : expelabListNew) {
                if (!expelabListOld.contains(expelabListNewExpelab)) {
                    Usuario oldUsuarioUsuarioOfExpelabListNewExpelab = expelabListNewExpelab.getUsuarioUsuario();
                    expelabListNewExpelab.setUsuarioUsuario(usuario);
                    expelabListNewExpelab = em.merge(expelabListNewExpelab);
                    if (oldUsuarioUsuarioOfExpelabListNewExpelab != null && !oldUsuarioUsuarioOfExpelabListNewExpelab.equals(usuario)) {
                        oldUsuarioUsuarioOfExpelabListNewExpelab.getExpelabList().remove(expelabListNewExpelab);
                        oldUsuarioUsuarioOfExpelabListNewExpelab = em.merge(oldUsuarioUsuarioOfExpelabListNewExpelab);
                    }
                }
            }
            for (EdSuperior edSuperiorListOldEdSuperior : edSuperiorListOld) {
                if (!edSuperiorListNew.contains(edSuperiorListOldEdSuperior)) {
                    edSuperiorListOldEdSuperior.setUsuarioUsuario(null);
                    edSuperiorListOldEdSuperior = em.merge(edSuperiorListOldEdSuperior);
                }
            }
            for (EdSuperior edSuperiorListNewEdSuperior : edSuperiorListNew) {
                if (!edSuperiorListOld.contains(edSuperiorListNewEdSuperior)) {
                    Usuario oldUsuarioUsuarioOfEdSuperiorListNewEdSuperior = edSuperiorListNewEdSuperior.getUsuarioUsuario();
                    edSuperiorListNewEdSuperior.setUsuarioUsuario(usuario);
                    edSuperiorListNewEdSuperior = em.merge(edSuperiorListNewEdSuperior);
                    if (oldUsuarioUsuarioOfEdSuperiorListNewEdSuperior != null && !oldUsuarioUsuarioOfEdSuperiorListNewEdSuperior.equals(usuario)) {
                        oldUsuarioUsuarioOfEdSuperiorListNewEdSuperior.getEdSuperiorList().remove(edSuperiorListNewEdSuperior);
                        oldUsuarioUsuarioOfEdSuperiorListNewEdSuperior = em.merge(oldUsuarioUsuarioOfEdSuperiorListNewEdSuperior);
                    }
                }
            }
            for (Idioma idiomaListOldIdioma : idiomaListOld) {
                if (!idiomaListNew.contains(idiomaListOldIdioma)) {
                    idiomaListOldIdioma.setUsuarioUsuario(null);
                    idiomaListOldIdioma = em.merge(idiomaListOldIdioma);
                }
            }
            for (Idioma idiomaListNewIdioma : idiomaListNew) {
                if (!idiomaListOld.contains(idiomaListNewIdioma)) {
                    Usuario oldUsuarioUsuarioOfIdiomaListNewIdioma = idiomaListNewIdioma.getUsuarioUsuario();
                    idiomaListNewIdioma.setUsuarioUsuario(usuario);
                    idiomaListNewIdioma = em.merge(idiomaListNewIdioma);
                    if (oldUsuarioUsuarioOfIdiomaListNewIdioma != null && !oldUsuarioUsuarioOfIdiomaListNewIdioma.equals(usuario)) {
                        oldUsuarioUsuarioOfIdiomaListNewIdioma.getIdiomaList().remove(idiomaListNewIdioma);
                        oldUsuarioUsuarioOfIdiomaListNewIdioma = em.merge(oldUsuarioUsuarioOfIdiomaListNewIdioma);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = usuario.getUsuario();
                if (findUsuario(id) == null) {
                    throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }
    
    public Usuario Buscaruser(String Usuario) {
       Connection cn=Conexion.getConexion2();
       Usuario u=new Usuario();
        try {
            String sql = "SELECT * FROM usuario"; 
            PreparedStatement pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
             if(rs.getString("usuario").equals(Usuario)){
                String nombre = rs.getString(1);
                String email = rs.getString(2);
                String pas=rs.getString(3);
            
                u.setUsuario(nombre);
                u.setEmail(email);
                u.setPassword(pas);
             }
            }
            
        } catch (Exception e) {
        }
        return u;
    }

    public void destroy(String id) throws IllegalOrphanException, NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuario;
            try {
                usuario = em.getReference(Usuario.class, id);
                usuario.getUsuario();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The usuario with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            Tiemexp tiemexpOrphanCheck = usuario.getTiemexp();
            if (tiemexpOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Usuario (" + usuario + ") cannot be destroyed since the Tiemexp " + tiemexpOrphanCheck + " in its tiemexp field has a non-nullable usuario field.");
            }
            Datosper datosperOrphanCheck = usuario.getDatosper();
            if (datosperOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Usuario (" + usuario + ") cannot be destroyed since the Datosper " + datosperOrphanCheck + " in its datosper field has a non-nullable usuario field.");
            }
            Obervaciones obervacionesOrphanCheck = usuario.getObervaciones();
            if (obervacionesOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Usuario (" + usuario + ") cannot be destroyed since the Obervaciones " + obervacionesOrphanCheck + " in its obervaciones field has a non-nullable usuario field.");
            }
            Fbasica fbasicaOrphanCheck = usuario.getFbasica();
            if (fbasicaOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Usuario (" + usuario + ") cannot be destroyed since the Fbasica " + fbasicaOrphanCheck + " in its fbasica field has a non-nullable usuario field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Expelab> expelabList = usuario.getExpelabList();
            for (Expelab expelabListExpelab : expelabList) {
                expelabListExpelab.setUsuarioUsuario(null);
                expelabListExpelab = em.merge(expelabListExpelab);
            }
            List<EdSuperior> edSuperiorList = usuario.getEdSuperiorList();
            for (EdSuperior edSuperiorListEdSuperior : edSuperiorList) {
                edSuperiorListEdSuperior.setUsuarioUsuario(null);
                edSuperiorListEdSuperior = em.merge(edSuperiorListEdSuperior);
            }
            List<Idioma> idiomaList = usuario.getIdiomaList();
            for (Idioma idiomaListIdioma : idiomaList) {
                idiomaListIdioma.setUsuarioUsuario(null);
                idiomaListIdioma = em.merge(idiomaListIdioma);
            }
            em.remove(usuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Usuario> findUsuarioEntities() {
        return findUsuarioEntities(true, -1, -1);
    }

    public List<Usuario> findUsuarioEntities(int maxResults, int firstResult) {
        return findUsuarioEntities(false, maxResults, firstResult);
    }

    private List<Usuario> findUsuarioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Usuario.class));
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

    public Usuario findUsuario(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Usuario.class, id);
        } finally {
            em.close();
        }
    }

    public int getUsuarioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Usuario> rt = cq.from(Usuario.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
