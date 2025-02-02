
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
        <div class="x_title">
            <h1>INGRESE SUS DATOS PERSONALES <small>Funcion Publica</small></h2>
            <div class="clearfix"></div>
        </div>
        <div class="x_content">
<div class="alert alert-danger alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <strong>Error</strong>Ya tienes datos registrados o ingresaste un dato erroneo!
                  </div>
            <form action="RegisDatosPer.do" class="form-horizontal form-label-left" method="doPost" >


                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Primer Apellido</label>
                    <input name="oneapellido" type="text" placeholder="Primer Apellido" class="form-control" required>
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Segundo Apellido (o de casada)</label>
                    <input name="twoapellido" type="text" placeholder="Segundo Apellido" class="form-control" required>
                </div>

                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Nombres</label>
                    <input name="nombres" type="text" placeholder="Nombres" class="form-control" required="">
                </div>
                <div class="x_title">

                    <div class="clearfix"></div>
                </div>
                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label>Doc de Identificacion</label>
                    <p>
                        CC:
                        <input type="radio" class="flat" name="tipodocumento" id="CC" value="CC" checked="" required /> CE:
                        <input type="radio" class="flat" name="tipodocumento" id="CE" value="CE" /> PAS:
                        <input type="radio" class="flat" name="tipodocumento" id="PAS" value="PAS" />
                    </p>
                </div>
                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label>Num de Documento:</label>
                    <input name="NumeroDocumento" type="text" placeholder="Num de Idenfiticacion" class="form-control" required="">
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                    <label>Sexo:</label>
                    <p>
                        Masculino :
                        <input type="radio" class="flat" name="sexo"  value="Masculino" checked="" required /> Femenino :
                        <input type="radio" class="flat" name="sexo"  value="Femenino" /> 
                    </p>
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                    <label>Nacionalidad:</label>
                    <p>
                        Colombiano :
                        <input type="radio" class="flat" name="nacionalidad" id="col" value="colombiano" checked="" required /> Extrenjero :
                        <input type="radio" class="flat" name="nacionalidad" id="ext" value="extranjero" /> 
                    </p>
                </div>

                <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                    <label>Pais:</label>
                    <input  name="paisnacionalidad" id="pais" type="text"  placeholder="Pais" class="form-control" required="">
                </div>
                <div class="x_title">

                    <div class="clearfix"></div>
                </div>
                
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">

                    <label>Tipo de Libreta Militar:</label>
                    <p>
                        Primera Clase :
                        <input type="radio" class="flat" name="tlibreta" id="M" value="PrimeraClase" checked="" required /> Segunda Clase :
                        <input type="radio" class="flat" name="tlibreta" id="F" value="SegundaClase" /> 
                    </p>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Numero de libreta militar:</label>
                    <input  name="numlibreta" id="pais" type="text"  placeholder="Numero de libreta Militar" class="form-control" required="">
                </div>
                
               <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                    <label>Distrito Militar:</label>
                    <input  name="dm" id="pais" type="text"  placeholder="DM "class="form-control" required="">
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
                        <input  name="fechanacido"type="text" placeholder="DD/MM/AAAA" class="form-control" required="" >                      
                      </div>
                    
                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                        <label>Pais :</label>
                        <input name="paisnacido" type="text" placeholder="ejm: colombia" class="form-control" required="">                      
                      </div>
             <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                        <label>Departamento :</label>
                        <input name="dptonacido" type="text" placeholder="ejm: santander" class="form-control" required="">                      
                      </div>
                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                        <label>Municipio :</label>
                        <input name="muninacido" type="text" placeholder="ejml: malaga" class="form-control" required="">                      
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
                        <input name="direccionresi" type="text" placeholder="ejm: Av4e #54r" class="form-control" required="" >                      
                      </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                        <label>Pais :</label>
                        <input name="paisresi" type="text" placeholder="ejm: colombia" class="form-control" required="">                      
                      </div>
             <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                        <label>Departamento :</label>
                        <input name="dptoresi" type="text" placeholder="ejm: santander" class="form-control" required="" >                      
                      </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                        <label>Municipio :</label>
                        <input name="munresi" type="text" placeholder="ejml: malaga" class="form-control" required="">                      
                      </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                        <label>Telefono :</label>
                        <input name="telefono" type="text" placeholder="ejml: 315642322" class="form-control" required="" >                      
                      </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                        <label>Email :</label>
                        <input name="email" type="email" placeholder="ejml: web@ufp.edu.co" class="form-control" required="" >                      
                      </div>
                    
                    <div class="x_title">

                    <div class="clearfix"></div>
                </div>
               
                       
                        <button id="send" type="submit" class="btn btn-success col-md-12">GUARDAR</button>
                    
            </form>
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
               
            