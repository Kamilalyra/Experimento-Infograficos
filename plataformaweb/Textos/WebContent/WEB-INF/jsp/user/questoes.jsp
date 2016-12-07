<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="images/favicon.html">

    <link href="bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	
	<!-- <script src="js/alertify.min.js"></script> -->
	<link rel="stylesheet" href="css/alertify.core.css" />
	<link rel="stylesheet" href="css/alertify.default.css" id="toggleCSS" />
	
	<link rel="stylesheet" href="css/alertify/alertify.css" />
	<link rel="stylesheet" href="css/alertify/alertify.min.css" />
	<link rel="stylesheet" href="css/alertify/themes/bootstrap.css" />
	<script src="js/alertify/alertify.js"></script>
	
	<style>	.alertify-log-custom {background: blue;	}	</style>

<title>Textos</title>


<script type="text/javascript">
	
	function proximaQuestao(){
		document.forms["f1"].action = "<c:url value="/user/proximaQuestao"/>";
		document.forms["f1"].submit();
	}
	
	function btnSubmit(escolha) {
		var resposta = document.getElementsByName("respostaAluno");
		var c = escolha;
		
		var d = new Date();
		var n = d.getTime();
		var diferenca =  n - document.getElementById("tempoChegada").value;
		document.getElementById("tempoFeedback").value = diferenca; 
		
		if (c == 'Continuar') {
			document.forms["f1"].action = "<c:url value="user/proximaQuestao"/>";
			document.forms["f1"].submit();
		}
		else if(c == 'Tentar'){
			document.forms["f1"].action = "<c:url value="/user/voltaQuestao"/>";
			document.forms["f1"].submit();
		}
	}
</script>

	<style type="text/css"> 
		.divVisivel {display:block;} 	
		.divEscondida {display:none;} 
	</style>
	


<!-- SCRIPTS PARA LOG -->
<script type="text/javascript">
	function antesDoSubmit(){
		var d = new Date();
		var ta = d.getTime();
		var diferenca = ta - document.getElementById("tempoChegada").value;;
		document.getElementById("logTempoPeramenciaQuestao").value = diferenca/1000;
		
	}
	function pegaTempoChegada(){
		var d = new Date();
		var ta = d.getTime();
		
		document.getElementById("tempoChegada").value = ta;
	}	
	
	/*function clickRadioButton(){
		var d = new Date();
		var n = d.getTime();
		var diferenca = n - document.getElementById("tempoChegada").value;
		var totalTempo = document.getElementById("logTempoMudancaRadioButton").value + "; " +diferenca;
		document.getElementById("logTempoMudancaRadioButton").value = totalTempo;
		
		var qtdClicks = document.getElementById("logTrocaDeRadioButton").value;
		var total = parseInt(qtdClicks, 10) + 1;
		document.getElementById("logTrocaDeRadioButton").value = total;
	}*/
	
</script>

</head>

<body onload="pegaTempoChegada()"> <!--class="full-width"-->

<section id="container" >

	<section id=""> 
		<section class="wrapper">
	<!-- page start-->
	<div class="row">
		<div class="col-sm-12">
			<section class="panel"> 
				<header class="panel-heading">
					Texto: ${questoes.titulo} 
					<div  align="right" >
					 ${questaoAtual} de 15
		        	</div>
		            <c:if test="${responder == true}">
		           		 <div><span id="time"></span></div>
		            </c:if>
		         </header>
		         
			
			
			<div class="panel-body">
				<c:if test="${mensagem != null}">
					<div class="row">		
                            <div class="col-md-12 ">
                                <div class="panel-alert">
                                    <div class="panel-heading1">
                                      <i class="fa fa-exclamation-circle"></i> ${mensagem}
                                    </div>
                                    
                                </div>
                         	</div> 
					</div>
				</c:if>
			   <!-- onsubmit="return validaRadio()" -->
				<form name="f1" class="form-horizontal bucket-form" method="get" action="<c:url value="/questoes"/>"><!-- visualizacaoInfografico-->
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 ">Qual o principal tema abordado pelo texto anterior?</label>
						
					</div>
					
					
					
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="respostaAluno" id="respostaAluno1" value="alternativa1" onclick="clickRadioButton()">${questoes.alternativa1}	</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="respostaAluno" id="respostaAluno2" value="alternativa2" onclick="clickRadioButton()">${questoes.alternativa2} </label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="respostaAluno" id="respostaAluno3" value="alternativa3" onclick="clickRadioButton()">${questoes.alternativa3}	</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="respostaAluno" id="respostaAluno4" value="alternativa4" onclick="clickRadioButton()">${questoes.alternativa4}	</label>
							</div>
							

						</div>
					</div>
					
					<input type="hidden" name="tempoChegada" id="tempoChegada" value="">
					<input type="hidden" name="questaoAtual" value="${questaoAtual}"/>
					<input type="hidden" name="questoes.id" value="${questoes.id}"/>
					<input type="hidden" name="respostaCerta" value="${questoes.respostaCerta}"/>
					<!-- o questÃµes precisa  passar o questoes para ele mesmo -->
					<input type="hidden" name="questoes.titulo" value="${questoes.titulo}"/>
					<input type="hidden" name="questoes.pergunta" value="${questoes.pergunta}"/>
					<input type="hidden" name="questoes.alternativa1" value="${questoes.alternativa1}"/>
					<input type="hidden" name="questoes.alternativa2" value="${questoes.alternativa2}"/>
					<input type="hidden" name="questoes.alternativa3" value="${questoes.alternativa3}"/>
					<input type="hidden" name="questoes.alternativa4" value="${questoes.alternativa4}"/>
					<input type="hidden" name="questoes.respostaCerta" value="${questoes.respostaCerta}"/>
					<input type="hidden" name="questoes.grupo" value="${questoes.grupo}"/>
					<input type="hidden" name="questoes.categoria" value="${questoes.categoria}"/>
					
					<input type="hidden" name="acertou" id="acertou" value="${acertou}" />
					
					<input type="hidden" name="logQuestoes.id" id="logId" value="${logQuestoes.id}">
					<input type="hidden" name="logQuestoes.idUser" id="logIdUser" value="${logQuestoes.idUser}">
					<input type="hidden" name="logQuestoes.idQuestao" id="logIdQuestao" value="${logQuestoes.idQuestao}">
					<input type="hidden" name="logQuestoes.tempoPermanenciaQuestao" id="logTempoPeramenciaQuestao" value="${logQuestoes.tempoPermanenciaQuestao}">
					<input type="hidden" name="logQuestoes.tempoPermanenciaInfografico" id="logTempoPermanenciaInfografico" value="${logQuestoes.tempoPermanenciaInfografico}">
					
					
					
					
							<div class="right">
								<button onclick="return antesDoSubmit()" type="submit" class="btn btn-warning btn-lg">Próximo <i class="fa fa-check"></i></button>
									
							</div>
							
				</form>
				</div>
			</div>
		</div>
						
	</div>
    </section>
		<!-- page end-->
  </section>
    <!--main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->

<!--Core js-->
<script src="js/lib/jquery.js"></script>
<script src="bs3/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="js/accordion-menu/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scrollTo/jquery.scrollTo.min.js"></script>
<script src="js/nicescroll/jquery.nicescroll.js" type="text/javascript"></script>
<!--Easy Pie Chart-->
<script src="assets/easypiechart/jquery.easypiechart.js"></script>
<!--Sparkline Chart-->
<script src="assets/sparkline/jquery.sparkline.js"></script>
<!--jQuery Flot Chart-->
<script src="assets/flot-chart/jquery.flot.js"></script>
<script src="assets/flot-chart/jquery.flot.tooltip.min.js"></script>
<script src="assets/flot-chart/jquery.flot.resize.js"></script>
<script src="assets/flot-chart/jquery.flot.pie.resize.js"></script>


<!--common script init for all pages-->
<script src="js/scripts.js"></script>


<!-- Modal -->
			  <!-- Modal ajuda -->
          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modalHint" class="modal fade">
              <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="alert alert-success alert-block fade in" style="color: black">
                      		<table style="width:100%">
							  <tr>
							    <td width="10%"><img style="width: 50px; height: 50px;" alt="" align="left" src="images/lampada.png"></td>
							    <td width="60%"><h4><i class="icon-ok-sign"></i>DICAS:</h4></td>		
							    
							  </tr>
							</table>
										<br><br>
                                	<div>
                                							
                                	<a id="btnHint" data-toggle="modal" class="btn btn-warning btn-dfn" onclick="return CollapseExpand()">Proxima dica <i class="fa fa-arrow-right"></i> </a>
                                	<a id="btnFechar" data-dismiss="modal" class="btn btn-danger btn-dfn" onclick="return CollapseExpandFechar()">Fechar  <i class="fa fa-close"></i> </a>
                                	<br><br>
									                             	
                            </div>
                  </div>
              </div>
          </div>
          <!-- modal -->
          
		  
		  <!-- Modal ajuda -->
          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modalAprenda" class="modal fade">
              <div style="margin-top:100px">
			  <div class="modal-dialog">
                <div class="modal-content">
                      <div class="alert alert-success alert-block fade in">
                      		<table style="width:100%">
							  <tr>
							    <td width="10%"><img style="width: 50px; height: 50px;" alt="" align="left" src="images/book.png"></td>
							    <td width="60%"><h4><i class="icon-ok-sign"></i>TÃTULO DO CONTEÃDO:</h4></td>		
							    <td></td>
							  </tr>
							</table>
                                
										<br><br><br>
                                	<div>
                                		<p><strong>conteÃºdo aqui</strong></p>
                                	</div>
                                				
                                	<a id="btnFechar" data-dismiss="modal" class="btn btn-danger btn-dfn" onclick="return CollapseExpandFechar()">Fechar  <i class="fa fa-close"></i> </a>
                                	<br><br>
									                             	
                            </div>
                  </div>
				</div>
			</div>
		  </div>
          <!-- modal -->


	<script>
		function reset () {
			$("#toggleCSS").attr("href", "../themes/alertify.default.css");
			alertify.set({
				labels : {
					ok     : "OK",
					cancel : "Cancel"
				},
				delay : 5000,
				buttonReverse : false,
				buttonFocus   : "ok"
			});
		}

		// ==============================
		// Standard Dialogs
		$("#alert").on( 'click', function () {
			reset();
			alertify.alert("This is an alert dialog");
			return false;
		});

	
	</script>

</body>
</html>