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
@Table(name = "idioma")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Idioma.findAll", query = "SELECT i FROM Idioma i")
    , @NamedQuery(name = "Idioma.findByIdlengua", query = "SELECT i FROM Idioma i WHERE i.idlengua = :idlengua")
    , @NamedQuery(name = "Idioma.findByNombreIdioma", query = "SELECT i FROM Idioma i WHERE i.nombreIdioma = :nombreIdioma")
    , @NamedQuery(name = "Idioma.findByLoHabla", query = "SELECT i FROM Idioma i WHERE i.loHabla = :loHabla")
    , @NamedQuery(name = "Idioma.findByLoLee", query = "SELECT i FROM Idioma i WHERE i.loLee = :loLee")
    , @NamedQuery(name = "Idioma.findByLoEscribe", query = "SELECT i FROM Idioma i WHERE i.loEscribe = :loEscribe")})
public class Idioma implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idlengua")
    private Integer idlengua;
    @Column(name = "nombre_idioma")
    private String nombreIdioma;
    @Column(name = "lo_habla")
    private String loHabla;
    @Column(name = "lo_lee")
    private String loLee;
    @Column(name = "lo_escribe")
    private String loEscribe;
    @JoinColumn(name = "usuario_usuario", referencedColumnName = "usuario")
    @ManyToOne
    private Usuario usuarioUsuario;

    public Idioma() {
    }

    public Idioma(Integer idlengua) {
        this.idlengua = idlengua;
    }

    public Integer getIdlengua() {
        return idlengua;
    }

    public void setIdlengua(Integer idlengua) {
        this.idlengua = idlengua;
    }

    public String getNombreIdioma() {
        return nombreIdioma;
    }

    public void setNombreIdioma(String nombreIdioma) {
        this.nombreIdioma = nombreIdioma;
    }

    public String getLoHabla() {
        return loHabla;
    }

    public void setLoHabla(String loHabla) {
        this.loHabla = loHabla;
    }

    public String getLoLee() {
        return loLee;
    }

    public void setLoLee(String loLee) {
        this.loLee = loLee;
    }

    public String getLoEscribe() {
        return loEscribe;
    }

    public void setLoEscribe(String loEscribe) {
        this.loEscribe = loEscribe;
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
        hash += (idlengua != null ? idlengua.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Idioma)) {
            return false;
        }
        Idioma other = (Idioma) object;
        if ((this.idlengua == null && other.idlengua != null) || (this.idlengua != null && !this.idlengua.equals(other.idlengua))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Dto.Idioma[ idlengua=" + idlengua + " ]";
    }
    
}
