/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import Controller.Conexion;
import java.util.logging.Level;
import java.util.logging.Logger;
import Dao.*;
import Dao.exceptions.PreexistingEntityException;
import Dto.*;


/**
 *
 * @author PC
 */
public class datosper {
    
    public static void main(String[] args) {
        
          Conexion con = Conexion.getConexion();
        UsuarioJpaController reg = new UsuarioJpaController(con.getBd());
//        Usuario bd =reg.findUsuario(usuario);
    String usuario="yeison";
    Datosper dat=new Datosper();
    dat.setUsuarioUsuario("sdasd");
    dat.setOneapellido("asdasd");
    dat.setTwoapellido("sadasd");
    dat.setNombres("asdasd");
    dat.setTipodocumento("asdasd");
    dat.setNdocumento("asdasd");
    dat.setPersonagenero("asdasd");
    dat.setNacionalidad("asdasd");
    dat.setPaisnacionalidad("asdasd");
    dat.setFechanaciemiento("asdasd");
    dat.setPaisnacimiento("asdasd");
    dat.setDeptonaciemiento("asdasd");
    dat.setMunicipionacimiento("asdasd");
    dat.setDireccioncorresp("asdas");
    dat.setPaiscorrespo("asdas");
    dat.setDptocorrespo("asdas");
    dat.setMuncorrespo("asdasd");
    dat.setTelefono("asdasd");
    dat.setEmail("asdasd");
    dat.setTipoLibreta("sdasdd");
    dat.setNumeroLibreta("asdasd");
    dat.setDmLibreta("sadasdasdasd");
    dat.setUsuarioUsuario(usuario);
    
    DatosperJpaController datos=new DatosperJpaController(con.getBd());
   
        try {
            datos.create(dat);
        } catch (PreexistingEntityException ex) {
            Logger.getLogger(pruebaformsupe.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(pruebaformsupe.class.getName()).log(Level.SEVERE, null, ex);
        }
           
    
    }
    
}
