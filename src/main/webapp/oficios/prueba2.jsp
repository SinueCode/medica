<%-- 
    Document   : prueba2
    Created on : 5 sept 2024, 09:35:28
    Author     : DIR. MEDICA
--%>
 <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> DIR. MÉDICA </title>
        <link rel="shortcut icon" href="../images/himfg-logo_ewzx59.webp">  
        <%=global.cFunciones.setHeadHtml(request)%> 
    </head>
<!-- Include Bootstrap CSS 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

 Include jQuery 
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

 Include Popper.js 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

 Include Bootstrap JS 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

 Include Bootstrap-Select CSS 
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" rel="stylesheet">

 Include Bootstrap-Select JS (compatible version with Bootstrap 5) 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js"></script>-->


<style>
    .sc_table {
  height: 100vh;
  overflow: scroll;
}

</style>
<body>

  <div>
    <center>
      <h2>Transaction Creation</h2>
    </center>
  </div>

  <div class="container-fluid p-2 sc_table b-5">
    <form action="" method="post">

      <div class="mb-3">
        
        <select id='FromACC' name='frmac' class="selectpicker" data-show-subtext="true" data-live-search="true">
          <option data-tokens="dummy" value="0" selected>Select Account</option>
          <option data-tokens="13000013" value="13">13000013 - CashBank fdgdfg fgdfgdfgdfg </option>
          <option data-tokens="202311433" value="33">202311433 - Interest Account</option>
          <option data-tokens="202311934" value="34">202311934 - IIA dfg dfgdgdfgdfgdfgdfg</option>
          <option data-tokens="202311735" value="35">202311735 - IEdfg dgdfgdfgd w4erwerw A</option>
          <option data-tokens="13001313" value="36">13001313 - Cash eredresggfnhfg</option>
          <option data-tokens="13130013" value="53">13130013 - Ban dfgdf dfgsdfgdfgk</option>
        </select>
      </div>

<!--      <button type="submit" name="tran_submit" class="btn btn-primary">Submit</button>-->
    </form>
  </div>
</body>


<script type="text/javascript">
$(function() {
  $('.selectpicker').selectpicker();
});



</script>