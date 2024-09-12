<%-- 
    Document   : menu
    Created on : 14 ago 2024, 9:22:17
    Author     : Diana
--%>

<!--<div class="modal fade " id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title titlea" id="exampleModalLabel">Acciones</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modaledit_cont">
            </div>
        </div>


    </div>
</div>

<div class="modal fade " id="editModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modaledit_cont2">
            </div>
        </div>


    </div>
</div>
<div class="modal fade " id="editModalpeque" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title titlea" id="exampleModalLabel">Acciones</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modaledit_cont">
            </div>
        </div>


    </div>
</div>

<div class="modal fade" id="modalmensaje" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalmensajeLabel">Mensaje</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modalbody">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modalmensaje2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalmensajeLabel">Mensaje 2</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modalbody2">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>-->
<div id="" class="hmenu-container-l">
    <div id="hmenu-canvas-background" class="hmenu-dark-l">
        <div class="nav-sprite hmenu-close-icon"></div>
    </div>
    <div class="notif-main-l hmenu-translateX-left">
        <div class="notif-body">
            <span>            
                <div class="hmenu-user">                    
                    <button type="button" class="btn  closemenul" style="float: right;padding-right: 5px;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                        </svg>
                    </button>


                    <div class="hmenu-user-cont" style="font-weight: 700;font-size: 14px;text-transform: capitalize;">
                        ¡Hola!,<%=session.getAttribute("username")%>
                    </div>
                </div>
            </span>
            <div class="notif-content-l" style="">
                <div class="notif-list-l menuleft hmenu-translateX-center" style="">
                    <ul class="ulmenu">
                        <!--SUBCOMITE-->
                        <%
                            if (session.getAttribute("user_mortalidad").toString().equals("1")) {
                        %>
                        <li>
                            <div class="subcat" style="font-size: 16px;">
                                SUBCOMITÉ DE MORTALIDAD HOSPITALARIA
                            </div>
                        </li>
                        <li>
                            <a href="/medica/mortalidad/nrmortalidad.jsp">                                
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                    <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
                                </svg>
                                <b>&nbsp; Nuevo registro</b>
                            </a>
                        </li>
                        <li>
                            <a href="/medica/mortalidad/nrmortalidad.jsp">                                
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-collection" viewBox="0 0 16 16">
                                    <path d="M2.5 3.5a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1zm2-2a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1zM0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6zm1.5.5A.5.5 0 0 1 1 13V6a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5z"/>
                                </svg>
                                <b>&nbsp; Reportes</b>
                            </a>
                        </li>
                        <li>
                            <a href="/medica/mortalidad/nrmortalidad.jsp">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart-line-fill" viewBox="0 0 16 16">
                                    <path d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h1V7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7h1z"/>
                                </svg>
                                <b>&nbsp; Estadística</b>
                            </a>
                        </li>
                        <hr/>
                        <%
                            }

                            if (session.getAttribute("user_eguardia").toString().equals("1")) {
                        %>
                        <!--ENTREGA DE GUARDIA-->
                        <li>
                            <div class="subcat">
                                ENTREGA DE GUARDIA
                            </div>
                        </li>
                        <li>
                            <a href="/medica/eguardia/registro_diario.jsp">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
                                    <path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5"/>
                                    <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5z"/>
                                </svg>
                                <b>&nbsp; Registro diario</b>
                            </a>
                        </li>

                        <%
                            }

                        %>

                        <hr/>
                        <%if (session.getAttribute("user_eguardia").toString().equals("1")) {
                        %>
                        <!--ENTREGA DE GUARDIA-->
                        <li>
                            <div class="subcat">
                                CONTROL DE OFICIOS
                            </div>
                        </li>
                        <li>
                            <a href="/medica/oficios/recibeof.jsp">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16">
                                    <path d="m.5 3 .04.87a2 2 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2m5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19q-.362.002-.683.12L1.5 2.98a1 1 0 0 1 1-.98z"/>
                                    <path d="M13.5 9a.5.5 0 0 1 .5.5V11h1.5a.5.5 0 1 1 0 1H14v1.5a.5.5 0 1 1-1 0V12h-1.5a.5.5 0 0 1 0-1H13V9.5a.5.5 0 0 1 .5-.5"/>
                                </svg>
                                <b>&nbsp;Recepción de oficios</b>
                            </a>
                        </li>
                        <li>
                            <a href="/medica/eguardia/registro_diario.jsp">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
                                </svg>
                                <b>&nbsp;Concentrado oficios recibidos</b>
                            </a>
                        </li>
                        <%
                            }

                        %>
                        <hr/>
                        <!--SALIR -->

                        <li>
                            <a href=" /medica/cerrar_sesion.jsp">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"/>
                                    <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
                                </svg>
                                <b>&nbsp; Salir</b> 
                            </a>
                        </li>






                    </ul>
                    <br/>
                    <br/>
                </div>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbarmenu">
    <a href="/medica/inicio.jsp">
        <img src="/medica/images/himfg-logo_ewzx59.webp" width="30" height="40" alt="HIMFG">          
    </a>
    <div class="navbar-toggler" >
        <div style=''>
            <div style="position: absolute;left: 55px;bottom: 11px;">
                <svg xmlns="http://www.w3.org/2000/svg" style="" width="1.9em" height="1.5em" fill="#FFF" class="bi bi-list pointerc menugo" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                </svg>
            </div> 
        </div>
    </div> 
    <div class="collapse navbar-collapse" style="margin-left: 15px;" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <svg xmlns="http://www.w3.org/2000/svg" style="/*margin-top: 9px;*/" width="1.9em" height="1.5em" fill="#FFF" class="bi bi-list pointerc menugo" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                </svg>
            </li>
        </ul>
    </div>
</nav>

<!--<div id="shownotifications" class="notifications">
    <div id="" class="notifications-1">

        <div id="" class="notifications-1a">

            <span id="" class="notifications-1a-span">
                                        Upload Complete
            </span>
        </div>
        <div id="" class="notifications-1b">

            <div id="" class="notifications-1b-in">
                <div id="" class="notifications-1b-in-a">
                    <svg class="bi bi-x-square closenotif" style="cursor:pointer" width="1.7em" height="1.7em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                    <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>
                    <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>
                    </svg>
                </div>

            </div>
        </div>
    </div>
    <div id="" class="notifications-2">

    </div>
    <div id="" class="notifications-3">

        <div id="" class="notifications-3a">
                                es la que se debe repetir
            <div id="" class="notifications-3a-1"> 

                <div id="" class="notifications-3a-1a">

                </div>
            </div>
        </div>
    </div>
</div>-->
<script type="text/javascript">

    $('.menugo').bind('click', function () {

        $('body').css("overflow-y", 'hidden');
        $('body').css("overflow-x", 'hidden');
        $('.hmenu-container-l').attr('style', 'visibility:visible');
        $('.hmenu-dark-l').attr('style', 'visibility:visible');
        $('.notif-main-l').removeClass('hmenu-translateX-left');
        $('.notif-main-l').addClass('hmenu-translateX-center');
    });


    $('.closemenul').click(function () {


        $('.hmenu-container-l').attr('style', 'visibility:hidden');
        $('.hmenu-dark-l').attr('style', 'visibility:hidden');
        $('.notif-main-l').removeClass('hmenu-translateX-center');
        $('.notif-main-l').addClass('hmenu-translateX-left');

        Cms.restoreY();
    });


    $('.hmenu-dark-l').bind('click', function () {
        $('.hmenu-container-l').attr('style', 'visibility:hidden');
        $('.hmenu-dark-l').attr('style', 'visibility:hidden');
        $('.notif-main-l').removeClass('hmenu-translateX-center');
        $('.notif-main-l').addClass('hmenu-translateX-left');

        Cms.restoreY();

    });



</script>