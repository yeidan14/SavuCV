/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dto;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author PC
 */
@Entity
@Table(name = "ed_superior")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EdSuperior.findAll", query = "SELECT e FROM EdSuperior e")
    , @NamedQuery(name = "EdSuperior.findById", query = "SELECT e FROM EdSuperior e WHERE e.id = :id")
    , @NamedQuery(name = "EdSuperior.findByModalidad", query = "SELECT e FROM EdSuperior e WHERE e.modalidad = :modalidad")
    , @NamedQuery(name = "EdSuperior.findByNsemestres", query = "SELECT e FROM EdSuperior e WHERE e.nsemestres = :nsemestres")
    , @NamedQuery(name = "EdSuperior.findByGraduado", query = "SELECT e FROM EdSuperior e WHERE e.graduado = :graduado")
    , @NamedQuery(name = "EdSuperior.findByNombretitulo", query = "SELECT e FROM EdSuperior e WHERE e.nombretitulo = :nombretitulo")
    , @NamedQuery(name = "EdSuperior.findByTerminacion", query = "SELECT e FROM EdSuperior e WHERE e.terminacion = :terminacion")
    , @NamedQuery(name = "EdSuperior.findByNtargeta", query = "SELECT e FROM EdSuperior e WHERE e.ntargeta = :ntargeta")})
public class EdSuperior implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "modalidad")
    private String modalidad;
    @Column(name = "N_semestres")
    private Integer nsemestres;
    @Column(name = "Graduado")
    private String graduado;
    @Column(name = "Nombre_titulo")
    private String nombretitulo;
    @Column(name = "Terminacion")
    private String terminacion;
    @Column(name = "N_targeta")
    private String ntargeta;
    @JoinColumn(name = "usuario_usuario", referencedColumnName = "usuario")
    @ManyToOne
    private Usuario usuarioUsuario;

    public EdSuperior() {
    }

    public EdSuperior(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModalidad() {
        return modalidad;
    }

    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    public Integer getNsemestres() {
        return nsemestres;
    }

    public void setNsemestres(Integer nsemestres) {
        this.nsemestres = nsemestres;
    }

    public String getGraduado() {
        return graduado;
    }

    public void setGraduado(String graduado) {
        this.graduado = graduado;
    }

    public String getNombretitulo() {
        return nombretitulo;
    }

    public void setNombretitulo(String nombretitulo) {
        this.nombretitulo = nombretitulo;
    }

    public String getTerminacion() {
        return terminacion;
    }

    public void setTerminacion(String terminacion) {
        this.terminacion = terminacion;
    }

    public String getNtargeta() {
        return ntargeta;
    }

    public void setNtargeta(String ntargeta) {
        this.ntargeta = ntargeta;
    }

    public Usuario getUsuarioUsuario() {
        return usuarioUsuario;
    }

    public void setUsuarioUsuario(Usuario usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EdSuperior)) {
            return false;
        }
        EdSuperior other = (EdSuperior) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Dto.EdSuperior[ id=" + id + " ]";
    }
    
}
