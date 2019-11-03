<%-- 
    Document   : infoacademica
    Created on : 13-oct-2019, 23:44:23
    Author     : Daniel
--%>
<%if (session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
    }%>

<%@page import="Dto.*"%>
<%@page import="Controller.*"%>
<%@page import="Dao.*"%>
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

        <title>FORMACION BASICA </title>

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
                                 <%
                                        Conexion con = Conexion.getConexion();
                                       ObervacionesJpaController obs = new ObervacionesJpaController(con.getBd());
                                        String usuario = (String) session.getAttribute("usuario");
                                        boolean v = obs.vacio(usuario);

                                        if (v == true) {
                                    %>
                                <div class="x_title">

                                    <h1>OBESERVACIONES </h1>



                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                   <%String prueba=(String)request.getAttribute("nombre");
                   
                    String elimino="obseliminada";
                    
                                        if(prueba==elimino){
                                            %>
                     <div class="alert alert-success alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <Strong>Tus Datos han sido eliminados de la la bade de datos!</Strong>
                  </div>
                                            <%
                                        } %>
                                    <form action="Registrarobs.do" class="form-horizontal form-label-left" novalidate>
                                        <div class="x_title">              

                                            <h2> Agregue alguna Observacion.</h2>

                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                            <label>Ciudad:</label>
                                            <input  name="ciudad" type="text" placeholder="Ciudad" class="form-control">
                                        </div>




                                        <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                            <label>Fecha:</label>
                                            <input  name="fecha" type="date" placeholder="DD/MM/AAAA" class="form-control" >                      
                                        </div>

                                         <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                            <label>Obervacion:</label>
                                            <textarea rows="10" cols="50" maxlength="500"  name="obs" type="text" placeholder="RELICE UNA BREVE OBSERVACION...." class="form-control" > </textarea>                     
                                        </div>




                                        <button id="send" type="submit" class="btn btn-success col-md-12">GUARDAR</button>

                                    </form>
                                    <%} else if (v == false) {
                                        Obervaciones ob = obs.findObervaciones(usuario);
                                    %>
 <div class="x_title">

                                    <h1>ACTUALICE LA OBSERVACION <a class=" btn btn-success btn-round pull-right" href="imprimir.jsp">SIGUIENTE PASO &NestedGreaterGreater;</a>
 </h1>
     
      <%String prueba=(String)request.getAttribute("nombre");
                   
                    String actualizo="obsactualizada";
                    String registro="obscreada";
                                        if(prueba==registro){
                                            %>
                                            <div class="alert alert-success alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    Felicidades! Agregaste Observacion, puedes actualizar,eliminar datos o ir al siguiente paso.
                  </div>
                                            <%
                                        } else if (prueba==actualizo){%>
                      <div class="alert alert-warning alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    Felicidades! Actualizaste tu Observacion, puedes actualizar,eliminar datos o ir al siguiente paso.
                  </div>
                                       <% }%>
<form action=""  name="obs" class="form-horizontal form-label-left" novalidate>
                                        <div class="x_title">              

                                           

                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                            <label>Ciudad:</label>
                                            <input value="<%=ob.getCiudad()%>"  name="ciudad" type="text" placeholder="Ciudad" class="form-control">
                                        </div>




                                        <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                            <label>Fecha:</label>
                                            <input value="<%=ob.getFecha()%>"  name="fecha" type="date" placeholder="DD/MM/AAAA" class="form-control" >                      
                                        </div>

                                         <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                            <label>Obervacion:</label>
                                            
                                            <textarea  maxlength="500"   value="" rows="10" cols="50"   name="obs" type="text" placeholder="RELICE UNA BREVE OBSERVACION...." class="form-control" >  <%=ob.getObervacionescol()%> </textarea>                     
                                        </div>




                                      <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                    <button id="send" onClick="document.forms.obs.action = 'actualizarobs.do';" type="submit" class="btn btn-round btn-warning col-md-12">ACTUALIZAR</button>
                                            </div>
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
            <button id="send                    " onClick="document.forms.obs.action = 'deleteobs.do';" type="submit" class="btn btn-danger btn-round col-md-12">ELIMINAR</button>
                                        </div>

                                    </form>
                                   
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    
                                   
                                    



                                    <%}%>



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




