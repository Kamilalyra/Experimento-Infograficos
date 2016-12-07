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
	
	<script src="js/jquery-1.8.3.min.js"></script>
	<script src="js/jquery.elevatezoom.js" type="text/javascript"></script> 
	
	<style>	.alertify-log-custom {background: blue;	}	</style>

<title>Textos</title>

<!-- SCRIPTS PARA LOG -->
<script type="text/javascript">
	function antesDoSubmit(){
		
		var d = new Date();
		var ta = d.getTime();
		var diferenca = ta - document.getElementById("tempoChegada").value;
		document.getElementById("logTempoPermanenciaInfografico").value = diferenca/1000;
		
	}
	
	function clickRadioButton(){
		var d = new Date();
		var n = d.getTime();
		var diferenca = n - document.getElementById("tempoChegada").value;
		var totalTempo = document.getElementById("logTempoMudancaRadioButton").value + "; " +diferenca;
		document.getElementById("logTempoMudancaRadioButton").value = totalTempo;
		
		var qtdClicks = document.getElementById("logTrocaDeRadioButton").value;
		var total = parseInt(qtdClicks, 10) + 1;
		document.getElementById("logTrocaDeRadioButton").value = total;
	}
	
	function pegaTempoChegada(){
		var d = new Date();
		var ta = d.getTime();
		
		document.getElementById("tempoChegada").value = ta;
	
	

	}

	
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
		         </header>
		         
			
			
			<div class="panel-body">
				
			
				<form name="f1" class="form-horizontal bucket-form" method="get" action="<c:url value="/questoes"/>"> <!-- C:\Users\kamil\Google Drive\Infografico projeto\Infograficos\WebContent\images\questoes  -->
					<div class="form-group "style="text-align:center; color: black">
						<c:if test="${not empty questoes.texto}">
							<br>
							 
							<!-- <img align="middle" src="images/questoes/${questoes.image}" width=800 height=auto />
							<script type="text/javascript">
								$('#zoom_01').elevateZoom({ zoomType: "lens", lensShape : "square", lensSize : 200, scrollZoom: true });
							</script> --> 
							
							<img  src="images/textos/small/${questoes.texto}"   />
							
						</c:if>
					</div>
					
					<input type="hidden" name="respostaAluno" value="0"/>
					<input type="hidden" name="questaoAtual" value="${questaoAtual}"/>
					<input type="hidden" name="questoes.id" value="${questoes.id}"/>
					<input type="hidden" name="questoes.titulo" value="${questoes.titulo}"/>
					<input type="hidden" name="questoes.pergunta" value="${questoes.pergunta}"/>
					<input type="hidden" name="questoes.texto" value="${questoes.texto}"/>
					<input type="hidden" name="questoes.alternativa1" value="${questoes.alternativa1}"/>
					<input type="hidden" name="questoes.alternativa2" value="${questoes.alternativa2}"/>
					<input type="hidden" name="questoes.alternativa3" value="${questoes.alternativa3}"/>
					<input type="hidden" name="questoes.alternativa4" value="${questoes.alternativa4}"/>
					<input type="hidden" name="questoes.respostaCerta" value="${questoes.respostaCerta}"/>
					<input type="hidden" name="questoes.grupo" value="${questoes.grupo}"/>
					<input type="hidden" name="questoes.categoria" value="${questoes.categoria}"/>
					<input type="hidden" name="tempoChegada" id="tempoChegada" value="">
					
					<input type="hidden" name="tempoChegada" id="tempoChegada" value="">
					<input type="hidden" name="logQuestoes.id" id="logId" value="${logQuestoes.id}">
					<input type="hidden" name="logQuestoes.idUser" id="logIdUser" value="${logQuestoes.idUser}">
					<input type="hidden" name="logQuestoes.idQuestao" id="logIdQuestao" value="${logQuestoes.idQuestao}">
					<input type="hidden" name="logQuestoes.tempoPermanenciaQuestao" id="logTempoPeramenciaQuestao" value="${logQuestoes.tempoPermanenciaQuestao}">
					<input type="hidden" name="logQuestoes.tempoPermanenciaInfografico" id="logTempoPermanenciaInfografico" value="${logQuestoes.tempoPermanenciaInfografico}">
					
					<button type="submit" onclick="antesDoSubmit()" class="btn btn-info btn-lg">Pronto <i class="fa fa-arrow-right"></i></button>
					
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
							    <td width="60%"><h4><i class="icon-ok-sign"></i>TÍTULO DO CONTEÚDO:</h4></td>		
							    <td></td>
							  </tr>
							</table>
                                
										<br><br><br>
                                	<div>
                                		<p><strong>conteúdo aqui</strong></p>
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