<%-- 
    Document   : registro_diario
    Created on : 2 sept 2024, 08:47:38
    Author     : DIR. MEDICA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> DIR. MÉDICA </title>
        <link rel="shortcut icon" href="../images/himfg-logo_ewzx59.webp">  
        <%=global.cFunciones.setHeadHtml(request)%> 
    </head>

    <body>
        <jsp:include page="../includes/menu.jsp" />
        <!-- Page Content -->


        <div class="container">            
            <div class="row ">
                <div class="col-md-4 mb-4 mb-lg-0">
                    <div class="about-image svg">
                        <img src="../images/salud_him_logo.png" class="img-fluid" alt="svg image">                        
                    </div>
                </div>
                <div class="col-md-8 mb-8 mb-lg-0 text-end ">
                    <br>                   
                    <small class="small-text" style=" font-size: 15px; align-items: end">HOSPITAL INFANTIL DE MÉXICO FEDERICO GÓMEZ </small><br>
                    <small class="small-text" style=" font-size: 15px;">INSTITUTO NACIONAL DE SALUD </small><br>
                    <small class="text-end small-text" style=" font-size: 20px;">DIRECCIÓN MÉDICA</small><br>
                    <br><br>
                </div>
            </div>
            <div class="row ">
                <div class="row justify-content-center text-center">
                    <div class="col-12 text-center mb-5">
                        <small class="small-text">ENTREGA DE GUARDIA</small>   <br>
                        <small class="small-text" style=" font-size: 15px;">DIRECCIÓN MÉDICA</small><br>
                    </div>
                </div>               
            </div>

            <form id="frmcomitem" method="POST" class="formulario"  action=" ">
                <div class="form-group row">
                    <div class="col-md-9 mb-9 mb-lg-0"></div>
                    <div class="col-md-3 mb-3 mb-lg-0">
                        <label for="ifsesion">Fecha:</label>                                      
                        <input type="text" class="form-control" name="ifsesion" id="ifsesion" placeholder="F. sesión">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="accordion" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                    <b>INTEGRANTES DE LA GUARDIA</b>                                        
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                                <div class="accordion-body">
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="cbojguardia">JEFE DE LA GUARDIA:</label>
                                            <select name="cbojguardia" id="cbojguardia" class="custom-select form-select">
                                                <option value="-1">Seleccione...</option>
                                                <option value="F">Femenino</option>
                                                <option value="M">Maculino</option>  
                                            </select>
                                        </div>         

                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="cboasistdir">ASISTENTE DE LA DIRECCIÓN:</label>
                                            <select name="cboasistdir" id="cboasistdir" class="custom-select form-select">
                                                <option value="-1">Seleccione...</option>
                                                <option value="F">Femenino</option>
                                                <option value="M">Maculino</option>  
                                            </select>
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="cborespcir">RESPONSABLE DE LA CIRUGÍA:</label>
                                            <select name="cborespcir" id="cborespcir" class="custom-select form-select">
                                                <option value="-1">Seleccione...</option>
                                                <option value="F">Femenino</option>
                                                <option value="M">Maculino</option>  
                                            </select>
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0"></div>

                                    </div>
                                    <br>
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="cborespenfe">RESPONSABLE ENFERMERÍA:</label>
                                            <select name="cborespenfe" id="cborespenfe" class="custom-select form-select">
                                                <option value="-1">Seleccione...</option>
                                                <option value="F">Femenino</option>
                                                <option value="M">Maculino</option>  
                                            </select>
                                        </div>
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <label for="cboresplab">RESPONSABLE DE LABORATORIO PED 3-4:</label>
                                            <select name="cboresplab" id="cboresplab" class="custom-select form-select">
                                                <option value="-1">Seleccione...</option>
                                                <option value="F">Femenino</option>
                                                <option value="M">Maculino</option>  
                                            </select>
                                        </div>
                                        <div class="col-md-5 mb-5 mb-lg-0"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                    <b>NUMERALIA (Información de 24 horas)</b>
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                <div class="accordion-body">
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iprealta"><b>PREALTAS:</b></label>                                      
                                            <input type="text" class="form-control" name="iprealta" id="iprealta" placeholder="Pre-altas" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="itotal_altas"><b>TOTAL DE ALTAS:</b></label>                                      
                                            <input type="text" style="" class="form-control" name="itotal_altas" id="itotal_altas" placeholder="Total de altas" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iaantes12">Altas antes de 12 hrs:</label>
                                            <input  style="" class="form-control" name="iaantes12" id="iaantes12" placeholder="A. antes de las 12">
                                        </div>

                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iadesp12">Altas después de 12 hrs:</label>
                                            <input style=""  class="form-control"  name="iadesp12"  id="iadesp12" placeholder="A. despúes de las 12">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iucin48">UCIN/48hrs:</label>                                      
                                            <input type="text" class="form-control" name="iucin48" id="iucin48" placeholder="UCIN/48hrs" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="ipamqx"><b>ÍNDICE PREALTA/ALTA MED/QX:</b></label>                                      
                                            <input type="text" style="" class="form-control" name="ipamqx" id="ipamqx" placeholder="índice..." MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="itrashacia"><b>TRASLADOS HACIA HIM:</b></label>
                                            <input  style="" class="form-control" name="itrashacia" id="itrashacia" placeholder="T. hacia HIM">
                                        </div>

                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="itrasdesde"><b>TRASLADOS DESDE HIM:</b></label>
                                            <input style=""  class="form-control"  name="itrasdesde"  id="itrasdesde" placeholder="T. desde HIM">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="itoting"><b>TOTAL DE INGRESOS:</b></label>                                      
                                            <input type="text" class="form-control" name="itoting" id="itoting" placeholder="Total de ingresos" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiamed">Ingresos área médica</label>                                      
                                            <input type="text" style="" class="form-control" name="iiamed" id="iiamed" placeholder="Ingresos médica" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiaquir">Ingresos área quirúrgica</label>
                                            <input  style="" class="form-control" name="iiaquir" id="iiaquir" placeholder="Ingresos quirúrgica">
                                        </div>

                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiporurg">Ingresos por urgencias:</label>
                                            <input style=""  class="form-control"  name="iiporurg"  id="iiporurg" placeholder="Ingresos por urgencias">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint">Ingresos terapia intensiva</label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiuneonat">Ingresos unidad neonatal</label>
                                            <input  style="" class="form-control" name="iiuneonat" id="iiuneonat" placeholder="Ingresos unidad neonatal">
                                        </div>

                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiaurg"><b>INGRESOS A URGENCIAS</b></label>
                                            <input style=""  class="form-control"  name="iiaurg"  id="iiaurg" placeholder="Ingresos a urgencias">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint"><b>PARO CARDIO -RESPIRATORIO</b></label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint">Esperado</label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiuneonat">No esperado</label>
                                            <input  style="" class="form-control" name="iiuneonat" id="iiuneonat" placeholder="Ingresos unidad neonatal">
                                        </div>

                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <!--                                            <label for="iiaurg"><b>INGRESOS A URGENCIAS</b></label>
                                                                                        <input style=""  class="form-control"  name="iiaurg"  id="iiaurg" placeholder="Ingresos a urgencias">-->
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint"><b>DEFUNCIONES</b></label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint">Esperado</label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiuneonat">No esperado</label>
                                            <input  style="" class="form-control" name="iiuneonat" id="iiuneonat" placeholder="Ingresos unidad neonatal">
                                        </div>

                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiaurg"><b>EXTUBACIONES NO PROGRAMADAS</b></label>
                                            <input style=""  class="form-control"  name="iiaurg"  id="iiaurg" placeholder="Ingresos a urgencias">
                                        </div>
                                    </div>                                    
                                    <br>
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint"><b>CIRUGÍAS PRACTICADAS TOTAL</b></label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint"><b>Programadas Matutinas</b></label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiuneonat"><b>Programadas Vespertino</b></label>
                                            <input  style="" class="form-control" name="iiuneonat" id="iiuneonat" placeholder="Ingresos unidad neonatal">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiaurg"><b>Cirugías Canceladas</b></label>
                                            <input style=""  class="form-control"  name="iiaurg"  id="iiaurg" placeholder="Ingresos a urgencias">
                                        </div>
                                    </div>

                                    <br>
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint">Cirugías mayores urgencia</label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint">Cirugías menores urgencia</label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiuneonat"><b>Cirugías durante la Guardia</b></label>
                                            <input  style="" class="form-control" name="iiuneonat" id="iiuneonat" placeholder="Ingresos unidad neonatal">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiaurg"><b>Valoraciones de cirugía</b></label>
                                            <input style=""  class="form-control"  name="iiaurg"  id="iiaurg" placeholder="Ingresos a urgencias">
                                        </div>
                                    </div>

                                    <br>
                                    <div class="form-group row"> 
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint"><b>TOTAL DE INCIDENCIAS</b></label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <br>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iiterint"><b>QUEJAS</b></label>                                      
                                            <input type="text" style="" class="form-control" name="iiterint" id="iiterint" placeholder="Ingresos terapia intensiva" MAXLENGTH="2">
                                        </div>
                                        <div class="col-md-6 mb-6 mb-lg-0"> </div>                                  
                                    </div>
                                    <br><br>
                                    <b>
                                        OBSERVACIONES (relacionadas al punto anterior)<br> 
                                    </b> 
                                    <div class="form-group row">  
                                        <div class="col-md-12 mb-12 mb-lg-0">
                                            <label for="iexistcong">Mantenimiento:</label>
                                            <textarea class="form-control" id="iexistcong" rows="3"></textarea>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row">  
                                        <div class="col-md-12 mb-12 mb-lg-0">
                                            <label for="iexistcong" >Servicios generales:</label>
                                            <textarea class="form-control" id="iexistcong" rows="3"></textarea>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row">  
                                        <div class="col-md-12 mb-12 mb-lg-0">
                                            <label for="iexistcong"> Derechohabientes:</label>
                                            <textarea class="form-control" id="iexistcong" rows="3"></textarea>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row">  
                                        <div class="col-md-12 mb-12 mb-lg-0">
                                            <label for="iexistcong"> Relaciones públicas:</label>
                                            <textarea class="form-control" id="iexistcong" rows="3"></textarea>
                                        </div>
                                    </div> 
                                    <br>
                                    <div class="form-group row">  
                                        <div class="col-md-12 mb-12 mb-lg-0">
                                            <label for="iexistcong"> Trabajo social:</label>
                                            <textarea class="form-control" id="iexistcong" rows="3"></textarea>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row">  
                                        <div class="col-md-12 mb-12 mb-lg-0">
                                            <label for="iexistcong"> Falta de medicameto:</label>
                                            <textarea class="form-control" id="iexistcong" rows="3"></textarea>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group row">  
                                        <div class="col-md-12 mb-12 mb-lg-0">
                                            <label for="iexistcong"> Otros:</label>
                                            <textarea class="form-control" id="iexistcong" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        
                        <!--item accordion-->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                    <b>COVID (SARS COV 2)</b>
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                                <div class="accordion-body">
                                    <div class="form-group row"> 
                                        <div class="col-md-12 mb-12 mb-lg-0">
                                            <label for="ipcovidact"><b>Pacientes activos:</b></label>                                      
                                            <input type="text" class="form-control" name="ipcovidact" id="ipcovidact" placeholder="Pacientes activos" MAXLENGTH="10">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--item INCIDENCIAS-->
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="panelsStayOpen-headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
                                    <b>INCIDENCIAS</b>
                                </button>
                            </h2>
                            <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
                                <div class="accordion-body">
                                    <div class="form-group row"> 
<!--                                        <div class="col-md-12 mb-12 mb-lg-0">
                                            <label for="ipcovidact"><b>Pacientes activos:</b></label>                                      
                                            <input type="text" class="form-control" name="ipcovidact" id="ipcovidact" placeholder="Pacientes activos" MAXLENGTH="10">
                                        </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="form-group row">
            <div class="col-md-10 ">

            </div>
            <div class="col-md-2 ">
                <input type="submit" class="btn btn-primary" type="submit" value="Guardar">
            </div>
        </div>
        <br><br><br><br><br>




        <script type="text/javascript">
            $(function () {
                jQuery.datetimepicker.setLocale('es');

                $('#idfechadef').datetimepicker({
                    format: 'd/m/Y H:i',
                    language: 'es'
                            //, minDate: '<?php echo $fecha_actualidad2 ?>'  //fecha actual
                            // , maxDate: '<?php echo $fecha_actualidad2 ?>' //fecha actual
                    , formatDate: 'd/m/Y H:i'
                    , autoclose: true
                    , step: 1
                });
            });

            //fecha de la sesion 
            $('#ifsesion').datepicker({
                language: 'es',
                startDate: "-1y",
                // endDate: "<?php echo $fecha_actualidad ?>",
                autoclose: true
            });

            //fecha de nacimiento
            $('#ifechanac').datepicker({
                language: 'es',
                startDate: "-1y",
                // endDate: "<?php echo $fecha_actualidad ?>",
                autoclose: true
            });

            //fecha de ingreso   ifechaing       idfechadef  
            $('#ifechaing').datepicker({
                language: 'es',
                startDate: "-1y",
                // endDate: "<?php echo $fecha_actualidad ?>",
                autoclose: true
            });

            //fecha de defuncion
            $('#ifechanac').datepicker({
                language: 'es',
                startDate: "-1y",
                // endDate: "<?php echo $fecha_actualidad ?>",
                autoclose: true
            });

        </script>
    </body>
</html>
