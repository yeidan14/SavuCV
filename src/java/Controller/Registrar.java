/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Dto.*;
import Dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class Registrar extends HttpServlet {

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
        
        
        String usuario=request.getParameter("usuario");
         String email=request.getParameter("email");
          String pass=request.getParameter("pass");
         Usuario nuevo=new Usuario();
         nuevo.setUsuario(usuario);
         nuevo.setEmail(email);
         nuevo.setPassword(pass);
         Conexion con=Conexion.getConexion();
        UsuarioJpaController est=new UsuarioJpaController(con.getBd());
        try {
            if(est.findUsuario(usuario)==null){
            est.create(nuevo);
            String tipo="Usuariocreado";
          request.setAttribute("nombre",tipo);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            }else{
                
             String tipo="Usuarioduplicado";
          request.setAttribute("nombre",tipo);
          request.getRequestDispatcher("registro.jsp").forward(request, response);
            }
         
            
           
            
            
        } catch (Exception ex) {
            Logger.getLogger(Registrar.class.getName()).log(Level.SEVERE, null, ex);
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
