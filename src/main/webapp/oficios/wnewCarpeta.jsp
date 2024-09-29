<%-- 
    Document   : wnewfolder
    Created on : 20 sept 2024, 09:10:14
    Author     : DIR. MEDICA
--%>

<form id="frm_carpeta" method="POST" class="formulario"  action=""> 
    <div class="modal-body">
        <p>Se agregará una nueva carpeta a la clasificación <%=request.getParameter("subcod")%> </p>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-primary"  data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-success" onclick="NewCarpeta('<%=request.getParameter("subcod")%>', '<%=request.getParameter("cod")%>')" id="modal-btn-si">Aceptar</button>       
    </div>
</form>

<script type="text/javascript">
    function NewCarpeta(cod_sub, cod) {
        vflagclose = 0;
        $.ajax({
            dataType: 'json',
            url: '../of/addCarpeta?cod_sub=' + cod_sub + '&cod=' + cod,
            success: function (data) {
                //alert(data.carpetaid);
                var iselected = data.carpetaid;
//                var vcod = cod;
//                var vsubcod = cod_sub;
                if (data.done === 1) { //se agrego
                    vflagclose = 1;
                    alert("Se agrego la carpeta" + cod_sub + "/ TOMO " + data.carpetanom);
//                    //aqui se cargan los cmb
//                    alert("aqui se cargan los cmb ---" + cod + "---" + cod_sub + "---" + data.carpetaid + "preguntaaaaaaaaaar");
//
                    //alert(data.carpetaid)
                    $.post("../consultas/cboCarpeta.jsp", {id_subcod: cod_sub}, function (data) { // carga cbo carpeta y deshabilitada
                        $("#divcbocarpeta").html(data);
                        $("#cbocarpeta_arch").unbind();
                        //$('select[name=cbocarpeta_arch]').val(data.carpetaid);
                        $('#cbocarpeta_arch').selectpicker('val', iselected);
                        fnmedica.initcbocarpeta(cod, cod_sub);
                        $("#cbocarpeta_arch").selectpicker("refresh");
                    });


                }
            }
        });
        $('#exampleModal').modal('hide');
    }
</script>

