/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import Controller.Conexion;
import Dao.DatosperJpaController;
import Dao.UsuarioJpaController;
import Dto.Datosper;

/**
 *
 * @author PC
 */
public class pruebabuscaruserdatosper {
    
    public static void main(String[] args) {
        
        
         Conexion con = Conexion.getConexion();
        UsuarioJpaController reg = new UsuarioJpaController(con.getBd());
          DatosperJpaController datos = new DatosperJpaController(con.getBd());
          
          Datosper dat=datos.buscarporusuario("yeison");
          
          System.out.println("nombres"+dat.getNombres());
    }
    
}
