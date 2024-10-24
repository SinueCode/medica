<%-- 
    Document   : table_recibidos
    Created on : 10 oct 2024, 14:01:39
    Author     : DIR. MEDICA
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="modalattach" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Adjuntar</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body bodyattach">
                <div class="row">
                    <div class="col-md">

                        <form id="frmattach" method="POST" class="" enctype="multipart/form-data"  action="<%=request.getContextPath()%>/u/uploadFiles?id_oficio=46">
                            <input type="file" class="form-control" style="height:auto;" id="ifileattach" name="archivos" multiple="">
                        </form>

                        <span class="alert-danger adjerror"></span>
                    </div>
                </div> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<style>
    .ui-tooltip{
        max-width: 800px !important;
        width: auto !important;
        overflow:auto !important;
    }

</style>

<%
    String sFiltro = " where DATE_FORMAT(O.fecha_recepcion,'%Y%m%d') between '" + request.getParameter("fi").toString().trim() + "' and  '" + request.getParameter("ff").toString().trim() + "' ";
    // System.out.println("llega@@@@@@@@@@@@@@@    " +sFiltro);
%> 
<!DOCTYPE html>
<!-- query oficios recibidos para la dirección médica-->
<sql:query var="qoficiosrec" dataSource="jdbc/MEDICA">
    select O.idof_recepcion as num_folio
    ,DATE_FORMAT(O.fecha_recepcion,'%Y-%m-%d %H:%i') 
    -- , O.sn 
    , IF(O.sn = 1, "S/N", " ") as sn            
    , CASE WHEN O.sn = 0 THEN CONCAT(O.id_dpto_remit,'/', O.num_of ,'/', O.annio)  ELSE'' END as num_oficio 
    , CASE WHEN O.sn = 0 THEN ''  ELSE O.num_referencia END as num_referencia
    -- , O.correo            
    , IF(O.correo = 1, "SE RECIBIÓ POR CORREO", " ") as Correo
    , O.id_dpto_remit
    , O.id_nom_remitente
    , O.dpto_remitente_txt
    , O.nom_remitente_txt
    , O.id_clasif
    , O.id_sub_clasif
    , IFNULL(C.cdescripcion, " ")
    -- , C.cdescripcion AS carpeta
    , asunto
    , O.observaciones
    , IF(O.cc = 1, "C.C.", " ") as CC
    , O.id_dpto_destinat
    , O.id_nom_destinat
    , O.id_depto_turnadoa
    , O.fecha_limiter
    , O.fecha_alta as fecha_captura
    , PD.cdescripcion as personal_recibe
    , O.cstatus
    from of_recepcion O LEFT JOIN of_ctl_archiv_carpeta C
    on  O.id_carpeta = C.id_carpeta    
    LEFT JOIN of_ctl_personal_dm PD 
    on  PD.id = O.id_personal_recibe
    <%=sFiltro%>
    --  and O.cc != 1
    order by num_folio desc
</sql:query>
<table id="tbl_ofrec_dm" class="table table-striped table-bordered nowrap" >
    <thead>
        <tr><th>Núm folio</th>
            <th>F. recepción</th>
            <th>S/N</th>
            <th>Núm Oficio</th>
            <th>Núm. Rerefencia</th>
            <th>Correo</th> 
            <th>Depto. remitente</th>                                    
            <th>Nom. remitente</th>                                          
            <th>Clasif.</th>
            <th>Sub. Clasif</th>
            <th>Carpeta</th>
            <th>Asunto</th>
            <th>Observaciones</th>
            <th>C.C.</th>
            <th>Depto. destinatario</th>
            <th>Nom. destinatario</th>
            <th>Turnado a (Depto.)</th>
            <th>F. limite respuesta</th>
            <th>cstatus</th>
            <th>Vencido</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="resultados" begin="0" items="${qoficiosrec.rowsByIndex}">
            <c:set var="num_folio" value="${resultados[0]}" />
            <c:set var="fecha_rec" value="${resultados[1]}" />
            <c:set var="sn" value="${resultados[2]}" />
            <c:set var="num_oficio" value="${resultados[3]}" />
            <c:set var="num_refer" value="${resultados[4]}" />
            <c:set var="correo" value="${resultados[5]}" /> 
            <c:set var="id_dpto_remit" value="${resultados[6]}" /> 
            <c:set var="id_nom_remitente" value="${resultados[7]}" />                                   
            <c:set var="dpto_remitente_txt" value="${resultados[8]}" />
            <c:set var="nom_remitente_txt" value="${resultados[9]}" />
            <c:set var="id_clasif" value="${resultados[10]}" />
            <c:set var="id_sub_clasif" value="${resultados[11]}" />
            <c:set var="carpeta" value="${resultados[12]}" />
            <c:set var="asunto" value="${resultados[13]}" />
            <c:set var="observaciones" value="${resultados[14]}" />                                    
            <c:set var="cc" value="${resultados[15]}" />
            <c:set var="id_dpto_destinat" value="${resultados[16]}" />
            <c:set var="id_nom_destinat" value="${resultados[17]}" />
            <c:set var="id_depto_turnadoa" value="${resultados[18]}" />                                    
            <c:set var="fecha_limiter" value="${resultados[19]}" />
            <c:set var="cstatus" value="${resultados[22]}" />
            <tr class="atendido_${resultados[0]}" data="${resultados[0]}" >
                <td> ${resultados[0]}</td>
                <td>${resultados[1]} </td>
                <td>${resultados[2]} </td>                                                                              
                <td><b> <%=global.cFunciones.getNomenclaturaOicioXFolio(pageContext.getAttribute("num_folio").toString(), pageContext.getAttribute("sn").toString())%> </b></td> 
                <td><b>${resultados[4]}</b></td> 
                <td>${resultados[5]} </td>   
                <%
                    if (pageContext.getAttribute("sn").equals("S/N")) {
                %>
                <td>${resultados[8]} </td>
                <td>${resultados[9]} </td>  
                <% } else {
                %>
                <td> <%=global.cFunciones.getNomServXclave(pageContext.getAttribute("id_dpto_remit").toString())%> </td>
                <td> <%=global.cFunciones.getNomPersonaXid(pageContext.getAttribute("id_nom_remitente").toString())%> </td>
                <%
                    }
                %>                                              
                <td>${resultados[10]} </td> 
                <td>${resultados[11]} </td>
                <td>${resultados[12]} </td>
                <td>${resultados[13]} </td> 
                <td>${resultados[14]} </td>
                <td>${resultados[15]} </td>  
                <%
                    if (pageContext.getAttribute("cc").equals("C.C.")) {
                %>
                <td>
                    <%=global.cFunciones.getNomServDestXFolio(pageContext.getAttribute("num_folio").toString())%>
                    <!--<svg data-toggle="tooltip"  title="<%=global.cFunciones.getNomServDestXFolio(pageContext.getAttribute("num_folio").toString())%>" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2"/>
                    </svg>-->
                </td>
                <td> 
                    <%=global.cFunciones.getNomPersDestXFolio(pageContext.getAttribute("num_folio").toString())%>
                    <!--<svg data-toggle="tooltip"  title="<%=global.cFunciones.getNomPersDestXFolio(pageContext.getAttribute("num_folio").toString())%>"  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                    <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                    </svg>-->
                </td>
                <% } else {
                %>
                <td><%=global.cFunciones.getNomServXclave(pageContext.getAttribute("id_dpto_destinat").toString())%>
                <td><%=global.cFunciones.getNomPersonaXid(pageContext.getAttribute("id_nom_destinat").toString())%>  </td>
                <%
                    }
                %> 
                <td><%=global.cFunciones.getNomServXclave(pageContext.getAttribute("id_depto_turnadoa").toString())%>  </td>
                <td>${resultados[19]} </td>
                <td>${resultados[22]}</td>
                <td><%=global.cFunciones.ifOfvencidoxid(pageContext.getAttribute("num_folio").toString())%>  </td>
                <td>
                    <div class="dropdown" id="sub-menu-medica">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                            Acciones
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <%
                                if (pageContext.getAttribute("cstatus").equals("P")) {
                            %>
                            <li><a class="dropdown-item" onclick="fnmedica.marca_atendido('${resultados[0]}')">Atendido</a></li> 
                                <%
                                    }
                                %>
                            <li><a class="dropdown-item doadj" rel="${num_folio}" onclick="">Adjuntar archivo</a></li>
                        </ul>

                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>


<script type="text/javascript">

    //doadj  //bodyattach
    var idoficio = 0;
    $(".doadj").click(function () {

        idoficio = $(this).attr('rel');
        $('#frmattach').attr('action', '<%=request.getContextPath()%>/u/uploadFiles?id_oficio=' + idoficio);
        $('#modalattach').modal('toggle');


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
        $('[data-toggle="tooltip"]').tooltip({
            placement: 'right'

        });
    });
    new DataTable('#tbl_ofrec_dm', {
        language: {
            url: '<%=request.getContextPath()%>/js/datatable/es-MX.json'
        },
        autowidth: false,
        scrollX: true,
        // fixedColumns: true,
        scrollCollapse: true,
        scrollY: 500,
        order: [[0, 'desc']]
        , createdRow: function (row, data, index) {
            if (data[19] === 'Vencido') { //vencido 
                $(row).removeClass('table-primary');
                $(row).addClass('table-danger');

            }

            if (data[18] === 'A') { //atendido o pendiente
                $(row).removeClass('table-danger');
                $(row).addClass('table-primary');


            }
        },
        columnDefs: [
            //{targets: [18, 19], visible: false},
            {targets: '_all', visible: true}
        ]
                // ,columnDefs: [{ visible: false, targets: 18 }]

    });
    fntables.init();



</script>