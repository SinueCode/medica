<%-- 
    Document   : list_oficios_tot
    Created on : 8 oct 2024, 08:13:22
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
    <body>        
        <jsp:include page="../includes/menu.jsp" />
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
            , C.cdescripcion AS carpeta
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
            from of_recepcion O , of_ctl_personal_dm PD , of_ctl_archiv_carpeta C
            WHERE PD.id 
            AND PD.id = O.id_personal_recibe 
            AND C.id_carpeta = O.id_carpeta 
            and O.cc != 1
            order by num_folio desc
        </sql:query>
        <!-- query oficios recibidos con copia para la dirección médica-->
        <sql:query var="qoficiosrec_cc" dataSource="jdbc/MEDICA">
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
            , C.cdescripcion AS carpeta
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
            from of_recepcion O , of_ctl_personal_dm PD , of_ctl_archiv_carpeta C
            WHERE PD.id 
            AND PD.id = O.id_personal_recibe 
            AND C.id_carpeta = O.id_carpeta 
            and O.cc = 1
            order by num_folio desc
        </sql:query>

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

                    <div class="row justify-content-center text-center">
                        <div class="col-12 text-center mb-5">
                            <small class="small-text">RECEPCIÓN DE OFICIOS </small>                  
                        </div>
                    </div>    
                    <div class="col-12 text-center mb-5"> 
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">PARA DIRECCIÓN MÉDICA</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">C.C. PARA DIRECCIÓN MÉDICA</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <!-- OFICIOS RECIBIDOS PARA LA DIRECCIÓN MÉDICA-->
                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                <table id="tbl_ofrec_dm" class="table table-striped table-bordered nowrap" >
                                    <thead>
                                        <tr>
                                            <th>Núm folio</th>
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
                                            <th>VENCIDO</th>
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
                                                <td><b>${resultados[3]}</b></td> 
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
                                                <td><%=global.cFunciones.getNomServXclave(pageContext.getAttribute("id_dpto_destinat").toString())%>  </td>
                                                <td><%=global.cFunciones.getNomPersonaXid(pageContext.getAttribute("id_nom_destinat").toString())%>  </td>
                                                <td><%=global.cFunciones.getNomServXclave(pageContext.getAttribute("id_depto_turnadoa").toString())%>  </td>
                                                <td>${resultados[19]} </td>
                                                <td>${resultados[22]}</td>
                                                <td><%=global.cFunciones.ifOfvencidoxid(pageContext.getAttribute("num_folio").toString())%>  </td>
                                                <td>
                                                    <div class="dropdown">
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
                                                            <li><a class="dropdown-item" onclick="">Adjuntar archivo</a></li>
                                                        </ul>

                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table> 
                            </div>


                            <!-- OFICIOS RECIBIDOS QUE SON COPIA PARA LA DIRECCIÓN MÉDICA tbl_ofrec_dm_cc-->
                            <div class="tab-pane " id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                <table id="tbl_ofrec_dm_cc" class="table table-striped table-bordered nowrap" >
                                    <thead>
                                        <tr>
                                            <th>Núm folio</th>
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
                                            <th>VENCIDO</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="resultados" begin="0" items="${qoficiosrec_cc.rowsByIndex}">
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
                                                <td><b>${resultados[3]}</b></td> 
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
                                                <td><%=global.cFunciones.getNomServXclave(pageContext.getAttribute("id_dpto_destinat").toString())%>  </td>
                                                <td><%=global.cFunciones.getNomPersonaXid(pageContext.getAttribute("id_nom_destinat").toString())%>  </td>
                                                <td><%=global.cFunciones.getNomServXclave(pageContext.getAttribute("id_depto_turnadoa").toString())%>  </td>
                                                <td>${resultados[19]} </td>
                                                <td>${resultados[22]}</td>
                                                <td><%=global.cFunciones.ifOfvencidoxid(pageContext.getAttribute("num_folio").toString())%>  </td>
                                                <td>
                                                    <div class="dropdown">
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
                                                            <li><a class="dropdown-item" onclick="">Adjuntar archivo</a></li>
                                                        </ul>

                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table> 
                            </div>                            
                        </div>
                    </div>
                </div>               
            </div>
        </div>
        <script type="text/javascript">

            new DataTable('#tbl_ofrec_dm', {
                language: {
                    url: '<%=request.getContextPath()%>/js/datatable/es-MX.json'
                },
                autowidth: false,
                scrollX: true,
                // fixedColumns: true,
                scrollCollapse: true,
                scrollY: 800,
                order: [[0, 'desc']]
                , createdRow: function (row, data, index) {
                    if (data[18] === 'A') {
                        $(row).addClass('table-primary');
                    }
                    if (data[19] === '1') {
                        $(row).removeClass('table-primary');
                        $(row).addClass('table-danger');
                    }
                },
                columnDefs: [
                    {targets: [18, 19], visible: false},
                    {targets: '_all', visible: true}
                ]
                        // ,columnDefs: [{ visible: false, targets: 18 }]

            });




            new DataTable('#tbl_ofrec_dm_cc', {
                language: {
                    url: '<%=request.getContextPath()%>/js/datatable/es-MX.json'
                },
                autowidth: false,
                scrollX: true,
//                fixedColumns: true,
//                fixedColumns: {
//                    leftColumns: 2
//                },
                scrollCollapse: true,
                scrollY: 800,
                order: [[0, 'desc']]
                , createdRow: function (row, data, index) {
                    if (data[18] === 'A') {
                        $(row).addClass('table-primary');
                    }
                    if (data[19] === '1') {
                        $(row).removeClass('table-primary');
                        $(row).addClass('table-danger');
                    }
                },
                columnDefs: [
                    {targets: [18, 19], visible: false},
                    {targets: '_all', visible: true}
                ]

                        //,columnDefs: [{ visible: false, targets: 18 }]

            });
        </script>
    </body>
</html>
<%
    }
%> 
