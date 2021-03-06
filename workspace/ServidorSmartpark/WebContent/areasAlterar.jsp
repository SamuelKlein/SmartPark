<!DOCTYPE html>
<%@page import="br.feevale.smartpark.persistencia.tabelas.Area"%>
<%@page import="java.util.List"%>
<%@page import="br.feevale.smartpark.apresentacao.MntAreas"%>
<%@page import="br.feevale.smartpark.sessao.GerenciadorDeSessao"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>Smartpark</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="css/starter-template.css" rel="stylesheet">
    <link href="css/estilo.css" rel="stylesheet" />
  </head>

   <body style="padding-top: 5px;">
 <script>
  <%
	MntAreas mnt = GerenciadorDeSessao.getMntAreas(request);
  	
  	Area area = mnt.solicitaAlteracao( request.getParameter("idArea"));
  
  	if( area == null ){ %>
  		alert("Area n�o encontrado!");
  		location.href = "areas.jsp";
  	<%}
  	
  	System.out.print( area.getSnDesativado());
  	
 %>
 </script> 

      <div>
      
      	<div id="DivCorpoWeb">
       	<div id="ConteinerEdit" style="width: 40%; text-align: left;">
       		<div class="col-sm-offset-2 col-sm-10">
		    	<label>Alterando �reas - <%=area.getDsArea()%></label>
             </div>
			<form action="areas.jsp" method="post" name="area">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Descri��o</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="descricao" name="descricao" value="<%=area.getDsArea()%>" >
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <div class="checkbox">
				        <label>
				          <input type="checkbox" id="desativar" name="desativar" 
				          <%if( area.getSnDesativado().equals("S") ) { %>
				             checked
				          <%}%>>Desativar �rea</label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <input type="submit" style="width:100px" value="Salvar" class="btn btn-default">
	                  <input onclick="window.history.back()" type="button" style="width:100px" value="Cancelar" class="btn btn-default">
				    </div>
				  </div>
				  
				  <input type="hidden" name="acao" value="alterar" />
				  <input type="hidden" name="id" value="<%=area.getIdArea()%>" />
	            
            </form>            
        </div>
    
    </div>
      
      </div>

    
    <script src="bootstrap/js/jquery-2.0.3.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/smartpark.js"></script>
  </body>
</html>
