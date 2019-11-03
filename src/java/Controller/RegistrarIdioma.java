/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.EdSuperiorJpaController;
import Dao.IdiomaJpaController;
import Dao.UsuarioJpaController;
import Dto.EdSuperior;
import Dto.Idioma;
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
public class RegistrarIdioma extends HttpServlet {

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
    String idioma=request.getParameter("nidioma");
    String lohabla=request.getParameter("lohabla");
    String loescribe=request.getParameter("loescribe");
    String lolee=request.getParameter("lolee");    

    Conexion con=Conexion.getConexion();
    UsuarioJpaController edsup= new UsuarioJpaController(con.getBd());
     Usuario user=edsup.findUsuario(usuario);
   
    Idioma idio=new Idioma();
    idio.setNombreIdioma(idioma);
    idio.setLoHabla(lohabla);
    idio.setLoEscribe(loescribe);
    idio.setLoLee(lolee);
    idio.setUsuarioUsuario(user);    
  
     if(idio!=null && idio.getLoEscribe()!=null &&idio.getLoLee()!=null&&idio.getLoHabla()!=null&&idio.getNombreIdioma()!=null){
    IdiomaJpaController id=new IdiomaJpaController(con.getBd());
   
   id.create(idio);
      String tipo = "idiomacreada";
    request.setAttribute("nombre", tipo);
     request.getRequestDispatcher("idiomas.jsp").forward(request, response);
     }else{
           String tipo = "idiovacia";
    request.setAttribute("nombre", tipo);
    response.sendRedirect("idiomas.jsp");
     }
   
         
        }catch(Exception ex){
           Logger.getLogger(Idioma.class.getName()).log(Level.SEVERE, null, ex);
            String tipo = "idiovacia";
    request.setAttribute("nombre", tipo);
     request.getRequestDispatcher("erroruser.jsp").forward(request, response);
        
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
        
        
//         try {
//             
//     HttpSession misession= request.getSession(true);
//    String usuario=  (String)misession.getAttribute("usuario");
//    String idioma=request.getParameter("nidioma");
//    String lohabla=request.getParameter("lohabla");
//    String loescribe=request.getParameter("loescribe");
//    String lolee=request.getParameter("lolee");    
//
//    Conexion con=Conexion.getConexion();
//    UsuarioJpaController edsup= new UsuarioJpaController(con.getBd());
//     Usuario user=edsup.findUsuario(usuario);
//   
//    Idioma idio=new Idioma();
//    idio.setNombreIdioma(idioma);
//    idio.setLoHabla(lohabla);
//    idio.setLoEscribe(loescribe);
//    idio.setLoLee(lolee);
//    idio.setUsuarioUsuario(user);    
//  
//     if(idio!=null && idio.getLoEscribe()!=null &&idio.getLoLee()!=null&&idio.getLoHabla()!=null&&idio.getNombreIdioma()!=null){
//    IdiomaJpaController id=new IdiomaJpaController(con.getBd());
//   
//   id.create(idio);
//      String tipo = "idiocreada";
//    request.setAttribute("nombre", tipo);
//     request.getRequestDispatcher("idiomas.jsp").forward(request, response);
//     }else{
//           String tipo = "idiovacia";
//    request.setAttribute("nombre", tipo);
//    response.sendRedirect("idiomas.jsp");
//     }
//   
//         
//        }catch(Exception ex){
//           Logger.getLogger(Idioma.class.getName()).log(Level.SEVERE, null, ex);
//            String tipo = "idiovacia";
//    request.setAttribute("nombre", tipo);
//     request.getRequestDispatcher("idiomas.jsp").forward(request, response);
//        
//        }
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
