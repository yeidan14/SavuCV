/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.*;
import Dto.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class RegistrarFormSupe extends HttpServlet {

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
//         try {
//             
//     HttpSession misession= request.getSession(true);
//    String usuario=  (String)misession.getAttribute("usuario");  
//    String modalidad=request.getParameter("modalidad");
//    String nsemestres=request.getParameter("nsemestres");
//    Integer nsem=Integer.parseInt(nsemestres);
//    String graduado=request.getParameter("graduado");   
//    String ntitulo=request.getParameter("nomtitulo");
//    String terminacion=request.getParameter("terminacion");   
//    String numtargeta=request.getParameter("numtargeta");
//
//    Conexion con=Conexion.getConexion();
//    EdSuperior edusupe=new  EdSuperior();
//    UsuarioJpaController edsup= new UsuarioJpaController(con.getBd());
//       Usuario user=edsup.findUsuario(usuario);
//    edusupe.setModalidad(modalidad);
//    edusupe.setNsemestres(nsem);
//    edusupe.setGraduado(graduado);
//    edusupe.setNombretitulo(ntitulo);
//    edusupe.setTerminacion(terminacion);
//    edusupe.setNtargeta(numtargeta);
//    edusupe.setUsuarioUsuario(user);
//  
//     
//    
//             EdSuperiorJpaController supe=new EdSuperiorJpaController(con.getBd());
//    supe.create(edusupe);
//      String tipo = "fbcreada";
//    request.setAttribute("nombre", tipo);
//     request.getRequestDispatcher("formsupe.jsp").forward(request, response);
//    
//   
//         
//        }catch(Exception ex){
//               Logger.getLogger(FormBasica.class.getName()).log(Level.SEVERE, null, ex);
//           response.sendRedirect("erroruser.jsp");
//        
//        }
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
         try {
             
     HttpSession misession= request.getSession(true);
    String usuario=  (String)misession.getAttribute("usuario");  
    String modalidad=request.getParameter("modalidad");
    String nsemestres=request.getParameter("nsemestres");
    Integer nsem=Integer.parseInt(nsemestres);
    String graduado=request.getParameter("graduado");   
    String ntitulo=request.getParameter("nomtitulo");
    String terminacion=request.getParameter("terminacion");   
    String numtargeta=request.getParameter("numtargeta");

    Conexion con=Conexion.getConexion();
    EdSuperior edusupe=new  EdSuperior();
    UsuarioJpaController edsup= new UsuarioJpaController(con.getBd());
     Usuario user=edsup.findUsuario(usuario);
    edusupe.setModalidad(modalidad);
    edusupe.setNsemestres(nsem);
    edusupe.setGraduado(graduado);
    edusupe.setNombretitulo(ntitulo);
    edusupe.setTerminacion(terminacion);
    edusupe.setNtargeta(numtargeta);
    edusupe.setUsuarioUsuario(user);
  
     
    EdSuperiorJpaController supe=new EdSuperiorJpaController(con.getBd());
   
    supe.create(edusupe);
      String tipo = "fsupecreada";
    request.setAttribute("nombre", tipo);
     request.getRequestDispatcher("formsupe.jsp").forward(request, response);
    
   
         
        }catch(Exception ex){
           Logger.getLogger(FormBasica.class.getName()).log(Level.SEVERE, null, ex);
            String tipo = "fsupevacia";
    request.setAttribute("nombre", tipo);
     request.getRequestDispatcher("formsupe.jsp").forward(request, response);
        
        }
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
