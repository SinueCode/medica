<%-- 
    Document   : recibeof
    Created on : 3 sept 2024, 14:49:31
    Author     : DIR. MEDICA
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (!global.cFunciones.fnhaysesion(session)) {
        response.sendRedirect(request.getContextPath() + "/cerrar_sesion.jsp");
    } else {
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> DIR. MÉDICA </title>
        <link rel="shortcut icon" href="../images/himfg-logo_ewzx59.webp">  
        <%=global.cFunciones.setHeadHtml(request)%> 
    </head>
    <script type="text/javascript">
        var vflagclose = 0;
        var cuentadest = 0;
    </script>
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
        <div class="modal fade" id="modalfinish" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalToggleLabel">Modal 1</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body bodyfinish">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary doclose" data-bs-dismiss="modal">Cerrar</button>
                        <button class="btn btn-primary" data-bs-target="#modaladj" data-bs-toggle="modal">Adjuntar archivos</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modaladj" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">Adjuntar</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="frmattach" method="POST" class="" enctype="multipart/form-data"  action="<%=request.getContextPath()%>/u/uploadFiles?id_oficio=">
                            <input type="file" class="form-control" style="height:auto;" id="ifileattach" name="archivos" multiple="">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary doclose" data-bs-dismiss="modal">Terminar</button>
                    </div>
                </div>
            </div>
        </div>
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
                        <small class="small-text">CONTROL DE OFICIOS (Recepción)</small>   <br>
                        <small class="small-text" style=" font-size: 15px;">DIRECCIÓN MÉDICA</small><br>
                    </div>
                </div>               
            </div>
            <form id="frm_RegOficio" method="POST" class="formulario"  action="../of/recibeOficios"> 
                <sql:query var="conactualdate" dataSource="jdbc/MEDICA">
                    select 
                    DATE_FORMAT(now(), '%d/%m/%Y 00:00') as fechaactual
                    , DATE_FORMAT( DATE_ADD(now(), interval -1 month), '%d/%m/%Y 00:00') as fmenos1m
                    , DATE_FORMAT( DATE_ADD(now(), interval +1 month), '%d/%m/%Y 00:00') as fmaslm
                    , DATE_FORMAT(now(), '%d%m%Y%H%i') as freferencia
                </sql:query>
                <c:set var="fechaactual" value="${conactualdate.rows[0].fechaactual}"/>     
                <c:set var="fmenos1m" value="${conactualdate.rows[0].fmenos1m}"/>     
                <c:set var="fmaslm" value="${conactualdate.rows[0].fmaslm}"/>     
                <c:set var="freferencia" value="${conactualdate.rows[0].freferencia}"/>     
                <div class="form-group col-md">
                    <div class="form-check">
                        <label for="chk-sn">S/N</label>
                        <input class="form-check-input" type="checkbox" value="" id="chk-sn" name="chk-sn">                           
                    </div> 
                </div>
                <div id="divnumof" class="divnumof"> 
                    <div class="form-group col-md">
                        <b> No. de oficio:</b>
                        <div class="_divoicq">
                            HIM /12200 / 
                        </div>
                        <select id='cbodeptoremit' name='cbodeptoremit' class="selectpicker form-control" style=" height: 55px;" data-show-subtext="false" data-live-search="true" data-width="85px" height="200px">
                            <option value="0" selected >Dpto.</option>
                            <sql:query var="qareas" dataSource="jdbc/MEDICA">
                                select clave, upper(cdescripcion) cdescripcion 
                                from ctl_departamentos 
                                where clave != 2000
                                order by clave asc
                            </sql:query>
                            <c:forEach var="areas" begin="0" items="${qareas.rowsByIndex}">
                                <option data-subtext="${areas[1]}" value="${areas[0]}">${areas[0]}</option>
                            </c:forEach>
                        </select> 

                        <div class="_divjuridico">
                            / <select id="cbojur" name="cbojur" class="selectpicker form-control " data-live-search="false" style="" style="" data-width="85px">
                                <sql:query var="qjur" dataSource="jdbc/MEDICA">
                                    SELECT id, cdescripcion from of_tipo_juridico
                                </sql:query>
                                <c:forEach var="vjur" begin="0" items="${qjur.rowsByIndex}">
                                    <option value="${vjur[0]}">${vjur[1]}</option>
                                </c:forEach>           
                            </select>           
                        </div>
                        / <input type="text" class="form-control ioficio onlyi input-b" id="iconsecutivo" name="iconsecutivo" autocomplete="off" placeholder="# Of." maxlength="4" onkeypress="return solonumeros(event, 'numemp');">  
                        / <select id="cboannio" name="cboannio" class="selectpicker form-control" data-live-search="false" style="" style="" data-width="85px">
                            <option value="0" selected >Año</option>
                            <sql:query var="qannio" dataSource="jdbc/MEDICA">
                                SELECT DATE_FORMAT(now(), '%Y') AS 'anio' UNION SELECT DATE_FORMAT( DATE_ADD(now(), INTERVAL -1 YEAR), '%Y') AS 'anio' 
                            </sql:query>
                            <c:forEach var="annio" begin="0" items="${qannio.rowsByIndex}">
                                <option value="${annio[0]}">${annio[0]}</option>
                            </c:forEach>           
                        </select>                     
                    </div>
                </div>
                <div id="divnumof_sin" class="form-group row divnumof_sin"  style="display: none"> 
                    <div class="form-group col-md-4">
                        <b> &nbsp;</b>
                        <div class="form-check">
                            <label>Se envió por correo</label>
                            <input class="form-check-input" type="checkbox" value="" id="chk-correo" name="chk-correo">                           
                        </div> 
                    </div>
                    <div class="form-group col-md-4">
                        <b> No. de referencia*:</b>
                        <svg data-toggle="tooltip" data-placement="right" title="Para los correos recibidos se generará un núm de referencia consecutivo" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2"/>
                        </svg>
                        <input type="text" class="form-control ireferencia input-b " id="iotro_numof" name="iotro_numof" placeholder="# de referencia" maxlength="38">  
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-4">
                        <label for="ifecharecep">Fecha de recepción*:</label>
                        <input type="text" class="form-control input-b" id="ifecharecep" name="ifecharecep" autocomplete="off" placeholder="Fecha de recepción" >
                    </div>
                    <div class="col-md-4">
                        <label for="icbonomrec">Nombre de quien recibe*:</label>
                        <select id="cboperdm" name="cboperdm" class="form-select input-b" data-live-search="true">                            
                            <option value="-1">Seleccione...</option>
                            <sql:query var="qperdm" dataSource="jdbc/MEDICA">
                                select id, upper(cdescripcion) cdescripcion from of_ctl_personal_dm where cstatus = 1 order by cdescripcion asc
                            </sql:query>
                            <c:forEach var="perdm" begin="0" items="${qperdm.rowsByIndex}">
                                <option data-subtext="${perdm[1]}" value="${perdm[0]}">${perdm[1]}</option>
                            </c:forEach>
                        </select>
                    </div>                   
                    <br>
                </div>
                <hr> 
                <b>
                    Enviado por (remitente):
                </b>
                <div id="depto_sn"  style="display: none">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="dep_remitente">Departamento*:</label>
                            <input type="text" class="form-control input-b" id="dep_remitente_sn" name="dep_remitente_sn" style="   text-align: center; ">
                        </div>
                        <div class="col-md-6">
                            <label for="inomrem">Nombre del remitente*:</label>                      
                            <input type="text" class="form-control input-b" id="nom_remitente_sn" name="nom_remitente_sn" style="   text-align: center; ">
                        </div>
                        <br>
                    </div>
                </div> 

                <div id="depto_cn">
                    <div class="form-group row">
                        <div class="col-md-5">
                            <label for="dep_remitente">Departamento*:
                                <svg data-toggle="tooltip" data-placement="right" title="Seleccione el departamento en el número de oficio" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
                                <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2"/>
                                </svg>
                            </label>
                            <input type="text" class="form-control input-b" id="dep_remitente" name="dep_remitente"  readonly style=" background: #FFFFFF;   border-style: dashed; cursor: default; font-weight:bold;  text-align: center; ">
                        </div>
                        <div class="col-md-5">
                            <label for="inomrem">Nombre del remitente*:</label>                      
                            <div id="divcboremitente">
                                <select style="" name="" id=""  class="form-select input-b disabled" data-live-search="false" style="" style="">
                                    <option value="0">Seleccione...</option>                           
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="chk-ausencia"></label> 
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="chk-ausencia" name="chk-ausencia" value="">
                                <label class="form-check-label" for="chk-ausencia">Firma en ausencia</label>
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
                                            <label for="iotron">Nombre*:</label>
                                            <input type="text" class="form-control input-b" id="iotron" name="iotron"  onchange="fnupperfg(this)" placeholder="Nombre">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iotroap1">Apellido1*:</label>
                                            <input type="text" class="form-control input-b" id="iotroap1" name="iotroap1" onchange="fnupperfg(this)" placeholder="Apellido1">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iotroap2">Apellido2*:</label>
                                            <input type="text" class="form-control input-b" id="iotroap2" name="iotroap2" onchange="fnupperfg(this)" placeholder="Apellido2">
                                        </div>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="div_ausencia" class="form-group row div_ausencia" style="display: none"> 
                    <div class="form-group col-md-4">
                        <b> Firma por ausencia:</b>                      
                        <input type="text" class="form-control  input-b " id="nom_ausencia" name="nom_ausencia" placeholder="Nombre completo" maxlength="38">  
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-6">
                        <label for="icbocodigo_arch">Clasificación*:</label>                      
                        <select id="cbocodigo_arch" name="cbocodigo_arch" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true">                            
                            <option value="0" selected >Seleccione...</option>
                            <sql:query var="qcodigoar" dataSource="jdbc/MEDICA">
                                select codigo, upper(cdescripcion) cdescripcion from of_ctl_archiv_p 
                                order by id
                            </sql:query>
                            <c:forEach var="codigoar" begin="0" items="${qcodigoar.rowsByIndex}">
                                <option data-subtext="${codigoar[1]}" value="${codigoar[0]}">${codigoar[0]}</option>
                            </c:forEach>
                        </select>
                    </div> 
                    <div class="col-md-6">
                        <div id="divcbosubcod"> 
                            <!--diana diana-->
                            <label for="icbosubcodigo_arch">Sub-Clasificación*:</label> 
                            <select id="cbosubcodigo_arch" name="cbosubcodigo_arch" disabled="true" class="selectpicker form-control"  data-show-subtext="true" data-live-search="false" >                            
                                <option value="0" selected >Sub-Clasif.</option>            
                            </select>
                        </div>
                    </div>                    
                </div>
                <div class="form-group row">
                    <div class="col-md-6">
                        <div id="divcbocarpeta">
                            <label for="icbosubcodigo_arch">Carpeta:</label> 
                            <select id="cbocarpeta_arch" name="cbocarpeta_arch" disabled="true" class="selectpicker form-control" data-live-search="false" >                            
                                <option value="0" selected >Seleccione...</option>                               
                            </select>
                        </div>
                    </div> 
                    <div class="col-md-6">
                        <label for="iarchivado"></label> 
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="iarchivado" name="iarchivado" value="1">
                            <label class="form-check-label" for="iarchivado">Archivado</label>
                        </div>
                    </div>                    
                </div>


                <div class="form-group row">
                    <div class="col-md-6">
                        <label for="txtasunto">Asunto*:</label>
                        <textarea class="form-control" id="txtasunto" name="txtasunto" rows="3" placeholder="Asunto..."></textarea>
                    </div>
                    <div class="col-md-6">
                        <label for="exampleFormControlTextarea1">Observaciones:</label>
                        <textarea class="form-control" id="txtobservaciones" name="txtobservaciones" rows="3" placeholder="Observaciones..."></textarea>
                    </div>                
                </div>   
                <hr> 
                <b>
                    Destinatario:
                </b>
                <div class="form-group col-md">
                    <div class="form-check">
                        <label for="chk-cc">C.C. A DIR. MÉDICA</label>
                        <input class="form-check-input" type="checkbox" value="" id="chk-cc" name="chk-cc">                           
                    </div> 
                </div>
                <div class="_show_dirmed">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="icbonomrec">Departamento*:</label> <!-- puede ser a la dirección médica o a otro departamento depende de C.C-->
                            <div id="divdepto_destmedica" >
                                <select id="cbodepto_destm" name="cbodepto_destm" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true" >                            
                                    <!--                                <option value="0" selected >Dpto.</option>-->
                                    <sql:query var="qareas_otro" dataSource="jdbc/MEDICA">
                                        select clave, upper(cdescripcion) cdescripcion from ctl_departamentos 
                                        where clave = 2000
                                        order by clave asc
                                    </sql:query>
                                    <c:forEach var="areas_otro" begin="0" items="${qareas_otro.rowsByIndex}">
                                        <option data-subtext="${areas_otro[1]}" value="${areas_otro[0]}">${areas_otro[0]}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <!--                            <div id="divdepto_destotro"  style="display: none">
                                                            <select id="cbodepto_dest" name="cbodepto_dest" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true">   
                                                                <option value="0" selected >Varios</option>
                                                                <option data-subtext="A TODO EL PERSONAL DEL HIMFG" value="HIMG001">--</option>
                                                                <option data-subtext="A TODOS LOS DIRECTORES, SUBDIRECTORES Y JEFES DE DEPARTAMENTO DEL HIMFG" value="HIMG002">--</option>
                                                                <option value="0" selected >Dpto.</option>
                            <sql:query var="qareas_otro" dataSource="jdbc/MEDICA">
                                select clave, upper(cdescripcion) cdescripcion from ctl_departamentos 
                                where clave != 2000
                                order by clave asc
                            </sql:query>
                            <c:forEach var="areas_otro" begin="0" items="${qareas_otro.rowsByIndex}">
                                <option data-subtext="${areas_otro[1]}" value="${areas_otro[0]}">${areas_otro[0]}</option>
                            </c:forEach>
                        </select>
                    </div>-->
                        </div>
                        <div class="col-md-6">
                            <label for="icbonomrec">Nombre(Dirigido a)*:</label>
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
                                            <label for="iotrondest">Nombre*:</label>
                                            <input type="text" class="form-control input-b" id="iotrondest" name="iotrondest" onchange="fnupperfg(this)" placeholder="Nombre">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iotroap1dest">Apellido1*:</label>
                                            <input type="text" class="form-control input-b" id="iotroap1dest" name="iotroap1dest" onchange="fnupperfg(this)" placeholder="Apellido1">
                                        </div>
                                        <div class="col-md-3 mb-3 mb-lg-0">
                                            <label for="iotroap2dest">Apellido2*:</label>
                                            <input type="text" class="form-control input-b" id="iotroap2dest" name="iotroap2dest" onchange="fnupperfg(this)" placeholder="Apellido2">
                                        </div>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="_adddestdiv" style="display: none;">
                    <div class="form-group row">
                        <div class="col-md-6">

                            <button type="button" id="btnadddest" class="btn btn-link btnadddest"> <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                </svg>    Agregar destinatario</button>


                            <button type="button" id="btnremoveall" class="btn btn-link btnremoveall"> 
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                                </svg>    Quitar todos</button>

                        </div>
                        <div class="_adddestcont">

                        </div>
                    </div>
                </div>
                <hr/>
                <div class="form-group row">
                    <div class="col-md-6">
                        <label for="icbonomrec">Turnado a:</label>
                        <select id="cbodepto_tur" name="cbodepto_tur" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true">                            
                            <option value="0" selected >Dpto.</option>
                            <sql:query var="qareas_tur" dataSource="jdbc/MEDICA">
                                select clave, upper(cdescripcion) cdescripcion from ctl_departamentos 
                                order by clave asc
                            </sql:query>
                            <c:forEach var="areas_tur" begin="0" items="${qareas_tur.rowsByIndex}">
                                <option data-subtext="${areas_tur[1]}" value="${areas_tur[0]}">${areas_tur[0]}</option>
                            </c:forEach>
                        </select>
                    </div>                    
                    <div class="col-md-6">
                        <label for="ifecha_limresp">Fecha limite de respuesta*:</label>
                        <input type="text" class="form-control input-b" id="ifecha_limresp" name="ifecha_limresp" placeholder="Fecha limite de respuesta" readonly>
                    </div>                 
                </div>
                <div class="form-group row">
                    <div class="col-md-10 "></div>
                    <div class="col-md-2 ">
                        <input type="submit" class="btn btn-primary btnguardar" type="submit" value="Guardar">
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
                    , minDate: '${fmenos1m}'  //fecha actual 
                    , maxDate: '${fechaactual}' //fecha actual
                    , formatDate: 'd/m/Y H:i'
                    , autoclose: true
                    , step: 1
                    , closeOnDateSelect: true
                });
                $('#ifecha_limresp').datetimepicker({
                    format: 'd/m/Y H:i',
                    language: 'es'
                    , minDate: '${fmenos1m}'  //fecha actual fmenos1m
                    , maxDate: '${fmaslm}' //fecha actual mas1m
                    , formatDate: 'd/m/Y H:i'
                    , autoclose: true
                    , step: 1
                    , closeOnDateSelect: true
                });
            });
            $('#divcbodestinatario').load('../consultas/cboUsuariosdest.jsp?valor=2000'); //destinatario dirección médica

            $("#cbocodigo_arch").change(function () {
                var id_cod = $(this).val();
                var option_cod = $('option:selected', this).attr('data-subtext');
                $.post("../consultas/cboSubcodigo.jsp", {id_cod: id_cod}, function (data) {
                    $("#divcbosubcod").html(data);
                    $("#cbosubcodigo_arch").selectpicker("refresh");
                    // $('#divcbocarpeta').html('aaaaaaaaaaaaaaaa');
                });

                $.post("../consultas/cboCarpeta.jsp", {id_subcod: 0}, function (data) { // carga cbo carpeta y deshabilitada
                    $("#divcbocarpeta").html(data);
                    $("#cbocarpeta_arch").unbind();
                    $("#cbocarpeta_arch").selectpicker("refresh");
                });
            });


            $("#cbodeptoremit").change(function () {
                $('._divjuridico').removeClass('_show');
                $('._divjuridico').addClass('_hide');
                $('._divoicq').removeClass('_show');
                $('._divoicq').addClass('_hide');
                $('._oicqvalue').html('');
                var id = $(this).val();
                var option = $('option:selected', this).attr('data-subtext');
                $('#dep_remitente').val(option);
                $("#cbodeptoremit option:selected").each(function () {
                    //alert(id);
                    $('#divcboremitente').load('../consultas/cboUsuarios.jsp?valor=' + id);
                });
                //opciones para juridico / OIC / QUEJAS
                if (id === '1010') { //_divjuridico
                    $('._divjuridico').removeClass('_hide');
                    $('._divjuridico').addClass('_show');
                }
                //_divoicq //_oicqvalue
                if (id === '7000') { //_divjuridico
                    $('._divoicq').removeClass('_hide');
                    $('._divoicq').addClass('_show');
                    //$('._oicqvalue').html('7000');
                }
                if (id === '7030') { //_divjuridico
                    $('._divoicq').removeClass('_hide');
                    $('._divoicq').addClass('_show');
                    //$('._oicqvalue').html('7030');
                }


                // limpa          
                $("#iconsecutivo").val(''); //num de oficio
                $('#cboannio').selectpicker('val', '0'); //año                    
                $("#cbonomremit").val('-1'); // nom remitente
                $('.otroremitentename').hide();
                $("#txtasunto").val(''); //asunto
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
                    // alert("aquiiiiii sinnn ");
                    $('#divnumof').hide();
                    $('#divnumof_sin').show();
                    $('#depto_sn').show();
                    $('#depto_cn').hide();
                    //limpia
                    $('#cbodeptoremit').selectpicker('val', '0');
                    $('#divcboremitente').load('../consultas/cboUsuarios.jsp?valor=0');
                    $("#iconsecutivo").val(''); //num de oficio
                    $('#cboannio').selectpicker('val', '0'); //año                
                    $('.otroremitentename').hide();
                    $("#txtasunto").val(''); //asunto
                    $("#txtobservaciones").val(''); //observaciones
                    $("#dep_remitente_sn").val(''); //depto sin num de oficio
                    $("#nom_remitente_sn").val(''); //nom sin num de oficio
                    $('#dep_remitente').val('');

                    // SE ENVIO POR CORREO 
                    $("#chk-correo").click(function () {
                        if ($('#chk-correo').prop('checked')) {
                            $('#iotro_numof').val("${freferencia}");
                            $('#iotro_numof').attr('readonly', true);
                            $("#iotro_numof").attr("style", "background: rgba(2, 104, 124, .1) !important;");
                        } else {
                            $('#iotro_numof').val('');
                            $('#iotro_numof').attr('readonly', false);
                            $("#iotro_numof").removeAttr("style");
                        }
                    });

                } else {
                    $('#divnumof').show();
                    $('#depto_cn').show();
                    $('#divnumof_sin').hide();
                    $('#depto_sn').hide();
                    $("#iotro_numof").val('');
                    $('#chk-correo').prop('checked', false);
                    $('#iotro_numof').attr('disabled', false);
                    $("#iotro_numof").removeAttr("style");
                    //ESCONDE LOSELEMENTOS EN CASO DE QUE ESTE SELECCCIONADO JURIDICO, OIC, QUEJAS
                    $('._divjuridico').removeClass('_show');
                    $('._divjuridico').addClass('_hide');
                    $('._divoicq').removeClass('_show');
                    $('._divoicq').addClass('_hide');
                    $('._oicqvalue').html('');

                }
            });

            $("#chk-ausencia").click(function () {
                if ($('#chk-ausencia').prop('checked')) { // firma alguien por ausencia                 
                    $('#div_ausencia').show();
                } else {
                    $('#div_ausencia').hide();
                    $("#nom_ausencia").val('');

                }
            });

            //btnremoveall
            $('.btnremoveall').click(function () {
                $('._adddestcont').html('');

                cuentadest = 0;
            });

            //btnadddest
            $('.btnadddest').click(function () {
                cuentadest++;
                var content;
                $.get('_adddest.jsp?item=' + cuentadest, function (data) {
                    content = data;
                    $('._adddestcont').append(data);
                });
            });
            //CC
            $('#chk-cc').click(function () {
                //_adddestdiv
                if ($('#chk-cc').prop('checked')) { // es copia para la dirección médica otro serv
                    $('._adddestdiv').show();
                } else {
                    $('._adddestdiv').hide();
                    cuentadest = 0;
                    $('._adddestcont').html('');
                }
            });

//            $('#chk-cc').click(function () {
//                $('.otrodestinatarioname').hide();
//                // $('#cbodeptodirigido').selectpicker('refresh');
//                // console.log($(this).attr('id'))
//                if ($('#chk-cc').prop('checked')) { // es copia para la dirección médica otro serv
//                    // alert('ESTA MARCADO');
//                    $('#divdepto_destmedica').hide();
//                    $('#divdepto_destotro').show();
//                    $('#cbodepto_dest').selectpicker('val', '0');
//                    $('#divcbodestinatario').load('../consultas/cboUsuariosdest.jsp?valor=0');
//                    $('#cbonomdest').val('-1');
//                    // cbonomdest
//                } else {
//                    // alert('NOOOO  ESTA MARCADO'); //  para la direccion médica
//                    $('#divdepto_destmedica').show();
//                    $('#divdepto_destotro').hide();
//                    $('#divcbodestinatario').load('../consultas/cboUsuariosdest.jsp?valor=2000');
//                    $('#cbonomdest').val('-1');
//                }
//            });
            //Departamentop
            $("#cbodepto_dest").change(function () {
                var id = $(this).val();
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
                        //cuando el folio del oficio ya existe
                        conf = data.confirma;
                        conf_folio = data.conf_folio;
                        if (conf) {
                            alert("El folio," + conf_folio + ", ya existe para este departamento, se le agregará un consecutivo.");
                        }
                        let result = data.elemento.includes("|");
                        if (result) {
                            const words = data.elemento.split('|');
                            //  alert(words[1]);
                            var vindex = words[1] - 1;
                            var ell = $('._adddestcont').children('.card').eq(vindex).find('.clcbodepto');
                            ell.trigger('focus');
                            // $('html, body').animate({scrollTop: $('#' + ell).offset().top - 86}, 15);                          
                            $('html, body').animate({scrollTop: $('#cbodepto_dest_' + words[1]).offset().top - 86}, 15);
                            alert(data.mensaje);
                        } else {
                            elemento = data.elemento;
                            alert(data.mensaje);
                            //   alert(elemento);
                            $('#' + elemento).trigger('focus');
                            $('html, body').animate({scrollTop: $('#' + elemento).offset().top - 86}, 15);
                        }
                    } else {
                        // alert(data.mensaje);
                        id_oficio = data.id_oficio;
                        //modalfinish
                        $('.bodyfinish').html('El oficio se registro correctamente, FOLIO CONSECUTIVO: ' + id_oficio + '<br/>Desea adjuntar archivos?')
                        $('#modalfinish').modal('toggle');
                        $('#frmattach').attr('action', '<%=request.getContextPath()%>/u/uploadFiles?id_oficio=' + id_oficio);
                        //alert("El oficio se registro correctamente, FOLIO CONSECUTIVO: " + id_oficio);
                        //window.top.location.href = '/medica/oficios/list_oficios_rec.jsp?';
                        $('.btnguardar').attr("disabled", true);
                        $('.btnguardar').append('<img src="../images/loading.gif" width="11" height="11" alt="" />');
                    }
                },
                beforeSubmit: function () {
                    $('.btnguardar').attr("disabled", false);
                }
            });
            //doclose
            $(".doclose").click(function () {
                window.top.location.href = '/medica/oficios/list_oficios_rec.jsp?';
            });


            $('#ifileattach').on('change', function (e) {

                if (this.files.length > 0) {


                    $("#frmattach").submit();
                } else {
                    return false;
                }

            });

            $('form#frmattach').ajaxForm({
                dataType: 'json',
                success: function (data) {
                    if (data.done === 1) {
                        $('.adjerror').html('');

                    } else {

                        $('.adjerror').html(data.mensaje);

                    }
                },
                error: function (data) {
                    $('.alertg').show();
                    $('.alertg').html('');
                    $('.alertg').html(data.error);
                },
                beforeSubmit: function () {
                    $('.btnarchivos').attr("disabled", true);
                },
                uploadProgress: function (event, position, total, percentComplete) {
                    $('.progress').show();
                    var percentVal = percentComplete + '%';
                    //alert(percentVal)
                    /*if (percentComplete < 33) {
                     $('.bar').css('background-color', '#FF0000');
                     }
                     if (percentComplete > 33 && percentComplete < 66) {//#FFCC33
                     $('.bar').css('background-color', '#FFCC33');
                     }
                     if (percentComplete > 90) {
                     $('.bar').css('background-color', '#B4F5B4');
                     }*/
                    //#B4F5B4 background-color
                    //$('.progress').csss('style:');
                    //$(".progress-bar").attr("width",percentVal);
                    $('.progress-bar').css('width', percentVal);
                    //bar.width(percentVal)
                    //percent.html(percentVal);
                },
                complete: function (xhr) {
                    //$('.progress').hide();
                    $('.progress-bar').css('width', '0%');
                }
            });

            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });

            const myModalEl = document.getElementById('exampleModal')
            myModalEl.addEventListener('hidden.bs.modal', event => {
                if (vflagclose === 0) {
                    $('#cbocarpeta_arch').selectpicker('val', 0);
                    $("#cbocarpeta_arch").selectpicker("refresh");
                } else {
                    vflagclose = 0;
                }
            });

        </script>


    </body>
</html>

<%
    }
%> 
