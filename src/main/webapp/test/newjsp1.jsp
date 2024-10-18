<%-- 
    Document   : newjsp1
    Created on : 15 oct 2024, 20:18:49
    Author     : KiRoS
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:h="http://xmlns.jcp.org/jsf/html"
    xmlns:f="http://xmlns.jcp.org/jsf/core"
    xmlns:p="http://primefaces.org/ui">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> DIR. MÉDICA </title>
        <link rel="shortcut icon" href="../images/himfg-logo_ewzx59.webp">  
        <%=global.cFunciones.setHeadHtml(request)%> 
    </head>
    <body>  
        <jsp:include page="../includes/menu.jsp" />


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

            --  and O.cc != 1
            order by num_folio desc
        </sql:query>
        <c:forEach var="resultados" begin="0" items="${qoficiosrec.rowsByIndex}">


        </c:forEach>
        <div class="card">
            <p:dataTable id="xd" var="qoficiosrec" value="${qoficiosrec.rowsByIndex}" 
                         selection="" selectionMode="single">
                <f:facet name="header">
                    RightClick to View Options ${qoficiosrec.rows[0]} ${qoficiosrec.rows[0].cdescripcion} ${qoficiosrec.rows[0].idof_recepcion}
                </f:facet>
                <p:column headerText="Code">
                    <h:outputText value="${qoficiosrec.rows[0].idof_recepcion}" />
                </p:column>


            </p:dataTable>

        </div>


    </body>
</html>
