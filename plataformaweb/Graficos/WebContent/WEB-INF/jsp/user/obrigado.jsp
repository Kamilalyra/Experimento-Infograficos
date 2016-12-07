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

<title>Obrigado</title>

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
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                           
                         </span>
                    </header>
                    <div class="panel-body" style=" margin-left:5px;  margin-right:10px">
                    <input type="hidden" name="badges" id="badges" value="${avisaBadge}"> 
					<form class="form-horizontal bucket-form" method="get">
						<div>
						<h4>OBRIGADO!</h4>
							<label class="control-label" style="text-align: justify"> 
								<br>
								<big>
								<b>
								Ol� ${userWeb.nome}!
								<br>
								Muito bem, voc� acabou de ler os 15 textos. 
								O teste a seguir � composto de 45 quest�es sobre os textos que voc� acabou de ler e 
								tem como objetivo medir o quanto voc� conseguiu aprender sobre eles.
								
								Responda as quest�es com aten��o.
								
								Bom trabalho!						
								</big><br> 
								</b>
							 </label><p></p>
							
						</div>          
						<br></br>
				
				
						
					</form>
                    </div>
                </section>
            </div>
        </div>
		
		<div style="margin-top:30px;" class="row">
            <div class="col-sm-12">
                <section class="panel">
					
                    <div style="text-align:center;" class="panel-body">
                   		<form action="<c:url value="/carregaQuestoes"/>">
	                    
		                    <input type="hidden" name="logPos.id" id="logId" value="${logPos.id}">
							<input type="hidden" name="logPos.idUser" id="logIdUser" value="${logPos.idUser}">
							<input type="hidden" name="logPos.tempoPermanenciaPosA" id="logTempoPermanenciaPosA" value="${logPos.tempoPermanenciaPosA}">
							<input type="hidden" name="logPos.tempoPermanenciaPosB" id="logTempoPermanenciaPosB" value="${logPos.tempoPermanenciaPosB}">
							<input type="hidden" name="logPos.tempoPermanenciaPosC" id="logTempoPermanenciaPosC" value="${logPos.tempoPermanenciaPosC}">
					 	
	                    
	                        <button type="submit" class="btn btn-info btn-lg">Responder teste <i class="fa fa-arrow-right"></i></button>
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
