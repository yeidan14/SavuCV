/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.DatosperJpaController;
import Dao.UsuarioJpaController;
import Dto.Datosper;
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
public class adatosper extends HttpServlet {

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
        HttpSession misession = request.getSession();
        String usuario = (String) misession.getAttribute("usuario");
        String oneapellido = request.getParameter("oneapellido");
        String twoapellido = request.getParameter("twoapellido");
        String nombre = request.getParameter("nombres");
        String tipodocumento = request.getParameter("tipodocumento");
        String numDocumento = request.getParameter("NumeroDocumento");
        String genero = request.getParameter("sexo");
        String nacionalidad = request.getParameter("nacionalidad");
        String paisnacionalidad = request.getParameter("paisnacionalidad");
        String fechanacido = request.getParameter("fechanacido");
        String paisnacido = request.getParameter("paisnacido");
        String dptonacido = request.getParameter("dptonacido");
        String muninacido = request.getParameter("muninacido");
        String direcciondtpo = request.getParameter("direccionresi");
        String paisresi = request.getParameter("paisresi");
        String dptoresi = request.getParameter("dptoresi");
        String munresi = request.getParameter("munresi");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        String tipolibreta = request.getParameter("tlibreta");
        String numLibreta = request.getParameter("numlibreta");
        String dm = request.getParameter("dm");

        Conexion con = Conexion.getConexion();
        UsuarioJpaController reg = new UsuarioJpaController(con.getBd());
//        Usuario bd =reg.findUsuario(usuario);
//  if( bd.getDatosper()!=null){
//      response.sendRedirect("");
//  }
        Datosper dat = new Datosper();
        dat.setUsuarioUsuario(usuario);
        dat.setOneapellido(oneapellido);
        dat.setTwoapellido(twoapellido);
        dat.setNombres(nombre);
        dat.setTipodocumento(tipodocumento);
        dat.setNdocumento(numDocumento);
        dat.setPersonagenero(genero);
        dat.setNacionalidad(nacionalidad);
        dat.setPaisnacionalidad(paisnacionalidad);
        dat.setFechanaciemiento(fechanacido);
        dat.setPaisnacimiento(paisnacido);
        dat.setDeptonaciemiento(dptonacido);
        dat.setMunicipionacimiento(muninacido);
        dat.setDireccioncorresp(direcciondtpo);
        dat.setPaiscorrespo(paisresi);
        dat.setDptocorrespo(dptoresi);
        dat.setMuncorrespo(munresi);
        dat.setTelefono(telefono);
        dat.setEmail(email);
        dat.setTipoLibreta(tipolibreta);
        dat.setNumeroLibreta(numLibreta);
        dat.setDmLibreta(dm);
        dat.setUsuarioUsuario(usuario);

        DatosperJpaController datos = new DatosperJpaController(con.getBd());
        try {
            datos.edit(dat);
            String tipo = "DatosActualizados";
                    request.setAttribute("nombre", tipo);
            request.getRequestDispatcher("datosper.jsp").forward(request, response);

        } catch (Exception ex) {

            Logger.getLogger(Datosper.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("errodatosper.jsp").forward(request, response);

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
