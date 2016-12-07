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
		   if (confirm("Tem certeza que deseja alterar as mensalidades? \nTodas os associados e dependentes serão atualizados.")) {  
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
                            <a href="#tab1" data-toggle="tab">Apas Plus Familiar - Quarto Coletivo</a>
                          </li>
                          <li class="">
                            <a href="#tab2" data-toggle="tab">Apas Plus Familiar - Apartamento</a>
                          </li>
                          <li class="">
                            <a href="#tab3" data-toggle="tab">Apas Plus - Agregados</a>
                          </li>
                          <li class="">
                            <a href="#tab4" data-toggle="tab">Apas II - Quarto Coletivo</a>
                          </li>
                          <li class="">
                            <a href="#tab5" data-toggle="tab">Apas II - Apartamento</a>
                          </li>
                          
						</ul>
						
						
							<div class="tab-content">
							
                                <div class="tab-pane active"  id="tab1">
									<form id="edit-profile2" name="form2" class="form-horizontal" action="<c:url value="/administrador/salvaMensalidades"/>">
										<fieldset>
											
											<input type="hidden" class="input-medium" name="valorMensalidade.id" value="${apasFamCol.id}"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.plano" value="Apas Plus 1119"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoQuarto" value="Coletivo"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoAssociado" value="Familiar"/>
	                                        <div class="control-group">	
												<label class="control-label" for="valormensalidade">00 a 17 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor17" placeholder="00.00" 
													value="${apasFamCol.valor17}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         
											
								          <div class="control-group">	
												<label class="control-label" for="valormensalidade">18 a 29 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor29" placeholder="00.00" 
													value="${apasFamCol.valor29}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group --> 
	
											<div class="control-group">											
												<label class="control-label" for="valormensalidade">30 a 39 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor39" placeholder="00.00" 
													value="${apasFamCol.valor39}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         									
	 
	 										<div class="control-group">	
	 											<label class="control-label" for="valormensalidade">40 a 49 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor49" placeholder="00.00" 
													value="${apasFamCol.valor49}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->                                                
	
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">50 a 59 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor59" placeholder="00.00" 
													value="${apasFamCol.valor59}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">60 a 69 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor69" placeholder="00.00" 
													value="${apasFamCol.valor69}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">Acima de 70:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor70" placeholder="00.00" 
													value="${apasFamCol.valor70}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
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
                                <!-- /TAB1 -->
                                
                                
                                
							
                                <div  class="tab-pane" id="tab2">
									<form id="edit-profile2" name="form2" class="form-horizontal" action="<c:url value="/administrador/salvaMensalidades"/>">
										<fieldset>
											
											<input type="hidden" class="input-medium" name="valorMensalidade.id" value="${apasFamAp.id}"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.plano" value="Apas Plus 1119"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoQuarto" value="Apartamento"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoAssociado" value="Familiar"/>
	                                        <div class="control-group">	
												<label class="control-label" for="valormensalidade">00 a 17 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor17" placeholder="00.00" 
													value="${apasFamAp.valor17}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         
											
								          <div class="control-group">	
												<label class="control-label" for="valormensalidade">18 a 29 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor29" placeholder="00.00" 
													value="${apasFamAp.valor29}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group --> 
	
											<div class="control-group">											
												<label class="control-label" for="valormensalidade">30 a 39 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor39" placeholder="00.00" 
													value="${apasFamAp.valor39}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         									
	 
	 										<div class="control-group">	
	 											<label class="control-label" for="valormensalidade">40 a 49 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor49" placeholder="00.00" 
													value="${apasFamAp.valor49}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->                                                
	
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">50 a 59 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor59" placeholder="00.00" 
													value="${apasFamAp.valor59}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">60 a 69 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor69" placeholder="00.00" 
													value="${apasFamAp.valor69}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">Acima de 70:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor70" placeholder="00.00" 
													value="${apasFamAp.valor70}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         																													
												
												
												<br />
												
												
	                                            <div class="form-actions">
											
													<button class="btn btn-danger">Cancelar</button> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		                                            <button type="submit" onclick="return confirmButton(this)" class="btn btn-primary btn-large">Salvar</button> 
												</div> <!-- /form-actions -->
	                                            
										</fieldset>
									</form>
								</div> 
                                <!-- /TAB2 -->
                                
                                
                               <div  class="tab-pane" id="tab3">
									<form id="edit-profile2" name="form2" class="form-horizontal" action="<c:url value="/administrador/salvaMensalidades"/>">
										<fieldset>
											
											<input type="hidden" class="input-medium" name="valorMensalidade.id" value="${apasAgreg.id}"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.plano" value="Apas Plus 1119"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoQuarto" value="-"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoAssociado" value="Agregados"/>
	                                            									
	 
	 										<div class="control-group">	
	 											<label class="control-label" for="valormensalidade">00 a 49 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor49" placeholder="00.00" 
													value="${apasAgreg.valor49}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->                                                
	
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">50 a 59 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor59" placeholder="00.00" 
													value="${apasAgreg.valor59}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">60 a 69 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor69" placeholder="00.00" 
													value="${apasAgreg.valor69}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">Acima de 70:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor70" placeholder="00.00" 
													value="${apasAgreg.valor70}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         																													
												
												
												<br />
												
												
	                                            <div class="form-actions">
											
													<button class="btn btn-danger">Cancelar</button> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		                                            <button type="submit" onclick="return confirmButton(this)" class="btn btn-primary btn-large">Salvar</button> 
												</div> <!-- /form-actions -->
	                                            
										</fieldset>
									</form>
								</div> 
                                <!-- /TAB3 -->
                                

                           <div  class="tab-pane" id="tab4">
									<form id="edit-profile2" name="form2" class="form-horizontal" action="<c:url value="/administrador/salvaMensalidades"/>">
										<fieldset>
											
											<input type="hidden" class="input-medium" name="valorMensalidade.id" value="${apasIICol.id}"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.plano" value="Apas II 1190"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoQuarto" value="Coletivo"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoAssociado" value="Familiar"/>
	                                            									
	 
	 										<div class="control-group">	
	 											<label class="control-label" for="valormensalidade">00 a 49 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor49" placeholder="00.00" 
													value="${apasIICol.valor49}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->                                                
	
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">50 a 59 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor59" placeholder="00.00" 
													value="${apasIICol.valor59}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">60 a 69 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor69" placeholder="00.00" 
													value="${apasIICol.valor69}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">Acima de 70:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor70" placeholder="00.00" 
													value="${apasIICol.valor70}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         																													
												
												
												<br />
												
												
	                                            <div class="form-actions">
											
													<button class="btn btn-danger">Cancelar</button> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		                                            <button type="submit" onclick="return confirmButton(this)" class="btn btn-primary btn-large">Salvar</button> 
												</div> <!-- /form-actions -->
	                                            
										</fieldset>
									</form>
								</div> 
                                <!-- /TAB4 -->
                                
                               <div  class="tab-pane" id="tab5">
									<form id="edit-profile2" name="form2" class="form-horizontal" action="<c:url value="/administrador/salvaMensalidades"/>">
										<fieldset>
											
											<input type="hidden" class="input-medium" name="valorMensalidade.id" value="${apasIIAp.id}"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.plano" value="Apas II 1190"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoQuarto" value="Apartamento"/>
											<input type="hidden" class="input-medium" name="valorMensalidade.tipoAssociado" value="Familiar"/>
	                                            									
	 
	 										<div class="control-group">	
	 											<label class="control-label" for="valormensalidade">00 a 49 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor49" placeholder="00.00" 
													value="${apasIIAp.valor49}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->                                                
	
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">50 a 59 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor59" placeholder="00.00" 
													value="${apasIIAp.valor59}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">60 a 69 anos:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor69" placeholder="00.00" 
													value="${apasIIAp.valor69}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         	
											
											<div class="control-group">	
												<label class="control-label" for="valormensalidade">Acima de 70:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" name="valorMensalidade.valor70" placeholder="00.00" 
													value="${apasIIAp.valor70}" id="valorMensalidade" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->         																													
												
												
												<br />
												
												
	                                            <div class="form-actions">
											
													<button class="btn btn-danger">Cancelar</button> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		                                            <button type="submit" onclick="return confirmButton(this)" class="btn btn-primary btn-large">Salvar</button> 
												</div> <!-- /form-actions -->
	                                            
										</fieldset>
									</form>
								</div> 
                                <!-- /TAB5 -->
                                
                                
                                
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