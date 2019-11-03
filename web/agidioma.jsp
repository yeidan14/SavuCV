<%-- 
    Document   : aexpe
    Created on : 18-oct-2019, 16:57:36
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <body>
        
                        <div class="x_title">
                    <h4>  <p>Especifique los idiomas diferentes al español que: habla, lee, escribe de forma, regular (R), bien (B) o muy bien (MB).</p>
                    </h4>
                        <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                            <p>Idioma</p>
                        <input id="Idioma" type="text" placeholder="Ingles" class="form-control" >                      
                      </div>
                        
                        <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                            <div class="col-md-3 col-sm-12 col-xs-12">
                                <p>Lo HABLA</p>
                                
                                 R<input type="radio" class="flat" name="h1" id="" value="r" checked="" required />
                        B<input type="radio" class="flat" name="h1" id="g1no" value="b" />  
                        MB<input type="radio" class="flat" name="h1" id="g1no" value="mb" /> 
                                
                            </div>
                            
                             <div class="col-md-3 col-sm-12 col-xs-12">
                                <p>LO LEE</p>
                                
                                 R<input type="radio" class="flat" name="L1" id="" value="r" checked="" required />
                        B<input type="radio" class="flat" name="L1" id="g1no" value="b" />  
                        MB<input type="radio" class="flat" name="L1" id="g1no" value="mb" /> 
                                
                            </div>
                            
                             <div class="col-md-3 col-sm-12 col-xs-12">
                                <p>LO ESCRIBE</p>
                                
                                 R<input type="radio" class="flat" name="e1" id="" value="r" checked="" required />
                        B<input type="radio" class="flat" name="e1" id="g1no" value="b" />  
                        MB<input type="radio" class="flat" name="e1" id="g1no" value="mb" /> 
                                
                            </div>
                                      
                      </div>
                        <div class="clearfix"></div>
                </div>
                  
                  
                    <button id="agregarexpe" class="btn btn-round btn-success col-md-12">GUARDAR</button>
                    
                    <div class="clearfix"></div>
                    
                </div>    </body>
</html>
