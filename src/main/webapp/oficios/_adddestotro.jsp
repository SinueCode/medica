<%-- 
    Document   : _adddestotro
    Created on : 17 oct 2024, 14:59:42
    Author     : KiRoS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<br>
<div class="card">
    <div class="card-header">
        <h5 class="card-title">Otro destinatario:</h5>
    </div>
    <div class="card-body">                    
        <div class="form-group row">
            <div class="col-md-3 mb-3 mb-lg-0">
                <label for="iotrondest_<%=request.getParameter("item")%>">Nombre:</label>
                <input type="text" class="form-control input-b" id="iotrondest_<%=request.getParameter("valor")%>" name="iotrondest_<%=request.getParameter("valor")%>" onchange="fnupperfg(this)" placeholder="Nombre">
            </div>
            <div class="col-md-3 mb-3 mb-lg-0">
                <label for="iotroap1dest_<%=request.getParameter("item")%>">Apellido1:</label>
                <input type="text" class="form-control input-b" id="iotroap1dest_<%=request.getParameter("valor")%>" name="iotroap1dest_<%=request.getParameter("valor")%>" onchange="fnupperfg(this)" placeholder="Apellido1">
            </div>
            <div class="col-md-3 mb-3 mb-lg-0">
                <label for="iotroap2dest_<%=request.getParameter("item")%>">Apellido2:</label>
                <input type="text" class="form-control input-b" id="iotroap2dest_<%=request.getParameter("valor")%>" name="iotroap2dest_<%=request.getParameter("valor")%>" onchange="fnupperfg(this)" placeholder="Apellido2">
            </div>
            <br>
        </div>
    </div>
</div>