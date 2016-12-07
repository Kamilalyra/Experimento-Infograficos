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

<title>Pos Teste</title>

<!-- SCRIPTS PARA LOG -->
<script type="text/javascript">
	function antesDoSubmit(){
		var d = new Date();
		var ta = d.getTime();
		
		var diferenca = ta - document.getElementById("tempoChegada").value;
		
		if (document.getElementById("categoria").value == 1) {
			document.getElementById("logTempoPermanenciaPosA").value = diferenca/1000; /*segundos*/
		}else if(document.getElementById("categoria").value == 2){
			document.getElementById("logTempoPermanenciaPosB").value = diferenca/1000;
		}else if(document.getElementById("categoria").value == 3){
			document.getElementById("logTempoPermanenciaPosC").value = diferenca/1000;
		}
		
		//document.getElementById("logQtdDicasClicadas").value = document.getElementById("nroDica").value;
	}
	function pegaTempoChegada(){
		var d = new Date();
		var ta = d.getTime();
		
		document.getElementById("tempoChegada").value = ta; 
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

	function btnSubmit(escolha) {
		var resposta1 = document.getElementsByName("resposta1");
		var resposta2 = document.getElementsByName("resposta2");
		var resposta3 = document.getElementsByName("resposta3");
		var resposta4 = document.getElementsByName("resposta4");
		var resposta5 = document.getElementsByName("resposta5");
		var resposta6 = document.getElementsByName("resposta6");
		var resposta7 = document.getElementsByName("resposta7");
		var resposta8 = document.getElementsByName("resposta8");
		var resposta9 = document.getElementsByName("resposta9");
		var resposta10 = document.getElementsByName("resposta10");
		var resposta11 = document.getElementsByName("resposta11");
		var resposta12 = document.getElementsByName("resposta12");
		var resposta13 = document.getElementsByName("resposta13");
		var resposta14 = document.getElementsByName("resposta14");
		var resposta15 = document.getElementsByName("resposta15");
		
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
					PÓS-TESTE 
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
		     
		     
			<div class="panel-body"  style="text-align:left; margin-left:30px" >
				
			
				<form name="f1" class="form-horizontal bucket-form" method="get" action="<c:url value="/gravaRespostasPos"/>"> <!-- C:\Users\kamil\Google Drive\Infografico projeto\Infograficos\WebContent\images\questoes  -->
					
					
					<div class="form-group " style="text-align: left; color: black">
						<label class="control-label  "> ${quest1.titulo} ${quest1.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black" >
							<div class="radio">
								<label> <input type="radio" required name="resposta1" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest1.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta1" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest1.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta1" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest1.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta1" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest1.alternativa4}</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest2.titulo} ${quest2.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta2" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest2.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta2" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest2.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta2" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest2.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta2" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest2.alternativa4}</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest3.titulo} ${quest3.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio" required  name="resposta3" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest3.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required  name="resposta3" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest3.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta3" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest3.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta3" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest3.alternativa4}</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest4.titulo} ${quest4.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta4" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest4.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta4" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest4.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta4" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest4.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required  name="resposta4" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest4.alternativa4}</label>
							</div>
						</div>
					</div>
					
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest5.titulo} ${quest5.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta5" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest5.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta5" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest5.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta5" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest5.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta5" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest5.alternativa4}</label>
							</div>
						</div>
					</div>
					
					
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest6.titulo} ${quest6.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta6" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest6.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta6" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest6.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta6" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest6.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta6" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest6.alternativa4}</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest7.titulo} ${quest7.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta7" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest7.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta7" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest7.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta7" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest7.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta7" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest7.alternativa4}</label>
							</div>
						</div>
					</div>
					
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest8.titulo} ${quest8.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta8" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest8.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta8" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest8.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta8" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest8.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta8" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest8.alternativa4}</label>
							</div>
						</div>
					</div>
					
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest9.titulo} ${quest9.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta9" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest9.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta9" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest9.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required  name="resposta9" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest9.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta9" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest9.alternativa4}</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest10.titulo} ${quest10.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta10" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest10.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta10" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest10.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta10" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest10.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required  name="resposta10" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest10.alternativa4}</label>
							</div>
						</div>
					</div>
					
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest11.titulo} ${quest11.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta11" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest11.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta11" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest11.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required  name="resposta11" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest11.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required  name="resposta11" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest11.alternativa4}</label>
							</div>
					</div>
					</div>
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest12.titulo} ${quest12.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta12" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest12.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta12" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest12.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required  name="resposta12" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest12.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required  name="resposta12" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest12.alternativa4}</label>
							</div>
						</div>
					</div>
					
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest13.titulo} ${quest13.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta13" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest13.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta13" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest13.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta13" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest13.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta13" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest13.alternativa4}</label>
							</div>
						</div>
					</div>
					
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest14.titulo} ${quest14.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta14" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest14.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta14" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest14.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta14" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest14.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta14" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest14.alternativa4}</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align: left; color: black">
						<label class="control-label  "> ${quest15.titulo} ${quest15.pergunta}</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="col-sm-3 control-label col-lg-3" for="inputSuccess"></label>
						<div class="" style="color: black">
							<div class="radio">
								<label> <input type="radio"  required name="resposta15" id="respostaHumor1" value="alternativa1" onclick="clickRadioButton()">${quest15.alternativa1}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta15" id="respostaHumor2" value="alternativa2" onclick="clickRadioButton()">${quest15.alternativa2}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta15" id="respostaHumor3" value="alternativa3" onclick="clickRadioButton()">${quest15.alternativa3}</label>
							</div>
							<div class="radio">
								<label> <input type="radio"  required name="resposta15" id="respostaHumor4" value="alternativa4" onclick="clickRadioButton()">${quest15.alternativa4}</label>
							</div>
						</div>
					</div>
					
						<input type="hidden" name="tempoChegada" id="tempoChegada" value="">
						<input type="hidden" name="categoria" id="categoria" value="${quest1.categoria}">
						<input type="hidden" name="logPos.id" id="logId" value="${logPos.id}">
						<input type="hidden" name="logPos.idUser" id="logIdUser" value="${logPos.idUser}">
						<input type="hidden" name="logPos.tempoPermanenciaPosA" id="logTempoPermanenciaPosA" value="${logPos.tempoPermanenciaPosA}">
						<input type="hidden" name="logPos.tempoPermanenciaPosB" id="logTempoPermanenciaPosB" value="${logPos.tempoPermanenciaPosB}">
						<input type="hidden" name="logPos.tempoPermanenciaPosC" id="logTempoPermanenciaPosC" value="${logPos.tempoPermanenciaPosC}">
				 	
					</div>
			
					<button type="submit" onclick="antesDoSubmit()" class="btn btn-info btn-lg">CONTINUAR <i class="fa fa-arrow-right"></i></button>
					
				</form>
				</div>
			</div>
		<!--  </div>
	</div>-->
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