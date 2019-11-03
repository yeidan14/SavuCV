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
@Table(name = "fbasica")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fbasica.findAll", query = "SELECT f FROM Fbasica f")
    , @NamedQuery(name = "Fbasica.findByNcurso", query = "SELECT f FROM Fbasica f WHERE f.ncurso = :ncurso")
    , @NamedQuery(name = "Fbasica.findByTitulo", query = "SELECT f FROM Fbasica f WHERE f.titulo = :titulo")
    , @NamedQuery(name = "Fbasica.findByBfechagrado", query = "SELECT f FROM Fbasica f WHERE f.bfechagrado = :bfechagrado")
    , @NamedQuery(name = "Fbasica.findByUsuarioUsuario", query = "SELECT f FROM Fbasica f WHERE f.usuarioUsuario = :usuarioUsuario")})
public class Fbasica implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "Ncurso")
    private Integer ncurso;
    @Column(name = "Titulo")
    private String titulo;
    @Column(name = "Bfecha_grado")
    private String bfechagrado;
    @Id
    @Basic(optional = false)
    @Column(name = "usuario_usuario")
    private String usuarioUsuario;
    @JoinColumn(name = "usuario_usuario", referencedColumnName = "usuario", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Usuario usuario;

    public Fbasica() {
    }

    public Fbasica(String usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    public Integer getNcurso() {
        return ncurso;
    }

    public void setNcurso(Integer ncurso) {
        this.ncurso = ncurso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getBfechagrado() {
        return bfechagrado;
    }

    public void setBfechagrado(String bfechagrado) {
        this.bfechagrado = bfechagrado;
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
        if (!(object instanceof Fbasica)) {
            return false;
        }
        Fbasica other = (Fbasica) object;
        if ((this.usuarioUsuario == null && other.usuarioUsuario != null) || (this.usuarioUsuario != null && !this.usuarioUsuario.equals(other.usuarioUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Dto.Fbasica[ usuarioUsuario=" + usuarioUsuario + " ]";
    }
    
}
