<%-- 
    Document   : pruebadepar
    Created on : 27/10/2019, 10:48:26 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="jquery/jquery.js"></script>
    <script type="text/javascript" src="jquery/jquery.cascade.js"></script>
    <script type="text/javascript" src="jquery/jquery.cascade.ext.js"></script>
    <script type="text/javascript" src="jquery/jquery.templating.js"></script>
    <script type="text/javascript">
      function commonTemplate(item) {
        return "<option value='" + item.Value + "'>" + item.Text + "</option>";
      };
      function commonTemplate2(item) {
        return "<option value='" + item.Value + "'>***" + item.Text + "***</option>";
      };
 
      function commonMatch(selectedValue) {
        return this.When == selectedValue;
      };
 
    </script>
  </head>
  <body>
 
  <h1>Ubicacion</h1>
  <div>
    <label>Pais
      <select id="pais">
        <option value="AR">Argentina</option>
        <option value="ES">España</option>
        <option value="MX">Mexico</option>
      </select>
    </label>
    <label>Provincia
      <select id="provincia"></select>
    </label>
    <label>Ciudad
      <select id="ciudad"></select>
    </label>
  </div>
 
  <script type="text/javascript">
    $(document).ready(function()
    {
      $("#provincia").cascade("#pais",{
        ajax: {url: 'datos-provincias.js'},
        template: commonTemplate,
        match: commonMatch
      });
 
      $("#ciudad").cascade("#provincia",{
        ajax: {url: 'datos-ciudades.js'},
        template: commonTemplate,
        match: commonMatch
      });
 
      //forzamos un evento de cambio para que se carge por primera vez
      $("#pais").change();
    });
  </script>
 
    </body>
</html>


