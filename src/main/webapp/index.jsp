<%-- 
    Document   : index.jsp
    Created on : 13 ago 2024, 9:00:42
    Author     : Diana
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> DIR. MÉDICA</title>
        <link rel="shortcut icon" href="images/himfg-logo_ewzx59.webp">  
        <%=global.cFunciones.setHeadHtml(request)%>
        <link href="css/sindex.css" rel="stylesheet">
    </head>

    <body>
        <!-- Page Content -->
        <div class="container">
            <div class="row">              
            </div>
            <br> <br> <br> <br> <br>
            <form id="frmlogin" method="POST" action="/medica/dologin"  class="validate-form">
                <div class="row">
                    <div class="col-md-offset-4 col-md-4 text-center">
                        <h1 class='text-blue' style="">SISTEMA DE CONTROL</h1>
                        <br>
                        <h1 class='text-blue' style="">DIRECCIÓN MÉDICA</h1>

                        <div class="form-login">
                            <br>
                            <h4>Bienvenido</h4>
                            <br>
                            <input type="text" id="username" name="username" class="form-control input-sm chat-input" placeholder="Usuario"/>
                            </br></br>

                            <input type="password" class="form-control"  id="pass" name="pass" placeholder="Contraseña">
                            </br></br>
                            <div class="wrapper">
                                <input type="submit" id="btnIN" name="btnIN" value="Ingresar" class="btn btn-primary btn-block py-3 logb">
                            </div>
                        </div>
                    </div>
                </div>
                <br/><br/><div id="error" style="color: red;font-weight: bold;text-align: center;" ></div>
            </form> 
            </br></br></br>
            <!--footer-->
            <div class="footer text-white text-center"></div>
        </div>
        <script type="text/javascript">
            $('#frmlogin').ajaxForm({
                success: function (data) {
                    if (data.done == 0) {
                        // alert(data.done);
                        // alert(data.mensaje);
                        $('#error').html(data.mensaje);
                        //  $('#btnIN').removeAttr("disabled");
                        $('.logb').removeAttr("disabled");
                        $('.logb img').remove();
                    } else {
                        //alert(data.done);
                        //  alert(data.mensaje);
                        //  alert("lo encontro");
                        window.top.location.href = 'inicio.jsp';
                        //window.top.location.href = 'calidad/econsultaext.php';
                    }
                },
                beforeSubmit: function () {
                    $('.logb').attr("disabled", "disabled");
                    $('.logb').append('<img src="images/loading.gif" width="11" height="11" alt="" />');
                }

            });
        </script>
    </body>
</html>
