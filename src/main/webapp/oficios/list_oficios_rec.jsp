<%-- 
    Document   : oficios_rec
    Created on : 3 oct 2024, 10:40:11
    Author     : DIR. MEDICA
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String sFiltro = " ";
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
        <sql:query var="conactualdate" dataSource="jdbc/MEDICA">
            select 
            DATE_FORMAT(now(), '%d/%m/%Y') as fechaactual
            , DATE_FORMAT(now(), '%Y%m%d') as f112
            , DATE_FORMAT( DATE_ADD(now(), interval -1 month), '%d/%m/%Y') as fmenos1m
            , DATE_FORMAT( DATE_ADD(now(), interval +1 month), '%d/%m/%Y') as fmaslm          
        </sql:query>
        <c:set var="fechaactual" value="${conactualdate.rows[0].fechaactual}"/>     
        <c:set var="fmenos1m" value="${conactualdate.rows[0].fmenos1m}"/>     
        <c:set var="fmaslm" value="${conactualdate.rows[0].fmaslm}"/> 
        <c:set var="fecha112" value="${conactualdate.rows[0].f112}"/>      



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
            <form id="frm_FiltroOf" method="POST" class="formulario"  action="../of/filtroOficios"> 
                <div class="row justify-content-center text-center">
                    <div class="row justify-content-center text-center">
                        <div class="col-12 text-center mb-5">
                            <small class="small-text">RECEPCIÓN DE OFICIOS</small>  

                        </div>
                    </div> 
                    <div class="card">
                        <div class="card-body ">                        
                            <div class="form-group row">
                                <div class="col-md-3">
                                    <label for="ifecharecini">Fecha inicio:</label>                                       
                                    <input type="text" class="form-control input-b" id="ifecharecini" name="ifecharecini" placeholder="F. recepción" >
                                </div>
                                <div class="col-md-3">
                                    <label for="ifecharecfin">Fecha fin:</label>
                                    <input type="text" class="form-control input-b" id="ifecharecfin" name="ifecharecfin" placeholder="F. de recepción" >
                                </div> 
                                <div class="col-md-2">
                                    <br>
                                    <input type="submit" class="btn btn-primary btnguardar" value="Buscar">

                                </div>
                                <div class="col-md-4">
                                    <!--                                    <br>
                                                                        <input type="submit" class="btn btn-primary btnguardar" value="Buscar">-->
                                </div>   
                                <br>
                            </div>                          
                        </div>
                    </div>
                </div>
            </form>
            <div class="row" id="tablita"> </div>               
        </div>
        <script type="text/javascript">

           
            sf1 = '${fecha112}';
            sf2 = '${fecha112}';

            $(document).ready(function () {
                $('#tablita').load('table_recibidos.jsp?fi=' + sf1 + '&ff=' + sf2);
            });

            ////filtros          
            $('#ifecharecini').datepicker({
                language: 'es',
                //  format: 'd/m/Y',
                startDate: "-1y",
                endDate: '${fechaactual}', //fecha actual
                autoclose: true
            });

            $('#ifecharecfin').datepicker({
                language: 'es',
                // format: 'd/m/Y',
                startDate: "-1y",
                endDate: '${fechaactual}', //fecha actual
                autoclose: true
            });


            $('#ifecharecini').val('${fechaactual}');
            $('#ifecharecfin').val('${fechaactual}');

            $('#frm_FiltroOf').ajaxForm({
                success: function (data) {
                    if (data.done === 0) {
                        alert(data.mensaje);
                    } else {
                        // alert("se carga la tabla con los nuevos parametros");
                        $('#tablita').load('table_recibidos.jsp?fi=' + data.fi + '&ff=' + data.ff);
                    }
                },
                beforeSubmit: function () {
                    $('.btnguardar').attr("disabled", false);
                }
            });



        </script>
    </body>
</html>
<%
    }
%> 

