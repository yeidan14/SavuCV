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
@Table(name = "datosper")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Datosper.findAll", query = "SELECT d FROM Datosper d")
    , @NamedQuery(name = "Datosper.findByNombres", query = "SELECT d FROM Datosper d WHERE d.nombres = :nombres")
    , @NamedQuery(name = "Datosper.findByOneapellido", query = "SELECT d FROM Datosper d WHERE d.oneapellido = :oneapellido")
    , @NamedQuery(name = "Datosper.findByTwoapellido", query = "SELECT d FROM Datosper d WHERE d.twoapellido = :twoapellido")
    , @NamedQuery(name = "Datosper.findByTipodocumento", query = "SELECT d FROM Datosper d WHERE d.tipodocumento = :tipodocumento")
    , @NamedQuery(name = "Datosper.findByNdocumento", query = "SELECT d FROM Datosper d WHERE d.ndocumento = :ndocumento")
    , @NamedQuery(name = "Datosper.findByPersonagenero", query = "SELECT d FROM Datosper d WHERE d.personagenero = :personagenero")
    , @NamedQuery(name = "Datosper.findByNacionalidad", query = "SELECT d FROM Datosper d WHERE d.nacionalidad = :nacionalidad")
    , @NamedQuery(name = "Datosper.findByPaisnacionalidad", query = "SELECT d FROM Datosper d WHERE d.paisnacionalidad = :paisnacionalidad")
    , @NamedQuery(name = "Datosper.findByTipoLibreta", query = "SELECT d FROM Datosper d WHERE d.tipoLibreta = :tipoLibreta")
    , @NamedQuery(name = "Datosper.findByNumeroLibreta", query = "SELECT d FROM Datosper d WHERE d.numeroLibreta = :numeroLibreta")
    , @NamedQuery(name = "Datosper.findByDmLibreta", query = "SELECT d FROM Datosper d WHERE d.dmLibreta = :dmLibreta")
    , @NamedQuery(name = "Datosper.findByFechanaciemiento", query = "SELECT d FROM Datosper d WHERE d.fechanaciemiento = :fechanaciemiento")
    , @NamedQuery(name = "Datosper.findByPaisnacimiento", query = "SELECT d FROM Datosper d WHERE d.paisnacimiento = :paisnacimiento")
    , @NamedQuery(name = "Datosper.findByDeptonaciemiento", query = "SELECT d FROM Datosper d WHERE d.deptonaciemiento = :deptonaciemiento")
    , @NamedQuery(name = "Datosper.findByMunicipionacimiento", query = "SELECT d FROM Datosper d WHERE d.municipionacimiento = :municipionacimiento")
    , @NamedQuery(name = "Datosper.findByDireccioncorresp", query = "SELECT d FROM Datosper d WHERE d.direccioncorresp = :direccioncorresp")
    , @NamedQuery(name = "Datosper.findByPaiscorrespo", query = "SELECT d FROM Datosper d WHERE d.paiscorrespo = :paiscorrespo")
    , @NamedQuery(name = "Datosper.findByMuncorrespo", query = "SELECT d FROM Datosper d WHERE d.muncorrespo = :muncorrespo")
    , @NamedQuery(name = "Datosper.findByDptocorrespo", query = "SELECT d FROM Datosper d WHERE d.dptocorrespo = :dptocorrespo")
    , @NamedQuery(name = "Datosper.findByTelefono", query = "SELECT d FROM Datosper d WHERE d.telefono = :telefono")
    , @NamedQuery(name = "Datosper.findByEmail", query = "SELECT d FROM Datosper d WHERE d.email = :email")
    , @NamedQuery(name = "Datosper.findByUsuarioUsuario", query = "SELECT d FROM Datosper d WHERE d.usuarioUsuario = :usuarioUsuario")})
public class Datosper implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "nombres")
    private String nombres;
    @Column(name = "oneapellido")
    private String oneapellido;
    @Column(name = "twoapellido")
    private String twoapellido;
    @Column(name = "Tipo_documento")
    private String tipodocumento;
    @Column(name = "N_documento")
    private String ndocumento;
    @Column(name = "Persona_genero")
    private String personagenero;
    @Column(name = "Nacionalidad")
    private String nacionalidad;
    @Column(name = "Pais_nacionalidad")
    private String paisnacionalidad;
    @Column(name = "tipo_libreta")
    private String tipoLibreta;
    @Column(name = "numero_libreta")
    private String numeroLibreta;
    @Column(name = "dm_libreta")
    private String dmLibreta;
    @Column(name = "Fecha_naciemiento")
    private String fechanaciemiento;
    @Column(name = "Pais_nacimiento")
    private String paisnacimiento;
    @Column(name = "Depto_naciemiento")
    private String deptonaciemiento;
    @Column(name = "Municipio_nacimiento")
    private String municipionacimiento;
    @Column(name = "Direccion_corresp")
    private String direccioncorresp;
    @Column(name = "Pais_correspo")
    private String paiscorrespo;
    @Column(name = "Mun_correspo")
    private String muncorrespo;
    @Column(name = "Dpto_correspo")
    private String dptocorrespo;
    @Column(name = "Telefono")
    private String telefono;
    @Column(name = "Email")
    private String email;
    @Id
    @Basic(optional = false)
    @Column(name = "usuario_usuario")
    private String usuarioUsuario;
    @JoinColumn(name = "usuario_usuario", referencedColumnName = "usuario", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Usuario usuario;

    public Datosper() {
    }

    public Datosper(String usuarioUsuario) {
        this.usuarioUsuario = usuarioUsuario;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getOneapellido() {
        return oneapellido;
    }

    public void setOneapellido(String oneapellido) {
        this.oneapellido = oneapellido;
    }

    public String getTwoapellido() {
        return twoapellido;
    }

    public void setTwoapellido(String twoapellido) {
        this.twoapellido = twoapellido;
    }

    public String getTipodocumento() {
        return tipodocumento;
    }

    public void setTipodocumento(String tipodocumento) {
        this.tipodocumento = tipodocumento;
    }

    public String getNdocumento() {
        return ndocumento;
    }

    public void setNdocumento(String ndocumento) {
        this.ndocumento = ndocumento;
    }

    public String getPersonagenero() {
        return personagenero;
    }

    public void setPersonagenero(String personagenero) {
        this.personagenero = personagenero;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public String getPaisnacionalidad() {
        return paisnacionalidad;
    }

    public void setPaisnacionalidad(String paisnacionalidad) {
        this.paisnacionalidad = paisnacionalidad;
    }

    public String getTipoLibreta() {
        return tipoLibreta;
    }

    public void setTipoLibreta(String tipoLibreta) {
        this.tipoLibreta = tipoLibreta;
    }

    public String getNumeroLibreta() {
        return numeroLibreta;
    }

    public void setNumeroLibreta(String numeroLibreta) {
        this.numeroLibreta = numeroLibreta;
    }

    public String getDmLibreta() {
        return dmLibreta;
    }

    public void setDmLibreta(String dmLibreta) {
        this.dmLibreta = dmLibreta;
    }

    public String getFechanaciemiento() {
        return fechanaciemiento;
    }

    public void setFechanaciemiento(String fechanaciemiento) {
        this.fechanaciemiento = fechanaciemiento;
    }

    public String getPaisnacimiento() {
        return paisnacimiento;
    }

    public void setPaisnacimiento(String paisnacimiento) {
        this.paisnacimiento = paisnacimiento;
    }

    public String getDeptonaciemiento() {
        return deptonaciemiento;
    }

    public void setDeptonaciemiento(String deptonaciemiento) {
        this.deptonaciemiento = deptonaciemiento;
    }

    public String getMunicipionacimiento() {
        return municipionacimiento;
    }

    public void setMunicipionacimiento(String municipionacimiento) {
        this.municipionacimiento = municipionacimiento;
    }

    public String getDireccioncorresp() {
        return direccioncorresp;
    }

    public void setDireccioncorresp(String direccioncorresp) {
        this.direccioncorresp = direccioncorresp;
    }

    public String getPaiscorrespo() {
        return paiscorrespo;
    }

    public void setPaiscorrespo(String paiscorrespo) {
        this.paiscorrespo = paiscorrespo;
    }

    public String getMuncorrespo() {
        return muncorrespo;
    }

    public void setMuncorrespo(String muncorrespo) {
        this.muncorrespo = muncorrespo;
    }

    public String getDptocorrespo() {
        return dptocorrespo;
    }

    public void setDptocorrespo(String dptocorrespo) {
        this.dptocorrespo = dptocorrespo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
        if (!(object instanceof Datosper)) {
            return false;
        }
        Datosper other = (Datosper) object;
        if ((this.usuarioUsuario == null && other.usuarioUsuario != null) || (this.usuarioUsuario != null && !this.usuarioUsuario.equals(other.usuarioUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Dto.Datosper[ usuarioUsuario=" + usuarioUsuario + " ]";
    }
    
}
