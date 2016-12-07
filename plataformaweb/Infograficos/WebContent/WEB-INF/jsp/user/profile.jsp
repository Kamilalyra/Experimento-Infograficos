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

<title>E-class</title>
</head>


<body> <!--class="full-width"-->

<section id="container" >

 <!--main content start-->
    <section id="">
        <section class="wrapper">
        <!-- page start-->

        <div class="row">
            <div class="col-md-12">
                <section class="panel">
                    <div class="panel-body profile-information">
                       <div class="col-md-3">
                           <div class="profile-pic text-center">
                               <img src="images/disciplina/matematica1_cor.png" alt=""/>
                           </div>
                       </div>
                       <div class="col-md-6">
                           <div class="profile-desk" style="color: black">
                               <h1>${userWeb.nome}</h1>
							   
							   Questões certas: <font style="color:green; font-size:20px"><strong>${userWeb.qtdAcertos}</strong></font>
							   <br>
							   Questões erradas: <font style="color:red; font-size:20px"><strong>${userWeb.qtdErros}</strong></font>
							   <br></br>
							   <p>
                                   Este é o seu perfil! Aqui você pode ver tudo sobre seu progresso no E-class! 
                                   
                                   </p>
                                   <p>Por favor, responda um breve questionário sobre a atividade desenvolvida e o que você achou!</p>
							   
							   
									
                           </div>
                           
                           
                        <div style="margin-top:30px;" class="row">
				            <div class="col-sm-12">
				                <section class="panel">
									
				                    <div style="text-align:center;" class="panel-body">
				                   		<form action="<c:url value="/questionarios3"/>">
					                        <button type="submit" class="btn btn-info btn-lg">Responder o questionário <i class="fa fa-arrow-right"></i></button>
				                        </form>
				                    </div>
				                </section>
				            </div>
				        </div>
				        
				        
                       </div>
                      
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


</body>
</html>