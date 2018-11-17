<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="index" lang="es">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<spring:url value="/resources/js" var="JS"/>
	<spring:url value="/resources/css" var="CSS"/>
	<spring:url value="/resources/controller" var="CONTROLLER"/>
	<spring:url value="/resources/images" var="IMAGES"/>

	<script type="text/javascript" src="${JS}/jquery/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="${JS}/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="${JS}/jquery/ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${JS}/jquery/jq-signature.min.js"></script>
	<script type="text/javascript" src="${JS}/jquery/jquery.validate.min.js"></script>

	<script type="text/javascript" src="${CONTROLLER}/verificaciontransporteController.js"></script>

	<link href="${CSS}/bootstrap/bootstrap.min.css" rel="stylesheet"/>
	<link href="${CSS}/bootstrap/bootstrap-theme.min.css" rel="stylesheet"/>
	<link href="${CSS}/jquery/ui/jquery-ui.min.css" rel="stylesheet"/>
	<link href="${CSS}/table.css" rel="stylesheet"/>

	<title>PAE</title>
</head>
	<body>
		<div class="container">
			<br>
			<br>
			<br>
			<div  class="row" id="cuadro1">
			<div class="panel panel-default">
				<div class="panel-body">
					<div id="logos1" class="col-md-4" style="padding: 0%">
						<div class="logo1" >
							<img style="width: 100% " src="${IMAGES}/todosporunpaislogo.png">
						</div>
						<div  class="logo2">
							<img style=" width: 100%; margin-left: 5%" src="${IMAGES}/mineducacion_colombia_logo.png">
						</div>

					</div>
					<div class="col-md-5" style="margin-top: 3%; padding: 0.5rem; text-align: center">
						<strong>SISTEMA DE INFORMACIÓN PAE</strong><br>
						<strong>PROGRAMA DE ALIMIENTACIÓN ESCOLAR</strong> <br>
					</div>
					<div id="logos" class="col-md-3" style="padding: 0%">
						<div class="logo3" >
							<img style="width: 100%" src="${IMAGES}/mana_pensaengrande_horizontal.png">
						</div>
					</div>
				</div>
			</div>
				</div>

			<div  class="row" id="cuadro2">
				<div class="panel panel-default">
					<div class="panel-body">
						<div  class="col-md-7" style="padding: 0%">
							<div class="col-md-5" style="padding: 0%">
								<div style="width: 22%; float: left; margin-top: 3%;margin-right: 2%">
									<img style="width: 100% " src="${IMAGES}/todosporunpaislogo.png">
								</div>
								<div style="width: 33%; float: left; margin-top:5% ">
									<img style=" width: 100%;" src="${IMAGES}/mineducacion_colombia_logo.png">
								</div>
								<div style="width: 43%; float: left">
									<img style="width: 100%" src="${IMAGES}/mana_pensaengrande_horizontal.png">
								</div>
							</div>
						</div>
						<div class="col-md-5" style="margin-top: 1%; padding: 0.5rem; text-align: center">
							<strong>SISTEMA DE INFORMACIÓN PAE</strong><br>
							<strong>PROGRAMA DE ALIMIENTACIÓN ESCOLAR</strong> <br>
						</div>
					</div>
				</div>
			</div>

			<div  class="row" id="main" >

				<div class="panel panel-default">

					<div class="panel-body">
						<a  style="text-align: center" href="rest/verificacionviveres" role="button" class="col-md-6"><h4 class="viveres">Formulario Entrega Viveres</h4></a>
						<a style="text-align: center" class="col-md-6" href="rest/verificacionbodegas" role="button"><h4 class="viveres">Formulario Verificacion de Bodegas</h4></a>
						<a style="text-align: center" class="col-md-6" href="rest/verificaciontransporteviveres" role="button"><h4 class="viveres">Formulario Verificacion Condiciones de Transporte</h4></a>
						<a style="text-align: center" class="col-md-6"  href="rest/institucioneseducativas" role="button"><h4 class="viveres">Formulario Instituciones Educativas</h4></a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>