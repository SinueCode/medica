<%-- 
    Document   : recibeof
    Created on : 3 sept 2024, 14:49:31
    Author     : DIR. MEDICA
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
    <style>
        .ioficio{
            display: inline;
            width: 85px;
        }

        .ireferencia{
            display: inline;
            width: 350px;
        }
    </style>

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
                        <small class="small-text">CONTROL DE OFICIOS (llegan)</small>   <br>
                        <small class="small-text" style=" font-size: 15px;">DIRECCIÓN MÉDICA</small><br>
                    </div>
                </div>               
            </div>
            <form id="frm_RegOficio" method="POST" class="formulario"  action="../of/recibeOficios?">  
                <div class="form-group col-md">
                    <div class="form-check">
                        <label>S/N</label>
                        <input class="form-check-input" type="checkbox" value="" id="chk-sn" name="chk-sn">                           
                    </div> 
                </div>
                <div id="divnumof" class="divnumof"> 
                    <div class="form-group col-md">
                        <b> No. de oficio:</b>
                        <select id='cbodeptoremit' name='cbodeptoremit' class="selectpicker form-control" style=" height: 55px;" data-show-subtext="false" data-live-search="true" data-width="85px" height="200px">
                            <option value="0" selected >Dpto.</option>
                            <sql:query var="qareas" dataSource="jdbc/MEDICA">
                                select clave, cdescripcion 
                                from ctl_departamentos 
                                where clave != 2000
                                order by clave asc
                            </sql:query>
                            <c:forEach var="areas" begin="0" items="${qareas.rowsByIndex}">
                                <option data-subtext="${areas[1]}" value="${areas[0]}">${areas[0]}</option>
                            </c:forEach>
                        </select> /
                        <input type="text" class="form-control ioficio onlyi input-b" id="iconsecutivo" name="iconsecutivo" placeholder="# Of." maxlength="4" onkeypress="return solonumeros(event, 'numemp');">  
                        <select id="cboannio" name="cboannio" class="selectpicker form-control" data-live-search="false" style="" style="" data-width="85px">
                            <option value="0">Año</option>
                            <option value="1">2023</option>
                            <option value="2">2024</option>                         
                        </select>                     
                    </div>
                </div>
                <div id="divnumof_sin" class="divnumof_sin"  style="display: none"> 
                    <div class="form-group col-md">
                        <b> No. de referencia:</b>
                        <input type="text" class="form-control ireferencia input-b " id="iotro_numof" name="iotro_numof" placeholder="# de referencia" maxlength="38">  

                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-4">
                        <label for="ifecharecep">Fecha de recepción:</label>
                        <input type="text" class="form-control input-b" id="ifecharecep" name="ifecharecep" placeholder="Fecha de recepción" readonly>
                    </div>
                    <div class="col-md-4">
                        <label for="icbonomrec">Nombre de quien recibe:</label>
                        <select id="cboperdm" name="cboperdm" class="form-select input-b" data-live-search="true">                            
                            <option value="-1">Seleccione...</option>
                            <sql:query var="qperdm" dataSource="jdbc/MEDICA">
                                select id, cdescripcion from of_ctl_personal_dm order by cdescripcion asc
                            </sql:query>
                            <c:forEach var="perdm" begin="0" items="${qperdm.rowsByIndex}">
                                <option data-subtext="${perdm[1]}" value="${perdm[0]}">${perdm[1]}</option>
                            </c:forEach>
                        </select>
                    </div>                   
                    <br>
                </div>
                <div class="form-group row">

                    <div class="col-md-6">
                        <label for="icbocodigo_arch">Clasificación:</label>                      
                        <select id="cbocodigo_arch" name="cbocodigo_arch" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true">                            
                            <option value="0" selected >Clasif.</option>
                            <sql:query var="qcodigoar" dataSource="jdbc/MEDICA">
                                select codigo, cdescripcion from of_ctl_archiv_p 
                                order by id
                            </sql:query>
                            <c:forEach var="codigoar" begin="0" items="${qcodigoar.rowsByIndex}">
                                <option data-subtext="${codigoar[1]}" value="${codigoar[0]}">${codigoar[0]}</option>
                            </c:forEach>
                        </select>
                    </div> 
                    <div class="col-md-6">
                        <div id="divcbosubcod">

                        </div>
                    </div>                    
                </div>
                <b>
                    Enviado por (remitente):
                </b>

                <div id="depto_sn"  style="display: none">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="dep_remitente">Departamento:</label>
                            <input type="text" class="form-control input-b" id="dep_remitente_sn" name="dep_remitente_sn" style="   text-align: center; ">
                        </div>
                        <div class="col-md-6">
                            <label for="inomrem">Nombre del remitente:</label>                      
                            <input type="text" class="form-control input-b" id="nom_remitente_sn" name="nom_remitente_sn" style="   text-align: center; ">
                        </div>
                        <br>
                    </div>
                </div> 

                <div id="depto_cn">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="dep_remitente">Departamento:</label>
                            <input type="text" class="form-control input-b" id="dep_remitente" name="dep_remitente"  readonly style=" background: #FFFFFF;   border-style: dashed; cursor: default; font-weight:bold;  text-align: center; ">
                        </div>
                        <div class="col-md-6">
                            <label for="inomrem">Nombre del remitente:</label>                      
                            <div id="divcboremitente">
                                <select style="" name="" id=""  class="form-select input-b" data-live-search="false" style="" style="">
                                    <option value="0">Seleccione...</option>                           
                                </select>
                            </div>
                        </div>
                        <br>                    

                        <div id="divotroremitente" class="otroremitentename" style="display: none" >  
                            <br>
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title">Otro remitente:</h5>
                                </div>
                                <div class="card-body">                    
                                    <div class="form-group row">
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iotron">Nombre:</label>
                                            <input type="text" class="form-control input-b" id="iotron" name="iotron" placeholder="Nombre">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iotroap1">Apellido1:</label>
                                            <input type="text" class="form-control input-b" id="iotroap1" name="iotroap1" placeholder="Apellido1">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iotroap2">Apellido2:</label>
                                            <input type="text" class="form-control input-b" id="iotroap2" name="iotroap2" placeholder="Apellido2">
                                        </div>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="txtasunto">Asunto:</label>
                    <textarea class="form-control" id="txtasunto" name="txtasunto" rows="3" placeholder="Asunto..."></textarea>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Observaciones</label>
                    <textarea class="form-control" id="txtobservaciones" name="txtobservaciones" rows="3" placeholder="Observaciones..."></textarea>
                    <br>
                </div>
                <b>
                    Destinatario:
                </b>

                <div class="form-group col-md">
                    <div class="form-check">
                        <label>C.C.</label>
                        <input class="form-check-input" type="checkbox" value="" id="chk-cc" name="chk-cc">                           
                    </div> 
                </div>

                <div class="form-group row">
                    <div class="col-md-6">  
                        <label for="icbonomrec">Departamento:</label> <!-- puede ser a la dirección médica o a otro departamento depende de C.C-->

                        <div id="divdepto_destmedica" >
                            <select id="cbodepto_destm" name="cbodepto_destm" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true" >                            
                                <!--                                <option value="0" selected >Dpto.</option>-->
                                <sql:query var="qareas_otro" dataSource="jdbc/MEDICA">
                                    select clave, cdescripcion from ctl_departamentos 
                                    where clave = 2000
                                    order by clave asc
                                </sql:query>
                                <c:forEach var="areas_otro" begin="0" items="${qareas_otro.rowsByIndex}">
                                    <option data-subtext="${areas_otro[1]}" value="${areas_otro[0]}">${areas_otro[0]}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div id="divdepto_destotro"  style="display: none">
                            <select id="cbodepto_dest" name="cbodepto_dest" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true">                            
                                <option value="0" selected >Dpto.</option>
                                <sql:query var="qareas_otro" dataSource="jdbc/MEDICA">
                                    select clave, cdescripcion from ctl_departamentos 
                                    where clave != 2000
                                    order by clave asc
                                </sql:query>
                                <c:forEach var="areas_otro" begin="0" items="${qareas_otro.rowsByIndex}">
                                    <option data-subtext="${areas_otro[1]}" value="${areas_otro[0]}">${areas_otro[0]}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="icbonomrec">Nombre(Dirigido a):</label>
                        <div id="divcbodestinatario">
                            <select style="width: 350px;" name="" id=""  class="selectpicker form-control" data-live-search="false">
                                <option value="0">Seleccione...</option>                           
                            </select>
                        </div>

                    </div>




                    <div id="divotrodestinatario" class="otrodestinatarioname" style="display: none">  
                        <br>
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Otro destinatario:</h5>
                            </div>
                            <div class="card-body">                    
                                <div class="form-group row">
                                    <div class="col-md-3 mb-3 mb-lg-0">
                                        <label for="iotrondest">Nombre:</label>
                                        <input type="text" class="form-control input-b" id="iotrondest" name="iotrondest" placeholder="Nombre">
                                    </div>
                                    <div class="col-md-3 mb-3 mb-lg-0">
                                        <label for="iotroap1dest">Apellido1:</label>
                                        <input type="text" class="form-control input-b" id="iotroap1dest" name="iotroap1dest" placeholder="Apellido1">
                                    </div>
                                    <div class="col-md-3 mb-3 mb-lg-0">
                                        <label for="iotroap2dest">Apellido2:</label>
                                        <input type="text" class="form-control input-b" id="iotroap2dest" name="iotroap2dest" placeholder="Apellido2">
                                    </div>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="form-group row">
                    <div class="col-md-6">
                        <label for="icbonomrec">Turnado a:</label>
                        <select id="cbodepto_tur" name="cbodepto_tur" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true">                            
                            <option value="0" selected >Dpto.</option>
                            <sql:query var="qareas_tur" dataSource="jdbc/MEDICA">
                                select clave, cdescripcion from ctl_departamentos 
                                order by clave asc
                            </sql:query>
                            <c:forEach var="areas_tur" begin="0" items="${qareas_tur.rowsByIndex}">
                                <option data-subtext="${areas_tur[1]}" value="${areas_tur[0]}">${areas_tur[0]}</option>
                            </c:forEach>
                        </select>
                    </div>                    
                    <div class="col-md-4">
                        <label for="ifecharecep">Fecha limite de respuesta:</label>
                        <input type="text" class="form-control input-b" id="ifecha_limresp" name="ifecha_limresp" placeholder="Fecha limite de respuesta" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-10 ">


                    </div>
                    <div class="col-md-2 ">
                        <input type="submit" class="btn btn-primary" type="submit" value="Guardar">
                    </div>
                </div>

                <br> <br> <br> <br> <br>
            </form>
        </div>



        <script type="text/javascript">
            $(function () {
                jQuery.datetimepicker.setLocale('es');
                $('#ifecharecep').datetimepicker({
                    format: 'd/m/Y H:i',
                    language: 'es'
                            //, minDate: '<?php echo $fecha_actualidad2 ?>'  //fecha actual
                            // , maxDate: '<?php echo $fecha_actualidad2 ?>' //fecha actual
                    , formatDate: 'd/m/Y H:i'
                    , autoclose: true
                    , step: 1
                });

                $('#ifecha_limresp').datetimepicker({
                    format: 'd/m/Y H:i',
                    language: 'es'
                            //, minDate: '<?php echo $fecha_actualidad2 ?>'  //fecha actual
                            // , maxDate: '<?php echo $fecha_actualidad2 ?>' //fecha actual
                    , formatDate: 'd/m/Y H:i'
                    , autoclose: true
                    , step: 1
                });
            });


            $('#divcbodestinatario').load('../consultas/cboUsuarios.jsp?valor=2000'); //destinatario dirección médica

            $("#cbocodigo_arch").change(function () {
                var id_cod = $(this).val();
                var option_cod = $('option:selected', this).attr('data-subtext');
                $("#cbocodigo_arch option:selected").each(function () {
                    $.post("../consultas/cboSubcodigo.jsp", {id_cod: id_cod}, function (data) {//sinue                        
                        $("#divcbosubcod").html(data);
                        $("#cbosubcodigo_arch").selectpicker("refresh");
                    });
                    //    $('#divcbosubcod').load('../consultas/cboSubcodigo.jsp?id_cod=' + id_cod);
                });
            });

            $("#cbodeptoremit").change(function () {
                var id = $(this).val();
                var option = $('option:selected', this).attr('data-subtext');
                $('#dep_remitente').val(option);
                $("#cbodeptoremit option:selected").each(function () {
                    $('#divcboremitente').load('../consultas/cboUsuarios.jsp?valor=' + id);
                });

                // limpa          
                $("#iconsecutivo").val(''); //num de oficio
                $('#cboannio').selectpicker('val', '0');     //año                    
                $("#cbonomremit").val('-1'); // nom remitente
                $('.otroremitentename').hide();
                $("#txtasunto").val('');   //asunto
                $("#txtobservaciones").val(''); //observaciones
            });


            //otro remitente
            $(document).on('change', '#cbonomremit', function () {
                $("#iotron").val('');
                $("#iotroap1").val('');
                $("#iotroap2").val('');
                if ($('#cbonomremit').val() === '3') { // OTRO
                    $('.otroremitentename').show();
                } else {
                    $('.otroremitentename').hide();
                }
            });


            //otro destinatario
            $(document).on('change', '#cbonomdest', function () {
                $("#iotrondest").val('');
                $("#iotroap1dest").val('');
                $("#iotroap2dest").val('');
                if ($('#cbonomdest').val() === '3') { // OTRO
                    $('.otrodestinatarioname').show();
                } else {
                    $('.otrodestinatarioname').hide();
                }
            });



            $("#chk-sn").click(function () {
                if ($('#chk-sn').prop('checked')) { //sin número de oficio 
                    $('#divnumof').hide();
                    $('#divnumof_sin').show();
                    $('#depto_sn').show();
                    $('#depto_cn').hide();
                    //limpia
                    $('#cbodeptoremit').selectpicker('val', '0');
                    $('#divcboremitente').load('../consultas/cboUsuarios.jsp?valor=0');
                    //  alert(a)
                    $("#iconsecutivo").val(''); //num de oficio
                    $('#cboannio').selectpicker('val', '0');     //año                
                    $('.otroremitentename').hide();
                    $("#txtasunto").val('');   //asunto
                    $("#txtobservaciones").val(''); //observaciones
                    $("#dep_remitente_sn").val('');   //depto sin num de oficio
                    $("#nom_remitente_sn").val('');   //nom sin num de oficio
                    $('#dep_remitente').val('');
                } else {
                    $('#divnumof').show();
                    $('#depto_cn').show();
                    $('#divnumof_sin').hide();
                    $('#depto_sn').hide();
                    $("#iotro_numof").val('');


                }
            });

            //CC
            $('#chk-cc').click(function () {
                $('.otrodestinatarioname').hide();
                // $('#cbodeptodirigido').selectpicker('refresh');
                // console.log($(this).attr('id'))
                if ($('#chk-cc').prop('checked')) { // es copia para la dirección médica otro serv
                    // alert('ESTA MARCADO');
                    $('#divdepto_destmedica').hide();
                    $('#divdepto_destotro').show();
                    $('#cbodepto_dest').selectpicker('val', '0');
                    $('#divcbodestinatario').load('../consultas/cboUsuariosdest.jsp?valor=0');
                    $('#cbonomdest').val('-1');
                    // cbonomdest
                } else {
                    // alert('NOOOO  ESTA MARCADO'); //  para la direccion médica
                    $('#divdepto_destmedica').show();
                    $('#divdepto_destotro').hide();
                    $('#divcbodestinatario').load('../consultas/cboUsuariosdest.jsp?valor=2000');
                    $('#cbonomdest').val('-1');
                }
            });


            //Departamentop
            $("#cbodepto_dest").change(function () {
                var id = $(this).val();
                //alert(id);
                $('#divcbodestinatario').load('../consultas/cboUsuariosdest.jsp?valor=' + id);
                $("#iotrondest").val('');
                $("#iotroap1dest").val('');
                $("#iotroap2dest").val('');
                $('.otrodestinatarioname').hide();
            });



            $('#frm_RegOficio').ajaxForm({

                success: function (data) {

                   // alert("aquiiiiiiiiii");
                    if (data.done === 0) {
                        elemento = data.elemento;
                        alert(data.mensaje);
                         alert(elemento);
                    $('#' + elemento).trigger('focus');
                          $('html, body').animate({scrollTop: $('#' + elemento).offset().top - 86}, 15);
         
        
        
                    } else {

                       
                        //  folio_receta = data.folio_receta;
                        alert("El oficio se registro correctamente, FOLIO CONSECUTIVO:"); //// 
                        // window.open('/HIM/receta/generaReceta?&folio_receta=' + folio_receta);
                        // $('.btnguardar').attr("disabled", "disabled");
                        //  $('.btnguardar').append('<img src="../imagenes/loading.gif" width="11" height="11" alt="" />');

                    }
                },
                beforeSubmit: function () {

                    // $('.btnguardar').attr("disabled", "disabled");


                }
            });


        </script>


    </body>
</html>

