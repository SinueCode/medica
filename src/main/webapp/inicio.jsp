<%-- 
    Document   : inicio
    Created on : 13 ago 2024, 14:15:11
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> DIR. MÉDICA | SEHIM</title>
        <link rel="shortcut icon" href="images/himfg-logo_ewzx59.webp">  
        <%=global.cFunciones.setHeadHtml(request)%>     
        <style type="text/css">

        </style>
    </head>

    <body>
        <jsp:include page="includes/menu.jsp" />
        <!-- Page Content -->
        <div class="container">
            <!-- ABOUT -->
            <section class="about full-screen d-lg-flex justify-content-center align-items-center" id="about">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-7 col-md-12 col-12 d-flex align-items-center">
                            <div class="about-text">
                                <small class="small-text">HOSPITAL INFANTIL DE MÉXICO "FEDERICO GÓMEZ"</small>   <br>
                                <small class="small-text" style=" font-size: 15px;">INSTITUTO NACIONAL DE SALUD</small>   <br>                             

                                <h1 class="animated animated-text">
                                    <span class="mr-2">DIRECCIÓN MÉDICA</span>
                                    <div class="animated-info">
                                        <span class="animated-item">Subcomité de mortalidad</span>
                                        <span class="animated-item">Censo hospitalario</span>
                                        <span class="animated-item">Entrega de guardia</span>
                                    </div>
                                </h1>
                                <br>

                                <p>
                                    <b> ¡Bienvenido <%=session.getAttribute("username")%>!</b>

                                    a nuestro espacio dedicado al apoyo de las actividades de la Dirección Médica. En este sitio, encontrarás, herramientas diseñadas para facilitar y optimizar procesos  ????? médicos.

                                </p>


                            </div>
                        </div>

                        <div class="col-lg-5 col-md-12 col-12">
                            <div class="about-image svg">
                                <img src="images/himfg-logo_ewzx59.webp" class="img-fluid" alt="svg image">
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>



        <script type="text/javascript">
//            $('#frmlogin').ajaxForm({
//                success: function (data) {
//                    if (data.done == 0) {
//                        // alert(data.done);
//                        // alert(data.mensaje);
//                        $('#error').html(data.mensaje);
//                        //  $('#btnIN').removeAttr("disabled");
//                        $('.logb').removeAttr("disabled");
//                        $('.logb img').remove();
//                    } else {
//                        //alert(data.done);
//                        //  alert(data.mensaje);
//                        //  alert("lo encontro");
//                        window.top.location.href = 'inicio.jsp';
//                        //window.top.location.href = 'calidad/econsultaext.php';
//                    }
//                },
//                beforeSubmit: function () {
//                    $('.logb').attr("disabled", "disabled");
//                    $('.logb').append('<img src="images/loading.gif" width="11" height="11" alt="" />');
//                }
//
//            });
        </script>
    </body>
</html>
