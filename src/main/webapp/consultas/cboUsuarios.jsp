<%-- 
    Document   : cboUsuarios
    Created on : 4 sept 2024, 14:26:01
    Author     : DIR. MEDICA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    if (request.getParameter("valor").equals("0")) {
%>
<script type="text/javascript">
    $('#cbonomremit').addClass('disabled');
</script> 
<sql:query var="consulta" dataSource="jdbc/MEDICA">
    SELECT o.id,  upper(CONCAT(o.nombre,' ',o.apellido1, ' ',o.apellido2)) as name  FROM of_usr_oficios o 
    WHERE o.ccosto= '<%=request.getParameter("valor")%>' and o.cstatus = 1
</sql:query>
<% }else {
%>
<script type="text/javascript">
    $('#cbonomremit').removeClass('disabled');
</script> 
<sql:query var="consulta" dataSource="jdbc/MEDICA">
    SELECT o.id,  upper(CONCAT(o.nombre,' ',o.apellido1, ' ',o.apellido2)) as name  FROM of_usr_oficios o 
    WHERE o.ccosto= '<%=request.getParameter("valor")%>' and o.cstatus = 1 UNION SELECT id, nombre as name FROM of_usr_oficios WHERE ccosto=9999
</sql:query>
<%
    }
%>
<select id="cbonomremit" name="cbonomremit" class="form-select input-b" data-live-search="true">     
    <option value="-1">Seleccione...</option>
    <c:forEach var="usuario" begin="0" items="${consulta.rowsByIndex}">
        <option value="${usuario[0]}">${usuario[1]}</option>        
    </c:forEach>
</select>