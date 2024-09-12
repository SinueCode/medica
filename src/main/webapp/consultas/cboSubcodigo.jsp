<%-- 
    Document   : cboSubcodigo
    Created on : 11 sept 2024, 12:19:14
    Author     : DIR. MEDICA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="qsubcodigoar" dataSource="jdbc/MEDICA">
    select sub_codigo, cdescripcion from of_ctl_archiv_det
    where codigo = '<%=request.getParameter("id_cod")%>'
    order by id
</sql:query>

 <label for="icbosubcodigo_arch">Sub-Clasificación:</label> 
<select id="cbosubcodigo_arch" name="cbosubcodigo_arch" class="selectpicker"  data-show-subtext="true" data-live-search="true" data-width="600px"  >                            
    <option value="0" selected >Sub-Clasif.</option>
    <c:forEach var="subcodigoar" begin="0" items="${qsubcodigoar.rowsByIndex}">
        <option data-subtext="${subcodigoar[1]}" value="${subcodigoar[0]}">${subcodigoar[0]}</option>
    </c:forEach>                   
</select>





