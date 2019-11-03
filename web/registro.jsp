<%-- 
    Document   : registro
    Created on : 12-oct-2019, 16:08:11
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

    <title>HOJA DE VIDA </title>

    <!-- Bootstrap -->
    <link href="build/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="build/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="build/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="build/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="css/custom.min.css" rel="stylesheet">
    
   
  </head>

  <body class="login">
     
    <div>
         
      

      <div class="login_wrapper">
          
        <div  id="contenido" class="animate form login_form">
          <section class="login_content">
             
             <form action="Registrar.do">
              <h1>CREA TU CUENTA</h1>
              
                <%String prueba=(String)request.getAttribute("nombre");                  
                    String usuariodup="Usuarioduplicado";
                                        if(prueba==usuariodup){
                                            %>
                                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span>
                    </button>
                    <strong>El usuario que intentas crear ya existe!</strong>
                  </div>
                                            <%
                                        } %>
                    
              <div>
                  <input  name="usuario" type="text" class="form-control" placeholder="Username" required="" />
              </div>
              <div>
                  <input name="email" type="email" class="form-control" placeholder="Email" required="" />
              </div>
              <div>
                  <input name="pass" type="password" class="form-control" placeholder="Password" required="" />
              </div>
            
                <button id="crear" type="submit" class="btn btn-success col-md-12">REGISTRAR</button>
             

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Ya eres miembro ?
                    <a href="index.jsp" class="to_register"> Ingresa </a>
                </p>

                <div class="clearfix"></div>
                <br />
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>