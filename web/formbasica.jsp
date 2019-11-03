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
                                        FbasicaJpaController fbasica = new FbasicaJpaController(con.getBd());
                                        String usuario = (String) session.getAttribute("usuario");
                                        boolean v = fbasica.vacio(usuario);

                                        if (v == true) {
                                    %>
                                <div class="x_title">

                                    <h1>EDUCACION BASICA </h1>



                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                   <%String prueba=(String)request.getAttribute("nombre");
                   
                    String elimino="fbeliminada";
                    
                                        if(prueba==elimino){
                                            %>
                     <div class="alert alert-success alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <Strong>Tus Datos han sido eliminados de la la bade de datos!</Strong>
                  </div>
                                            <%
                                        } %>
                                    <form action="FormBasica.do"class="form-horizontal form-label-left" novalidate>
                                        <div class="x_title">              

                                            <h4>Marque con una x el último grado aprobado (los grados de 1o. a 6o. de bachillerato equivalen a los grados 6o. a 11o. de educación básica secundaria y media).</h4>

                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">


                                            <label>Primaria</label>

                                            <p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1" checked="" required />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /> 
                                            </p>
                                        </div>

                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>

                                            <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6" checked="" required />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" /> 

                                            </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>

                                            <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10" checked="" required />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> 


                                            </p>
                                        </div>




                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Titulo Obtenido:</label>
                                            <input  name="titulo" type="text" placeholder="Titulo Obtenido" class="form-control">
                                        </div>




                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Fecha de grado:</label>
                                            <input  name="fechagrado" type="date" placeholder="DD/MM/AAAA" class="form-control" >                      
                                        </div>






                                        <button id="send" type="submit" class="btn btn-success col-md-12">GUARDAR</button>

                                    </form>
                                    <%} else if (v == false) {
                                        Fbasica fb = fbasica.findFbasica(usuario);
                                    %>
 <div class="x_title">

                                    <h1>EDUCACION BASICA  <a class=" btn btn-success btn-round pull-right" href="formsupe.jsp">SIGUIENTE PASO &NestedGreaterGreater;</a>
 </h1>

                                   
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    
                                    <%String prueba=(String)request.getAttribute("nombre");
                   
                    String actualizo="fbactualizada";
                    String registro="fbcreada";
                                        if(prueba==registro){
                                            %>
                                            <div class="alert alert-success alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    Felicidades! Agregaste Tu formacion Basica, puedes actualizar,eliminar datos o ir al siguiente paso.
                  </div>
                                            <%
                                        } else if (prueba==actualizo){%>
                      <div class="alert alert-warning alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    Felicidades! Actualizaste tu formacion basica, puedes actualizar,eliminar datos o ir al siguiente paso.
                  </div>
                                       <% }%>
                                    <form action="" name="fbasica" class="form-horizontal form-label-left" novalidate>
                                        <div class="x_title">              

                                            <h4>Marque con una x el último grado aprobado (los grados de 1o. a 6o. de bachillerato equivalen a los grados 6o. a 11o. de educación básica secundaria y media).</h4>

                                            <div class="clearfix"></div>
                                        </div>
                                        <% if(fb.getNcurso().toString().equals("1")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1" checked="" required />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"   />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"   />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                           <% if(fb.getNcurso().toString().equals("2")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" checked="" required/> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"   />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("3")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" checked="" required=""/> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"   />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("4")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" checked="" required=""/> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"   />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("5")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" checked="" required=""/></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"  required />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("6")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"  checked="" required />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"   />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("7")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2"/> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" checked="" required=""/> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("8")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8" checked="" required="" /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("9")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8"  /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9"checked="" required="" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("10")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8"  /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10" checked="" required=""  />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                           <% if(fb.getNcurso().toString().equals("11")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input type="radio" class="flat" name="colegio" id="8" value="8"  /> 
                                                9:<input type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input type="radio" class="flat" name="colegio" id="10" value="10"   />
                                                11:<input type="radio" class="flat" name="colegio" id="11" value="11" checked="" required="" /> </p>
                                        </div>
                                          <%}%>
                                          


                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Titulo Obtenido:</label>
                                            <input maxlength="45" name="titulo" type="text" value="<%=fb.getTitulo()%>" placeholder="Titulo Obtenido" class="form-control">
                                        </div>




                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Fecha de grado:</label>
                                            <input  name="fechagrado" type="date" placeholder="DD/MM/AAAA" value="<%=fb.getBfechagrado()%>" class="form-control" >                      
                                        </div>





<div class="col-md-6 col-sm-12 col-xs-12 form-group">
                    <button id="send" onClick="document.forms.fbasica.action = 'afbasica.do';" type="submit" class="btn btn-round btn-warning col-md-12">ACTUALIZAR</button>
                                            </div>
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
            <button id="send                    " onClick="document.forms.fbasica.action = 'deletefbasica.do';" type="submit" class="btn btn-danger btn-round col-md-12">ELIMINAR</button>
                                        </div>

                                    </form>



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




