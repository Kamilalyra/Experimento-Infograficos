<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>

 <script type="text/javascript" src="../js/valida.js"></script>
<!--  jquery core -->
<script src="../js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>
<!-- Custom jquery scripts -->
<script src="../js/jquery/custom_jquery.js" type="text/javascript"></script>

<!-- AUTOCOMPLETE -->
<script type="text/javascript" charset="utf-8" 	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/js/jqueryputs.js"></script>

<link href="${path}/css/jquery.autocomplete.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="${path}/js/jquery.autocomplete.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>

<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
	 

</head>
<body>

<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	
	      	<div class="span6">	
	      		
	      		
	      		<div class="widget">
	      		
							               	<form action="<c:url value="/administrador/selecionaAssociado"/>">		
													
														
																												
																										
													<h3><i class="icon-user"></i> Selecione um associado:</h3>		
													
																								
													<br>									
													<input type="text" class="input-xlarge"  name="nomeUsuario" id="nomeUsuario"/>
													<button type="submit" class="btn btn-medium btn-info" onclick="consultar()" > <i class="icon-search icon-large" ></i> </button>
													<br>
													
													
												</form>
												
											 <script>
												  $(function() {
												    $( "#nomeUsuario" ).autocomplete({
												      source: function( request, response ) {
												        $.ajax({
												          url: "<c:url value="/busca.json"/>",
												          dataType: "json",
												          data: {  
											                    featureClass: "P",  
											                    style: "full",  
											                    maxRows: 12,  
											                    q: request.term  
											              },  
												          success: function( data ) {
												            response( $.map(data, function(user) {
												              return {
												                label: user.nome,
												                value: user.nome
												              }
												            }));
												          }
												        });
												      },
												      open: function() {
												        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
												      },
												      close: function() {
												        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
												      }
												    });
												  });
												  </script>		
						
						<br><br>
					<div class="widget-header">
						<i class="icon-bookmark"></i>
						<h3>Links rápidos</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
						
						<div class="shortcuts">
							<a href="<c:url value="/consulta/consulta_usuario"/>" class="shortcut">
								<i class="shortcut-icon icon-search"></i>
								<span class="shortcut-label">Consulta de Associados</span>
							</a>
							
							<a href="<c:url value="/consulta/dependentes"/>" class="shortcut">
								<i class="shortcut-icon icon-search"></i>
								<span class="shortcut-label">Consulta de Dependentes</span>								
							</a>
							
							<a href="<c:url value="/lancamentos/farmacia"/>" class="shortcut">
								<i class="shortcut-icon icon-signal"></i>
								<span class="shortcut-label">Lançamento de Farmácia</span>	
							</a>
							
							<a href="<c:url value="/cadastro/cadastroUsuario"/>" class="shortcut">
								<i class="shortcut-icon icon-user"></i>
								<span class="shortcut-label">Cadastro de Associados</span>								
							</a>
							
							<a href="<c:url value="/lancamentos/gerarTabelasPagamento"/>" class="shortcut">
								<i class="shortcut-icon icon-check"></i>
								<span class="shortcut-label">Pagamento</span>
							</a>
							
							<a href="<c:url value="/relatorio/relatorioMensal"/>" class="shortcut">
								<i class="shortcut-icon icon-file"></i>
								<span class="shortcut-label">Relatório Mensal</span>	
							</a>
							
							<a href="<c:url value="/cadastro/consulta"/>" class="shortcut">
								<i class="shortcut-icon icon-plus"></i>
								<span class="shortcut-label">Cad. de Consulta</span>	
							</a>
							
							<a href="http://www.apassaocarlos.com.br/webmail" class="shortcut">
								<i class="shortcut-icon icon-envelope"></i>
								<span class="shortcut-label">Webmail</span>
							</a>				
						</div> <!-- /shortcuts -->	
					
					</div> <!-- /widget-content -->
					
				</div> <!-- /widget -->
									
		      </div> <!-- /span6 -->
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div> <!-- /main -->
    

    
    
<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<script src="../js/bootstrap.js"></script>
<script src="../js/base.js"></script>

<script src="../js/charts/area.js"></script>
<script src="../js/charts/donut.js"></script>


</body>
</html>