/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.ExpelabJpaController;
import Dao.UsuarioJpaController;
import Dto.Expelab;
import Dto.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class expactualizar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
             
     HttpSession misession= request.getSession(true);
      String id=request.getParameter("id");
   Integer i=Integer.parseInt(id);  
    String usuario=  (String)misession.getAttribute("usuario");  
    String empres=request.getParameter("nomEmpresa");    
    String tempres=request.getParameter("Tempresa");
    String paisempresa=request.getParameter("paisempresa");
    String dptoempres=request.getParameter("dptoempresa");
    String munempres=request.getParameter("munempresa");
    String correoEmpresa=request.getParameter("correoempresa");
    String telefono=request.getParameter("telempresa");
    String fechaingreso=request.getParameter("FechaIngreso");
    String fechaReiro=request.getParameter("FechaRetiro");
    String cargo=request.getParameter("cargo");
    String dependecia=request.getParameter("dependencia");
    String direccion=request.getParameter("direccion"); 
    Conexion con=Conexion.getConexion();
     UsuarioJpaController edsup= new UsuarioJpaController(con.getBd());
       Usuario user=edsup.findUsuario(usuario);
    Expelab ex=new  Expelab();
    ex.setEmpresa(empres);
    ex.setTipoEmpresa(tempres);
    ex.setPaisEmpresa(paisempresa);
    ex.setDepEmpresa(dptoempres);
    ex.setMuniEmpresa(munempres);
    ex.setCorreoEmp(correoEmpresa);
    ex.setTelefono(telefono);
    ex.setFIngreso(fechaingreso);
    ex.setFechaRetiro(fechaReiro);
    ex.setCargo(cargo);
    ex.setDependencia(dependecia);
    ex.setDireccion(direccion);
    ex.setUsuarioUsuario(user);
    ex.setIdExplaboral(i);
     ExpelabJpaController expe=new ExpelabJpaController(con.getBd());
   expe.edit(ex);
      String tipo = "expactualizada";
    request.setAttribute("nombre", tipo);
     request.getRequestDispatcher("explab.jsp").forward(request, response);
   
   
         
        }catch(Exception ex){
               Logger.getLogger(expactualizar.class.getName()).log(Level.SEVERE, null, ex);
           response.sendRedirect("erroruser.jsp");
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
