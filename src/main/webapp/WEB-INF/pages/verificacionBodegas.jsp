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

    <script type="text/javascript" src="${CONTROLLER}/verificacionbodegasController.js"></script>

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
                    <strong>Verificación a bodegas de proveedores</strong> <br>
                </div>
                <div class="col-md-2" style="margin: 0%; padding: 0px;">
                    <table border="1" style="border-radius: 5px; width: 100%;">
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Código</span></td>
                            <td style="padding: 0em;" class="texto_tabla"><span>&nbsp;ESC_05-01&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Versión</span></td>
                            <td style="padding: 0em;" class="texto_tabla"><span>04</span></td>
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
    <form id="verificacionBodegasForm" enctype="multipart/form-data">
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
                <h5 class="col-md-2 control-label">Modelo Operacion</h5>
                <div class="col-md-2">
                    <h5><input type="radio" name="snCentralizado" value=Centralizado checked>Centralizado
                    </h5>
                    <h5><input type="radio" name="snCentralizado" value=Descentralizado>Descentralizado
                    </h5>
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

                <h5 class="col-md-3 control-label">1. Nombre del proveedor</h5>
                <div class="col-md-4">
                    <input placeholder="" id="txtNombreProveedor" class="form-control" type="text"
                           name="txtNombreProveedor"
                           value=""/>
                </div>
                <h5 class="col-md-1 control-label">2.Nit./C.C.</h5>
                <div class="col-md-4">
                    <input placeholder="" class="form-control" type="text"  name="txtIdentificacionProveedor"
                           id="txtIdentificacionProveedor"
                           value=""/>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <h5 class="col-md-3 control-label">3. Producto(s) que suministra</h5>
                <div class="form-group">
                    <div class="col-md-9">
                        <input placeholder="" class="form-control" type="text" name="txtProductosSuministrados"
                               id="txtProductosSuministrados"
                               value=""/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <div class="form-group">
                    <div class="col-md-3 control-label">4. Tipo Modalidad</div>

                    <div class="col-md-3">
                        <div>
                            <input type="checkbox" id="tipoModalidadDesayuno" name="tipoModalidad" value="Desayuno">&nbsp;Desayuno
                        </div>
                    </div>
                    <div class="col-md-3"><input type="checkbox" id="tipoModalidadAlmuerzo" name="tipoModalidad" value="Almuerzo"> &nbsp;Almuerzo
                    </div>
                    <div class="col-md-3"><input type="checkbox" id="tipoModalidadRacion" name="tipoModalidad" value="Racion"> &nbsp;Ración
                        Industrializada
                    </div>

                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-1 control-label">5.Dirección</h5>
                <div class="form-group">
                    <div class="col-md-3">
                        <input placeholder="" class="form-control" type="text" name="txtDireccionProveedor"
                               id="txtDireccionProveedor"
                               value=""/>
                    </div>
                </div>
                <h5 class="col-md-2 control-label" style="padding-left: 0px; padding-right: 0px;">6.Teléfono
                    proveedor</h5>
                <div class="form-group">
                    <div class="col-md-2">
                        <input placeholder="" class="form-control" type="number" name="txtTelefonoProveedor"
                               id="txtTelefonoProveedor"
                               value=""/>
                    </div>
                </div>
                <h5 class="col-md-2 control-label" style="padding-left: 0px; padding-right: 0px;">7. Correo
                    Electrónico</h5>
                <div class="form-group">
                    <div class="col-md-2">
                        <input placeholder="" class="form-control" type="email" name="txtCorreoElectronico"
                               id="txtCorreoElectronico"
                               value=""/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-3 control-label">8. Fecha de la Visita</h5>
                <div class="col-md-4">
                    <div class="input-group" id="divMiCalendario2">
                        <input type="text" id="txtFechaVisita" name="txtFechaVisita" class="form-control"
                               placeholder="Selecciona Fecha"/>
                        <span id="btnFechaEntrega" class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                    </div>
                </div>
                <h5 class="col-md-3 control-label">9. Hora de Realizacion de la Visita</h5>
                <div class="col-md-2">
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker2'>
                            <input type='time' class="form-control" id="horaVisita" name="horaVisita"/>
                        </div>
                    </div>
                </div>

                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <div class="form-group">
                    <h5 class="col-md-4 control-label">10. Nombre de quien recibe la visita</h5>
                    <div class="col-md-3">
                        <input placeholder="" class="form-control" type="text" name="txtNombreRecibe"
                               id="txtNombreRecibe"
                               value=""/>
                    </div>
                    <h5 class="col-md-2 control-label">11. C.C.</h5>
                    <div class="col-md-3">
                        <input placeholder="" class="form-control" type="number" name="txtIdentificacionRecibe"
                               id="txtIdentificacionRecibe"
                               value=""/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <h5 class="col-md-4 control-label">12. Nombre de quien realiza la visita.</h5>
                <div class="col-md-3">
                    <input placeholder="" class="form-control" type="text" name="txtNombreRealizaVisitaEnc" id="txtNombreRealizaVisitaEnc"
                           value=""/>
                </div>
                <h5 class="col-md-2 control-label">13. C.C.</h5>
                <div class="col-md-3">
                    <input placeholder="" class="form-control" type="number" name="txtIdentificacionRealizaVisitaEnc"
                           id="txtIdentificacionRealizaVisitaEnc"
                           value=""/>
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
                    <b>1. Infraestructura</b>
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
                            <h5 id="pregunta1">1. Los alrededores se conservarán en perfecto estado de aseo, libres
                                de focos de descontaminacnión.</h5>
                        </td>
                        <td class="opciones"><input name="c1" type="radio" class="pregunta1" value=true></td>
                        <td class="opciones"><input name="c1" type="radio" class="pregunta1" value=false></td>
                        <td><textarea id="txtAreaObservacionesc1" name="txtAreaObservacionesc1" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta2">2. La edificación está diseñada y construida de manera que proteja los
                            ambientes
                            e impida la entrada de polvo, lluvia, suciedades u otros contaminantes, así como del ingreso
                            y refugio
                            de plagas animales domésticos.</h5>
                        </td>
                        <td class="opciones"><input name="c2" type="radio" class="pregunta1" value=true></td>
                        <td class="opciones"><input name="c2" type="radio" class="pregunta1" value=false></td>
                        <td><textarea id="txtAreaObservacionesc2" name="txtAreaObservacionesc2" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta3">3. Los pisos están construidos con materiales resistentes, no porosos,
                            impermeables, no absorbentes, no deslizantes y con acabados libres de grietas o defectos que
                            dificulten la limpieza, desinfección y manteminiento sanitario.</h5>
                        <td class="opciones"><input name="c3" type="radio" class="pregunta1" value=true>
                        <td class="opciones"><input name="c3" type="radio" class="pregunta1" value=false>
                        <td><textarea id="txtAreaObservacionesc3" name="txtAreaObservacionesc3" class="form-control" rows="3" maxlength="130"></textarea>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta4">4. Las paredes son de material resistente,impermeables, no absorbentes
                            y
                            son de facíl limpieza y desinfección.</h5>
                        </td>
                        <td class="opciones"><input name="c4" type="radio" class="pregunta1" value=true></td>
                        <td class="opciones"><input name="c4" type="radio" class="pregunta1" value=false></td>
                        <td><textarea id="txtAreaObservacionesc4" name="txtAreaObservacionesc4" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta5">5. Los techos están diseñados y construidos de manera que se evite la
                            acumulación
                            de suciedad y además facilitan la limpieza y el mantenimiento.</h5>
                        <td class="opciones"><input name="c5" type="radio" class="pregunta1" value=true>
                        <td class="opciones"><input name="c5" type="radio" class="pregunta1" value=false>
                        <td><textarea id="txtAreaObservacionesc5" name="txtAreaObservacionesc5" class="form-control" rows="3" maxlength="130"></textarea>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta6">6. Las ventanas y otras aberturas en las paredes están construidas
                            para evitar
                            la acumulacion de polvo y están provistas con malla anti insectos de fácil limpieza y
                            mantenimiento.</h5>
                        </td>
                        <td class="opciones"><input name="c6" type="radio" class="pregunta1" value=true></td>
                        <td class="opciones"><input name="c6" type="radio" class="pregunta1" value=false></td>
                        <td><textarea id="txtAreaObservacionesc6" name="txtAreaObservacionesc6" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta7">7. Las puertas son resistentes, de fácil limpieza y mantenimiento y
                            sus
                            aberturas entre las puertas exteriores y los pisos no son mayores del 1 cm.</h5>
                        </td>
                        <td class="opciones"><input name="c7" type="radio" class="pregunta1" value=true></td>
                        <td class="opciones"><input name="c7" type="radio" class="pregunta1" value=false></td>
                        <td><textarea id="txtAreaObservacionesc7" name="txtAreaObservacionesc7" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="Pregunta8">8. Cuenta con adecuada y suficiente iluminacion natural y/o
                            artificial.</h5>
                        </td>
                        <td class="opciones"><input name="c8" type="radio" class="pregunta1" value=true></td>
                        <td class="opciones"><input name="c8" type="radio" class="pregunta1" value=false></td>
                        <td><textarea id="txtAreaObservacionesc8" name="txtAreaObservacionesc8" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="Pregunta9">9. Las lámparas y accesorios ubicados por encima de las materias
                            primas, insumos y productos
                            están protegidas para evitar la contaminacion en caso de ruptura.</h5>
                        </td>
                        <td class="opciones"><input name="c9" type="radio" class="pregunta1" value=true></td>
                        <td class="opciones"><input name="c9" type="radio" class="pregunta1" value=false></td>
                        <td><textarea id="txtAreaObservacionesc9" name="txtAreaObservacionesc9" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="Pregunta10">10. Poseen sistema de ventilación directa o indirecta, las aberturas
                            para circulacion del aire
                            están protegidas con mallas fácilmente removibles para su limpieza y mantenimiento.</h5>
                        </td>
                        <td class="opciones"><input name="c10" type="radio" class="pregunta1" value=true></td>
                        <td class="opciones"><input name="c10" type="radio" class="pregunta1" value=false></td>
                        <td><textarea id="txtAreaObservacionesc10" name="txtAreaObservacionesc10" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="Pregunta11">11. Las instalaciones se mantienen limpias y en buenas condiciones
                            higiénicas.</h5>
                        </td>
                        <td class="opciones"><input name="c11" type="radio" class="pregunta1" value=true></td>
                        <td class="opciones"><input name="c11" type="radio" class="pregunta1" value=false></td>
                        <td><textarea id="txtAreaObservacionesc11" name="txtAreaObservacionesc11" class="form-control" rows="3" maxlength="130"></textarea></td>
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
                            <h5>(&Sigma; C/11)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto1"
                                   id="totalCumpleAspecto1" min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto1"
                                   id="totalNoCumpleAspecto1" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h5>Porcentaje de cumplimiento infraestructura</h5>
                        </td>
                        <td>
                            <input readonly style="width: 60px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimiento"
                                   id="porcentajeCumplimientoAspecto1" min="1"
                                   value=""/>
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
                    <b>2. Personal Manipulador de Alimentos</b>
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
                            <h5 id="pregunta2.1">1. El personal manipulador de alimentos cuenta con certificado de
                                capacitacion BPM.</h5>
                        </td>
                        <td class="opciones"><input name="c21" type="radio" class="pregunta2" value=true></td>
                        <td class="opciones"><input name="c21" type="radio" class="pregunta2" value=false></td>
                        <td><textarea id="txtAreaObservacionesc21" name="txtAreaObservacionesc21" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta2.2">2. El personal manipulador de alimentos cuenta con certificación
                            médica y análisis de laboratorio.</h5>
                        </td>
                        <td class="opciones"><input name="c22" type="radio" class="pregunta2" value=true></td>
                        <td class="opciones"><input name="c22" type="radio" class="pregunta2" value=false></td>
                        <td><textarea id="txtAreaObservacionesc22" name="txtAreaObservacionesc22" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta2.3">3. El personal manipulador no utiliza joyas, aretes, anillos,
                            etc.</h5>
                        <td class="opciones"><input name="c23" type="radio" class="pregunta2" value=true>
                        <td class="opciones"><input name="c23" type="radio" class="pregunta2" value=false>
                        <td><textarea id="txtAreaObservacionesc23" name="txtAreaObservacionesc23" class="form-control" rows="3" maxlength="130"></textarea>
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
                            <h5>(&Sigma; C/3)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto2"
                                   id="totalCumpleAspecto2" min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto2"
                                   id="totalNoCumpleAspecto2" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h5>Porcentaje de cumplimiento personal manipulador de alimentos</h5>
                        </td>
                        <td>
                            <input readonly style="width: 60px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto2"
                                   id="porcentajeCumplimientoAspecto2" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <br>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>3. Condiciones higiénico sanitarias</b>
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
                            <h5 id="pregunta3.1">1. Cuenta con concepto favorable y se encuentra vigente.</h5>
                        </td>
                        <td class="opciones"><input name="c31" type="radio" class="pregunta3" value=true></td>
                        <td class="opciones"><input name="c31" type="radio" class="pregunta3" value=false></td>
                        <td><textarea id="txtAreaObservacionesc31" name="txtAreaObservacionesc31" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta3.2">2. Cuenta con plan de saneamiento básico: plan de limpieza y desnfección,
                            plan de control de plagas y adecuado manejo de desechos sólidos.</h5>
                        </td>
                        <td class="opciones"><input name="c32" type="radio" class="pregunta3" value=true></td>
                        <td class="opciones"><input name="c32" type="radio" class="pregunta3" value=false></td>
                        <td><textarea id="txtAreaObservacionesc32" name="txtAreaObservacionesc32" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta3.3">3. Se evidencia registros de los programas de saneamiento básico.</h5>
                        <td class="opciones"><input name="c33" type="radio" class="pregunta3" value=true>
                        <td class="opciones"><input name="c33" type="radio" class="pregunta3" value=false>
                        <td><textarea id="txtAreaObservacionesc33" name="txtAreaObservacionesc33" class="form-control" rows="3" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130" maxlength="130"></textarea>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta3.4">4. Cuenta con avisos alucivos a las BPM.</h5>
                        <td class="opciones"><input name="c34" type="radio" class="pregunta3" value=true>
                        <td class="opciones"><input name="c34" type="radio" class="pregunta3" value=false>
                        <td><textarea id="txtAreaObservacionesc34" name="txtAreaObservacionesc34" class="form-control" rows="3" maxlength="130"></textarea>
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
                            <h5>(&Sigma; C/4)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto3"
                                   id="totalCumpleAspecto3" min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto3"
                                   id="totalNoCumpleAspecto3" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h5>Porcentaje de cumplimiento condiciones higiénico sanitarias</h5>
                        </td>
                        <td>
                            <input readonly style="width: 60px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto3"
                                   id="porcentajeCumplimientoAspecto3" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <br>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>4. Condiciones del producto</b>
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
                            <h5 id="pregunta4.1">1. Cuenta con listado de marcas aprobadas actualizadas por el programa.</h5>
                        </td>
                        <td class="opciones"><input name="c41" type="radio" class="pregunta4" value=true></td>
                        <td class="opciones"><input name="c41" type="radio" class="pregunta4" value=false></td>
                        <td><textarea id="txtAreaObservacionesc41" name="txtAreaObservacionesc41" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta4.2">2. Las cantidades de víveres despachados corresponde a los cupos y días
                            a atender por cada Unidad de Servicio.</h5>
                        </td>
                        <td class="opciones"><input name="c42" type="radio" class="pregunta4" value=true></td>
                        <td class="opciones"><input name="c42" type="radio" class="pregunta4" value=false></td>
                        <td><textarea id="txtAreaObservacionesc42" name="txtAreaObservacionesc42" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta4.3">3. Los productos registrados cuentan con registro sanitario e invima.</h5>
                        <td class="opciones"><input name="c43" type="radio" class="pregunta4" value=true>
                        <td class="opciones"><input name="c43" type="radio" class="pregunta4" value=false>
                        <td><textarea id="txtAreaObservacionesc43" name="txtAreaObservacionesc43" class="form-control" rows="3" maxlength="130"></textarea>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta4.4">4. Los productos suministrados cumplen con las normas de rotulado.</h5>
                        <td class="opciones"><input name="c44" type="radio" class="pregunta4" value=true>
                        <td class="opciones"><input name="c44" type="radio" class="pregunta4" value=false>
                        <td><textarea id="txtAreaObservacionesc44" name="txtAreaObservacionesc44" class="form-control" rows="3" maxlength="130"></textarea>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta4.5">5. Los productos suministrados se entregan en su empaque y envase original.</h5>
                        <td class="opciones"><input name="c45" type="radio" class="pregunta4" value=true>
                        <td class="opciones"><input name="c45" type="radio" class="pregunta4" value=false>
                        <td><textarea id="txtAreaObservacionesc45" name="txtAreaObservacionesc45" class="form-control" rows="3" maxlength="130"></textarea>
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
                            <h5>(&Sigma; C/5)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto4"
                                   id="totalCumpleAspecto4" min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto4"
                                   id="totalNoCumpleAspecto4" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h5>Porcentaje de cumplimiento condiciones del producto</h5>
                        </td>
                        <td>
                            <input readonly style="width: 60px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto4"
                                   id="porcentajeCumplimientoAspecto4" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <br>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>5. Obligaciones del operador para con el proveedor</b>
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
                            <h5 id="pregunta5.1">1. Se cuenta con soportes de la visita mensual por parte del operador
                                para verificación del cumplimiento del derecho 3075 de 1997, formato ESC_05_operadores_proveedores.</h5>
                        </td>
                        <td class="opciones"><input name="c51" type="radio" class="pregunta5" value=true></td>
                        <td class="opciones"><input name="c51" type="radio" class="pregunta5" value=false></td>
                        <td><textarea id="txtAreaObservacionesc51" name="txtAreaObservacionesc51" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta5.2">2. Copia del plan de mejoramiento, en caso que la evaluación no sea satisfactoria
                            y su respectivo seguimiento. (Generado por el municipio o interventoría u operador)</h5>
                        </td>
                        <td class="opciones"><input name="c52" type="radio" class="pregunta5" value=true></td>
                        <td class="opciones"><input name="c52" type="radio" class="pregunta5" value=false></td>
                        <td><textarea id="txtAreaObservacionesc52" name="txtAreaObservacionesc52" class="form-control" rows="3" maxlength="130"></textarea></td>
                    </tr>
                    <tr>
                        <td><h5 id="pregunta5.3">3. Se evidencian actas de visita o acompañamiento por parte del operador durante
                            la entrega de viveres.</h5>
                        <td class="opciones"><input name="c53" type="radio" class="pregunta5" value=true>
                        <td class="opciones"><input name="c53" type="radio" class="pregunta5" value=false>
                        <td><textarea id="txtAreaObservacionesc53" name="txtAreaObservacionesc53" class="form-control" rows="3" maxlength="130"></textarea>
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
                            <h5>(&Sigma; C/3)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto5"
                                   id="totalCumpleAspecto5" min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto5"
                                   id="totalNoCumpleAspecto5" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <h5>Porcentaje de cumplimiento obligaciones de operador para con el proveedor</h5>
                        </td>
                        <td>
                            <input readonly style="width: 60px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto5"
                                   id="porcentajeCumplimientoAspecto5" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <br>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>Observaciones</b>
                </h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <h5>Observaciones:</h5>
                    <textarea class="form-control" rows="5" id="txtComentario" name="txtComentario"></textarea>
                </div>
            </div>
        </div>
        </br>
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
                        <th colspan="2">Quien atiende la visita</th>
                        <th colspan="2">Funcionario que realiza la visita</th>
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
                                                onclick="verificacionBodegasController.limpiarFirmaVerificador();">
                                            Limpiar
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><h5 id="nombreOperador">Nombre</h5></td>
                        <td><input placeholder="" id="txtNombreAtiendeVisita" class="form-control" type="text"
                                   name="txtNombreAtiendeVisita"
                                   value=""/></td>
                        <td><h5 id="nombreR">Nombre</h5></td>
                        <td><input placeholder="" id="txtNombreRealizaVisita" class="form-control" type="text"
                                   name="txtNombreRealizaVisita"
                                   value=""/></td>
                    </tr>
                    <tr>
                        <td><h5 id="cedulaOperador">C.C</h5></td>
                        <td><input placeholder="" id="txtCedulaAtiendeVisita" class="form-control" type="text"
                                   name="txtCedulaAtiendeVisita"
                                   value=""/></td>
                        <td><h5 id="cedulaR">C.C</h5></td>
                        <td><input placeholder="" id="txtCedulaRealizaVisita" class="form-control" type="text"
                                   name="txtCedulaRealizaVisita"
                                   value=""/></td>
                    </tr>
                    <tr>
                        <td><h5 id="cargoOperador">Cargo</h5></td>
                        <td><input placeholder="" id="txtCargoAtiendeVisita" class="form-control" type="text"
                                   name="txtCargoAtiendeVisita"
                                   value=""/></td>
                        <td><h5 id="cargoR">Cargo</h5></td>
                        <td><input placeholder="" id="txtCargoRealizaVisita" class="form-control" type="text"
                                   name="txtCargoRealizaVisita"
                                   value=""/></td>
                    </tr>
                    <tr>
                        <td><h5 id="telefonoOperador">Teléfono</h5></td>
                        <td><input placeholder="" id="txtTelefonoAtiendeVisita" class="form-control" type="text"
                                   name="txtTelefonoAtiendeVisita"
                                   value=""/></td>
                        <td><h5 id="telefonoR">Télefono</h5></td>
                        <td><input placeholder="" id="txtTelefonoRealizaVisita" class="form-control" type="text"
                                   name="txtTelefonoRealizaVisita"
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
                            onclick="verificacionBodegasController.enviarFormulario()">Enviar
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
