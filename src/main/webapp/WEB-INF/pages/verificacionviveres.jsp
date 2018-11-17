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

    <script type="text/javascript" src="${CONTROLLER}/verificacionviveresController.js"></script>

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
                    <strong>Verificación entrega de víveres</strong> <br>
                </div>
                <div class="col-md-2" style="margin: 0%; padding: 0px;">
                    <table border="1" style="border-radius: 5px; width: 100%;">
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Código</span></td>
                            <td style="padding: 0em;" class="texto_tabla"><span>&nbsp;ESC_05-01&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Versión</span></td>
                            <td style="padding: 0em;" class="texto_tabla"><span>05</span></td>
                        </tr>
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Fecha</span></td>
                            <td style="padding: 0em;" class="texto_tabla">
                                <span>&nbsp;&nbsp;30/03/2016&nbsp;&nbsp;</span></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="contenedores">
    <form id="logisticaEntregaForm" enctype="multipart/form-data">
        <div class="panel panel-default">
            <div class="panel-body">
                <h5 class="col-md-1 control-label">Subregión</h5>
                <div class="col-md-3">
                    <select class="form-control" name="subregion" id="subregion">
                        <option value="-1" label="--- Select ---"/>
                        <c:forEach var="subregion" items="${listaSubregiones}">
                            <option value="${subregion.id}"> ${subregion.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                <h5 class="col-md-1 control-label">Municipio</h5>
                <div class="col-md-3">
                    <select class="form-control" name="municipios" id="municipios">
                        <option value="-1" label="--- Select ---"/>
                    </select>
                </div>
                <h5 class="col-md-1 control-label">Operador</h5>
                <div class="col-md-3">
                    <input name="txtOperador" id="txtOperador" class="form-control" type="text"/>
                </div>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Identificación del Proveedor</b>
                </h3>
            </div>
            <div class="panel-body">
                <h5 class="col-md-2 control-label">1. Tiene Proveedor Local</h5>
                <div class="col-md-1">
                    <div class="radio">
                        <h5><input type="radio" name="snProveedor"
                                   value=true checked>SI
                        </h5> <h5><input type="radio" name="snProveedor"
                                         value=false>NO
                    </h5>
                    </div>
                </div>

                <h5 class="col-md-2 control-label">2. Nombre o razón social
                    del proveedor</h5>
                <div class="col-md-3">
                    <input placeholder="" id="txtNombreProveedor" class="form-control" type="text"
                           name="txtNombreProveedor"
                           value=""/>
                </div>
                <h5 class="col-md-1 control-label">3.Nit./C.C.</h5>
                <div class="col-md-3">
                    <input placeholder="" class="form-control" type="text" name="txtIdentificacionProveedor"
                           id="txtIdentificacionProveedor"
                           value=""/>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <div class="form-group">
                    <h5 class="col-md-1 control-label">4.Teléfono</h5>
                    <div class="form-group">
                        <div class="col-md-3">
                            <input placeholder="" class="form-control" type="number" name="txtTelefonoProveedor"
                                   id="txtTelefonoProveedor"
                                   value=""/>
                        </div>
                    </div>

                    <h5 class="col-md-1 control-label">5.Dirección</h5>
                    <div class="form-group">
                        <div class="col-md-7">
                            <input placeholder="" class="form-control" type="text" name="txtDireccionProveedor"
                                   id="txtDireccionProveedor"
                                   value=""/>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-2 control-label">5.Fecha de la Entrega</h5>
                <div class="col-md-2">
                    <div class="input-group" id="divMiCalendario2">
                        <input type="text" id="txtFechaEntrega" name="txtFechaEntrega" class="form-control"
                               placeholder="Selecciona Fecha"/>
                        <span id="btnFechaEntrega" class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                    </div>
                </div>
                <h5 class="col-md-2 control-label">6.Hora Inicio de la Entrega</h5>
                <div class="col-md-2">
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker2'>
                            <input type='time' class="form-control" id="horaInicioEntrega" name="horaInicioEntrega"/>
                        </div>
                    </div>
                </div>
                <h5 class="col-md-2 control-label" style="padding-top: 0px;">7.Hora final de la Entrega</h5>
                <div class="col-md-2">
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker3'>
                            <input type='time' class="form-control" id="horaFinEntrega" name="horaFinEntrega"/>
                            </span>
                        </div>
                    </div>
                </div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <div class="form-group">
                    <h5 class="col-md-5 control-label">8. Nombre del responsable
                        de la entrega</h5>
                    <div class="col-md-7">
                        <input placeholder="" class="form-control" type="text" name="txtNombreResponsableEntrega"
                               id="txtNombreResponsableEntrega"
                               value=""/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <h5 class="col-md-5 control-label">9. Nombre del responsable
                    municipal de la recepción de víveres</h5>
                <div class="col-md-7">
                    <input placeholder="" class="form-control" type="text" name="txtNombreResponsableRecepcion"
                           id="txtNombreResponsableRecepcion"
                           value=""/>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <h5 class="col-md-1 control-label">10. Semanas entregas</h5>
                <div class="col-md-2">
                    <div class="checkbox">
                        <label> <input type="checkbox" name="checkboxSemanasEntregadas"
                                       value="1">1
                        </label>
                        <label> <input type="checkbox" name="checkboxSemanasEntregadas"
                                       value="2">2
                        </label>
                        <label> <input type="checkbox" name="checkboxSemanasEntregadas"
                                       value="3">3
                        </label>
                        <label> <input type="checkbox" name="checkboxSemanasEntregadas"
                                       value="4">4
                        </label>
                    </div>
                </div>
                <h5 class="col-md-1 control-label">11. Días entregados</h5>
                <div class="col-md-2">
                    <input placeholder="" class="form-control" type="number" name="numDiasEntregados"
                           id="numDiasEntregados" min="1"
                           value=""/>
                </div>
                <h5 class="col-md-1 control-label">Desde</h5>
                <div class="col-md-2">
                    <div class='input-group date' id='divCalendarioDesde'>
                        <input type="text" id="txtFechaDesde" name="txtFechaDesde" class="form-control"
                               placeholder="Selecciona Fecha"/>
                        <span id="btnFechaDesde" class="input-group-addon">
                            <span
                                    class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <h5 class="col-md-1 control-label">Hasta</h5>
                <div class="col-md-2" style="margin-left: 0px;">
                    <div class='input-group date' id='divCalendarioHasta'>
                        <input type="text" id="txtFechaHasta" name="txtFechaHasta" class="form-control"
                               placeholder="Selecciona Fecha"/>
                        <span id="btnFechaHasta" class="input-group-addon">
                            <span
                                    class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="panel-heading">
            <h3 class="panel-title" style="color: #761c19; font-size : 14px">
                <i><b>*Tener en cuenta:  C= Cumple, NC = No Cumple </b></i>
            </h3>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Logística entrega de víveres</b>
                </h3>
            </div>
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>
                    <tr>
                        <th>Ítem Evaluado</th>
                        <th>C</th>
                        <th>NC</th>
                        <th>observaciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <h5 id="pregunta1">1. Se entrega en la fecha y hora concertada con el
                                operador/proveedor.</h5>
                        </td>
                        <td class="opciones"><input name="c1" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c1" type="radio" class="pregunta" value=false></td>
                        <td><textarea id="txtAreaObservacionesc1" name="txtAreaObservacionesc1" class="form-control" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta2">2. Cumplen con las cantidades solicitadas de cada
                            producto según lista de entrega de víveres</h5>
                        </td>
                        <td class="opciones"><input name="c2" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c2" type="radio" class="pregunta" value=false></td>
                        <td><textarea id="txtAreaObservacionesc2" name="txtAreaObservacionesc2" class="form-control" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta3">3. Cumplen con las unidades de medida de cada producto
                            según lista de entrega de víveres</h5>
                        <td class="opciones"><input name="c3" type="radio" class="pregunta" value=true>
                        <td class="opciones"><input name="c3" type="radio" class="pregunta" value=false>
                        <td><textarea id="txtAreaObservacionesc3" name="txtAreaObservacionesc3" class="form-control" maxlength="130"></textarea>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta4">4. La calidad de los alimentos es buena, en cuanto a
                            color, olor, textura (apariencia física)</h5>
                        </td>
                        <td class="opciones"><input name="c4" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c4" type="radio" class="pregunta" value=false></td>
                        <td><textarea id="txtAreaObservacionesc4" name="txtAreaObservacionesc4" class="form-control" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta5">5. Los productos se organizan en paquetes según
                            programación y acta de víveres para cada unidad aplicativa.</h5>
                        <td class="opciones"><input name="c5" type="radio" class="pregunta" value=true>
                        <td class="opciones"><input name="c5" type="radio" class="pregunta" value=false>
                        <td><textarea id="txtAreaObservacionesc5" name="txtAreaObservacionesc5" class="form-control" maxlength="130"></textarea>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta6">6. El almacenamiento de los productos permite la
                            conservación y calidad de los mismos.</h5>
                        </td>
                        <td class="opciones"><input name="c6" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c6" type="radio" class="pregunta" value=false></td>
                        <td><textarea id="txtAreaObservacionesc6" name="txtAreaObservacionesc6" class="form-control" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta7">7. Los productos recibidos cumplen las marcas
                            autorizadas por la GSAN y/o Municipio.</h5>
                        </td>
                        <td class="opciones"><input name="c7" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c7" type="radio" class="pregunta" value=false></td>
                        <td><textarea id="txtAreaObservacionesc7" name="txtAreaObservacionesc7" class="form-control" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="Pregunta8">8. El producto devuelto o faltante se repone antes de
                            las 24 horas siguientes a la entrega para no afectar la
                            Programación.</h5>
                        </td>
                        <td class="opciones"><input name="c8" type="radio" class="pregunta" value=true></td>
                        <td class="opciones"><input name="c8" type="radio" class="pregunta" value=false></td>
                        <td><textarea id="txtAreaObservacionesc8" name="txtAreaObservacionesc8" class="form-control" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td rowspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td rowspan="2" class="opciones">
                            <h5>(&Sigma; C/8)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumple" id="totalCumple"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumple" id="totalNoCumple" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h5>Porcentaje cumplimiento logística de entregas</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimiento"
                                   id="porcentajeCumplimiento" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Registrar las marcas de los alimentos</b>
                </h3>
            </div>
            <div class="panel-body">
                <table class="miyazaki">
                    <thead>
                    <tr>
                        <th rowspan="2">Alimento</th>
                        <th rowspan="2">Marca</th>
                        <th colspan="2">Aprobada por la GSAN</th>
                    </tr>
                    <tr>
                        <th >
                            SI
                        </th>
                        <th >
                            NO
                        </th>
                    </tr>

                    </thead>
                    <tbody>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado1" id="alimentoRegistrado1">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento1" class="form-control" type="text"
                                   name="txtMarcaAlimento1"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento1" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento1" type="radio" value=false></td>
                    </tr>
                    <tr>

                        <td><select class="form-control alimento" name="alimentoRegistrado2" id="alimentoRegistrado2">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento2" class="form-control" type="text"
                                   name="txtMarcaAlimento2"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento2" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento2" type="radio" value=false></td>

                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado3" id="alimentoRegistrado3">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento3" class="form-control" type="text"
                                   name="txtMarcaAlimento3"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento3" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento3" type="radio" value=false></td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado4" id="alimentoRegistrado4">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento4" class="form-control" type="text"
                                   name="txtMarcaAlimento4"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento4" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento4" type="radio" value=false></td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado5" id="alimentoRegistrado5">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento5" class="form-control" type="text"
                                   name="txtMarcaAlimento5"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento5" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento5" type="radio" value=false></td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado6" id="alimentoRegistrado6">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento6" class="form-control" type="text"
                                   name="txtMarcaAlimento6"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento6" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento6" type="radio" value=false></td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado7" id="alimentoRegistrado7">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento7" class="form-control" type="text"
                                   name="txtMarcaAlimento7"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento7" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento7" type="radio" value=false></td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado8" id="alimentoRegistrado8">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento8" class="form-control" type="text"
                                   name="txtMarcaAlimento8"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento8" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento8" type="radio" value=false></td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado9" id="alimentoRegistrado9">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento9" class="form-control" type="text"
                                   name="txtMarcaAlimento9"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento9" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento9" type="radio" value=false></td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado10" id="alimentoRegistrado10">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input placeholder="" id="txtMarcaAlimento10" class="form-control" type="text"
                                   name="txtMarcaAlimento10"
                                   value=""/></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento10" type="radio" value=true></td>
                        <td class="opciones"><input name="aprobacionGsanAlimento10" type="radio" value=false></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Evidencias</b>
                </h3>
            </div>
            <div class="panel-body">
                <p>Seleccione las fotos que desea cargar. Pulse el botón Agregar para agregar más fotos.</p>
                <table id="fileTable">
                    <tr>
                        <td><input name="foto[0]" type="file"/></td>
                    </tr>
                </table>
                <br/>
                <button id="agregarFoto" type="button">Agregar Foto</button>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Comentarios</b>
                </h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <h5>Comentarios:</h5>
                    <textarea class="form-control" rows="5" id="txtComentario" name="txtComentario"></textarea>
                </div>
            </div>
        </div>
        </br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Responsables</b>
                </h3>
            </div>
            <div class="panel-body">
                <table class="miyazaki">
                    <thead>
                    <tr>
                        <th colspan="2">Responsable operador/proveedor</th>
                        <th colspan="2">Responsable que realiza verificación</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="2">
                            <div class="col-md-8 control-label">
                                <h5 style="text-align: left;" id="urlFoto" class="col-md-2 control-label"><b>Firma</b>
                                </h5>
                                <div class="col-md-8 control-label">
                                    <div class='js-signature'>

                                    </div>
                                    <input type="hidden" class="form-control" name="firma1" id="firma1">
                                    <p>
                                        <button type="button" id="clearBtnFirmaOperador" class="btn btn-default"
                                                onclick="verificacionViveresController.limpiarFirmaOperador();">Limpiar
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td colspan="2">
                            <div class="col-md-8 control-label">
                                <h5 style="text-align: left;" id="urlFotoR" class="col-md-2 control-label"><b>Firma</b>
                                </h5>
                                <div class="col-md-8 control-label">
                                    <div class='js-signature'>
                                    </div>
                                    <input type="hidden" class="form-control" name="firma2" id="firma2">
                                    <p>
                                        <button type="button" id="clearBtnFirmaVerificador" class="btn btn-default"
                                                onclick="verificacionViveresController.limpiarFirmaVerificador();">
                                            Limpiar
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><h5 id="nombreOperador">Nombre</h5></td>
                        <td><input placeholder="" id="txtNombreOperador" class="form-control" type="text"
                                   name="txtNombreOperador"
                                   value=""/></td>
                        <td><h5 id="nombreR">Nombre</h5></td>
                        <td><input placeholder="" id="txtNombreResponsable" class="form-control" type="text"
                                   name="txtNombreResponsable"
                                   value=""/></td>
                    </tr>
                    <tr>
                        <td><h5 id="cedulaOperador">C.C</h5></td>
                        <td><input placeholder="" id="txtCedulaOperador" class="form-control" type="text"
                                   name="txtCedulaOperador"
                                   value=""/></td>
                        <td><h5 id="cedulaR">C.C</h5></td>
                        <td><input placeholder="" id="txtCedulaResponsable" class="form-control" type="text"
                                   name="txtCedulaResponsable"
                                   value=""/></td>
                    </tr>
                    <tr>
                        <td><h5 id="cargoOperador">Cargo</h5></td>
                        <td><input placeholder="" id="txtCargoOperador" class="form-control" type="text"
                                   name="txtCargoOperador"
                                   value=""/></td>
                        <td><h5 id="cargoR">Cargo</h5></td>
                        <td><input placeholder="" id="txtCargoResponsable" class="form-control" type="text"
                                   name="txtCargoResponsable"
                                   value=""/></td>
                    </tr>
                    <tr>
                        <td><h5 id="telefonoOperador">Teléfono</h5></td>
                        <td><input placeholder="" id="txtTelefonoOperador" class="form-control" type="text"
                                   name="txtTelefonoOperador"
                                   value=""/></td>
                        <td><h5 id="telefonoR">Télefono</h5></td>
                        <td><input placeholder="" id="txtTelefonoResponsable" class="form-control" type="text"
                                   name="txtTelefonoResponsable"
                                   value=""/></td>
                    </tr>
                    <tr>
                        <td><h5 id="EmailOperador">Email</h5></td>
                        <td><input placeholder="" id="txtEmailOperador" class="form-control" type="email"
                                   name="txtEmailOperador"
                                   value=""/></td>
                        <td><h5 id="emailR">Email</h5></td>
                        <td><input placeholder="" id="txtEmailResponsable" class="form-control" type="email"
                                   name="txtEmailResponsable"
                                   value=""/></td>
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
                            onclick="verificacionViveresController.enviarFormulario()">Enviar
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>