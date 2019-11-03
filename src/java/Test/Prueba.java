/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;
import Dto.*;
import Controller.*;
import Dao.*;
/**
 *
 * @author PC
 */
public class Prueba {
    
    public static void main(String[] args) throws Exception {
          Usuario user = new Usuario();
        user.setUsuario("papallokiniel");
        user.setEmail("asdasd");
        user.setPassword("yeidan141995");
        Conexion con = Conexion.getConexion();
        UsuarioJpaController reg = new UsuarioJpaController(con.getBd());
         reg.create(user);
        System.err.println("registrado");
    }
    
}
