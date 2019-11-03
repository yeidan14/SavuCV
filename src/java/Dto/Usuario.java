/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dto;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author PC
 */
@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
    , @NamedQuery(name = "Usuario.findByUsuario", query = "SELECT u FROM Usuario u WHERE u.usuario = :usuario")
    , @NamedQuery(name = "Usuario.findByEmail", query = "SELECT u FROM Usuario u WHERE u.email = :email")
    , @NamedQuery(name = "Usuario.findByPassword", query = "SELECT u FROM Usuario u WHERE u.password = :password")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "usuario")
    private String usuario;
    @Column(name = "email")
    private String email;
    @Column(name = "password")
    private String password;
    @OneToMany(mappedBy = "usuarioUsuario")
    private List<Expelab> expelabList;
    @OneToMany(mappedBy = "usuarioUsuario")
    private List<EdSuperior> edSuperiorList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "usuario")
    private Tiemexp tiemexp;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "usuario")
    private Datosper datosper;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "usuario")
    private Obervaciones obervaciones;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "usuario")
    private Fbasica fbasica;
    @OneToMany(mappedBy = "usuarioUsuario")
    private List<Idioma> idiomaList;

    public Usuario() {
    }

    public Usuario(String usuario) {
        this.usuario = usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @XmlTransient
    public List<Expelab> getExpelabList() {
        return expelabList;
    }

    public void setExpelabList(List<Expelab> expelabList) {
        this.expelabList = expelabList;
    }

    @XmlTransient
    public List<EdSuperior> getEdSuperiorList() {
        return edSuperiorList;
    }

    public void setEdSuperiorList(List<EdSuperior> edSuperiorList) {
        this.edSuperiorList = edSuperiorList;
    }

    public Tiemexp getTiemexp() {
        return tiemexp;
    }

    public void setTiemexp(Tiemexp tiemexp) {
        this.tiemexp = tiemexp;
    }

    public Datosper getDatosper() {
        return datosper;
    }

    public void setDatosper(Datosper datosper) {
        this.datosper = datosper;
    }

    public Obervaciones getObervaciones() {
        return obervaciones;
    }

    public void setObervaciones(Obervaciones obervaciones) {
        this.obervaciones = obervaciones;
    }

    public Fbasica getFbasica() {
        return fbasica;
    }

    public void setFbasica(Fbasica fbasica) {
        this.fbasica = fbasica;
    }

    @XmlTransient
    public List<Idioma> getIdiomaList() {
        return idiomaList;
    }

    public void setIdiomaList(List<Idioma> idiomaList) {
        this.idiomaList = idiomaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (usuario != null ? usuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.usuario == null && other.usuario != null) || (this.usuario != null && !this.usuario.equals(other.usuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Dto.Usuario[ usuario=" + usuario + " ]";
    }
    
}
