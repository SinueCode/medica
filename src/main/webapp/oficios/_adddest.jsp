<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="card card_<%=request.getParameter("item")%>" style="padding: 15px;padding-top: 20px;margin-bottom: 12px;">
    <div class="" style="text-align: right;">
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-dash-fill pointerc removedest_<%=request.getParameter("item")%>" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M11 7.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5"/>
        <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
        </svg>
    </div>



    <div class="form-group row">
        <div class="col-md-6">  

            <label for="icbonomrec">Departamento:</label> <!-- puede ser a la dirección médica o a otro departamento depende de C.C-->

            <select id="cbodepto_dest_<%=request.getParameter("item")%>" name="cbodeptod" class="selectpicker form-control clcbodepto"  data-show-subtext="true" data-live-search="true">   
                <option value="0" selected >Grupos</option>
                <sql:query var="qgrupos_otro" dataSource="jdbc/MEDICA">
                    SELECT id_grupo , cdescripcion 
                    from of_ctl_grupos where cstatus =1
                </sql:query>
                <c:forEach var="grupos_otro" begin="0" items="${qgrupos_otro.rowsByIndex}">
                    <option data-subtext="${grupos_otro[1]}" value="${grupos_otro[0]}">${grupos_otro[0]}</option>
                </c:forEach>   
                <option value="0" selected >Dpto.</option>
                <sql:query var="qareas_otro" dataSource="jdbc/MEDICA">
                    select clave, upper(cdescripcion) cdescripcion from ctl_departamentos 
                    where clave != 2000
                    order by clave asc
                </sql:query>
                <c:forEach var="areas_otro" begin="0" items="${qareas_otro.rowsByIndex}">
                    <option data-subtext="${areas_otro[1]}" value="${areas_otro[0]}">${areas_otro[0]}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-6">
            <label for="icbonomrec" id="divlabelcbodestinatario_<%=request.getParameter("item")%>">Nombre(Dirigido a):</label>
            <div id="divcbodestinatario_<%=request.getParameter("item")%>">
                <select style="width: 350px;" name="cbonomrecdef_<%=request.getParameter("item")%>" id="cbonomrecdef_<%=request.getParameter("item")%>"  class="selectpicker form-control" data-live-search="false" disabled>
                    <option value="0">Seleccione...</option>                           
                </select>
            </div>
        </div>
        <div id="divotrodestinatario_<%=request.getParameter("item")%>" class="otrodestinatarioname_<%=request.getParameter("item")%>" style="display: none">  

        </div>

        <script type="text/javascript">
            $('#cbodepto_dest_<%=request.getParameter("item")%>').selectpicker('refresh');
            $('#cbonomrecdef_<%=request.getParameter("item")%>').selectpicker('refresh');

            //$('#divcbodestinatario_<%=request.getParameter("item")%>').load('../consultas/cboUsuariosdest.jsp?valor=2000&item=<%=request.getParameter("item")%>');

            $("#cbodepto_dest_<%=request.getParameter("item")%>").change(function () {
                var id = $(this).val();
                //alert("diana" + id.substring(0, 1));
                if (id.substring(0, 1) === 'G') {
                    $('#divlabelcbodestinatario_<%=request.getParameter("item")%>').hide();
                    $('#divcbodestinatario_<%=request.getParameter("item")%>').hide();

                } else {
                    $('#divlabelcbodestinatario_<%=request.getParameter("item")%>').show();
                    $('#divcbodestinatario_<%=request.getParameter("item")%>').show();

                    $('#cbodepto_dest_<%=request.getParameter("item")%>').selectpicker('refresh');
                    $('#divcbodestinatario_<%=request.getParameter("item")%>').load('../consultas/cboUsuariosdest.jsp?valor=' + id + '&item=<%=request.getParameter("item")%>');
                    $("#iotrondest_<%=request.getParameter("item")%>").val('');
                    $("#iotroap1dest_<%=request.getParameter("item")%>").val('');
                    $("#iotroap2dest_<%=request.getParameter("item")%>").val('');
                    $('.otrodestinatarioname_<%=request.getParameter("item")%>').hide();
                }
            });

            $(".removedest_<%=request.getParameter("item")%>").click(function () {
                $(".card_<%=request.getParameter("item")%>").remove();
            });


        </script>



    </div>
</div>