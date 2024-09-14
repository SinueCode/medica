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
    if (request.getParameter("valor").equals("0")) {
%>
<sql:query var="consulta" dataSource="jdbc/MEDICA">
    SELECT o.id, CONCAT(o.nombre,' ',o.apellido1, ' ',o.apellido2) as name  FROM of_usr_oficios o 
    WHERE o.ccosto= '<%=request.getParameter("valor")%>'
</sql:query>
<% } else {
%>
<sql:query var="consulta" dataSource="jdbc/MEDICA">
    SELECT o.id, CONCAT(o.nombre,' ',o.apellido1, ' ',o.apellido2) as name  FROM of_usr_oficios o 
    WHERE o.ccosto= '<%=request.getParameter("valor")%>'  UNION SELECT id, nombre as name FROM of_usr_oficios WHERE ccosto=9999

</sql:query>
<%
    }
%>
<select id="cbonomdest" name="cbonomdest" class="form-select input-b" data-live-search="true">     
    <option value="-1">SELECCIONE...</option>
    <c:forEach var="camas" begin="0" items="${consulta.rowsByIndex}">
        <option value="${camas[0]}">${camas[1]}</option>
    </c:forEach>
</select>
