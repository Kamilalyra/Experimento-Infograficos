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

<title>Infográficos</title>

<!-- SCRIPTS PARA LOG -->
<script type="text/javascript">
	function antesDoSubmit(){
		var d = new Date();
		var ta = d.getTime();
		var diferenca = ta - document.getElementById("tempoChegada").value;;
		document.getElementById("logTempoPermanenciaInfografico").value = diferenca;
		
		document.getElementById("logQtdDicasClicadas").value = document.getElementById("nroDica").value;
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
 
	//essa função valida a seleção dos radios, mas não está sendo usada
 	function validaRadio() {
		  if (document.f1.respostaHumor[0].checked == false 
		    && document.f1.respostaHumor[1].checked == false
		    && document.f1.respostaHumor[2].checked == false
		    && document.f1.respostaHumor[3].checked == false
		    && document.f1.respostaHumor[4].checked == false
		    && document.f1.respostaHumor[5].checked == false
		    && document.f1.respostaHumor[6].checked == false
		    && document.f1.respostaHumor[7].checked == false
		    && document.f1.respostaHumor[8].checked == false
		    && document.f1.respostaHumor[9].checked == false) {
		    alert('Por favor, selecione o HUMOR.');
		    return false;
		  }
		  return true;
	}
	
</script>

</head>

<body onload="verificarBadge()"> <!--class="full-width"-->

<section id="container" >

	<section id=""> 
		<section class="wrapper">
	<!-- page start-->
	<div class="row">
		<div class="col-sm-12">
			<section class="panel"> 
				<header class="panel-heading">
					O seu estilo de aprendizagem é:  
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
			
				<form name="f1" class="form-horizontal bucket-form" " method="get" action="<c:url value="/questhumor"/>"> <!-- C:\Users\kamil\Google Drive\Infografico projeto\Infograficos\WebContent\images\questoes  -->
					<div class="form-group "style="text-align:center; color: black">
						
			
					
					<label class="control-label col-lg-12 ">${ativoReflexivo}</label>
					<label class="control-label col-lg-12 ">${sensorialIntuitivo}</label>
					<label class="control-label col-lg-12 ">${visualVerbal}</label>
					<label class="control-label col-lg-12 ">${sequencialGlobal}</label>
						<div class="form-group" >
							<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
							<div class="col-lg-6" style="color: black">
								  
								 Visual<input type="range" value=1 id="ativoReflexivo" name="ativoReflexivo" min="1" max="5" step="1" style="width: 500px; height: 200px" list="numbers"> Verbal
								
								<datalist id="numbers">
								  <option>1</option> 
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								 </datalist>
								  Visual<input type="range" value=3 id="sensorialIntuitivo" name="sensorialIntuitivo" min="1" max="5" step="1" style="width: 500px; height: 200px" list="numbers"> Verbal
								
								<datalist id="numbers">
								  <option>1</option> 
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								 </datalist>
								  Visual<input type="range" value=5 id="respostaHumor" name="respostaHumor" min="1" max="5" step="1" style="width: 500px; height: 200px" list="numbers"> Verbal
								
								<datalist id="numbers">
								  <option>1</option> 
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								 </datalist>
								  
								  
								  
								  
								  
								  
								  
								  								 
								
							</div>
						</div>
					</div>
					
					<button type="submit" onclick="return antesDoSubmit()" class="btn btn-info btn-lg">CONTINUAR <i class="fa fa-arrow-right"></i></button>
					
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