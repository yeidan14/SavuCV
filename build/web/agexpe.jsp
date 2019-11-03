<%-- 
    Document   : listexpe
    Created on : 17-oct-2019, 8:52:47
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

                    <div class="x_title">              
              
                <h4>Relacione su experiencia laboral o de
                    prestación de servicios en estricto orden cronológico comenzando por el actual.</h4>
 
            <div class="clearfix"></div>
        </div>
                
              
                
                <div class="x_title">              
              
                  <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Empresa o Entidad:</label>
                    <input id="EmpresaAc" type="text" placeholder="Empresa Actual" class="form-control">
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Tipo de Empresa: </label>
             
                      <p></p>
                        Publica :<input type="radio" class="flat" name="ppa" id="1" value="pb" checked="" required />
                        Privada:<input type="radio" class="flat" name="ppa" id="2" value="pv" /> 
                      
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Pais:</label>
                    <input id="pais_empresa_actual" type="text" placeholder="Colombia" class="form-control">
                  </div>
                    
                    
                   <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Departamento:</label>
                    <input id="dpto_empresa_actual" type="text" placeholder="Nte Santander" class="form-control">
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Municipio: </label>
             
                    <input id="mun_empresa_actual" type="text" placeholder="Los Patios" class="form-control">                      
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Correo electronico de la Entidad:</label>
                      <input id="correo_empresa_actual" type="email" placeholder="empresa@web.com" class="form-control" required>
                  </div>
                    
                     <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Telefonos:</label>
                      <input id="tel_empresa_actual" type="tel" placeholder="5723823 / 32412322" class="form-control">
                  </div>
                    
                     <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Fecha de Ingreso:</label>
                      <input id="ingreso_empresa_actual" type="date" placeholder="" class="form-control">
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Fecha de Retiro:</label>
                      <input id="retiro_empresa_actual" type="date" placeholder="" class="form-control">
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Cargo o Contrato:</label>
                      <input id="cargo_empresa_actual" type="text" placeholder="Gerente" class="form-control">
                  </div>
                    
                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Dependencia:</label>
                      <input id="depe_empresa_actual" type="text" placeholder="Sistemas" class="form-control">
                  </div>
                    
                     <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                      <label>Direccion:</label>
                      <input id="dire_empresa_actual" type="text" placeholder="Av 4e #34-23" class="form-control">
                  </div>
 
            <div class="clearfix"></div>
        </div>  

      
<button id="btnexpe" type="submit" class="btn btn-round btn-success col-sm-12">GUARDAR</button>
                    
