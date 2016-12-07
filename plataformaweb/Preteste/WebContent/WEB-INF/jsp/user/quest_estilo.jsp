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

<title>Estilos de Aprendizagem</title>

<!-- SCRIPTS PARA LOG -->
<script type="text/javascript">
	function antesDoSubmit(){
		var d = new Date();
		var ta = d.getTime();
		var diferenca = ta - document.getElementById("tempoChegada").value;
		document.getElementById("logTempoPermanenciaEstilo").value = diferenca/1000;
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
		var resposta16 = document.getElementsByName("resposta16");
		var resposta17 = document.getElementsByName("resposta17");
		var resposta18 = document.getElementsByName("resposta18");
		var resposta19 = document.getElementsByName("resposta19");
		var resposta20 = document.getElementsByName("resposta20");	
		
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
		<div class="col-sm-12" >
			<section class="panel"> 
				<header class="panel-heading">
					<h3>Questionário para Estilo de Aprendizagem </h3> <a href="http://repositorio.unesp.br/handle/11449/100339">(Vieira Junior, 2012)</a>
		         </header>
		     <div class="control-label" style="text-align: center">
		     <p><br><b>Marque uma opção para indicar sua resposta a cada uma das questões.
		     Se as duas alternativas se aplicam a você, escolha aquela que é mais frequente.</b>
		     </p>
		     </div>
		     <div class="panel-body"  >
		    
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
		     
		     
			<div class="panel-body" style=" margin-left:100px;  margin-right:150px">
				
			
				<form name="f1" class="form-horizontal bucket-form"  method="get" action="<c:url value="/estiloResult"/>"> <!-- C:\Users\kamil\Google Drive\Infografico projeto\Infograficos\WebContent\images\questoes  -->
					
					<div class="form-group" style="text-align:center; color: black">
						<label style="text-align:left" class="control-label col-lg-12 "> 1 . Quando estou aprendendo algum assunto novo, gosto de:</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black" >
							<div class="radio"  >
								<label> <input type="radio" required name="resposta1"  value="A" onclick="clickRadioButton()">primeiramente, discuti-lo com outras pessoas.</label>
							</div>
							<div class="radio">
								<label> <input  type="radio" required name="resposta1"  value="B" onclick="clickRadioButton()">primeiramente, refletir sobre ele individualmente.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group" style="text-align:center; color: black">
						<label class="control-label  col-lg-12 "  style="text-align:left"> 2 . Se eu fosse um professor, eu preferiria ensinar uma disciplina:</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black" >
							<div class="radio">
								<label> <input type="radio" required name="resposta2"  value="A" onclick="clickRadioButton()">que trate com fatos e situações reais.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta2"  value="B" onclick="clickRadioButton()">que trate com ideias e teorias.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class=" control-label col-lg-12 " style="text-align:left"> 3 . Eu prefiro obter novas informações através de:</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black" >
							<div class="radio">
								<label> <input type="radio" required name="resposta3"  value="A" onclick="clickRadioButton()">figuras, diagramas, gráficos ou mapas.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta3"  value="B" onclick="clickRadioButton()">instruções escritas ou informações verbais.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 4 . Quando resolvo problemas de matemática, eu:</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-12" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta4"  value="A" onclick="clickRadioButton()">usualmente preciso resolvê-los por etapas para então chegar a solução.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta4"  value="B" onclick="clickRadioButton()">usualmente antevejo a solução, mas às vezes me complico para resolver cada uma das etapas.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 5 . Em um grupo de estudo, trabalhando um material difícil, eu provavelmente:</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta5"  value="A" onclick="clickRadioButton()">tomo a iniciativa e contribuo com ideias.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta5"  value="B" onclick="clickRadioButton()">assumo uma posição observadora e analiso os fatos.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 6 . Acho mais fácil aprender:</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta6"  value="A" onclick="clickRadioButton()">a partir de experimentos.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta6"  value="B" onclick="clickRadioButton()">a partir de conceitos.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 7 . Ao ler um livro: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta7"  value="A" onclick="clickRadioButton()">eu primeiramente observo as figuras e desenhos.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta7"  value="B" onclick="clickRadioButton()">eu primeiramente me atento para o texto escrito.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 8 . É mais importante para mim que o professor: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta8"  value="A" onclick="clickRadioButton()">apresente a matéria em etapas sequenciais.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta8"  value="B" onclick="clickRadioButton()">apresente um quadro geral e relacione a matéria com outros assuntos.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 9 . Nas turmas em que já estudei, eu: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta9"  value="A" onclick="clickRadioButton()">fiz amizade com muitos colegas.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta9"  value="B" onclick="clickRadioButton()">fui reservado e fiz amizade com alguns colegas.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 10 . Ao ler textos técnicos ou científicos, eu prefiro: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta10"  value="A" onclick="clickRadioButton()">algo que me ensine como fazer alguma coisa.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta10"  value="B" onclick="clickRadioButton()">algo que me apresente novas ideias para pensar.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 11 . Relembro melhor: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta11" id="visualverbal1" value="A" onclick="clickRadioButton()">o que vejo. </label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta11" id="visualverbal2" value="B" onclick="clickRadioButton()">o que ouço.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 12 . Eu aprendo: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-12" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta12" id="visualverbal1" value="A" onclick="clickRadioButton()">num ritmo constante, etapa por etapa. </label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta12" id="visualverbal2" value="B" onclick="clickRadioButton()">em saltos. Fico confuso(a) por algum tempo e então, repentinamente, tenho um “estalo”.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 13 . Eu prefiro estudar: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta13" id="visualverbal1" value="A" onclick="clickRadioButton()">em grupo.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta13" id="visualverbal2" value="B" onclick="clickRadioButton()">sozinho.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 14 . Prefiro a ideia do: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta14" id="visualverbal1" value="A" onclick="clickRadioButton()">concreto.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta14" id="visualverbal2" value="B" onclick="clickRadioButton()">conceitual.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 15 . Quando vejo um diagrama ou esquema em uma aula, relembro mais facilmente:</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta15" id="visualverbal1" value="A" onclick="clickRadioButton()">a figura.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta15" id="visualverbal2" value="B" onclick="clickRadioButton()">o que o professor disse a respeito dela.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 16 . Quando estou aprendendo um assunto novo, eu prefiro:</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta16" id="visualverbal1" value="A" onclick="clickRadioButton()">concentrar-me exclusivamente no assunto, aprendendo o máximo possível.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta16" id="visualverbal2" value="B" onclick="clickRadioButton()">tentar estabelecer conexões entre o assunto e outros com ele relacionados.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 17 . Normalmente eu sou considerado(a) :</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta17" id="visualverbal1" value="A" onclick="clickRadioButton()">extrovertido(a).</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta17" id="visualverbal2" value="B" onclick="clickRadioButton()">reservado(a).</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 18 . Prefiro disciplinas que enfatizam:</label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta18" id="visualverbal1" value="A" onclick="clickRadioButton()">material concreto (fatos, dados).</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta18" id="visualverbal2" value="B" onclick="clickRadioButton()">material abstrato (conceitos, teorias).</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 19 . Quando alguém está me mostrando dados, eu prefiro: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta19" id="visualverbal1" value="A" onclick="clickRadioButton()">Diagramas ou gráficos</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta19" id="visualverbal2" value="B" onclick="clickRadioButton()">Texto sumarizando os resultados.</label>
							</div>
						</div>
					</div>
					
					<div class="form-group "style="text-align:center; color: black">
						<label class="control-label col-lg-12 "  style="text-align:left"> 20 . Quando estou resolvendo um problema eu: </label> <!-- ${questoes.pergunta} -->
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-12 " for="inputSuccess"></label>
						<div class="col-lg-6" style="color: black">
							<div class="radio">
								<label> <input type="radio" required name="resposta20" id="visualverbal1" value="A" onclick="clickRadioButton()">primeiramente penso nas etapas do processo para chegar a solução.</label>
							</div>
							<div class="radio">
								<label> <input type="radio" required name="resposta20" id="visualverbal2" value="B" onclick="clickRadioButton()">primeiramente penso nas consequências ou aplicações da solução.</label>
							</div>
						</div>
					</div>
			
					</div>
						
						<input type="hidden" name="tempoChegada" id="tempoChegada" value="">
						<input type="hidden" name="logPreTeste.id" id="logId" value="${logPreTeste.id}">
						<input type="hidden" name="logPreTeste.idUser" id="logIdUser" value="${logPreTeste.idUser}">
						<input type="hidden" name="logPreTeste.tempoPermanenciaEstilo" id="logTempoPermanenciaEstilo" value="${logPreTeste.tempoPermanenciaEstilo}">
						<input type="hidden" name="logPreTeste.tempoPermanenciaPreA" id="logTempoPermanenciaPreA" value="${logPreTeste.tempoPermanenciaPreA}">
						<input type="hidden" name="logPreTeste.tempoPermanenciaPreB" id="logTempoPermanenciaPreB" value="${logPreTeste.tempoPermanenciaPreB}">
						<input type="hidden" name="logPreTeste.tempoPermanenciaPreC" id="logTempoPermanenciaPreC" value="${logPreTeste.tempoPermanenciaPreC}">
				
				<div style="margin-top:50px; margin-left:175px" class="row">
				<button type="submit" onclick="antesDoSubmit()" class="btn btn-info btn-lg">CONTINUAR <i class="fa fa-arrow-right"></i></button>
				</div>	
				
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