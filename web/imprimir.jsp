<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%if (session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
    }%>

<%@page import="Dto.*"%>
<%@page import="Controller.*"%>
<%@page import="Dao.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Datos Personales </title>
        <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

          
<script type="text/javascript"
src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
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

                <!-- page content  "-->
                <div class="right_col" role="main">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                            <%
                    Conexion con = Conexion.getConexion();
                    DatosperJpaController datos = new DatosperJpaController(con.getBd());
                    String usuario = (String) session.getAttribute("usuario");
                    boolean v = datos.vacio(usuario);

                    if (v == true) {
                %>
                
                  
                                <div class="x_title">
                                    <h1>INGRESE SUS DATOS PERSONALES <small>Funcion Publica  </small></h2> 

                                        <div class="clearfix"></div>
                           </div>


                                        
                                <div class="x_content">

<%String prueba=(String)request.getAttribute("nombre");
                   
                    String elimino="DatosUsuarioEliminado";
                    
                                        if(prueba==elimino){
                                            %>
                     <div class="alert alert-success alert-dismissible fade in" role="alert">
                    <button  type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <Strong>Tus Datos han sido eliminados de la la bade de datos!</Strong>
                  </div>
                                            <%
                                        } %>
              
                                        <h2>SIN DATOS PERSONALES REGISTRADOS</h2>
            <%
                                    } else if (v == false) {
                                        Datosper dat = datos.buscarporusuario(usuario);%>
                                        
                                        <div class="x_title">
                                    <h1>HOJA DE VIDA FUNCION PUBLICA. <small> </small></h2> 

                                        <div class="clearfix"></div>
                           </div>


                                        
                                <div class="x_content">
                                    
                                    
                                    
            <form  name="datosper" action="" class="form-horizontal form-label-left" method="doPost" >


                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Primer Apellido</label>
                    <input disabled="" name="oneapellido" type="text" placeholder="Primer Apellido" value="<%=dat.getOneapellido()%>" class="form-control" required>
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Segundo Apellido (o de casada)</label>
                    <input disabled="" name="twoapellido" type="text" placeholder="Segundo Apellido" value="<%=dat.getTwoapellido()%>" class="form-control" required>
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Nombres</label>
                    <input disabled="" name="nombres" type="text" placeholder="Nombres" value="<%=dat.getNombres()%>" class="form-control" required="">
                </div>
                <div class="x_title">

                    <div class="clearfix"></div>
                </div>
                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label>Doc de Identificacion</label>
                    <input disabled="" name="tipododcumnento" type="text" placeholder="Nombres" value="<%=dat.getTipodocumento()%>" class="form-control" required="">
                                
                    

                </div>
                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label>Num de Documento:</label>
                    <input disabled=""  name="NumeroDocumento" type="text" placeholder="Num de Idenfiticacion" value="<%=dat.getNdocumento()%>" class="form-control" required="">
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                    <label>Sexo:</label>

 <input disabled=""  name="NumeroDocumento" type="text" placeholder="Num de Idenfiticacion" value="<%=dat.getPersonagenero()%>" class="form-control" required="">
               

                </div>

                <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                    <label>Nacionalidad:</label>

                   <input disabled=""  name="nacionaliadd" type="text" placeholder="Num de Idenfiticacion" value="<%=dat.getNacionalidad()%>" class="form-control" required="">
 

                </div>

                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label>Pais:</label>
                    <input  disabled=""  name="paisnacionalidad" id="pais" type="text"  placeholder="Pais" value="<%=dat.getPaisnacionalidad()%>" class="form-control" required="">
                </div>
                <div class="x_title">

                    <div class="clearfix"></div>
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                    <label>Tipo de Libreta Militar:</label>

                     <input disabled=""  name="tlibreta" type="text" placeholder="Num de Idenfiticacion" value="<%=dat.getTipoLibreta()%>" class="form-control" required="">
 

                </div>
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Numero de libreta militar:</label>
                    <input   disabled="" name="numlibreta" id="pais" type="text" value="<%=dat.getNumeroLibreta()%>" placeholder="Numero de libreta Militar" class="form-control" required="">
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Distrito Militar:</label>
                    <input   disabled="" name="dm" id="pais" type="text" value="<%=dat.getDmLibreta()%>"   placeholder="DM "class="form-control" required="">
                </div>
                <div class="x_title">

                    <div class="clearfix"></div>
                </div>

                <div class="x_title"> <%-- separador --%>
                    <h2>Fecha y lugar de nacimiento</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                    <label>Fecha :</label>
                    <input  disabled=""  name="fechanacido" type="date" placeholder=""  value="<%=dat.getFechanaciemiento()%>" class="form-control" required="" >                      
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                    <label>Pais :</label>
                    <input  disabled="" name="paisnacido" type="text" placeholder="ejm: colombia"value="<%=dat.getPaisnacimiento()%>" class="form-control" required="">                      
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                    <label>Departamento :</label>
                    <input  disabled="" name="dptonacido" type="text" placeholder="ejm: santander" value="<%=dat.getDeptonaciemiento()%>" class="form-control" required="">                      
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                    <label>Municipio :</label>
                    <input  disabled="" name="muninacido" type="text" placeholder="ejml: malaga" value="<%=dat.getMunicipionacimiento()%>" class="form-control" required="">                      
                </div>

                <div class="x_title">

                    <div class="clearfix"></div>
                </div>
                <div class="x_title"> <%-- separador --%>
                    <h2>Direccion de correspondencia</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Direccion :</label>
                    <input  disabled="" name="direccionresi" type="text" placeholder="ejm: Av4e #54r" value="<%=dat.getDireccioncorresp()%>" class="form-control" required="" >                      
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Pais :</label>
                    <input disabled=""  name="paisresi" type="text" placeholder="ejm: colombia" value="<%=dat.getPaiscorrespo()%>" class="form-control" required="">                      
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Departamento :</label>
                    <input  disabled="" name="dptoresi" type="text" placeholder="ejm: santander" value="<%=dat.getDptocorrespo()%>" class="form-control" required="" >                                      </div>
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Municipio :</label>
                    <input  disabled="" name="munresi" type="text" placeholder="ejml: malaga" value="<%=dat.getMuncorrespo()%>" class="form-control" required="">                      
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Telefono :</label>
                    <input  disabled="" name="telefono" type="text" placeholder="ejml: 315642322" value="<%=dat.getTelefono()%>" class="form-control" required="" >                      
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Email :</label>
                    <input disabled=""  name="email" type="email" placeholder="ejml: web@ufp.edu.co" value="<%=dat.getEmail()%>" class="form-control" required="" >                      
                </div>

                <div class="x_title">

                    <div class="clearfix"></div>
                </div>

               
                         </form>
                        <%
                }
            %>
            
            
            <div class="row"><div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                 <%
                                     
                                        FbasicaJpaController fbasica = new FbasicaJpaController(con.getBd());
                                        
                                        boolean vb = fbasica.vacio(usuario);

                                        if (vb == true) {
                                    %>
                                <div class="x_title">

                                    <h1>EDUCACION BASICA </h1>



                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                   
                                        <h2> SIN FORMBACION BASICA REGISTRADA</h2>
                                    <%} else if (vb == false) {
                                        Fbasica fb = fbasica.findFbasica(usuario);
                                    %>
 <div class="x_title">

                                    <h1>EDUCACION BASICA  
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
                                                1:<input  disabled="" type="radio" class="flat" name="colegio" id="1" value="1" checked="" required />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input  disabled="" type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input disabled=""  type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input disabled=""  type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input disabled=""  type="radio" class="flat" name="colegio" id="6" value="6"   />
                                                7:<input  disabled="" type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input  disabled="" type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input disabled=""  type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input  disabled="" type="radio" class="flat" name="colegio" id="10" value="10"   />
                                                11:<input  disabled="" type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                           <% if(fb.getNcurso().toString().equals("2")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input disabled=""  type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2" checked="" required/> 
                                                3:<input  disabled="" type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input  disabled="" type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input disabled=""  type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input  disabled="" type="radio" class="flat" name="colegio" id="6" value="6"   />
                                                7:<input  disabled="" type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input  disabled="" type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input  disabled="" type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("3")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input disabled=""  type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input disabled=""  type="radio" class="flat" name="colegio" id="3" value="3" checked="" required=""/> 
                                                4:<input disabled=""  type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input disabled=""  type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input  disabled="" type="radio" class="flat" name="colegio" id="6" value="6"   />
                                                7:<input  disabled="" type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input  disabled="" type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input  disabled="" type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("4")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input disabled=""  type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input disabled=""  type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input disabled=""  type="radio" class="flat" name="colegio" id="4" value="4" checked="" required=""/> 
                                                5:<input disabled=""  type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input disabled=""  type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input  disabled="" type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input  disabled="" type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input  disabled="" type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10"   />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("5")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input disabled=""  type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input disabled=""  type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input disabled=""  type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input disabled=""  type="radio" class="flat" name="colegio" id="5" value="5" checked="" required=""/></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input disabled=""  type="radio" class="flat" name="colegio" id="6" value="6"  required />
                                                7:<input  disabled="" type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input  disabled="" type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input  disabled="" type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("6")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input disabled=""  type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input  disabled="" type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input disabled=""  type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input  disabled="" type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input disabled=""  type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input disabled=""  type="radio" class="flat" name="colegio" id="6" value="6"  checked="" required />
                                                7:<input disabled=""  type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input  disabled="" type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input  disabled="" type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10"   />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("7")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input  disabled="" type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2"/> 
                                                3:<input disabled=""  type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input  disabled="" type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input  disabled="" type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input disabled=""  type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input disabled=""  type="radio" class="flat" name="colegio" id="7" value="7" checked="" required=""/> 
                                                8:<input disabled=""  type="radio" class="flat" name="colegio" id="8" value="8" /> 
                                                9:<input disabled=""  type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("8")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input disabled=""  type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input disabled=""  type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input disabled=""  type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input disabled=""  type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input  disabled="" type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input  disabled="" type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input  disabled="" type="radio" class="flat" name="colegio" id="8" value="8" checked="" required="" /> 
                                                9:<input  disabled="" type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("9")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input  disabled="" type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input disabled=""  type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input disabled=""  type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input  disabled="" type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input disabled=""  type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input disabled=""  type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input disabled=""  type="radio" class="flat" name="colegio" id="8" value="8"  /> 
                                                9:<input  disabled="" type="radio" class="flat" name="colegio" id="9" value="9"checked="" required="" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10"  />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                          <% if(fb.getNcurso().toString().equals("10")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input  disabled="" type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input disabled=""  type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input disabled=""  type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input disabled=""  type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input  disabled="" type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input disabled=""  type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input disabled=""  type="radio" class="flat" name="colegio" id="8" value="8"  /> 
                                                9:<input disabled=""  type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10" checked="" required=""  />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" /> </p>
                                        </div>
                                          <%}%>
                                           <% if(fb.getNcurso().toString().equals("11")){%>
                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Primaria</label><p>
                                                1:<input  disabled="" type="radio" class="flat" name="colegio" id="1" value="1"  />
                                                2:<input disabled=""  type="radio" class="flat" name="colegio" id="2" value="2" /> 
                                                3:<input  disabled="" type="radio" class="flat" name="colegio" id="3" value="3" /> 
                                                4:<input  disabled="" type="radio" class="flat" name="colegio" id="4" value="4" /> 
                                                5:<input  disabled="" type="radio" class="flat" name="colegio" id="5" value="5" /></p>
                                        </div>
                                        <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                                            <label>Secundaria</label>     <p>
                                                6:<input  disabled="" type="radio" class="flat" name="colegio" id="6" value="6"  />
                                                7:<input  disabled="" type="radio" class="flat" name="colegio" id="7" value="7" /> 
                                                8:<input  disabled="" type="radio" class="flat" name="colegio" id="8" value="8"  /> 
                                                9:<input  disabled="" type="radio" class="flat" name="colegio" id="9" value="9" />      </p>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <label>Media</label>    <p>
                                                10:<input disabled=""  type="radio" class="flat" name="colegio" id="10" value="10"   />
                                                11:<input disabled=""  type="radio" class="flat" name="colegio" id="11" value="11" checked="" required="" /> </p>
                                        </div>
                                          <%}%>
                                          


                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Titulo Obtenido:</label>
                                            <input  disabled="" maxlength="45" name="titulo" type="text" value="<%=fb.getTitulo()%>" placeholder="Titulo Obtenido" class="form-control">
                                        </div>




                                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                                            <label>Fecha de grado:</label>
                                            <input  disabled=""  name="fechagrado" type="date" placeholder="DD/MM/AAAA" value="<%=fb.getBfechagrado()%>" class="form-control" >                      
                                        </div>






                                    </form>



                                    <%}%>



                                </div>
                            </div>
                        </div></div>
                </div>





            <!--else--->
<div class="row"><div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
        <div class="x_title">
           
            <h1>EDUCACION MEDIA Y SUPERIOR </h1>
                 
          
              
               
            <div class="clearfix"></div>
        </div>
        <div class="x_content">              
                    
                   
           
              
                
         <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection cn=Conexion.getConexion2();
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = cn.createStatement();
            rs = smt.executeQuery("select * from ed_superior");
            //Creamo la Tabla:     
        %>
               
                
                 <table class="table table-striped jambo_table bulk_action"  id="tablaDatos">
                    <thead>
                        <tr>
                           
                             <th class="column-title">Modalidad Academica</th>
                            <th class="column-title">Numero de Semestres</th>
                            <th class="column-title">Graduado </th>
                            <th class="column-title">Titulo Obtenido </th>
                            <th class="column-title">Fecha de Terminacion</th>
                            <th class="column-title">Targeta Profesional </th>
                          
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                                if(rs.getString("usuario_usuario").equals((String) session.getAttribute("usuario"))){
                        %>
                        <tr>
                          
                            <td><%= rs.getString("modalidad")%></td>
                            <td name="editsemestre" class="column-title"><%= rs.getInt("N_semestres")%></td>
                            <td class="column-title"><%= rs.getString("Graduado")%></td>
                             <td class="column-title"><%= rs.getString("Nombre_titulo")%></td>
                              <td class="column-title"><%= rs.getString("Terminacion")%></td>
                               <td class="column-title"><%= rs.getString("N_targeta")%></td>
                            
                        </tr>
                        <%}}%>
                </table>
            
                    
              
                   
                                       
              <div class="clearfix"></div>
        </div>
                       
                            
                             
                                       
                                                    
 </div>
                      </div>
                    </div>
                
                
                
                <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
        <div class="x_title">
           
                 <h1>IDIOMAS </h1>
                
              
               
            <div class="clearfix"></div>
        </div>
        <div class="x_content">              
                    
                   <div class="x_title">
           
               
                
        
               
               
                
         <%
            //CONECTANOD A LA BASE DE DATOS:
            smt = cn.createStatement();
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
                               
                              
                        </tr>
                        <%}}%>
                </table>                   
              <div class="clearfix"></div>
        </div>
              

      

                        
                        </div>
                       

                      </div>
                    </div>
                        
               
    <div class="x_panel">
        
         <div class="x_title">

                                    <h1> EXPERIENCIA LABORAL! </h1>



                                    <div class="clearfix"></div>
                                </div>
   
         
               
                
         <%
            //CONECTANOD A LA BASE DE DATOS:
        
            smt = cn.createStatement();
            rs = smt.executeQuery("select * from expelab");
            //Creamo la Tabla:     
        %>
        <div class="col-md-6 col-sm-12 col-xs-12">
        <table class="table col-md-12 col-sm-12 col-xs-12 table-striped jambo_table "  id="tablaDatos">
                    <thead>
                        <tr>
                           
                             <th class="column-title text-center">Empresa</th>
                            <th class="column-title text-center">Tipo de Empresa</th>
                            <th class="column-title text-center">Pais de Empresa</th>
                            <th class="column-title text-center">Departamento de Empresa</th>
                            <th class="column-title text-center">Municipio de Empresa</th>
                             <th class="column-title text-center">Correo de Empresa</th>
                            <th class="column-title text-center">Telefono De Empresa</th>
                            <th class="column-title text-center">Fecha Ingreso</th>
                            <th class="column-title text-center">Fecha Retiro</th>
                            <th class="column-title text-center">Cargo</th>                            
                            <th class="column-title text-center">Dependencia</th>
                            <th class="column-title text-center">Direccion</th>                            
                            
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                                if(rs.getString("usuario_usuario").equals((String) session.getAttribute("usuario"))){
                        %>
                        <tr> 
                            <td class="text-center"><%= rs.getString("Empresa")%></td>
                            <td class="text-center"><%= rs.getString("TipoEmpresa")%></td>
                             <td class="text-center"><%= rs.getString("PaisEmpresa")%></td>
                              <td class="text-center "><%= rs.getString("DepEmpresa")%></td>
                                <td class="text-center"><%= rs.getString("MuniEmpresa")%></td>
                            <td class="text-center"><%= rs.getString("CorreoEmp")%></td>
                             <td class="text-center"><%= rs.getString("Telefono")%></td>
                              <td class="text-center "><%= rs.getString("FIngreso")%></td>
                                <td class="text-center"><%= rs.getString("FechaRetiro")%></td>
                            <td class="text-center"><%= rs.getString("Cargo")%></td>
                             <td class="text-center"><%= rs.getString("Dependencia")%></td>
                              <td class="text-center "><%= rs.getString("Direccion")%></td>
                            
                        </tr>
                        <%}}%>
                </table>   
                
       
                          
                        
                          

      

                        
                        </div>
                        

                      </div>
                
                
                <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">

                                <%                              
                                    TiemexpJpaController txpjpa = new TiemexpJpaController(con.getBd());
                                
                                    boolean vexp = txpjpa.vacio(usuario);

                                    if (vexp == true) {
                                %>

                                <div class="x_title">
                                   
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                                <h2> NO TIENE TIEMPO DE EXPRIENCIA REGISTRADO</h2>
                                </div>

                                

                                <%} else if (vexp == false) {
                                    Tiemexp txp = txpjpa.findTiemexp(usuario);
                                %>



                                <div class="x_title">
                                     <h1>TIEMPO DE EXPERIENCIA!</h1>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                             
                                    <form  action="" name="exptime" class="form-horizontal form-label-left" novalidate>

                                        <div class="x_title">
                                          
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

                                                <select disabled="" name="spublicoyears" class="select2_single form-control" tabindex="-1">

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
                                                <select disabled="" name="spublicomonths" class="select2_single form-control" tabindex="-1">

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

                                                <select  disabled=" " name="sprivadoyears" class="select2_single form-control" tabindex="-1">

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

                                                <select disabled="" name="sprivadomonths" class="select2_single form-control" tabindex="-1">

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

                                                <select disabled="" name="tiyears" class="select2_single form-control" tabindex="-1">

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

                                                <select disabled="" name="timonths" class="select2_single form-control" tabindex="-1">

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


                                    

                                            
                                    </form>
                                </div>





                                <%}%>


                            </div>
                   
                                          
                       
        
         <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                 <%
                                     
                                       ObervacionesJpaController obs = new ObervacionesJpaController(con.getBd());                                        
                                        boolean vobs = obs.vacio(usuario);

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
                                         <h2> Sin Observacion.</h2>
                                    
                                    <%} else if (v == false) {
                                        Obervaciones ob = obs.findObervaciones(usuario);
                                    %>
 <div class="x_title">

                                    <h1> OBSERVACION 
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





                                    </form>
                                   
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    
                                   
                                    



                                    <%}%>



                                </div>
                            </div>
                        </div></div>
                </div>

                      
                       
                             
               
            
     

                             
               
            
        </div>
    </div>
</div></div>

           
        </div>
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
    
       <script src="buid/pnotify/dist/pnotify.js"></script>
    <script src="build/pnotify/dist/pnotify.buttons.js"></script>
    <script src="build/pnotify/dist/pnotify.nonblock.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="js/custom.min.js"></script>
</body>
</html>

