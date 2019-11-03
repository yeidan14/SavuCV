<%-- 
    Document   : user
    Created on : 18-oct-2019, 13:16:09
    Author     : Daniel
--%>

<%@page import="Dto.Usuario"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <li class="">
                  <a  href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                      <img  src="images/img.jpg" alt="">               
                      <%=(String)session.getAttribute("usuario")%>                  
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">          
                     <li><a href="Logout.do"><i class="fa fa-sign-out pull-right"></i> Cerrar Session</a></li>
                      
                    </li>
                  </ul>
                </li>
    </body>
</html>
