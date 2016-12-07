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
	<link href="css/style-estilo.css" rel="stylesheet" />


<title>Pré Teste</title>

</head>


<body onload="setValue()">


<section id="container" >

   <!--main content start-->
    <section id="">
        <section class="wrapper">
        <!-- page start-->
            
<div class="row">
            <div class="col-sm-12">
                <section class="panel">
                    <header class="panel-heading">
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                        </span>
                    </header>
                    <div class="panel-body">
                    <input type="hidden" name="badges" id="badges" value="${avisaBadge}"> 
					<form class="form-horizontal bucket-form" method="get">
						<div>
						<h2>OBRIGADO!</h2>
							<label class="control-label" style="text-align: justify">
								<b>
								Olá ${userWeb.nome}! 
								<br>
								Muito obrigado pela sua contribuição nessa primeira fase.  
								Se desejar obter mais informações sobre estilos de aprendizagem ou se tiver dúvidas ou 
								comentários sobre essa atividade, por favor, contate o seu professor ou os pesquisadores.
								</b>
						 	</label><p></p>
						</div>          
						<br></br>
				
						
						<div class="title">Veja abaixo qual o resultado do seu teste para estilo de aprendizagem</div>
										<div style="text-align: center; padding-bottom:4% ">Passe o mouse sobre o texto para ter mais infomações. </div>
								<div id="visualverbal" class="group">
									<div class="dimension l">					
										<img src="images/estilos/visual.svg" alt="Visual" >
										<div class="desc" data-toggle="popover" data-trigger="hover" data-placement="top" title="Aprendizes Visuais" data-content="Aprendizes visuais aprendem melhor quando a informação é apresentada visualmente através de fotos, diagramas, fluxogramas, filmes, gráficos e demonstrações. Relembram melhor o que viram.">Visual</div>
									</div>
									<div class="values">
										<div class="value 5a"></div>
										<div class="value 3a"></div>
										<div class="value 1a"></div>
										<div class="value 1b"></div>
										<div class="value 3b"></div>
										<div class="value 5b"></div>
									</div>
									<div class="dimension r">
										<img src="images/estilos/verbal.svg" alt="Verbal">
										<div class="desc" data-toggle="popover" data-trigger="hover" data-placement="top" title="Aprendizes Verbais" data-content="Aprendizes verbais aprendem melhor quando a infomação é apresentada verbalmente. Dessa forma recordam com mais facilidade aquilo que escutam ou lêem. ">Verbal</div>
									</div>
								</div>
								<div id="sensorialintuitivo" class="group">
									<div class="dimension l">
										<img src="images/estilos/sensorial.svg" alt="Sensorial">
										<div class="desc"data-toggle="popover" data-trigger="hover" data-placement="top" title="Aprendizes Sensoriais" data-content="Aprendizes sensoriais tendem a ser práticos, gostam de aprender através de fatos e observações e a resolver problemas usando procedimentos bem estabelecidos. Preferem cursos que tenham conexão aparente com o mundo real. O sensitivo é atento, detalhista, paciente e metódico e podem ser bons experimentalistas.">Sensorial</div>					
									</div>
									<div class="values">
										<div class="value 5a"></div>
										<div class="value 3a"></div>
										<div class="value 1a"></div>
										<div class="value 1b"></div>
										<div class="value 3b"></div>
										<div class="value 5b"></div>
									</div>
									<div class="dimension r">
										<img src="images/estilos/intuitivo.svg" alt="Intuitivo">
										<div class="desc" data-toggle="popover" data-trigger="hover" data-placement="top" title="Aprendizes Intuitivos" data-content="Aprendizes Intuitivos tendem a ser mais imaginativos e inovadores. Preferem conceitos e interpretações e se sentem mais confortáveis em lidar com símbolos e abstrações. Gostam de novidades e se aborrecem com a repetição. São mais rápidos nos trabalhos.">Intuitivo</div>
									</div>
								</div>
								<div id="ativoreflexivo" class="group">
									<div class="dimension l">
										<img src="images/estilos/ativo.svg" alt="Ativo">
										<div class="desc" data-toggle="popover" data-trigger="hover" data-placement="top" title="Aprendizes Ativos" data-content="Aprendizes ativos tendem a reter e compreender melhor a informação fazendo algo ativo, discutindo, aplicando ou explicando para os outros. Preferem trabalhos em grupos, são habilidosos em coordenação de projetos.''Vamos experimentar e ver como funciona'' é a frase que caracteriza os aprendizes ativos. ">Ativo</div>					
									</div>
									<div class="values">
										<div class="value 5a"></div>
										<div class="value 3a"></div>
										<div class="value 1a"></div>
										<div class="value 1b"></div>
										<div class="value 3b"></div>
										<div class="value 5b"></div>
									</div>
									<div class="dimension r">
										<img src="images/estilos/reflexivo.svg" alt="Reflexivo">
										<div class="desc" data-toggle="popover" data-trigger="hover" data-placement="top" title="Aprendizes Reflexivos" data-content="Aprendizes reflexivos preferem processar a informação de forma reflexiva, ou seja, pensar sobre algo primeiro. Preferem trabalhar em projetos e pesquisas individuais. ''Vamos primeiro meditar sobre o assunto'' é a resposta dos aprendizes reflexivos.">Reflexivo</div>
									</div>
								</div>
								<div id="sequencialglobal" class="group">
									<div class="dimension l">
										<img src="images/estilos/sequencial.svg" alt="Sequencial">
										<div class="desc" data-toggle="popover" data-trigger="hover" data-placement="top" title="Aprendizes Sequenciais" data-content="Aprendizes sequenciais tendem a aprender de forma linear, para encontrar soluções. São muitas vezes bons analistas e hábeis para resolver problemas.">Sequencial</div>					
									</div>
									<div class="values">
										<div class="value 5a"></div>
										<div class="value 3a"></div>
										<div class="value 1a"></div>
										<div class="value 1b"></div>
										<div class="value 3b"></div>
										<div class="value 5b"></div>
									</div>
									<div class="dimension r">
										<img src="images/estilos/global.svg" alt="Global">
										<div class="desc" data-toggle="popover" data-trigger="hover" data-placement="top" title="Aprendizes Globais" data-content="Aprendizes Globais aprendem quase que aleatoriamente em saltos grandes, holisticamente, sem ver as conexões para, então, repentinamente, ''compreender'' tudo. Podem ser hábeis em resolver rapidamente problemas complexos ou unir coisas, mas têm dificuldades de explicar como fizeram. São muitas vezes bons sintetizadores.">Global</div>
									</div>
								</div>
						
						
					</form>
                    </div>
                </section>
            </div>
        </div>
		
			<input type="hidden" class="estilo" name="estilo.ativoreflexivo" id="atiref" value="${estilo.ativoreflexivo}">
			<input type="hidden" class="estilo" name="estilo.sensorialintuitivo" id="senint" value="${estilo.sensorialintuitivo}">
			<input type="hidden" class="estilo" name="estilo.sequencialglobal" id="seqglo" value="${estilo.sequencialglobal}">
			<input type="hidden" class="estilo" name="estilo.visualverbal" id="visver" value="${estilo.visualverbal}">
				
		
		<div style="margin-top:30px;" class="row">
            <div class="col-sm-12">
                <section class="panel">
					
                    <div style="text-align:center;" class="panel-body">
                   		<form action="<c:url value="/botaoOk"/>">
	                        <button type="submit" class="btn btn-info btn-lg">Finalizar <i class="fa fa-arrow-right"></i></button>
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

<script type="text/javascript">

$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
});


function setValue()
{
	var estilo = document.getElementsByClassName("estilo");
	var i;	
	for(i = 0; i < estilo.length; i++)
	{
		var group = estilo[i].name.split(".")[1];
		var value = estilo[i].value;
		
		group = group.toLowerCase();
		value = value.toLowerCase();

		var groupElem = document.getElementById(group);
		var className = groupElem.getElementsByClassName("value");
		var j;
		for (j = 0; j < className.length; j++) 
		{
			console.log(className[j].classList[1]);
			if(className[j].classList[1] == value)
			{
				className[j].className = className[j].className + " selected";	
			}
		}
	}
	console.log(estilo);
}

</script>


</body>
</html>
