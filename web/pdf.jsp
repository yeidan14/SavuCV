

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="Controller.*"%>

<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>

<%@page import="javax.servlet.ServletResponse"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
           
            Connection con =Conexion.getConexion2();
        File reportfile = new File (application.getRealPath("producto.jasper"));
        
        Map<String,Object> parameter = new HashMap<String,Object>();
        
         String usuario = (String) session.getAttribute("usuario");
         System.out.println("className.methodName()"+ usuario);
         parameter.put("mar",usuario);
        
        byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter, con);
        
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputstream = response.getOutputStream();
        outputstream.write(bytes,0,bytes.length);
        
        outputstream.flush();
        outputstream.close();
        %>
        
    </body>
</html>
