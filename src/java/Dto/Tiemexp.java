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
@Table(name = "tiemexp")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tiemexp.findAll", query = "SELECT t FROM Tiemexp t")
    , @NamedQuery(name = "Tiemexp.findByUsuarioUsuario", query = "SELECT t FROM Tiemexp t WHERE t.usuarioUsuario = :usuarioUsuario")
    , @NamedQuery(name = "Tiemexp.findBySpublicoyears", query = "SELECT t FROM Tiemexp t WHERE t.spublicoyears = :spublicoyears")
    , @NamedQuery(name = "Tiemexp.findBySpublicomonths", query = "SELECT t FROM Tiemexp t WHERE t.spublicomonths = :spublicomonths")
    , @NamedQuery(name = "Tiemexp.findBySprivadoyears", query = "SELECT t FROM Tiemexp t WHERE t.sprivadoyears = :sprivadoyears")
    , @NamedQuery(name = "Tiemexp.findBySprivadomonths", query = "SELECT t FROM Tiemexp t WHERE t.sprivadomonths = :sprivadomonths")
    , @NamedQuery(name = "Tiemexp.findByTiyears", query = "SELECT t FROM Tiemexp t WHERE t.tiyears = :tiyears")
    , @NamedQuery(name = "Tiemexp.findByTimonths", query = "SELECT t FROM Tiemexp t WHERE t.timonths = :timonths")
    , @NamedQuery(name = "Tiemexp.findByTotalyears", query = "SELECT t FROM Tiemexp t WHERE t.totalyears = :totalyears")
    , @NamedQuery(name = "Tiemexp.findByToalmonths", query = "SELECT t FROM Tiemexp t WHERE t.toalmonths = :toalmonths")})
public class Tiemexp implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "usuario_usuario")
    private String usuarioUsuario;
    @Basic(optional = false)
    @Column(name = "spublicoyears")
    private int spublicoyears;
    @Basic(optional = false)
    @Column(name = "spublicomonths")
    private int spublicomonths;
    @Basic(optional = false)
    @Column(name = "sprivadoyears")
    private int sprivadoyears;
    @Basic(optional = false)
    @Column(name = "sprivadomonths")
    private int sprivadomonths;
    @Basic(optional = false)
    @Column(name = "tiyears")
    private int tiyears;
    @Basic(optional = false)
    @Column(name = "timonths")
    private int timonths;
    @Basic(optional = false)
    @Column(name = "totalyears")
    private int totalyears;
    @Basic(optional = false)
    @Column(name = "toalmonths")
    private int toalmonths;
    @JoinColumn(name = "usuario_usuario", referencedColumnName = "usuario", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Usuario usuario;

    public Tiemexp() {
    }

    public Tiemexp(String usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    public Tiemexp(String usuarioUsuario, int spublicoyears, int spublicomonths, int sprivadoyears, int sprivadomonths, int tiyears, int timonths, int totalyears, int toalmonths) {
        this.usuarioUsuario = usuarioUsuario;
        this.spublicoyears = spublicoyears;
        this.spublicomonths = spublicomonths;
        this.sprivadoyears = sprivadoyears;
        this.sprivadomonths = sprivadomonths;
        this.tiyears = tiyears;
        this.timonths = timonths;
        this.totalyears = totalyears;
        this.toalmonths = toalmonths;
    }

    public String getUsuarioUsuario() {
        return usuarioUsuario;
    }

    public void setUsuarioUsuario(String usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    public int getSpublicoyears() {
        return spublicoyears;
    }

    public void setSpublicoyears(int spublicoyears) {
        this.spublicoyears = spublicoyears;
    }

    public int getSpublicomonths() {
        return spublicomonths;
    }

    public void setSpublicomonths(int spublicomonths) {
        this.spublicomonths = spublicomonths;
    }

    public int getSprivadoyears() {
        return sprivadoyears;
    }

    public void setSprivadoyears(int sprivadoyears) {
        this.sprivadoyears = sprivadoyears;
    }

    public int getSprivadomonths() {
        return sprivadomonths;
    }

    public void setSprivadomonths(int sprivadomonths) {
        this.sprivadomonths = sprivadomonths;
    }

    public int getTiyears() {
        return tiyears;
    }

    public void setTiyears(int tiyears) {
        this.tiyears = tiyears;
    }

    public int getTimonths() {
        return timonths;
    }

    public void setTimonths(int timonths) {
        this.timonths = timonths;
    }

    public int getTotalyears() {
        return totalyears;
    }

    public void setTotalyears(int totalyears) {
        this.totalyears = totalyears;
    }

    public int getToalmonths() {
        return toalmonths;
    }

    public void setToalmonths(int toalmonths) {
        this.toalmonths = toalmonths;
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
        if (!(object instanceof Tiemexp)) {
            return false;
        }
        Tiemexp other = (Tiemexp) object;
        if ((this.usuarioUsuario == null && other.usuarioUsuario != null) || (this.usuarioUsuario != null && !this.usuarioUsuario.equals(other.usuarioUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Dto.Tiemexp[ usuarioUsuario=" + usuarioUsuario + " ]";
    }
    
}
