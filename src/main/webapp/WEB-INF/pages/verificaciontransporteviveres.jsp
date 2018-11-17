<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
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
    <script type="text/javascript" src="${JS}/util.js"></script>

    <script type="text/javascript" src="${CONTROLLER}/verificaciontransporteController.js"></script>

    <link href="${CSS}/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="${CSS}/bootstrap/bootstrap-theme.min.css" rel="stylesheet"/>
    <link href="${CSS}/jquery/ui/jquery-ui.min.css" rel="stylesheet"/>
    <link href="${CSS}/table.css" rel="stylesheet"/>

    <title>Control Programa Alimentacion Escolar PAE</title>
</head>

<body>
<div class="contenedores">
    <a style="float: right; width: 30px; position: relative; bottom: 40px;" href="../index"><img style="width: 100% " src="${IMAGES}/home-icon.png"></a>
</div>
<header style="text-align: center; margin-top: 5%">
    <div class="contenedores">
        <div class="panel panel-default">
            <div class="panel-body">
                <div id="logos" class="col-md-5" style="padding: 0%">
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
                <div class="col-md-5" style="margin-top: 1%; padding: 0.5rem;">
                    <strong>PROGRAMA DE ALIMIENTACIÓN ESCOLAR</strong><br>
                    <strong>Verificación de las condiciones de transporte de víveres</strong> <br>
                </div>
                <div class="col-md-2" style="margin: 0%; padding: 0px;">
                    <table border="1" style="border-radius: 5px; width: 100%;">
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Código</span></td>
                            <td style="padding: 0em;" class="texto_tabla"><span>&nbsp;ESC_06&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Versión</span></td>
                            <td style="padding: 0em;" class="texto_tabla"><span>02</span></td>
                        </tr>
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Fecha</span></td>
                            <td style="padding: 0em;" class="texto_tabla">
                                <span>&nbsp;&nbsp;20/05/2016&nbsp;&nbsp;</span></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</header>


<div style="margin: 0 auto; width: 80%;margin: auto">
    <form id="verificacionTransporteForm" enctype="multipart/form-data">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Objetivo del Instrumento</b>
                </h3>
            </div>
            <div class="panel-body">
                <h5>Realizar seguimiento a las condiciones de transporte de víveres de los alimentos del Programa de Alimentación Escolar.</h5>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Datos Generales</b>
                </h3>
            </div>
            <div class="panel-body">
                <h5 class="col-md-2 control-label" style=" padding-right: 0px;">1. Fecha de la visita</h5>
                <div class="col-md-2" style="padding-left: 0px; padding-right: 0px;">
                    <div class="input-group" id="divMiCalendario2">
                        <input type="text" id="txtFechaVisita" name="txtFechaVisita" class="form-control"
                               placeholder="Selecciona Fecha"/>
                        <span id="btnFechaVisita" class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <h5 class="col-md-2 control-label" style=" padding-right: 0px;">2.Subregión</h5>
                <div class="col-md-2" style="padding-left: 0px; padding-right: 0px;">
                    <select class="form-control" name="subregion" id="subregion">
                        <option value="-1" label="--- Select ---"/>
                        <c:forEach var="subregion" items="${listaSubregiones}">
                            <option value="${subregion.id}"> ${subregion.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                <h5 class="col-md-2 control-label"  style="padding-right: 0px;">3.Municipio</h5>
                <div class="col-md-2"  style="padding-left: 0px; ">
                    <select class="form-control" name="municipios" id="municipios">
                        <option value="-1" label="--- Select ---"/>
                    </select>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <h5 class="col-md-2 control-label">4.Operador</h5>
                <div class="col-md-4">
                    <input placeholder="" id="txtOperador" class="form-control" type="text"
                           name="txtOperador"
                           value=""/>
                </div>
                <h5 class="col-md-2 control-label">5.Proveedor</h5>
                <div class="col-md-4">
                    <input placeholder="" id="txtProveedor" class="form-control" type="text"
                           name="txtProveedor"
                           value=""/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-3 control-label">6.Alimientos que provee.</h5>
                <div class="col-md-9">
                    <input placeholder="" id="txtAlimentosProvee" class="form-control" type="text"
                           name="txtAlimentosProvee"
                           value=""/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <h5 class="col-md-1 control-label">7.Dirección</h5>
                <div class="form-group">
                    <div class="col-md-5">
                        <input placeholder="" class="form-control" type="text" name="txtDireccionProveedor"
                               id="txtDireccionProveedor"
                               value=""/>
                    </div>
                </div>
                <h5 class="col-md-1 control-label">8.Teléfono</h5>
                <div class="form-group">
                    <div class="col-md-5">
                        <input placeholder="" class="form-control" type="number" name="txtTelefonoProveedor"
                               id="txtTelefonoProveedor"
                               value=""/>
                    </div>
                </div>
            </div>
        </div>

            <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="text-align: center">
                                <b>Transporte</b>
                        </h3>
                    </div>
                    <div class="panel-body">
                        <h5 class="col-md-3 control-label" style="padding-left: 0px;">9.De operador a cabecera municipal.</h5>
                        <div class="col-md-3">
                            <input placeholder="" class="form-control" type="text" name="txtOperadorCabecera"
                                   id="txtOperadorCabecera"
                                   value=""/>
                        </div>
                        <h5 class="col-md-3 control-label"  style="padding-left: 0px;">10.De cabecera municipal a unidad aplicativa. </h5>
                        <div class="col-md-3">
                            <input placeholder="" class="form-control" type="text" name="txtCabeceraUnidad"
                                   id="txtCabeceraUnidad"
                                   value=""/>
                        </div>
                    </div>
        </div>

        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Condiciones de transporte de víveres</b>
                </h3>
            </div>
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>
                    <tr>
                        <th rowspan="2">Requisito</th>
                        <th colspan="2">Cumple</th>
                    </tr>
                    <tr>
                        <th>SI</th>
                        <th>NO</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <h5 id="pregunta1">11. El transporte se realiza en condiciones tales que excluye la contaminación y/o la proliferación de microorganismos
                            y protege contra la alteración del alimento o los daños del envase.</h5>
                        </td>
                        <td class="opciones"><input name="c1" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c1" type="radio" class="pregunta" value=false></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta2">12. Los alimentos y materias primas que por su naturaleza requieran mantenerse refrigerados o congelados
                                son transportados y distribuidos bajo condiciones que aseguren y garanticen el mantenimiento el mantenimiento de las condiciones de
                                refrigeración o congelación hasta su destino final.</h5>
                        </td>
                        <td class="opciones"><input name="c2" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c2" type="radio" class="pregunta" value=false></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta3">13. Los vehículos que posean sistemas de refrigeración o congelación, son sometidos a revisión periódica, con
                            el fin de que su funcionamiento garantice las temperaturas requeridas para la buena conservación de los alimentos y contarán con indicadores y sistemas de registro de estas temperaturas.</h5>
                        <td class="opciones"><input name="c3" type="radio" class="pregunta" value=true>
                        <td class="opciones"><input name="c3" type="radio" class="pregunta" value=false>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta4">14. Se revisan los vehículos antes de cargar los alimentos, con el fin de asegurar que se encuentren en buenas
                            condiciones sanitarias.</h5>
                        </td>
                        <td class="opciones"><input name="c4" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c4" type="radio" class="pregunta" value=false></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta5">15.Los vehículos son adecuados para el fin perseguido y fabricados con materiales tales que permitan una limpieza
                            fácil y completa.</h5>
                        <td class="opciones"><input name="c5" type="radio" class="pregunta" value=true>
                        <td class="opciones"><input name="c5" type="radio" class="pregunta" value=false>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta6">16. Se evidencian elementos para evitar el contacto de los alimentos directamente con el piso del vehículo.</h5>
                        </td>
                        <td class="opciones"><input name="c6" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c6" type="radio" class="pregunta" value=false></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta7">17. Se transportan conjuntamente en un mismo vehículo alimentos
                            y materias primas con sustancias peligrosas y otras que por  su naturaleza representen riesgo  de contaminación del alimento.</h5>
                        </td>
                        <td class="opciones"><input name="c7" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c7" type="radio" class="pregunta" value=false></td>
                    </tr>
                    <tr>
                        <td><h5 id="Pregunta9">18. Los vehículos transportadores de alimentos llevan en su exterior en forma claramente visible la leyenda:
                            Transporte de Alimentos.</h5>
                        </td>
                        <td class="opciones"><input name="c8" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c8" type="radio" class="pregunta" value=false></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Observaciones (Aspectos positivos y a mejorar)</b>
                </h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <h5>Observaciones:</h5>
                    <textarea class="form-control" rows="5" id="txtComentario" name="txtComentario"></textarea>
                </div>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Firmas</b>
                </h3>
            </div>
            <div class="panel-body">
                <table class="miyazaki">
                    <thead>
                    <tr>
                        <th >responsbale</th>
                        <th >profesional</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 id="nombreResponsable" style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Nombre</h5>
                                <div class="col-md-10 control-label" style=" padding-left:0px; padding-right:0px;">
                                    <input placeholder="" id="txtNombreResponsable" class="form-control" type="text"
                                           name="txtNombreResponsable"
                                           value=""/>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </td>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 id="nombreProfesional" style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Nombre</h5>
                                <div class="col-md-10 control-label" style=" padding-left:0px; padding-right:0px;">
                                    <input placeholder="" id="txtNombreProfesional" class="form-control" type="text"
                                           name="txtNombreProfesional"
                                           value=""/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 style="text-align: left; padding-left:0px; padding-right:0px;" id="urlFoto" class="col-md-2 control-label">Firma
                                </h5>
                                <div class="col-md-10 control-label" style="text-align: left; padding-left:0px; padding-right:0px;">
                                    <div class='js-signature'>

                                    </div>
                                    <input type="hidden" class="form-control" name="firma1" id="firma1">
                                    <p>
                                        <button type="button" id="clearBtnFirmaResponsable" class="btn btn-default"
                                                onclick="verificacionTransporteController.limpiarFirmaResponsable();">Limpiar
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td >
                            <div class="col-md-12 control-label">
                                <h5 style="text-align: left; padding-left:0px; padding-right:0px;" id="urlFotoP" class="col-md-2 control-label">Firma
                                </h5>
                                <div class="col-md-10 control-label" style="text-align: left; padding-left:0px; padding-right:0px;">
                                    <div class='js-signature'>
                                    </div>
                                    <input type="hidden" class="form-control" name="firma2" id="firma2">
                                    <p>
                                        <button type="button" id="clearBtnFirmaProfesional" class="btn btn-default"
                                                onclick="verificacionTransporteController.limpiarFirmaProfesional();">
                                            Limpiar
                                        </button>

                                    </p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="miyazaki">
                    <thead>
                    <tr>
                        <th>revisÓ</th>
                        <th>DIGITÓ</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 id="nombreReviso" style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Nombre</h5>
                                <div class="col-md-10 control-label" style=" padding-left:0px; padding-right:0px;">
                                    <input placeholder="" id="txtNombreReviso" class="form-control" type="text"
                                           name="txtNombreReviso"
                                           value=""/>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 id="nombreDigito"style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Nombre</h5>
                                <div class="col-md-10 control-label" style=" padding-left:0px; padding-right:0px;">
                                    <input placeholder="" id="txtNombreDigito" class="form-control" type="text"
                                           name="txtNombreDigito"
                                           value=""/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Firma
                                </h5>
                                <div class="col-md-10 control-label" style="text-align: left; padding-left:0px; padding-right:0px;">
                                    <div class='js-signature'>

                                    </div>
                                    <input type="hidden" class="form-control" name="firma3" id="firma3">
                                    <p>
                                        <button type="button" id="clearBtnFirmaReviso" class="btn btn-default"
                                                onclick="verificacionTransporteController.limpiarFirmaReviso();">Limpiar
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 style="text-align: left; padding-left:0px; padding-right:0px;" id="urlFotoR" class="col-md-2 control-label">Firma
                                </h5>
                                <div class="col-md-10 control-label" style="text-align: left; padding-left:0px; padding-right:0px;">
                                    <div class='js-signature'>
                                    </div>
                                    <input type="hidden" class="form-control" name="firma4" id="firma4">
                                    <p>
                                        <button type="button" id="clearBtnFirmaDigito" class="btn btn-default"
                                                onclick="verificacionTransporteController.limpiarFirmaDigito();">
                                            Limpiar
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div style="margin: 0 auto; width: 10%">
                    <button align="center" type="button" class="btn btn-default btn-primary"
                            onclick="verificacionTransporteController.enviarFormulario()">Enviar
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
