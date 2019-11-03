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
@Table(name = "expelab")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Expelab.findAll", query = "SELECT e FROM Expelab e")
    , @NamedQuery(name = "Expelab.findByIdExplaboral", query = "SELECT e FROM Expelab e WHERE e.idExplaboral = :idExplaboral")
    , @NamedQuery(name = "Expelab.findByEmpresa", query = "SELECT e FROM Expelab e WHERE e.empresa = :empresa")
    , @NamedQuery(name = "Expelab.findByTipoEmpresa", query = "SELECT e FROM Expelab e WHERE e.tipoEmpresa = :tipoEmpresa")
    , @NamedQuery(name = "Expelab.findByPaisEmpresa", query = "SELECT e FROM Expelab e WHERE e.paisEmpresa = :paisEmpresa")
    , @NamedQuery(name = "Expelab.findByDepEmpresa", query = "SELECT e FROM Expelab e WHERE e.depEmpresa = :depEmpresa")
    , @NamedQuery(name = "Expelab.findByMuniEmpresa", query = "SELECT e FROM Expelab e WHERE e.muniEmpresa = :muniEmpresa")
    , @NamedQuery(name = "Expelab.findByCorreoEmp", query = "SELECT e FROM Expelab e WHERE e.correoEmp = :correoEmp")
    , @NamedQuery(name = "Expelab.findByTelefono", query = "SELECT e FROM Expelab e WHERE e.telefono = :telefono")
    , @NamedQuery(name = "Expelab.findByFIngreso", query = "SELECT e FROM Expelab e WHERE e.fIngreso = :fIngreso")
    , @NamedQuery(name = "Expelab.findByFechaRetiro", query = "SELECT e FROM Expelab e WHERE e.fechaRetiro = :fechaRetiro")
    , @NamedQuery(name = "Expelab.findByCargo", query = "SELECT e FROM Expelab e WHERE e.cargo = :cargo")
    , @NamedQuery(name = "Expelab.findByDependencia", query = "SELECT e FROM Expelab e WHERE e.dependencia = :dependencia")
    , @NamedQuery(name = "Expelab.findByDireccion", query = "SELECT e FROM Expelab e WHERE e.direccion = :direccion")})
public class Expelab implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_explaboral")
    private Integer idExplaboral;
    @Column(name = "Empresa")
    private String empresa;
    @Column(name = "TipoEmpresa")
    private String tipoEmpresa;
    @Column(name = "PaisEmpresa")
    private String paisEmpresa;
    @Column(name = "DepEmpresa")
    private String depEmpresa;
    @Column(name = "MuniEmpresa")
    private String muniEmpresa;
    @Column(name = "CorreoEmp")
    private String correoEmp;
    @Column(name = "Telefono")
    private String telefono;
    @Column(name = "FIngreso")
    private String fIngreso;
    @Column(name = "FechaRetiro")
    private String fechaRetiro;
    @Column(name = "Cargo")
    private String cargo;
    @Column(name = "Dependencia")
    private String dependencia;
    @Column(name = "Direccion")
    private String direccion;
    @JoinColumn(name = "usuario_usuario", referencedColumnName = "usuario")
    @ManyToOne
    private Usuario usuarioUsuario;

    public Expelab() {
    }

    public Expelab(Integer idExplaboral) {
        this.idExplaboral = idExplaboral;
    }

    public Integer getIdExplaboral() {
        return idExplaboral;
    }

    public void setIdExplaboral(Integer idExplaboral) {
        this.idExplaboral = idExplaboral;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public String getTipoEmpresa() {
        return tipoEmpresa;
    }

    public void setTipoEmpresa(String tipoEmpresa) {
        this.tipoEmpresa = tipoEmpresa;
    }

    public String getPaisEmpresa() {
        return paisEmpresa;
    }

    public void setPaisEmpresa(String paisEmpresa) {
        this.paisEmpresa = paisEmpresa;
    }

    public String getDepEmpresa() {
        return depEmpresa;
    }

    public void setDepEmpresa(String depEmpresa) {
        this.depEmpresa = depEmpresa;
    }

    public String getMuniEmpresa() {
        return muniEmpresa;
    }

    public void setMuniEmpresa(String muniEmpresa) {
        this.muniEmpresa = muniEmpresa;
    }

    public String getCorreoEmp() {
        return correoEmp;
    }

    public void setCorreoEmp(String correoEmp) {
        this.correoEmp = correoEmp;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFIngreso() {
        return fIngreso;
    }

    public void setFIngreso(String fIngreso) {
        this.fIngreso = fIngreso;
    }

    public String getFechaRetiro() {
        return fechaRetiro;
    }

    public void setFechaRetiro(String fechaRetiro) {
        this.fechaRetiro = fechaRetiro;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getDependencia() {
        return dependencia;
    }

    public void setDependencia(String dependencia) {
        this.dependencia = dependencia;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
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
        hash += (idExplaboral != null ? idExplaboral.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Expelab)) {
            return false;
        }
        Expelab other = (Expelab) object;
        if ((this.idExplaboral == null && other.idExplaboral != null) || (this.idExplaboral != null && !this.idExplaboral.equals(other.idExplaboral))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Dto.Expelab[ idExplaboral=" + idExplaboral + " ]";
    }
    
}
