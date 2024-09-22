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
<select id="cbosubcodigo_arch" name="cbosubcodigo_arch" class="selectpicker form-control"  data-show-subtext="true" data-live-search="true" >                            
    <option value="0" selected >Sub-Clasif.</option>
    <c:forEach var="subcodigoar" begin="0" items="${qsubcodigoar.rowsByIndex}">
        <option data-subtext="${subcodigoar[1]}" value="${subcodigoar[0]}">${subcodigoar[0]}</option>
    </c:forEach>                   
</select>


<script type="text/javascript">
    $("#cbosubcodigo_arch").change(function () {
        //$('.divcbocarpeta').html();
        var id_subcod = $(this).val();
        var option_subcod = $('option:selected', this).attr('data-subtext');

        //  alert(option_subcod);

        if (id_subcod === '0') {
            $('#divcbocarpeta').html('');
        } else {

            $.post("../consultas/cboCarpeta.jsp", {id_subcod: id_subcod}, function (data) {//sinue                        
                $("#divcbocarpeta").html(data);
                $("#cbocarpeta_arch").unbind();
                $("#cbocarpeta_arch").selectpicker("refresh");

                //
                $("#cbocarpeta_arch").change(function () {
                    //  $(document).on('change', '#cbocarpeta_arch', function () {
                    if ($('#cbocarpeta_arch').val() === '999') { // OTRO
                        //  alert("sdfsdfsdf");
                        var idhosp = $(this).attr('data');
                        $('.titlea').html('Agregar folder');
                        $('.modaledit_cont').load('wnewfolder.jsp?valor=' + idhosp);
                        $('#exampleModal').modal('show');
                        // $('.otroremitentename').show();
                    } else {
                        ///$('.otroremitentename').hide();
                    }
                });


            });

        }

    });
</script>





