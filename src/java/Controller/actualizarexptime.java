/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.TiemexpJpaController;
import Dto.Tiemexp;
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
public class actualizarexptime extends HttpServlet {

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
    int spublicoyears=Integer.parseInt(request.getParameter("spublicoyears"));
    int spublicomonths=Integer.parseInt(request.getParameter("spublicomonths"));
    int sprivadoyears=Integer.parseInt(request.getParameter("sprivadoyears"));
    int sprivadomonths=Integer.parseInt(request.getParameter("sprivadomonths"));
    int tiyears=Integer.parseInt(request.getParameter("tiyears"));
    int timonths=Integer.parseInt(request.getParameter("timonths"));
    int totalyears=spublicoyears+sprivadoyears+tiyears;
    int totalmonths=spublicomonths+sprivadomonths+timonths;   
  
    Conexion con=Conexion.getConexion();
    Tiemexp b=new  Tiemexp();
    b.setSpublicoyears(spublicoyears);
    b.setSpublicomonths(spublicomonths);
    b.setSprivadoyears(sprivadoyears);
    b.setSprivadomonths(sprivadomonths);
    b.setTiyears(tiyears);
    b.setTimonths(timonths);    
    b.setTotalyears(totalyears);    
    b.setToalmonths(totalmonths);
    b.setUsuarioUsuario(usuario);
    
    TiemexpJpaController texp=new TiemexpJpaController(con.getBd());
    texp.edit(b);
     String tipo = "texpactualizada";
    request.setAttribute("nombre", tipo);
     request.getRequestDispatcher("exptime.jsp").forward(request, response);
         
        }catch(Exception ex){
               Logger.getLogger(FormBasica.class.getName()).log(Level.SEVERE, null, ex);
           response.sendRedirect("exptime.jsp");
        
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
