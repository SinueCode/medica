<%-- 
    Document   : cboCarpeta
    Created on : 20 sept 2024, 09:55:42
    Author     : DIR. MEDICA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>



<script type="text/javascript">
    
    alert('<%=request.getParameter("id_subcod")%>');
  //  alert('<%=request.getParameter("id_codigo")%>');
</script>
<sql:query var="qcarpetaar" dataSource="jdbc/MEDICA">
    SELECT id_carpeta,cdescripcion  
    FROM of_ctl_archiv_carpeta 
    where id_sub_codigo = '<%=request.getParameter("id_subcod")%>' 
    order by id_carpeta  
</sql:query>
<label for="icbosubcodigo_arch">Carpeta:</label> 
<select id="cbocarpeta_arch" name="cbocarpeta_arch" class="selectpicker form-control" data-live-search="false" >                            
    <option value="0" selected >Carpeta....</option>
    <option value="999" >otra....</option>
    <c:forEach var="carpetaar" begin="0" items="${qcarpetaar.rowsByIndex}">
        <option value="${carpetaar[0]}">${carpetaar[1]}</option>
        
    </c:forEach> 
</select>