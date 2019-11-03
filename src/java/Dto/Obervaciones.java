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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author PC
 */
@Entity
@Table(name = "obervaciones")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Obervaciones.findAll", query = "SELECT o FROM Obervaciones o")
    , @NamedQuery(name = "Obervaciones.findByCiudad", query = "SELECT o FROM Obervaciones o WHERE o.ciudad = :ciudad")
    , @NamedQuery(name = "Obervaciones.findByFecha", query = "SELECT o FROM Obervaciones o WHERE o.fecha = :fecha")
    , @NamedQuery(name = "Obervaciones.findByUsuarioUsuario", query = "SELECT o FROM Obervaciones o WHERE o.usuarioUsuario = :usuarioUsuario")})
public class Obervaciones implements Serializable {

    private static final long serialVersionUID = 1L;
    @Lob
    @Column(name = "Obervacionescol")
    private String obervacionescol;
    @Column(name = "ciudad")
    private String ciudad;
    @Column(name = "fecha")
    private String fecha;
    @Id
    @Basic(optional = false)
    @Column(name = "usuario_usuario")
    private String usuarioUsuario;
    @JoinColumn(name = "usuario_usuario", referencedColumnName = "usuario", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Usuario usuario;

    public Obervaciones() {
    }

    public Obervaciones(String usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    public String getObervacionescol() {
        return obervacionescol;
    }

    public void setObervacionescol(String obervacionescol) {
        this.obervacionescol = obervacionescol;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getUsuarioUsuario() {
        return usuarioUsuario;
    }

    public void setUsuarioUsuario(String usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (usuarioUsuario != null ? usuarioUsuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Obervaciones)) {
            return false;
        }
        Obervaciones other = (Obervaciones) object;
        if ((this.usuarioUsuario == null && other.usuarioUsuario != null) || (this.usuarioUsuario != null && !this.usuarioUsuario.equals(other.usuarioUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Dto.Obervaciones[ usuarioUsuario=" + usuarioUsuario + " ]";
    }
    
}
