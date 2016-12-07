<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Configurações</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" />
    <link href="./css/font-awesome.css" rel="stylesheet" />
    
    <link href="./css/base-admin.css" rel="stylesheet" />
    <link href="./css/base-admin-responsive.css" rel="stylesheet" />
    
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
    <script>     
		function confirmButton(form) {     
		   if (confirm("Tem certeza que deseja alterar essas informações? Todos os usuários serão alterados.")) {  
			   return true;
		   }
		   else{
			   return false;
		   }
		}     
	</script>

</head>
<body>

<div class="main">
	
    
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">		      	   		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-user"></i>
	      				<h3>Configurações</h3>
	  				</div> <!-- /widget-header -->
	  				
					
					<div class="widget-content">	
					
						<c:if test="${mensagem != null}">
							<table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
									<tr>
										<td>
										<div id="message-green">
										<table border="0" width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td class="green-left">${mensagem}</td>
											<td class="green-right"><a class="close-green"><img src="../img/table/icon_close_green.gif"   alt="" /></a></td>
										</tr>
										</table>
										</div>
								    </td>
									</tr>
							</table>
						</c:if>
												
						<div class="tabbable">
						<ul class="nav nav-tabs">
						  <li class="active">
                            <a href="#tab3" data-toggle="tab">Geral</a>
                          </li>
                          
						</ul>
						
						
							<div class="tab-content">
							
                                <div  id="tab3">
									<form id="edit-profile2" name="form2" class="form-horizontal" action="<c:url value="/administrador/salvaConfiguracoes"/>">
										<fieldset>
											
											<input type="hidden" class="input-medium" name="configuracao.id" value="${configuracao.id}"/>
                                        <div class="control-group">	
											<label class="control-label" for="valormensalidade">Repasse Cruz Azul:</label>
											<div class="controls">
												R$ <input type="text" class="input-medium" name="configuracao.repasseCruzAzul" placeholder="00.00" 
												value="${configuracao.repasseCruzAzul}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->         
										
										<div class="control-group">	
											<label class="control-label" for="valormensalidade">Convênio:</label>
											<div class="controls">
												R$ <input type="text" class="input-medium" name="configuracao.convenio" placeholder="00.00" 
												value="${configuracao.convenio}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->            
										
										<div class="control-group">	
											<label class="control-label" for="valorDesconto">Desconto:</label>
											<div class="controls">
												R$ <input type="text" class="input-medium" name="configuracao.desconto" placeholder="00.00" 
												value="${configuracao.desconto}" id="valorDesconto" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->  
                                        
                                        <div class="control-group">	
											<label class="control-label" for="limiteConsulta">Limite de Consulta:</label>
											<div class="controls">
												<select name="configuracao.limiteConsulta">
			                                         <option value="${configuracao.limiteConsulta}">${configuracao.limiteConsulta}</option>
			                                         <option value="Sim">Sim</option>
			                                         <option value="Não">Não</option>
		                                         </select>										
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										<div class="control-group">	
											<label class="control-label" for="valorDesconto">Valor da Consulta (caso seja cobrado):</label>
											<div class="controls">
												R$ <input type="text" class="input-medium" name="configuracao.valorConsulta" placeholder="00.00" 
												value="${configuracao.valorConsulta}" id="valorConsulta" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->  

											
											<br />
											
                                            <div class="form-actions">
										
											<input type="button" class="btn btn-danger" onclick="history.back();" value="Cancelar"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                            <button type="submit" onclick="return confirmButton(this)" class="btn btn-primary btn-large">Salvar</button> 
										</div> <!-- /form-actions -->
                                            
										</fieldset>
									</form>
								</div> 
                                <!-- /TAB3 -->
                                
                                
                                

                                
							</div>
						</div>
					</div> <!-- /widget-content -->
				</div> <!-- /widget -->
	      </div> <!-- /row -->
	    </div> <!-- /container -->
	</div> <!-- /main-inner -->
</div> <!-- /main -->    
		
</body>
</html>