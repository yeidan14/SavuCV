/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.FbasicaJpaController;
import Dto.Fbasica;
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
public class afbasica extends HttpServlet {

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
    String usuario=  (String)misession.getAttribute("usuario");  
    String ncurso=request.getParameter("colegio");
    Integer curso=Integer.parseInt(ncurso);
    String titulo=request.getParameter("titulo");
    String fechagrado=request.getParameter("fechagrado");
    Conexion con=Conexion.getConexion();
    Fbasica b=new  Fbasica();
    b.setUsuarioUsuario(usuario);
    b.setNcurso(curso);
    b.setTitulo(titulo);
    b.setBfechagrado(fechagrado);
    
    
    FbasicaJpaController basic=new FbasicaJpaController(con.getBd());
    basic.edit(b);
      String tipo = "fbactualizada";
                    request.setAttribute("nombre", tipo);
     request.getRequestDispatcher("formbasica.jsp").forward(request, response);
         
        }catch(Exception ex){
               Logger.getLogger(FormBasica.class.getName()).log(Level.SEVERE, null, ex);
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
