<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">




<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="images/favicon.html">

   <!--Core CSS -->
    <link href="bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

<title>Pré Teste</title>

</head>


<body>


<section id="container" >

   <!--main content start-->
    <section id="">
        <section class="wrapper">
        <!-- page start-->
            
<div class="row">
            <div class="col-sm-12">
                <section class="panel">
                    <header class="panel-heading">
                        <h2>Bem vindo(a)!</h2>
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                           
                         </span>
                    </header>
                    <div class="panel-body">
                    <input type="hidden" name="badges" id="badges" value="${avisaBadge}"> 
					<form class="form-horizontal bucket-form" method="get">
						<div style="color: black">
						<h3>Olá ${userWeb.nome}!</h3>
							<label class="control-label" style="text-align: justify"> 
							<br>
							<b>
							Você está participando de uma atividade desenvolvida pelo <b>Laboratório de Computação Aplicada a Educação da USP</b>.
							&nbsp&nbsp<img alt="" src="images/disciplina/Logo_transparente.png" height="124" width="256">
							<big>
							<br><br>
							O objetivo desta atividade é reunir dados para comparar como ocorre o aprendizado dos alunos que utilizam diferentes tipos de materiais educacionais e 
							 verificar a influência dos estilos de aprendizagem e estados emocionais nesse processo. 	
							A atividade está dividida em três fases: 
							<br><br>
							A) Pré-teste de conhecimento e questionário de estilo de aprendizagem;<br>
							B) Interação com o material educacional e pós-teste de conhecimento; e  <br>
							C) Teste de retenção de conhecimento.
							<br><br>
							Hoje você completará a fase A dessa atividade. Nessa fase você responderá 45 questões, em sua maioria relacionadas ao tema "meio ambiente", mas não somente.
							Esse teste vai servir de parâmetro para medir o quanto você vai aprender sobre esse tema nas próximas semanas. Se não souber a resposta evite 
							"chutar" e opte pela alternativa "Não sei".
							<br><br>
							
							Posteriormente, será apresentado um questionário para dizer qual seu estilo de aprendizagem, ou seja, a forma como você prefere receber e processar infomações . 
							O questionário é composto por 20 perguntas adaptadas por <a href="http://repositorio.unesp.br/handle/11449/100339">Vieira Junior(2012)</a>.  
							</b> </big>
							<br><br>
						
							
							</label>
						</div>          
						<br></br>
						
						
					</form>
                    </div>
                </section>
            </div>
        </div>
       
		
		
		<div style="margin-top:5px;" class="row">
            <div class="col-sm-12">
                <section class="panel">
					
                    <div style="text-align:center;" class="panel-body">
                   		<form action="<c:url value="/carregaQuestoes"/>">
	                    	<input type="hidden" name="responder" id="responder" value="true" />
	                        <button type="submit" class="btn btn-info btn-lg">Responder Questões <i class="fa fa-arrow-right"></i></button>
                        </form>
                    </div>
                </section>
            </div>
        </div>
        
		<!-- page end-->
        </section>
    </section>
    <!--main content end-->

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
          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
              <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="alert alert-success alert-block fade in">
                                <!--<button data-dismiss="alert" class="close close-sm" type="button">
                                    <i class="fa fa-times"></i>
                                </button>-->
                                <h4>
                                    <i class="icon-ok-sign"></i>
                                    Success!
                                </h4>
                                <p>Best check yo self, you're not looking too good...</p>
                            </div>
                  </div>
              </div>
          </div>
          <!-- modal -->




</body>
</html>
