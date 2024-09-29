<%-- 
    Document   : cboSubcodigo
    Created on : 11 sept 2024, 12:19:14
    Author     : DIR. MEDICA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<script type="text/javascript">
    <%
        if (request.getParameter("id_cod").equals("0")) {
    %>
    $('#cbosubcodigo_arch').attr('disabled', true);
    <%
        }
    %>
</script>
<sql:query var="qsubcodigoar" dataSource="jdbc/MEDICA">
    select sub_codigo, cdescripcion from of_ctl_archiv_det
    where codigo = '<%=request.getParameter("id_cod")%>'
    order by id
</sql:query>
<label for="icbosubcodigo_arch">Sub-Clasificación:</label> 
<select id="cbosubcodigo_arch" name="cbosubcodigo_arch" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true" >                            
    <option value="0" selected >Seleccione...</option>
    <c:forEach var="subcodigoar" begin="0" items="${qsubcodigoar.rowsByIndex}">
        <option data-subtext="${subcodigoar[1]}" value="${subcodigoar[0]}">${subcodigoar[0]}</option>
    </c:forEach>                   
</select>
<script type="text/javascript">
    $("#cbosubcodigo_arch").change(function () {
        var id_subcod = $(this).val();
        var id_cod = '<%=request.getParameter("id_cod")%>';
        var option_subcod = $('option:selected', this).attr('data-subtext');
        if (id_subcod === '0') {
            //$('#divcbocarpeta').html('bbbbbbbbbbbbbb');       
            $.post("../consultas/cboCarpeta.jsp", {id_subcod: id_subcod}, function (data) { // carga cbo carpeta y deshabilita          
                $("#divcbocarpeta").html(data);
                $("#cbocarpeta_arch").unbind();
                $("#cbocarpeta_arch").selectpicker("refresh");
            });
        } else {
            $.post("../consultas/cboCarpeta.jsp", {id_subcod: id_subcod}, function (data) {
                $("#divcbocarpeta").html(data);
                $("#cbocarpeta_arch").unbind();
                $("#cbocarpeta_arch").selectpicker("refresh");
                fnmedica.initcbocarpeta(id_cod, id_subcod);
                
            });
        }
    });
</script>





