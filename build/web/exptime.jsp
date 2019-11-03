<%-- 
    Document   : admin
    Created on : 12-oct-2019, 10:24:38
    Author     : Daniel
--%>

<%@page import="Controller.Conexion"%>
<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%-- 
    Document   : inicio
    Created on : 17-oct-2019, 10:58:21
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Datos Personales </title>

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

                                <%
                                    Conexion con = Conexion.getConexion();
                                    TiemexpJpaController txpjpa = new TiemexpJpaController(con.getBd());
                                    String usuario = (String) session.getAttribute("usuario");
                                    boolean v = txpjpa.vacio(usuario);

                                    if (v == true) {
                                %>

                                <div class="x_title">
                                    <h1>AGREGA TU TIEMPO DE EXPERIENCIA !</h1>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
<%String prueba = (String) request.getAttribute("nombre");

                                    String elimino = "expeliminada";

                                    if (prueba == elimino) {
                                %>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                                    </button>
                                    <Strong>Tus Datos De tiempo de Experiencia han sido  eliminados de la la base de datos!</Strong>
                                </div>
                                <%
                                                } %>
                                    <form action="RegistrarExpTime.do" class="form-horizontal form-label-left" novalidate>

                                        <div class="x_title">
                                            <p>INDIQUE EL TIEMPO TOTAL DE SU EXPERIENCIA LABORAL EN NÚMERO DE AÑOS Y MESES</p>
                                            <div class="clearfix"></div>
                                        </div>

                                        <div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                <label>Ocupacion:</label>  

                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Años:</label> 

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Meses:</label> 

                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">

                                                <h4>SERVIDOR PUBLICO :</h4>                    
                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="spublicoyears" class="select2_single form-control" tabindex="-1">

                                                    <option value="1">1 AÑO</option>
                                                    <option value="2">2 AÑOS</option>
                                                    <option value="3">3 AÑOS</option>
                                                    <option value="4">4 AÑOS</option>
                                                    <option value="5">5 AÑOS</option>
                                                    <option value="6">6 AÑOS</option>
                                                    <option value="7">7 AÑOS</option>


                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <select name="spublicomonths" class="select2_single form-control" tabindex="-1">

                                                    <option value="1">1 MES</option>
                                                    <option value="2">2 MESES</option>
                                                    <option value="3">3 MESES</option>
                                                    <option value="4">4 MESES</option>
                                                    <option value="5">5 MESES</option>
                                                    <option value="6">6 MESES</option>
                                                    <option value="7">7 MESES</option>
                                                    <option value="8">8 MESES</option>
                                                    <option value="9">9 MESES</option>
                                                    <option value="10">10 MESES</option>
                                                    <option value="11">11MESES</option>



                                                </select>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>

                                        <div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">

                                                <h4>EMPLEADO DEL SECTOR PRIVADO :</h4>                    
                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="sprivadoyears" class="select2_single form-control" tabindex="-1">

                                                    <option value="1">1 AÑO</option>
                                                    <option value="2">2 AÑOS</option>
                                                    <option value="3">3 AÑOS</option>
                                                    <option value="4">4 AÑOS</option>
                                                    <option value="5">5 AÑOS</option>
                                                    <option value="6">6 AÑOS</option>
                                                    <option value="7">7 AÑOS</option>


                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="sprivadomonths" class="select2_single form-control" tabindex="-1">

                                                    <option value="1">1 MES</option>
                                                    <option value="2">2 MESES</option>
                                                    <option value="3">3 MESES</option>
                                                    <option value="4">4 MESES</option>
                                                    <option value="5">5 MESES</option>
                                                    <option value="6">6 MESES</option>
                                                    <option value="7">7 MESES</option>
                                                    <option value="8">8 MESES</option>
                                                    <option value="9">9 MESES</option>
                                                    <option value="10">10 MESES</option>
                                                    <option value="11">11MESES</option>



                                                </select>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>


                                        <div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">

                                                <h4>TRABAJADOR INDEPENDIENTE :</h4>                    
                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="tiyears" class="select2_single form-control" tabindex="-1">

                                                    <option value="1">1 AÑO</option>
                                                    <option value="2">2 AÑOS</option>
                                                    <option value="3">3 AÑOS</option>
                                                    <option value="4">4 AÑOS</option>
                                                    <option value="5">5 AÑOS</option>
                                                    <option value="6">6 AÑOS</option>
                                                    <option value="7">7 AÑOS</option>


                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="timonths" class="select2_single form-control" tabindex="-1">

                                                    <option value="1">1 MES</option>
                                                    <option value="2">2 MESES</option>
                                                    <option value="3">3 MESES</option>
                                                    <option value="4">4 MESES</option>
                                                    <option value="5">5 MESES</option>
                                                    <option value="6">6 MESES</option>
                                                    <option value="7">7 MESES</option>
                                                    <option value="8">8 MESES</option>
                                                    <option value="9">9 MESES</option>
                                                    <option value="10">10 MESES</option>
                                                    <option value="11">11MESES</option>



                                                </select>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>




                                        <button id="send" type="submit" class="btn btn-round btn-success col-md-12">GUARDAR</button>

                                    </form>
                                </div>

                                

                                <%} else if (v == false) {
                                    Tiemexp txp = txpjpa.findTiemexp(usuario);
                                %>



                                <div class="x_title">
                                     <h1>ACTUALIZA TU TIEMPO DE EXPERIENCIA! <a class=" btn btn-success btn-round pull-right" href="obs.jsp">SIGUIENTE PASO &NestedGreaterGreater;</a></h1>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <%String prueba = (String) request.getAttribute("nombre");

                                        String actualizo = "texpactualizada";
                                        String registro = "texpcreada";
                                        if (prueba == registro) {
                                    %>
                                    <div class="alert alert-success alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                                        </button>
                                        Felicidades! Agregaste Tu Tiempo de expericncia, puedes actualizar,eliminar datos o ir al siguiente paso.
                                    </div>
                                    <%
                                            } else if (prueba == actualizo) {%>
                                    <div class="alert alert-warning alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                                        </button>
                                        Felicidades! Actualizaste tu Tiempo de experiencia, puedes actualizar,eliminar datos o ir al siguiente paso.
                                    </div>
                                    <% }%>
                                    <form  action="" name="exptime" class="form-horizontal form-label-left" novalidate>

                                        <div class="x_title">
                                            <p>INDIQUE EL TIEMPO TOTAL DE SU EXPERIENCIA LABORAL EN NÚMERO DE AÑOS Y MESES</p>
                                            <div class="clearfix"></div>
                                        </div>

                                        <div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                                                <label>Ocupacion:</label>  

                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Años:</label> 

                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <label>Meses:</label> 

                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">

                                                <h4>SERVIDOR PUBLICO :</h4>                    
                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="spublicoyears" class="select2_single form-control" tabindex="-1">

                                                    <option <% if(txp.getSpublicoyears()==1){%> selected="true" <%}%> value="1">1 AÑO</option>
                                                    <option <% if(txp.getSpublicoyears()==2){%> selected="true" <%}%>value="2">2 AÑOS</option>
                                                    <option <% if(txp.getSpublicoyears()==3){%> selected="true" <%}%>value="3">3 AÑOS</option>
                                                    <option <% if(txp.getSpublicoyears()==4){%> selected="true" <%}%>value="4">4 AÑOS</option>
                                                    <option <% if(txp.getSpublicoyears()==5){%> selected="true" <%}%>value="5">5 AÑOS</option>
                                                    <option <% if(txp.getSpublicoyears()==6){%> selected="true" <%}%>value="6">6 AÑOS</option>
                                                    <option <% if(txp.getSpublicoyears()==7){%> selected="true" <%}%>value="7">7 AÑOS</option>


                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                                <select name="spublicomonths" class="select2_single form-control" tabindex="-1">

                                                    <option <% if(txp.getSpublicomonths()==1){%> selected="true" <%}%>value="1">1 MES</option>
                                                    <option <% if(txp.getSpublicomonths()==2){%> selected="true" <%}%>value="2">2 MESES</option>
                                                    <option <% if(txp.getSpublicomonths()==3){%> selected="true" <%}%>value="3">3 MESES</option>
                                                    <option <% if(txp.getSpublicomonths()==4){%> selected="true" <%}%>value="4">4 MESES</option>
                                                    <option <% if(txp.getSpublicomonths()==5){%> selected="true" <%}%>value="5">5 MESES</option>
                                                    <option <% if(txp.getSpublicomonths()==6){%> selected="true" <%}%>value="6">6 MESES</option>
                                                    <option <% if(txp.getSpublicomonths()==7){%> selected="true" <%}%>value="7">7 MESES</option>
                                                    <option <% if(txp.getSpublicomonths()==8){%> selected="true" <%}%>value="8">8 MESES</option>
                                                    <option <% if(txp.getSpublicomonths()==9){%> selected="true" <%}%>value="9">9 MESES</option>
                                                    <option <% if(txp.getSpublicomonths()==10){%> selected="true" <%}%>value="10">10 MESES</option>
                                                    <option <% if(txp.getSpublicomonths()==11){%> selected="true" <%}%>value="11">11MESES</option>



                                                </select>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>

                                        <div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">

                                                <h4>EMPLEADO DEL SECTOR PRIVADO :</h4>                    
                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="sprivadoyears" class="select2_single form-control" tabindex="-1">

                                                    <option <% if(txp.getSprivadoyears()==1){%> selected="true" <%}%> value="1">1 AÑO</option>
                                                    <option <% if(txp.getSprivadoyears()==2){%> selected="true" <%}%> value="2">2 AÑOS</option>
                                                    <option <% if(txp.getSprivadoyears()==3){%> selected="true" <%}%> value="3">3 AÑOS</option>
                                                    <option <% if(txp.getSprivadoyears()==4){%> selected="true" <%}%> value="4">4 AÑOS</option>
                                                    <option <% if(txp.getSprivadoyears()==5){%> selected="true" <%}%> value="5">5 AÑOS</option>
                                                    <option <% if(txp.getSprivadoyears()==6){%> selected="true" <%}%> value="6">6 AÑOS</option>
                                                    <option <% if(txp.getSprivadoyears()==7){%> selected="true" <%}%> value="7">7 AÑOS</option>


                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="sprivadomonths" class="select2_single form-control" tabindex="-1">

                                                    <option <% if(txp.getSprivadomonths()==1){%> selected="true" <%}%> value="1">1 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==2){%> selected="true" <%}%> value="2">2 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==3){%> selected="true" <%}%> value="3">3 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==4){%> selected="true" <%}%>value="4">4 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==5){%> selected="true" <%}%>value="5">5 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==6){%> selected="true" <%}%> value="6">6 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==7){%> selected="true" <%}%> value="7">7 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==8){%> selected="true" <%}%>value="8">8 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==9){%> selected="true" <%}%> value="9">9 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==10){%> selected="true" <%}%> value="10">10 MESES</option>
                                                    <option <% if(txp.getSprivadomonths()==11){%> selected="true" <%}%> value="11">11MESES</option>



                                                </select>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>


                                        <div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">

                                                <h4>TRABAJADOR INDEPENDIENTE :</h4>                    
                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="tiyears" class="select2_single form-control" tabindex="-1">

                                                    <option <% if(txp.getTiyears()==1){%> selected="true" <%}%>value="1">1 AÑO</option>
                                                    <option <% if(txp.getTiyears()==2){%> selected="true" <%}%> value="2">2 AÑOS</option>
                                                    <option <% if(txp.getTiyears()==3){%> selected="true" <%}%>value="3">3 AÑOS</option>
                                                    <option <% if(txp.getTiyears()==4){%> selected="true" <%}%>value="4">4 AÑOS</option>
                                                    <option <% if(txp.getTiyears()==5){%> selected="true" <%}%>value="5">5 AÑOS</option>
                                                    <option <% if(txp.getTiyears()==6){%> selected="true" <%}%>value="6">6 AÑOS</option>
                                                    <option <% if(txp.getTiyears()==7){%> selected="true" <%}%>value="7">7 AÑOS</option>


                                                </select>
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <select name="timonths" class="select2_single form-control" tabindex="-1">

                                                    <option <% if(txp.getTimonths()==1){%> selected="true" <%}%> value="1">1 MESES</option>
                                                    <option <% if(txp.getTimonths()==2){%> selected="true" <%}%> value="2">2 MESES</option>
                                                    <option <% if(txp.getTimonths()==3){%> selected="true" <%}%> value="3">3 MESES</option>
                                                    <option <% if(txp.getTimonths()==4){%> selected="true" <%}%> value="4">4 MESES</option>
                                                    <option <% if(txp.getTimonths()==5){%> selected="true" <%}%> value="5">5 MESES</option>
                                                    <option <% if(txp.getTimonths()==6){%> selected="true" <%}%> value="6">6 MESES</option>
                                                    <option <% if(txp.getTimonths()==7){%> selected="true" <%}%> value="7">7 MESES</option>
                                                    <option <% if(txp.getTimonths()==8){%> selected="true" <%}%> value="8">8 MESES</option>
                                                    <option <% if(txp.getTimonths()==9){%> selected="true" <%}%> value="9">9 MESES</option>
                                                    <option <% if(txp.getTimonths()==10){%> selected="true" <%}%> value="10">10 MESES</option>
                                                    <option <% if(txp.getTimonths()==11){%> selected="true" <%}%> value="11">11MESES</option>



                                                </select>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
<div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">

                                                                  
                                            </div>
</div>
                                        <div class="x_title">
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">

                                                <h4>TOTAL TIEMPO EXPERIENCIA:</h4>                    
                                            </div>

                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <input disabled="" id="yeartotal" type="text" value=" <%=txp.getTotalyears()%> AÑOS.." placeholder="5" class="form-control">
                                            </div>
                                            <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                                                <input  disabled="" id="monttotal" type="text" placeholder="5" value=" <%=txp.getToalmonths()%>  MESES.." class="form-control">
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>


                                    
<div class="col-md-6 col-sm-12 col-xs-12 form-group">
                    <button id="send" onClick="document.forms.exptime.action = 'actualizarexptime.do';" type="submit" class="btn btn-round btn-warning col-md-12">ACTUALIZAR</button>
                                            </div>
                                            <div class="col-md-6 col-sm-12 col-xs-12 form-group">
            <button id="send                    " onClick="document.forms.exptime.action = 'deletetiemexp.do';" type="submit" class="btn btn-danger btn-round col-md-12">ELIMINAR</button>
                                        </div>
                                            
                                    </form>
                                </div>





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




