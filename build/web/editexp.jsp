<%-- 
    Document   : explab
    Created on : 14-oct-2019, 13:34:09
    Author     : Daniel
--%>

<%@page import="Dto.Expelab"%>
<%@page import="Controller.Conexion"%>
<%@page import="Dao.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>EXPERIENCIA LABORAL</title>

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
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
        <div class="x_title">
                       <div class="clearfix"></div>
        </div> 
          <%
              Integer id=(Integer)request.getAttribute("id");
                                        Conexion con = Conexion.getConexion();
                                       ExpelabJpaController expe = new ExpelabJpaController(con.getBd());
                                        String usuario = (String) session.getAttribute("usuario");
                                        Expelab ex=expe.findExpelab(id);
                                        boolean v = expe.vacio(id);

                                        if (v == false) {
                                    %>
        <div class="x_title">

            <h1>EDITANDO EXPERCIENCIA LABORAL <a class=" btn btn-success btn-round pull-right" href="explab.jsp">&Ll;REGRESAR</a>
 </h1>

                                   
                                    <div class="clearfix"></div>
                                </div>
        <form  name="editexpe" action=""   class="form-horizontal form-label-left" novalidate> 
 <input name="id"  style="visibility: hidden"  id="EmpresaAc" type="text" placeholder="Empresa Actual" value="<%=ex.getIdExplaboral()%>"class="form-control">
                  <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Empresa o Entidad:</label>
                      
                     
                  
                      <input name="nomEmpresa"   id="EmpresaAc" type="text" placeholder="Empresa Actual" value="<%=ex.getEmpresa()%>"class="form-control">
                  </div>
                    
                    <div  class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Tipo de Empresa: </label>
             
                  
                      
                      <select name="Tempresa" class="select2_single form-control" tabindex="-1">
                            <option></option>
                            <option <%if(ex.getTipoEmpresa().equals("Publica")){%> selected="true" <%}%> value="Publica">Publica</option>
                            <option <%if(ex.getTipoEmpresa().equals("Privada")){%> selected="true" <%}%> value="Privada">Privada</option>
                        
                           
                          </select>
                       
                      
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Pais:</label>
                      <input name="paisempresa" id="pais_empresa_actual" type="text" placeholder="Colombia" value="<%=ex.getPaisEmpresa()%>" class="form-control" required="llenaloscampos">
                  </div>
                    
                    
                   <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Departamento:</label>
                      <input name="dptoempresa" id="dpto_empresa_actual" type="text" value="<%=ex.getDepEmpresa()%>" placeholder="Nte Santander" class="form-control">
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Municipio: </label>
             
                      <input name="munempresa" id="mun_empresa_actual" type="text" value="<%=ex.getMuniEmpresa()%>" placeholder="Los Patios" class="form-control">                      
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Correo electronico de la Entidad:</label>
                      <input name="correoempresa"id="correo_empresa_actual" type="email" value="<%=ex.getCorreoEmp()%>" placeholder="empresa@web.com" class="form-control" required>
                  </div>
                    
                     <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Telefonos:</label>
                      <input name="telempresa" id="tel_empresa_actual" type="tel" value="<%=ex.getTelefono() %>" placeholder="5723823 / 32412322" class="form-control">
                  </div>
                    
                     <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Fecha de Ingreso:</label>
                      <input name="FechaIngreso" id="ingreso_empresa_actual" type="date" value="<%=ex.getFIngreso() %>" placeholder="" class="form-control">
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Fecha de Retiro:</label>
                      <input name="FechaRetiro" id="retiro_empresa_actual" type="date" value="<%=ex.getFechaRetiro() %>" placeholder="" class="form-control">
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Cargo o Contrato:</label>
                      <input name="cargo" id="cargo_empresa_actual" type="text" placeholder="Gerente" value="<%=ex.getCargo() %>" class="form-control">
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Dependencia:</label>
                      <input name="dependencia" id="depe_empresa_actual" type="text" value="<%=ex.getDependencia() %>" placeholder="Sistemas" class="form-control">
                  </div>
                    
                     <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Direccion:</label>
                      <input name="direccion" id="dire_empresa_actual" type="text" value="<%=ex.getDireccion() %>" placeholder="Av 4e #34-23" class="form-control">
                  </div>
 
            <div class="clearfix"></div>
            <div class="modal-footer">
                         
                         <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                    <button id="send" onClick="document.forms.editexpe.action = 'expactualizar.do';" type="submit" class="btn btn-round btn-warning col-md-12">ACTUALIZAR</button>
                                            </div>
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
            <button id="send                    " onClick="document.forms.editexpe.action = 'expdelete.do';" type="submit" class="btn btn-danger btn-round col-md-12">ELIMINAR</button>
                                        </div>
                        </div>
                        </form>

     <%}%>
                  
                                          
                       
        
          </div>
</div>
          </div>
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

    <!-- jQuery -->
    <script src="build/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="build/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="build/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="build/nprogress/nprogress.js"></script>
    <!-- jQuery custom content scroller -->
    <script src="build/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="js/custom.min.js"></script>
  </body>
</html>