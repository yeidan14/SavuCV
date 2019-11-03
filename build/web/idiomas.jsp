<%-- 
    Document   : infoacademica
    Created on : 13-oct-2019, 23:44:23
    Author     : Daniel
--%>

<%@page import="Controller.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>IDIOMAS</title>

    <!-- Bootstrap -->
    <link href="build/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="build/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="build/nprogress/nprogress.css" rel="stylesheet">
    <!-- jQuery custom content scroller -->
    <link href="build/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col menu_fixed">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
                <a href="datosper.jsp" ><img src="images/logob.png" aling-content="center" width="85%"></a></div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
           
            <!-- /menu profile quick info -->

            <br />
            
            
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
               
                <ul class="nav side-menu">
                  
                 
                                 
                  <li><a href="datosper.jsp"><i class="fa fa fa-edit"></i> DATOS PERSONALES </a></li>
                  
                   <li><a><i class="fa fa fa-graduation-cap"></i><span class="fa fa-chevron-down"></span>FORMACION ACADEMICA</a>
                    <ul class="nav child_menu">
                      <li><a href="formbasica.jsp">FORMACION BASICA</a></li>
                      <li><a href="formsupe.jsp">FORMACION MEDIA Y SUPERIOR</a></li>
                      <li><a href="idiomas.jsp">IDIOMAS</a></li>
                    </ul>
                  </li>
                  <li></a></li>
                  
                  <li><a href="explab.jsp"><i class="fa fa-bar-chart-o"></i> EXPERIENCIA LABORAL</a></li>
                  <li><a href="exptime.jsp"><i class="fa fa-hourglass"></i> TIEMPO DE EXPERIENCIA</a></li>
                 <li><a href="obs.jsp"><i class="fa fa-comments-o"></i> OBSERVACIONES</a></li>                                 
                                    <li><a href="imprimir.jsp"><i class="fa fa fa-print"></i> IMPRIMIR</a></li>
                  
                
                </ul>
              </div>

            </div>
            
            
            <div id="menu">
                
                
            </div>
            <!-- sidebar menu -->
            
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            
            <!-- /menu footer buttons -->
          </div>
            
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

                <ul id="usuario" class="nav navbar-nav navbar-right">
                

                
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="row"><div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
        <div class="x_title">
           
                 <h1>IDIOMAS <a class=" btn btn-success btn-round pull-right" href="explab.jsp">SIGUIENTE PASO &NestedGreaterGreater;</a></h1>
                
              
               
            <div class="clearfix"></div>
        </div>
        <div class="x_content">              
                    
                   <div class="x_title">
           
               
                
        
               
                
               <%String prueba=(String)request.getAttribute("nombre");
                   
                    String creada="idiomacreada";
                    String eliminada="idiomaeliminada";
                    
                                        if(prueba==creada){
                                            %>
                                            <div class="alert alert-success alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    Felicidades! Agregaste Un Idioma,Actualiza la pagina.
                    <a class=" btn btn-success btn-round pull-right" href="idiomas.jsp"><i class="fa fa fa-refresh" aria-hidden="true"></i></a>
                  </div>
                                            <%
                                        } else if (prueba==eliminada){%>
                      <div class="alert alert-warning alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    Idioma o media Eliminado correctamente.
                  </div>
                                       <%  }    %>
                
         <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con=Conexion.getConexion2();
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from idioma");
            //Creamo la Tabla:     
        %>
               
                
                 <table class="table table-striped jambo_table bulk_action"  id="tablaDatos">
                    <thead>
                        <tr>
                           
                             <th class="column-title text-center">Nombre del Idioma</th>
                            <th class="column-title text-center">Lo Habla</th>
                            <th class="column-title text-center">Lo Lee</th>
                            <th class="column-title text-center">Lo escribe</th>
                            <th class="column-title text-center">Modificar</th>
                            
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                                if(rs.getString("usuario_usuario").equals((String) session.getAttribute("usuario"))){
                        %>
                        <tr>
                          
                          
                            <td class="text-center"><%= rs.getString("nombre_idioma")%></td>
                            <td class="text-center"><%= rs.getString("lo_habla")%></td>
                             <td class="text-center"><%= rs.getString("lo_lee")%></td>
                              <td class="text-center "><%= rs.getString("lo_escribe")%></td>
                               
                                <td class=" text-center">
                                 
                                <form action="deleteidioma.do">
                                    <input name="id" style="visibility: hidden" value="<%= rs.getInt("idlengua")%>"/>                                     
                              <button id="send"  type="submit" class="btn btn-danger btn-round ">ELIMINAR</button>
                                </form>
                              
                            </td>
                        </tr>
                        <%}}%>
                </table>                   
              <div class="clearfix"></div>
        </div>
            
            <button id="btnexpe" class="btn btn-round btn-success " data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-plus" aria-hidden="true"></i></button>
  
        <a class=" btn btn-success btn-round pull-right" href="idiomas.jsp"><i class="fa fa fa-refresh" aria-hidden="true"></i></a>
                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel">AGREGAR IDIOMA</h4>
                        </div>
                        <div class="modal-body">
                          
                        
                        <div class="x_title">              
                            <form action="RegistrarIdioma.do"  class="form-horizontal form-label-left" novalidate> 

                  <h4>  <p>Especifique los idiomas diferentes al español que: habla, lee, escribe de forma, regular (R), bien (B) o muy bien (MB).</p>
                    </h4>
                        <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                            <p>Idioma</p>
                            <select name="nidioma" class="select2_single form-control" tabindex="-1">                            
                            <option value="Espanol">Español</option>
                            <option value="Ingles">Ingles</option>
                            <option value="Portugues">Portuges</option>
                            <option value="Italiano">Italiano</option>
                            <option value="Aleman">Aleman</option>
                            <option value="Frances">Frances</option>
                            <option value="Latin">Latin</option>
                            <option value="Japones">Japones</option>
                            <option value="Griego">Griego</option>
                            <option value="Arabe">Arabe</option>
                            <option value="Ruso">Ruso</option>
                            
                            
                          
                           
                          </select>        
                      </div>
                        
                        
                            
                            <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                 <p>LO HABLA</p>

                                 <select name="lohabla" class="select2_single form-control" tabindex="-1">
                            
                            <option value="Regular">Regular</option>
                            <option value="Bien">Bien</option>
                            <option value="Muy bien">Muy Bien</option>
                          
                           
                          </select>
                        </div>
                            
                            
                             <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                 <p>LO LEE</p>

                                 <select name="lolee" class="select2_single form-control" tabindex="-1">
                           
                            <option value="Regular">Regular</option>
                            <option value="Bien">Bien</option>
                            <option value="Muy bien">Muy Bien</option>
                          
                           
                          </select>
                        </div>
                            
                             <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                 <p>LO ESCRIBE</p>

                          <select name="loescribe" class="select2_single form-control" tabindex="-1">
                           
                            <option value="Regular">Regular</option>
                            <option value="Bien">Bien</option>
                            <option value="Muy bien">Muy Bien</option>
                          
                           
                          </select>
                        </div>
                                      
                     
 
            <div class="clearfix"></div>
             <div class="modal-footer">
                         
                        <button id="btnexpe" type="submit" class="btn btn-round btn-success col-sm-12" >GUARDAR</button>
                        </div>
                        </form>

        </div>  

      

                        
                        </div>
                       

                      </div>
                    </div>
                        
                  </div>
                      
                       
                             
               
            
        </div>
    </div>
</div></div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
              <a class="savuf">Todos los derechos reservados Ingenieria de Sistemas UFPS /SAVU CV</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

 <script src="build/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="build/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="build/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="build/nprogress/nprogress.js"></script>
    <!-- jQuery custom content scroller -->
    <script src="build/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    
       <script src="buid/pnotify/dist/pnotify.js"></script>
    <script src="build/pnotify/dist/pnotify.buttons.js"></script>
    <script src="build/pnotify/dist/pnotify.nonblock.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="js/custom.min.js"></script>
  </body>
</html>
               
            


