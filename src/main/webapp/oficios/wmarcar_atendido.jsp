<%-- 
    Document   : wmarcar_atendido
    Created on : 8 oct 2024, 12:20:55
    Author     : DIR. MEDICA
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<form id="frm_matendido" method="POST" class="formulario"  action=""> 
    <div class="row justify-content-center text-center">
        <div class="modal-body">
            <p>Marcar como atendido el oficio con <br> <b><%=global.cFunciones.getnumOf_or_RefXid(request.getParameter("idfolio"))%></b> </p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary"  data-bs-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-success" onclick="marcar_atendido('<%=request.getParameter("idfolio")%>')" id="modal-btn-si">Aceptar</button>       
        </div>
    </div>
</form>

<script type="text/javascript">
    function marcar_atendido(id_folio) {
        $.ajax({
            dataType: 'json',
            url: '../of/marca_atendido?id_folio=' + id_folio,
            success: function (data) {
                if (data.done === 1) { //se agrego
                    //  alert("Atendido" );     
                    
                    $('.atendido_' + id_folio).removeClass('table-danger'); //en caso de q este vencido
                    $('.atendido_' + id_folio).addClass("table-primary");
                }
            }
        });
        $('#exampleModal').modal('hide');
    }
</script>