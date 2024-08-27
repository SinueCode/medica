<%-- 
    Document   : newjsp
    Created on : 23 ago 2024, 11:15:48
    Author     : DIR. MEDICA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%=global.cFunciones.setHeadHtml(request)%>
    </head>
    <body>
        <div class="container">
            <form id="frmsolpac" method="POST" class="formulario"  action="../action/forms/_solpruebapac.php?">    
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
                                    <label for="icbogen">Género:</label>
                                    <select name="cbogen" id="cbogen" class="form-select">
                                        <option value="-1">Seleccione género</option>
                                        <option value="F">Femenino</option>
                                        <option value="M">Maculino</option>  
                                    </select>
                                </div>
                </div>                     
            </form>
        </div>
    </body>
</html>
