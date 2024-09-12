<%-- 
    Document   : prueba
    Created on : 5 sept 2024, 07:21:39
    Author     : DIR. MEDICA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link href="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/css/tom-select.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/js/tom-select.complete.min.js"></script>

<div class="container">
    <div class="row">
        <div class="p-4">
            <select id="cbodxbase" name="cbodxbase"  data-live-search="true" >
                <option value="1000" data-subtext="Dirección Médica">Dirección Médica</option>
                <option value="1001" data-subtext="1989">Dirección General</option>
                <option value="1002" data-subtext="1997">Sistemas</option>
                <option value="1003" data-subtext="1984">Compras</option> 
            </select>

        </div>
    </div>
</div>

<script type="text/javascript">
    new TomSelect("#cbodxbase", {
        // plugins: ['remove_button'],
        create: true,
        onItemAdd: function () {
            this.setTextboxValue('');
            this.refreshOptions();
        }
        ,
        render: {
            option: function (data, escape) {
                return '<div class="d-flex"><span>' + escape(data.value) + '</span><span class="ms-auto text-muted">' + escape(data.subtext) + '</span></div>';
            },
            item: function (data, escape) {
                return '<div>' + escape(data.value) + '</div>';
            }
        }
    });
//    


//    new TomSelect("#cbodxbase", {
//        create: true,
//        sortField: {
//            field: "text",
//            direction: "asc"
//        }
//    });



</script>