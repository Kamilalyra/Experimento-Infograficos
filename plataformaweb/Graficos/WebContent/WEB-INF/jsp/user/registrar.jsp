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


  <body class="login-body">

    <div class="container">

      <form class="form-signin" action="<c:url value="user/salvaRegistro"/>">
        <h2 class="form-signin-heading">cadastro</h2>
        <div class="login-wrap" style="color: black">
            <p style="color: black">Entre com suas informações abaixo</p>
            <label class="col-lg-11 control-label" style="text-align: left">Nome:</label>
            <input style="color: black" type="text" class="form-control" name="user.nome"  autofocus >
            <label class="col-lg-11 control-label" style="text-align: left">Idade</label>
            <input type="text" class="form-control" name="user.idade" autofocus>
            <label class="col-lg-11 control-label" style="text-align: left">Escolaridade</label>
	                <select class="input-sm m-bot15" name="user.escolaridade">
	                   <option>Superior-Incompleto</option>
	                   <option>Superior-Completo</option>
	                   <option>Pós-graduação (mestrado)-Incompleto</option>
	                   <option>Pós-graduação (mestrado)-Completo</option>
	                   <option>Pós-graduação (doutorado)-Incompleto</option>
	                   <option>Pós-graduação (doutorado)-Completo</option>
	               </select>
			
			<label class="col-lg-11 control-label" style="text-align: left">Sexo:</label> 
			<div class="col-lg-6"  >	
				<div  class="radio">
					<input type="radio" name="user.sexo" value="F">Feminino</div>
				<div  class="radio">
					<input type="radio" name="user.sexo" value="M">Masculino</div>
			</div>
			
			<label class="col-lg-11 control-label" style="text-align: left">Número USP:</label>
            <input type="text" class="form-control" name="user.nrousp" autofocus>
           
            <button class="btn btn-lg btn-login btn-block" type="submit">Registrar</button>

            <div class="registration">
                Já tem cadastro?
                <a class="" href="<c:url value="/login"/>">
                    Login
                </a>
            </div>

        </div>

      </form>

    </div>


    <!-- Placed js at the end of the document so the pages load faster -->

    <!--Core js-->
    <script src="js/lib/jquery.js"></script>
    <script src="bs3/js/bootstrap.min.js"></script>

  </body>
</html>