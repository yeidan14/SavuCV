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
                     <h4> <p>Diligencie este punto en estricto orden cronológico, en modalidad académica escriba:</p>
                        
                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                           <p> <label>TC : </label>(Tecnica)</p>
                        </div>
                        
                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                           <p> <label>TL : </label>(Tecnologia)</p>
                        </div>
                        
                         <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                           <p> <label>TE : </label>(Tecnologica Especializada)</p>
                        </div>
                        
                        <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                           <p> <label>UN : </label>(Universitaria)</p>
                        </div>
                        
                         <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                           <p> <label>ES : </label>(Especializacion)</p>
                        </div>
                         <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                           <p> <label>MG: </label>(Maestria o Magister)</p>
                        </div>
                         <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                           <p> <label>DOC : </label>(Doctorado o PHD)</p>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12 form-group">
                         <p>Relacione al frente el número de la tarjeta profesional (si ésta ha sido prevista en una ley)</p>
                         </div>
                     </h4>
                    <div class="clearfix"></div>
                </div>

       <div class="x_title">        <div class="clearfix"></div>             </div>
                <!--Primera -->
                <div class="x_title">
                    
                    <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                         <div class="x_title">
     <label>Modalidad Academica :</label>
                    <div class="clearfix"></div>
                </div>
                         
                        <input id="mod1" type="text" placeholder="EJ: TC" class="form-control" >                      
                      </div>
                    <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                           <div class="x_title">  <label>N&SmallCircle; de semestres Aprobados:</label>     <div class="clearfix"></div>             </div>
                       
                       
                        <input id="NumSem" type="text" placeholder="ejm: 7" class="form-control" >                      
                      </div>
             <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                 <div class="x_title">        <label>Graduado:</label> <div class="clearfix"></div>     <br>         </div>
                      
                        Si:<input type="radio" class="flat" name="g1" id="g1si" value="true" checked="" required />
                        No:<input type="radio" class="flat" name="g1" id="g1no" value="false" />                      
                      </div>
                    <div class="col-md-3 col-sm-12 col-xs-12 form-group">
                        <div class="x_title">      <label>Nombre de los Estudios o Titulo Obtenido:</label>   <div class="clearfix"></div>           </div>
                        
                        <input id="nomtitulo1" type="text" placeholder="ejmp: Tecnico en diseño para medios impresos" class="form-control" >                      
                      </div>
                    
                    <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                        <div class="x_title">      <label>Terminacion :</label> <br>    <div class="clearfix"></div>   <br>          </div>
                    
                        <input id="term1" type="text" placeholder="MM/AAAA" class="form-control" >                      
                      </div>
                    <div class="col-md-2 col-sm-12 col-xs-12 form-group">
                        <div class="x_title">      <label>N&SmallCircle; de targeta Profesional :</label>   <div class="clearfix"></div>             </div>
                                           <input id="numt1" type="text" placeholder="ejml: web@ufp.edu.co" class="form-control" >                      
                      </div>
                    
                    <button id="agregarexpe" class="btn btn-round btn-success col-md-12">GUARDAR</button>
                    
                    <div class="clearfix"></div>
                    
                </div>    </body>
</html>
