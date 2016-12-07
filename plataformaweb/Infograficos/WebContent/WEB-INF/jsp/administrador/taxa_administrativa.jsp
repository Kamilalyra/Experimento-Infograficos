<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Taxa Administrativa</title>

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

	function incrementaValor(valor){
		var total = 0;
		if(form1.valorTotalFatura.value != ""){
			total = parseFloat(form1.valorTotalFatura.value, 10);
		}
		if(valor.value != ""){
			var vlr = parseFloat(valor.value, 10);
			total = (total + vlr).toFixed(2);
			form1.valorTotalFatura.value = total;
		}
	}
		
	function calculaValorParcelas(parcela){
		var i = document.form1.parcelas.selectedIndex;  
        var parcelas = document.form1.parcelas[i].text;  
		var totalFatura = form1.valorTotalFatura.value;
		var totalParcela = (totalFatura/parcelas).toFixed(2);
		
		form1.valorParcelas.value = totalParcela;
	}
	

</script>


<script type="text/javascript">
		
		function BlockKeybord(){
			if(window.event){ // IE
				if((event.keyCode < 48) || (event.keyCode > 57)){
					event.returnValue = false;
				}
			}
			else if(e.which){ // Netscape/Firefox/Opera
				if((event.which < 48) || (event.which > 57)){
					event.returnValue = false;
				}
			}
		}
		function troca(str,strsai,strentra){
			while(str.indexOf(strsai)>-1){
				str = str.replace(strsai,strentra);
			}
			return str;
		}

		function FormataMoeda(campo,tammax,teclapres,caracter){
			if(teclapres == null || teclapres == "undefined"){
				var tecla = -1;
			}
			else{
				var tecla = teclapres.keyCode;
			}

			if(caracter == null || caracter == "undefined"){
				caracter = "";
			}

			vr = campo.value;
			if(caracter != ""){
				vr = troca(vr,caracter,"");
			}
			vr = troca(vr,"/","");
			vr = troca(vr,".","");
			vr = troca(vr,".","");

			tam = vr.length;
			if(tecla > 0){
				if(tam < tammax && tecla != 8){
					tam = vr.length + 1;
				}
				if(tecla == 8){
					tam = tam - 1;
				}
			}
			if(tecla == -1 || tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105){
				if(tam <= 2){
					campo.value = vr;
				}
				if((tam > 2) && (tam <= 5)){
					campo.value = vr.substr(0, tam - 2) + '.' + vr.substr(tam - 2, tam);
				}
				if((tam >= 6) && (tam <= 8)){
					campo.value = vr.substr(0, tam - 5) + caracter + vr.substr(tam - 5, 3) + '.' + vr.substr(tam - 2, tam);
				}
				if((tam >= 9) && (tam <= 11)){
					campo.value = vr.substr(0, tam - 8) + caracter + vr.substr(tam - 8, 3) + caracter + vr.substr(tam - 5, 3) + '.' + vr.substr(tam - 2, tam);
				}
				if((tam >= 12) && (tam <= 14)){
					campo.value = vr.substr(0, tam - 11) + caracter + vr.substr(tam - 11, 3) + caracter + vr.substr(tam - 8, 3) + caracter + vr.substr(tam - 5, 3) + '.' + vr.substr(tam - 2, tam);
				}
				if((tam >= 15) && (tam <= 17)){
					campo.value = vr.substr(0, tam - 14) + caracter + vr.substr(tam - 14, 3) + caracter + vr.substr(tam - 11, 3) + caracter + vr.substr(tam - 8, 3) + caracter + vr.substr(tam - 5, 3) + '.' + vr.substr(tam - 2, tam);
				}
			}
		}

		function maskKeyPress(objEvent){
			var iKeyCode;
			if(window.event){ // IE
				iKeyCode = objEvent.keyCode;
				if(iKeyCode>=48 && iKeyCode<=57) return true;
				return false;
			}
			else if(e.which){ // Netscape/Firefox/Opera
				iKeyCode = objEvent.which;
				if(iKeyCode>=48 && iKeyCode<=57) return true;
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
	      				<h3>Taxa Administrativa </h3>
	  				</div> <!-- /widget-header -->
	  				
					
					<div class="widget-content">
					
					<div class="tabbable">
						<ul class="nav nav-tabs">
						  <li class="active">
                            <a href="#tab3" data-toggle="tab">Cadastro</a>
                          </li>
                          
						</ul>	
					
			<div class="tabbable">
						
						
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
                        
						
				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
					
					

					
					
							<form id="edit-profile" name="form1" class="form-horizontal" action="<c:url value="/administrador/adicionaTaxaAdministrativa"/>" method="POST">
								<fieldset>
                                    
                                <table width="100%">
                                	<tr>

   										<td>
						                    <div class="control-group">	
												<label class="control-label" for="nomeCompleto">Nome:</label>
												<div class="controls">
													<input type="text" class="input-large" name="taxaAdministrativa.nome" placeholder="Nome Completo" id="nomeAssociado"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->
				
											 <script>
												  $(function() {
												    $( "#nomeAssociado" ).autocomplete({
												      source: function( request, response ) {
												        $.ajax({
												          url: "<c:url value="/cadastro/buscaTitularPlano.json"/>",
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
											
									
											
                                        </td>
										
										<td>
                                            <div class="control-group">	
												<label class="control-label" for="mes">Qtd de Parcelas</label>
												<div class="controls">
													<select name="taxaAdministrativa.parcelas" id="parcelas" style="width: 55">
	                                                 <option value="1">1</option>
	                                                 <option value="2">2</option>
	                                                 <option value="3">3</option>
	                                                 <option value="4">4</option>
	                                                 <option value="5">5</option>
	                                                 <option value="6">6</option>
	                                                 <option value="7">7</option>
	                                                 <option value="8">8</option>
	                                                 <option value="9">9</option>
	                                                 <option value="10">10</option>
	                                                 <option value="11">11</option>
	                                                 <option value="12">12</option>
	                                                </select>										
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->
										</td>
										<td>
                                            <div class="control-group">	
												<label class="control-label" for="mes">A começar no mês:</label>
												<div class="controls">
													<select name="taxaAdministrativa.mes" id="mes" style="width: 55">
	                                                 <option value="1">1</option>
	                                                 <option value="2">2</option>
	                                                 <option value="3">3</option>
	                                                 <option value="4">4</option>
	                                                 <option value="5">5</option>
	                                                 <option value="6">6</option>
	                                                 <option value="7">7</option>
	                                                 <option value="8">8</option>
	                                                 <option value="9">9</option>
	                                                 <option value="10">10</option>
	                                                 <option value="11">11</option>
	                                                 <option value="12">12</option>
	                                                </select>										
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->
										
										 </td>
										 <td>
										 
	                                        <div class="control-group">	
												<label class="control-label" for="valor">Valor:</label>
												<div class="controls">
													R$ <input type="text" class="input-medium" id="valor" name="taxaAdministrativa.valor" placeholder="00,00" 
													 onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)"/>
												</div> <!-- /controls -->				
											</div> <!-- /control-group -->
										
										</td>

                                      </tr>
                                      </table>
                                      <br>
                                   
                                     
                                    	
								<input type="hidden" class="input-medium" name="farmacia.idTitular" value="${associado.id}"/>
										
								<div class="form-actions">
									<input type="button" class="btn btn-danger" onclick="history.back();" value="Cancelar"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    <button type="submit" class="btn btn-primary btn-large">Salvar</button> 
								</div> <!-- /form-actions -->
							</fieldset>
						</form>
					</div> 
					
					
					<!-- FILTROS -->
					
					
			<form action="<c:url value="/administrador/filtroPorNome"/>" method="get">
			      <div class="control-group">	
					<label class="control-label" for="Nome">Nome:</label>
					<div class="controls">
						<input type="text" class="campos-borda" size="30" name="nome" id="nome"/>
						<input type="submit" value="Filtrar"/>
					</div> <!-- /controls -->				
				</div> <!-- /control-group -->
			</form>
			
			<form action="<c:url value="/administrador/filtroPorValor"/>" method="get">
			      <div class="control-group">	
					<label class="control-label" for="re">Valor:</label>
					<div class="controls">
						<input type="text" class="campos-borda" size="30" name="valor" id="valor"/>
						<input type="submit" value="Filtrar"/>
					</div> <!-- /controls -->				
				</div> <!-- /control-group -->
			</form>
			
			<form action="<c:url value="/administrador/filtroPorMes"/>" method="get">
			      <div class="control-group">	
					<label class="control-label" for="re">Mês:</label>
					<div class="controls">
						<select name="mes" id="mes" style="width: 130">
                                <option value="1">Janeiro</option>
                                <option value="2">Fevereiro</option>
                                <option value="3">Março</option>
                                <option value="4">Abril</option>
                                <option value="5">Maio</option>
                                <option value="6">Junho</option>
                                <option value="7">Julho</option>
                                <option value="8">Agosto</option>
                                <option value="9">Setembro</option>
                                <option value="10">Outubro</option>
                                <option value="11">Novembro</option>
                                <option value="12">Dezembro</option>
                              </select>			
						<input type="submit" value="Filtrar"/>
					</div> <!-- /controls -->				
				</div> <!-- /control-group -->
			</form>
					
					
			<!-- /TABLE / DIV -->
                  <div class="widget widget-table action-table">
					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3>Usuários em aberto</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
						
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Nome</th>
									<th>Mês/ano</th>
                                    <th>Valor</th>
                                    <th>Parcela</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${taxaAdministrativaList}" var="taxa" varStatus="s">
									<tr>
										<td>${taxa.nome}</td>
										<td>${taxa.mes} / ${taxa.ano}</td>
	                                    <td>R$ ${taxa.valor}</td>
										<td>${taxa.parcelaDe} / ${taxa.parcelas}</td>									

									</tr>
                                </c:forEach>

								</tbody>
							</table>
						
					</div> <!-- /widget-content -->
				
				</div> <!-- /widget -->
                                
                                
                                
							</div>
						</div>
					</div> <!-- /widget-content -->
				</div> <!-- /widget -->
	      </div> <!-- /row -->
	    </div> <!-- /container -->
	</div> <!-- /main-inner -->
</div> <!-- /main -->    
</div>
		
</body>
</html>