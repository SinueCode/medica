<%-- 
    Document   : nrmortalidad
    Created on : 14 ago 2024, 14:53:45
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> DIR. MÉDICA | SEHIM</title>
        <link rel="shortcut icon" href="../images/himfg-logo_ewzx59.webp">  
        <%=global.cFunciones.setHeadHtml(request)%> 
    </head>

    <body>
        <jsp:include page="../includes/menu.jsp" />
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
            <div class="row ">
                <div class="row justify-content-center text-center">
                    <div class="col-12 text-center mb-5">
                        <small class="small-text">SUBCOMITÉ DE MORTALIDAD HOSPITALARIA</small>   <br>
                        <small class="small-text" style=" font-size: 15px;">DIRECCIÓN MÉDICA</small><br>
                    </div>
                </div>               
            </div>

            <form id="frmcomitem" method="POST" class="formulario"  action=" ">

                <div class="form-group row">
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="ifsesion">Fecha de la Sesión:</label>                                      
                        <input type="text" class="form-control" name="ifsesion" id="ifsesion" placeholder="F. sesión">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="inumcaso">Caso No.:</label>
                        <input  type="text" class="form-control" name="inumcaso" id="inumcaso" placeholder="No. Caso"  style="text-transform:uppercase;">
                    </div>                 

                    <div class="col-md-4 mb-4 mb-lg-0">
                        <div class="radio">
                            <br>                          
                            <a href="htipocaso" id='hestatusres'></a>
                            <input type="radio" name="tipocaso" id="tipocasoo" value="O">
                            <label for="tipocasoo" class="chktipocaso">Ordinario</label>
                            <input type="radio" name="tipocaso" id="tipocasor" value="R">
                            <label for="tipocasor" class="chktipocaso">Reprogramado</label>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="iregistro">Registro:</label>                                      
                        <input type="text" class="form-control" name="iregistro" id="iregistro" placeholder="Registro"   MAXLENGTH="25">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="icurp">CURP:</label>
                        <input  type="text" class="form-control" name="icurp" id="icurp" placeholder="CURP"  style="text-transform:uppercase;">
                    </div>                 

                    <div class="col-md-4 mb-4 mb-lg-0">
                        <!--                        <div class="radio">
                                                    <br>                          
                                                    <a href="htipocaso" id='hestatusres'></a>
                                                    <input type="radio" name="tipocaso" id="tipocasoo" value="O">
                                                    <label for="tipocasoo" class="chktipocaso">Ordinario</label>
                                                    <input type="radio" name="tipocaso" id="tipocasor" value="R">
                                                    <label for="tipocasor" class="chktipocaso">Reprogramado</label>
                                                </div>-->
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="inombre">Nombre:</label>                                      
                        <input type="text" style="text-transform:uppercase;" class="form-control onlyltracent"  MAXLENGTH="25" name="inombre" id="inombre" placeholder="Nombre">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="iprmapellido">Primer apellido:</label>
                        <input  style="text-transform:uppercase;" class="form-control" name="iprmapellido" id="iprmapellido" placeholder="Apellido1">
                    </div>

                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="isegapellido">Segundo apellido:</label>
                        <input style="text-transform:uppercase;"  class="form-control"  name="isegapellido"  id="isegapellido" placeholder="Apellido2">
                    </div>
                </div>  

                <div class="form-group row">                                
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="ifechanac">Fecha de nacimiento:</label>
                        <input type="text" id="ifechanac" name="ifechanac" placeholder="Fecha de nacimiento" class="form-control" readonly>
                    </div>
                    <div class="col-md-4">
                        <label for="iedad">Edad:</label>                                      
                        <input type="text" disabled="disabled"  class="form-control" name="iedad" id="iedad" placeholder="Edad">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="cbogen">Género:</label>
                        <select name="cbogen" id="cbogen" class="custom-select form-select">
                            <option value="-1">Seleccione género</option>
                            <option value="F">Femenino</option>
                            <option value="M">Maculino</option>  
                        </select>
                    </div>
                </div>

                <div class="form-group row">                                
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="ifechaing">Fecha de ingreso:</label>
                        <input type="text" id="ifechaing" name="ifechaing" placeholder="Fecha de nacimiento" class="form-control" readonly>
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="idfechadef">Fecha de defunción:</label>
                        <input type="text" class="form-control" id="idfechadef" name="idfechadef" placeholder="Fecha de nacimiento" readonly>
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <div class="col-md-4 mb-4 mb-lg-0">
                            <label for="idestancia">Días de estancia:</label>                                      
                            <input type="text" class="form-control"  id="idestancia" name="idestancia" placeholder="Días de estancia">
                        </div>
                    </div>
                </div>

                <div class="form-group row">                                
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="cboserv">Servicios (Principal):</label>
                        <select name="cboserv" id="cboserv" class="custom-select form-select">
                            <option value="-1">Seleccione servicio</option>
                            <option value="F">Femenino</option>
                            <option value="M">Maculino</option>  
                        </select>
                    </div>

                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="cbolugarm">¿Dónde ocurrió la muerte?:</label>
                        <select name="cbolugarm" id="cbolugarm" class="custom-select form-select">
                            <option value="-1">Seleccione dónde ocurrió la muerte</option>
                            <option value="F">Femenino</option>
                            <option value="M">Maculino</option>  
                        </select>
                    </div>

                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="cboparticiparon">Participaron:</label>
                        <select name="cboparticiparon" id="cboparticiparon" class="custom-select form-select">
                            <option value="-1">Seleccione género</option>
                            <option value="F">Femenino</option>
                            <option value="M">Maculino</option>  
                        </select>
                    </div>
                </div>

                <div class="form-group row">                                
                    <div class="col-md-12 mb-12 mb-lg-0">
                        <label for="cbodxbase">Diagnósticos(s) de base:</label>
                        <select name="cbodxbase" id="cbodxbase" class="custom-select form-select">
                            <option value="-1">Seleccione DX. de base</option>
                            <option value="F">Femenino</option>
                            <option value="M">Maculino</option>  
                        </select>
                    </div>
                </div>
                <div class="form-group row">                                
                    <div class="col-md-12 mb-12 mb-lg-0">
                        <label for="cbodxdefun">Diagnósticos(s) de defunción:</label>
                        <select name="cbodxdefun" id="cbodxdefun" class="custom-select form-select">
                            <option value="-1">Seleccione DX. de defunción</option>
                            <option value="F">Femenino</option>
                            <option value="M">Maculino</option>  
                        </select>
                    </div>
                </div>

                <div class="form-group row">                                
                    <div class="col-md-8 mb-8 mb-lg-0">
                        <label for="ielaboro">Certificado de defunción elaborado por:</label>
                        <input type="text" style="text-transform:uppercase;" class="form-control onlyltracent"  MAXLENGTH="25" name="ielaboro" id="ielaboro" placeholder="Elaborado por ...">
                    </div>                    
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <br>
                        <div class="radio">              
                            <a href="helaboro" id='helaboro'></a>
                            <input type="radio" name="elaboro" id="elaboroa" value="A">
                            <label for="elaboroa" class="chkelaboro">Médico Adscrito</label>
                            <input type="radio" name="elaboro" id="elaboror" value="R">
                            <label for="elaboror" class="chkelaboro">Médico Residente</label>
                        </div>
                    </div>
                </div>
                <div class="form-group row" style="border-bottom: 1px solid #ccc;">  
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="rcanexo">RESUMEN CLÍNICO ANEXO (no mayor a dos cuartillas):</label>
                        <div class="radio">             
                            <a href="hrcanexo" id='hrcanexo'></a>
                            <input type="radio" name="rcanexo" id="rcanexos" value="S">
                            <label for="rcanexos" class="chkrcanexo">SI</label>
                            <input type="radio" name="rcanexo" id="rcanexon" value="N">
                            <label for="rcanexon" class="chkrcanexo">NO</label>
                        </div>
                    </div>
                </div>
                <div class="form-group row" style="border-bottom: 1px solid #ccc;">  
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="discusion">DISCUSIÓN DEL CASO AL INTERIOR DEL SERVICIO:</label>
                        <div class="radio">           
                            <a href="hdiscusion" id='hdiscusion'></a>
                            <input type="radio" name="discusion" id="discusions" value="S">
                            <label for="discusions" class="chkdiscusion">SI</label>
                            <input type="radio" name="discusion" id="discusionn" value="N">
                            <label for="discusionn" class="chkediscusion">NO</label>
                        </div>
                    </div>
                </div>          

                <div class="form-group row" style="border-bottom: 1px solid #ccc;">  
                    <div class="col-md-4 mb-4 mb-lg-0">
                        <label for="entregar">ENTREGA RESUMEN:</label>
                        <div class="radio">              
                            <a href="hentregar" id='hestatusres'></a>
                            <input type="radio" name="entregar" id="entregars" value="S">
                            <label for="entregars" class="chkentregar">SI</label>
                            <input type="radio" name="entregar" id="entregarn" value="N">
                            <label for="entregarn" class="chkentregar">NO</label>
                        </div>
                    </div>
                </div>
                <div class="form-group row">  
                    <div class="col-md-12 mb-12 mb-lg-0">
                        <label for="iparticipantes" class="form-label">Participantes:</label>
                        <textarea class="form-control" id="iparticipantes" rows="3"></textarea>
                    </div>
                </div>
                <div class="form-group row">  
                    <div class="col-md-12 mb-12 mb-lg-0">
                        <label for="icomentarios" class="form-label">Comentarios y Conclusiones de discusión en el servicio:</label>
                        <textarea class="form-control" id="icomentarios" rows="3"></textarea>
                    </div>
                </div>
                <br>
                <b> <label for="cboserv">EXPEDIENTE CLÍNICO:</label></b>
                <div class="form-group row" style="border-bottom: 1px solid #ccc;">  
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hcompleto" id='hcompleto'></a>
                            Completo
                            <input type="radio" name="completo" id="completos" value="S">
                            <label for="completos" class="chkcompleto">SI</label>
                            <input type="radio" name="completo" id="completon" value="N">
                            <label for="completon" class="chkcompleto">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hnecompleta" id='hnecompleta'></a>
                            Nota de evolución completa
                            <input type="radio" name="necompleta" id="necompletas" value="S">
                            <label for="necompletas" class="chknecompleta">SI</label>
                            <input type="radio" name="necompleta" id="necompletan" value="N">
                            <label for="necompletan" class="chknecompleta">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                </div>                
                <div class="form-group row" style="border-bottom: 1px solid #ccc;">  
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hhcvigente" id='hhcvigente'></a>
                            Historia clínica vigente
                            <input type="radio" name="hcvigente" id="hcvigentes" value="C">
                            <label for="hcvigente" class="chkhcvigente">SI</label>
                            <input type="radio" name="hcvigente" id="hcvigenten" value="P">
                            <label for="hcvigenten" class="chkhcvigente">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hcpr" id='hcpr'></a>
                            Condición, pronóstico, riesgo
                            <input type="radio" name="cpr" id="cprs" value="S">
                            <label for="cprs" class="chkcpr">SI</label>
                            <input type="radio" name="cpr" id="cprn" value="N">
                            <label for="cprn" class="chkcpr">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                </div>
                <div class="form-group row" style="border-bottom: 1px solid #ccc;">
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hcinformado" id='hcinformado'></a>
                            Consentimiento informado
                            <input type="radio" name="cinformado" id="cinformados" value="S">
                            <label for="cinformados" class="chkcinformado">SI</label>
                            <input type="radio" name="cinformado" id="cinformadon" value="N">
                            <label for="cinformadon" class="chkcinformado">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hintegradx" id='hintegradx'></a>
                            Integración diagnóstica
                            <input type="radio" name="integradx" id="integradxs" value="S">
                            <label for="integradxs" class="chkintegradx">SI</label>
                            <input type="radio" name="integradx" id="integradxn" value="N">
                            <label for="integradxn" class="chkintegradx">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                </div>
                <div class="form-group row" style="border-bottom: 1px solid #ccc;">  
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hevidenciasa" id='hevidenciasa'></a>
                            <span style="font-size: 15px;">Evidencia de solicitud de autopsia </span>
                            <input type="radio" name="evidenciasa" id="evidenciasas" value="S">
                            <label for="evidenciasas" class="chkevidenciasa">SI</label>
                            <input type="radio" name="evidenciasa" id="evidenciasan" value="N">
                            <label for="evidenciasan" class="chkevidenciasa">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">                          
                            <a href="hlegible" id='hlegible'></a>
                            Legible
                            <input type="radio" name="legible" id="legibles" value="S">
                            <label for="legibles" class="chklegible">SI</label>
                            <input type="radio" name="legible" id="legiblen" value="N">
                            <label for="legiblen" class="chklegible">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                </div>
                <div class="form-group row" style="border-bottom: 1px solid #ccc;">  
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hfechahf" id='hfechahf'></a>
                            Fecha, hora, firma
                            <input type="radio" name="fechahf" id="fechahfs" value="S">
                            <label for="fechahfs" class="chkfechahf">SI</label>
                            <input type="radio" name="fechahf" id="fechahfn" value="N">
                            <label for="fechahfn" class="chkfechahf">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hnintercon" id='hnintercon'></a>
                            Notas interconsulta
                            <input type="radio" name="nintercon" id="nintercons" value="S">
                            <label for="nintercons" class="chknintercon">SI</label>
                            <input type="radio" name="nintercon" id="ninterconn" value="N">
                            <label for="ninterconn" class="chknintercon">NO</label>
                        </div>
                    </div> 
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                </div>
                <div  class="form-group row" style="border-bottom: 1px solid #ccc;">
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hinfodiario" id='hinfodiario'></a>
                            Informe diario al familiar
                            <input type="radio" name="infodiario" id="infodiarios" value="S">
                            <label for="infodiarios" class="chkinfodiario">SI</label>
                            <input type="radio" name="infodiario" id="infodiarion" value="N">
                            <label for="infodiarion" class="chkinfodiario">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hparaclinicos" id='hparaclinicos'></a>
                            Paraclínicos comentados
                            <input type="radio" name="paraclinicos" id="paraclinicoss" value="S">
                            <label for="paraclinicoss" class="chkparaclinicos">SI</label>
                            <input type="radio" name="paraclinicos" id="paraclinicosn" value="N">
                            <label for="paraclinicosn" class="chkparaclinicos">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                </div>
                <div  class="form-group row" style="border-bottom: 1px solid #ccc;">
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hnotaalta" id='hnotaalta'></a>
                            Nota de alta
                            <input type="radio" name="notaalta" id="notaaltas" value="S">
                            <label for="notaaltas" class="chknotaalta">SI</label>
                            <input type="radio" name="notaalta" id="notaaltan" value="N">
                            <label for="notaaltan" class="chknotaalta">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                    <div class="col-md-4 mb-4 mb-lg-0 text-end">
                        <div class="radio">
                            <a href="hautorizoaut" id='hautorizoaut'></a>
                            Se autirizó autopsia
                            <input type="radio" name="autorizoaut" id="autorizoauts" value="S">
                            <label for="autorizoauts" class="chkautorizoaut">SI</label>
                            <input type="radio" name="autorizoaut" id="autorizoautn" value="N">
                            <label for="autorizoautn" class="chkautorizoaut">NO</label>
                        </div>
                    </div>
                    <div class="col-md-2 mb-2 mb-lg-0 text-end">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-12 mb-12 mb-lg-0">
                        <b>  CALIFICACIÓN OBTENIDA EN LA EVALUACIÓN DEL EXPEDIENTE CLÍNICO:<span  style="color: #71bc42; text-align: center; font-size: 18px;">  9.8</span> </b>                                    
                        <br>
                    </div>
                </div>  
                <div class="col-md-4 mb-4 mb-lg-0">
                    <input type="text" id="ifecharesviral" name="ifecharesviral" placeholder="Fecha de Resultado de la prueba viral" class="form-control" readonly>        

                    <input type="text" id="ifecharesviralb" name="ifecharesviralb" placeholder="Fecha de Resultado de la prueba viral" class="form-control" readonly>        
                </div>

                <script type="text/javascript">
                    $(function () {
                        jQuery.datetimepicker.setLocale('es');

                        $('#ifecharesviral').datetimepicker({
                            format: 'd/m/Y H:i',
                            language: 'es'
//            , minDate: '<?php echo $fecha_actualidad2 ?>'  //fecha actual
//            , maxDate: '<?php echo $fecha_actualidad2 ?>' //fecha actual
                            , formatDate: 'd/m/Y H:i'
                            , autoclose: true
                            , step: 1
                        });

                      
                    });

                    $('#ifecharesviralb').datepicker({
                        language: 'es',
                        startDate: "-1y",
//                        endDate: "<?php echo $fecha_actualidad ?>",
                        autoclose: true
                    });

                </script>
                <br> <br> <br> <br> <br>
            </form>
        </div>




        <!--Evidencia de solicitud de autopsia
                <div class="container">
                    <div class="row justify-content-center text-center">
                        <div class="col-12 text-center mb-5">
                            <small class="small-text">SUBCOMITÉ DE MORTALIDAD HOSPITALARIA</small>   <br>
                            <small class="small-text" style=" font-size: 15px;">DIRECCIÓN MÉDICA</small><br>
                        </div>
                    </div>
        
                    <div class="row">
                        <div class="col-lg-12 mb-5" >
                            <form id="frmSmortalidad" method="POST" class="formulario"  action=" ">
                                <div class="form" >
        
                                    <div class="form-group row">
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <label for="iregistro">Registro:</label>                                      
                                            <input type="text" style="text-transform:uppercase;" class="form-control onlyltracent"  MAXLENGTH="25" name="iregistro" id="iregistro" placeholder="Registro">
                                        </div>
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <label for="iprmapellido">CURP:</label>
                                            <input  style="text-transform:uppercase;" class="form-control" name="icurp" id="icurp" placeholder="CURP">
                                        </div>
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                             <label for="isegapellido">Segundo apellido:</label>
                                            <input style="text-transform:uppercase;"  class="form-control"  name="isegapellido"  id="isegapellido" placeholder="Apellido2">
                                        </div>
                                    </div>
        
        
                                    <div class="form-group row">
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <label for="inombre">Nombre:</label>                                      
                                            <input type="text" style="text-transform:uppercase;" class="form-control onlyltracent"  MAXLENGTH="25" name="inombre" id="inombre" placeholder="Nombre">
                                        </div>
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <label for="iprmapellido">Primer apellido:</label>
                                            <input  style="text-transform:uppercase;" class="form-control" name="iprmapellido" id="iprmapellido" placeholder="Apellido1">
                                        </div>
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <label for="isegapellido">Segundo apellido:</label>
                                            <input style="text-transform:uppercase;"  class="form-control"  name="isegapellido"  id="isegapellido" placeholder="Apellido2">
                                        </div>
                                    </div>
        
        
        
                                    <div class="form-group row">                                
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <label for="cf-3">Fecha de ingreso:</label>
                                            <input type="text" id="ifechaing" name="ifechaing" placeholder="Fecha de nacimiento" class="form-control" readonly>
                                        </div>
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <label for="cf-3">Fecha de defunción:</label>
                                            <input type="text" id="ifechaing" name="ifechaing" placeholder="Fecha de nacimiento" class="form-control" readonly>
                                        </div>
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <div class="col-md-4 mb-4 mb-lg-0">
                                                <label for="idestancia">Días de estancia:</label>                                      
                                                <input type="text" style="text-transform:uppercase;" class="form-control onlyltracent"  MAXLENGTH="25" name="idestancia" id="idestancia" placeholder="Días de estancia">
                                            </div>
                                        </div>
                                    </div>
        
                                    <div class="form-group row">
                                        <div class="col-md-4 mb-4 mb-lg-0">
                                            <label for="icboestado">Servicios (Principal):</label>
                                            <select name="cboservicio" id="cboservicio" class="custom-select form-control">
                                                <option value="-1">Seleccione servicio</option>                                       
                                                <option value="1">fsdfsdfs</option>
                                            </select>
                                        </div>
        
                                    </div>
        
                                    <div class="form-group row">
                                        <div class="col-md-6 mb-6 mb-lg-0">
                                            <label for="icboserv">Servicio:</label>
                                            <select name="cboserv" id="cboserv" class="custom-select form-control">
                                                <option value="-1">Seleccione servicio</option>
        
                                                <option value="1">gfdfgdfgdfg</option>
        
                                                ?>
                                            </select>
                                        </div>
        
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-6 mb-6 mb-lg-0">
                                            <div class="radio">
                                                <h2>Estatus de la Prueba:</h2>
                                                <a href="hestatusres" id='hestatusres'></a>
                                                <input type="radio" name="estatusres" id="estatusresc" value="C">
                                                <label for="estatusresc" class="chkestatusres">Emitida</label>
                                                <input type="radio" name="estatusres" id="estatusresp" value="P">
                                                <label for="estatusresp" class="chkestatusres">En Proceso</label>
                                            </div>
                                        </div>
        
        
        
                                        <div class="col-md-6 mb-6 mb-lg-0">
                                            <label for="icbomotivo">Motivo de la solicitud:</label>
                                            <select name="icbomotivo" id="icbomotivo" class="custom-select form-control">
                                                <option value="-1">Seleccione motivo de la solicitud</option>                                        
                                                <option value="1>">fsdfsdfsdfsdf</option>
        
                                            </select>
                                        </div>
                                    </div>
        
                                    <div class="form-group row displayres" style="display: none">
                                        <div class="col-md-6">
                                            <label for="cf-3">Fecha de Resultado de la prueba (PCR COVID):</label>
                                            <input type="text" id="ifechares" name="ifechares" placeholder="Fecha de Resultado de la prueba" class="form-control" readonly>
                                        </div>
                                        <div class="col-md-6 mb-6 mb-lg-0">
                                            <div class="radio">
                                                <h2>Resultado de la prueba(PCR COVID):</h2>
                                                <a href="hresultado" id='hresultado'></a>
                                                <input type="radio" name="resultado" id="resppos" value="1">
                                                <label for="resppos" class="chkresultado">Positiva</label>
        
                                                <input type="radio" name="resultado" id="respneg" value="2">
                                                <label for="respneg" class="chkresultado">Negativa</label>
        
                                                <input type="radio" name="resultado" id="respinde" value="3">
                                                <label for="respinde" class="chkresultado">Indeterminada</label>
                                            </div>
                                        </div>
                                    </div>
        
                                    <div class="form-group row">
                                        <div class="col-md-6 mb-6 mb-lg-0">
        
                                            <div class="radio">
                                                <h2>¿El paciente de encuentra?:</h2>
                                                <a href="hencuentra" id='hencuentra'></a>
                                                <input type="radio" name="encuentra" id="encuentraamb" value="1">
                                                <label for="encuentraamb" class="chkencuentra">Ambulatorio</label>
                                                <input type="radio" name="encuentra" id="encuentrahosp" value="2">
                                                <label for="encuentrahosp" class="chkencuentra">Hospitalizado</label>                     
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-6 mb-lg-0">
                                            <label for="itipopru">Prueba solicitada:</label>
                                            <div class="checkbox">                                   
                                                <a href="htipopru" id='hresultado'></a>
                                                <input type="checkbox" name="tipopru[]" id="prupcr" value="1">
                                                <label for="prupcr" class="chktipopru">PCR COVID</label>
        
                                                <input type="checkbox" name="tipopru[]" id="pruvir" value="2">
                                                <label for="pruvir" class="chktipopru">PANEL VIRAL</label>
                                            </div>
                                        </div>
                                    </div>
        
        
                                    <div class="form-group row">
                                        <div class="col-md-8 ">
        
                                        </div>
                                        <div class="col-md-4 ">
                                            <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5 btnguardarsolp" style="background-color: #02687C; border-color:#02687C "value="Guardar">
                                        </div>
                                    </div>
        
                                </div>
        
                            </form>
                        </div>
                    </div>
                </div>-->







        <script type="text/javascript">

        </script>
    </body>
</html>
