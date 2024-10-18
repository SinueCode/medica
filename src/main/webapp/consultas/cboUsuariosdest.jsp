<%-- 
    Document   : cboUsuariosdest
    Created on : 9 sept 2024, 11:53:21
    Author     : DIR. MEDICA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
    String sitem = "";
    String sname = "";
    if (request.getParameter("item") != null) {
        sitem = "_" + request.getParameter("valor").toString().trim();
        sname = "cbonomdestcc_" + request.getParameter("valor");

    } else {
        sname = "cbonomdest";

    }
    if (request.getParameter("valor").equals("0")) {


%>
<sql:query var="consulta" dataSource="jdbc/MEDICA">
    SELECT o.id,  upper(CONCAT(o.nombre,' ',o.apellido1, ' ',o.apellido2)) as name  FROM of_usr_oficios o 
    WHERE o.ccosto= '<%=request.getParameter("valor")%>'
</sql:query>
<% } else {
%>
<sql:query var="consulta" dataSource="jdbc/MEDICA">
    SELECT o.id,  upper(CONCAT(o.nombre,' ',o.apellido1, ' ',o.apellido2)) as name  FROM of_usr_oficios o 
    WHERE o.ccosto= '<%=request.getParameter("valor")%>'  UNION SELECT id, nombre as name FROM of_usr_oficios WHERE ccosto=9999
</sql:query>
<%
    }
%>
<select  style="" id="<%=sname%>" name="<%=sname%>" class="form-select input-b clccboname" data-live-search="true">     
    <option value="-1">SELECCIONE...</option>
    <c:forEach var="nomdest" begin="0" items="${consulta.rowsByIndex}">
        <option value="${nomdest[0]}">${nomdest[1]}</option>
    </c:forEach>
</select>

<script type="text/javascript">
    //otro destinatario
    //$('#cbonomdest<%=sitem%>').selectpicker('refresh');
    $(document).on('change', '#<%=sname%>', function () {
        $("#iotrondest_<%=request.getParameter("valor")%>").val('');
        $("#iotroap1dest_<%=request.getParameter("item")%>").val('');
        $("#iotroap2dest_<%=request.getParameter("item")%>").val('');
        if ($('#<%=sname%>').val() === '3') { // OTRO
            $('.otrodestinatarioname_<%=request.getParameter("item")%>').show();
            $('.otrodestinatarioname_<%=request.getParameter("item")%>').load('_adddestotro.jsp?valor=<%=request.getParameter("valor")%>&item=<%=request.getParameter("item")%>');


        } else {
            $('.otrodestinatarioname_<%=request.getParameter("item")%>').html('');
            $('.otrodestinatarioname_<%=request.getParameter("item")%>').hide();
        }
    });


</script>

