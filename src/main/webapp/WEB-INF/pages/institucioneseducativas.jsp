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
    <script type="text/javascript" src="${JS}/jquery/stepyform/jquery.stepyform.js"></script>
    <script type="text/javascript" src="${JS}/jquery/jq-signature.min.js"></script>
    <script type="text/javascript" src="${JS}/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${JS}/util.js"></script>

    <script type="text/javascript" src="${CONTROLLER}/institucioneseducativasController.js"></script>

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
                    <strong>Instituciones Educativas</strong> <br>
                </div>
                <div class="col-md-2" style="margin: 0%; padding: 0px;">
                    <table class="version" border="1" >
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Código</span></td>
                            <td style="padding: 0em;" class="texto_tabla"><span>&nbsp;ESC_01&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Versión</span></td>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>05</span></td>
                        </tr>
                        <tr>
                            <td style="padding: 0.4em;" class="texto_tabla"><span>Fecha</span></td>
                            <td style="padding: 0em;" class="texto_tabla">
                                <span>&nbsp;&nbsp;30/06/2016&nbsp;&nbsp;</span></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="contenedores">
    <form id="institucionesEducativasForm" enctype="multipart/form-data">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center">
                    <b>1. Datos generales</b>
                </h3>
            </div>
            <div class="panel-body">
                <h5 class="col-md-1 control-label">2.Subregión</h5>
                <div class="col-md-3">
                    <select class="form-control" name="subregion" id="subregion">
                        <option value="-1" label="--- Select ---"/>
                        <c:forEach var="subregion" items="${listaSubregiones}">
                            <option value="${subregion.id}"> ${subregion.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                <h5 class="col-md-1 control-label">3.Municipio</h5>
                <div class="col-md-3">
                    <select class="form-control" name="municipios" id="municipios">
                        <option value="-1" label="--- Select ---"/>
                    </select>
                </div>
                <h5 class="col-md-2 control-label" style=" padding-right:0px;">4.Corregimiento</h5>
                <div class="col-md-2" >
                    <input name="txtCorregimiento" id="txtCorregimiento" class="form-control" type="text"/>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <h5 class="col-md-2 control-label" style=" padding-right: 0px;">5. Fecha de la visita</h5>
                <div class="col-md-2">
                    <div class="input-group" id="divMiCalendario2">
                        <input type="text" id="txtFechaVisita" name="txtFechaVisita" class="form-control"
                               placeholder="Selecciona Fecha"/>
                        <span id="btnFechaVisita" class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>
                <h5 class="col-md-2 control-label" style=" padding-right:0px;">6. Barrio/Vereda</h5>
                <div class="col-md-2" >
                    <input name="txtBarrio" id="txtBarrio" class="form-control" type="text"/>
                </div>
                <h5 class="col-md-2 control-label" style=" padding-right:0px;">7.Modelo de operación</h5>
                <div class="col-md-2">
                    <h5><input type="radio" name="modeloOperacion" value=Centralizado checked>Centralizado
                    </h5>
                    <h5><input type="radio" name="modeloOperacion" value=Descentralizado>Descentralizado
                    </h5>
                </div>
                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">8. Nombre de la IE</h5>
                <div class="col-md-10" >
                    <input name="txtNombreIE" id="txtNombreIE" class="form-control" type="text"/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-3 control-label" style=" padding-right:0px;">9. Nombre de la sede educativa</h5>
                <div class="col-md-3" >
                    <input name="txtNombreSedeIE" id="txtNombreSedeIE" class="form-control" type="text"/>
                </div>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">10. Código DANE</h5>
                <div class="col-md-4" >
                    <input name="txtCodigoDane" id="txtCodigoDane" class="form-control" type="text"/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">11.Nombre del Rector</h5>
                <div class="col-md-4" >
                    <input name="txtNombreRector" id="txtNombreRector" class="form-control" type="text"/>
                </div>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">12.Teléfono </h5>
                <div class="col-md-4" >
                    <input name="txtTelefonoRector" id="txtTelefonoRector" class="form-control" type="number"/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-3 control-label" style=" padding-right:0px;">13. Docente encargado del programa</h5>
                <div class="col-md-3" >
                    <input name="txtDocentePrograma" id="txtDocentePrograma" class="form-control" type="text"/>
                </div>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">14.Teléfono </h5>
                <div class="col-md-4" >
                    <input name="txtTelefonoDocente" id="txtTelefonoDocente" class="form-control" type="number"/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-3 control-label" style=" padding-right:0px;">15. Nombre del manipulador de alimentos</h5>
                <div class="col-md-3" >
                    <input name="txtManipuladorAlimientos" id="txtManipuladorAlimientos" class="form-control" type="text"/>
                </div>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">16.Teléfono </h5>
                <div class="col-md-4" >
                    <input name="txtTelefonoManipuladorAlimientos" id="txtTelefonoManipuladorAlimientos" class="form-control" type="number"/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-3 control-label" style=" padding-right:0px;">17. Profesional que realiza la visita.</h5>
                <div class="col-md-3" >
                    <input name="txtProfesionalVisita" id="txtProfesionalVisita" class="form-control" type="text"/>
                </div>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">18. Cargo </h5>
                <div class="col-md-4" >
                    <input name="txtCargoProfesional" id="txtCargoProfesional" class="form-control" type="text"/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-3 control-label" style=" padding-right:0px;">19.Número de niños matriculados en primaria (SIMAT) en IE</h5>
                <div class="col-md-2" >
                    <input name="txtNiñosMatriculados" id="txtNiñosMatriculados" class="form-control" type="number"/>
                </div>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">20.Número de niños atendidos en restaurante escolar</h5>
                <div class="col-md-2" >
                    <input name="txtNiñosAtendidosRestaurante" id="txtNiñosAtendidosRestaurante" class="form-control" type="number"/>
                </div>
                <h5 class="col-md-2 control-label">21.Minuta Mejorada.</h5>
                <div class="col-md-1">
                    <div class="radio">
                        <label><input type="radio" name="snMinutaMejorada"
                                      value=true checked>SI
                        </label> <label><input type="radio" name="snMinutaMejorada"
                                               value=false>NO
                    </label>
                    </div>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">22.Modalidad de atención</h5>
                <div class="col-md-3" >
                    <select class="form-control" name="tipoModalidad" id="tipoModalidad">
                        <option value="-1" label="--- Select ---"/>
                        <option value="PSR">Preparada en Sitio</option>
                        <option value="IND">Industrializada</option>
                        <option value="RD">Diferencial</option>
                    </select>
                </div>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">23.Número de cupos atendidos Gobernación MEN</h5>
                <div class="col-md-2" >
                    <input name="txtNiñosAtendidosGobernacion" id="txtNiñosAtendidosGobernacion" class="form-control" type="number"/>
                </div>
                <h5 class="col-md-2 control-label" style=" padding-right:0px;">24.Número de cupos atendidos con recursos del Municipio</h5>
                <div class="col-md-1" >
                    <input name="txtNiñosAtendidosMunicipio" id="txtNiñosAtendidosMunicipio" class="form-control" type="number"/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>

                <h5 class="col-md-3 control-label" style=" padding-right:0px;">25.Número de escolares matriculados en secundaria</h5>
                <div class="col-md-2" >
                    <input name="txtNiñosMatriculadosSecundaria" id="txtNiñosMatriculadosSecundaria" class="form-control" type="number"/>
                </div>
                <h5 class="col-md-1 control-label" style=" padding-right:0px;">26.N° Indigenas</h5>
                <div class="col-md-2" >
                    <input name="txtNumIndigenas" id="txtNumIndigenas" class="form-control" type="number"/>
                </div>

                <h5 class="col-md-2 control-label" style=" padding-right:0px;">27.N° Desplazados</h5>
                <div class="col-md-2" >
                    <input name="txtNumDesplazados" id="txtNumDesplazados" class="form-control" type="number"/>
                </div>

                <div class="clearfix"></div>
                <hr align="center" noshade="noshade" size="2" width="100%"/>
                <h5 class="col-md-1 control-label" style=" padding-right:0px;">28.N° Discapacitados</h5>
                <div class="col-md-2" >
                    <input name="txtNumDiscapacitados" id="txtNumDiscapacitados" class="form-control" type="number"/>
                </div>
                <h5 class="col-md-3 control-label">29.Cobertura del 100% de la población con el PAE</h5>
                <div class="col-md-1">
                    <div class="radio">
                        <label><input type="radio" name="snCoberturaPAE"
                                      value=true checked>SI
                        </label> <label><input type="radio" name="snCoberturaPAE"
                                               value=false>NO
                    </label>
                    </div>
                </div>
                <h5 class="col-md-2 control-label">30.Existe cobro de cuota de participación</h5>
                <div class="col-md-3">
                    <div class="radio">
                        <label><input type="radio" name="snCobroParticipacion"
                                      value=true checked>SI
                        </label> <label><input type="radio" name="snCobroParticipacion"
                                               value=false>NO
                    </label>
                        <input placeholder="Valor" name="txtValorcobro" id="txtValorcobro" class="form-control" type="number"/>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="panel-heading">
            <h3 class="panel-title" style="color: #761c19; font-size : 14px">
                <i><b>*Tener en cuenta:  C= Cumple, NC = No Cumple, NA= No Aplica, NO= No Observa </b></i>
            </h3>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>
                    <tr>
                        <th class="actividad">Actividades</th>
                        <th>SUPERVISIÓN PAE</th>
                        <th>C</th>
                        <th>NC</th>
                        <th>NA</th>
                        <th>NO</th>
                        <th class="comentarios">observaciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="8" class="actividad">
                            <h5><b>1. Desarrollo del servicio</b></h5>
                        </td>
                        <td>
                            <h5 id="pregunta1">31.Se da cumplimiento a la minuta patrón y ciclo de minutas empleadas por el operador del programa.</h5>
                        </td>
                        <td class="opciones"><input name="c1" type="radio" class="1" value=1></td>
                        <td class="opciones"><input name="c1" type="radio" class="1" value=2></td>
                        <td class="opciones"><input name="c1" type="radio" class="1" value=3></td>
                        <td class="opciones"><input name="c1" type="radio" class="1" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc1" name="txtAreaObservacionesc1" class="form-control" maxlength="130"                                      rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5 id="pregunta2">32.El restaurante escolar cuenta con la minuta actualizada del Programa.</h5>
                        </td>
                        <td class="opciones"><input name="c2" type="radio" class="1" value=1></td>
                        <td class="opciones"><input name="c2" type="radio" class="1" value=2></td>
                        <td class="opciones"><input name="c2" type="radio" class="1" value=3></td>
                        <td class="opciones"><input name="c2" type="radio" class="1" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc2" name="txtAreaObservacionesc2" class="form-control" maxlength="130"                                      rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5 id="pregunta3">33.La minuta se encuentra publicada en un lugar visible del restaurante escolar.</h5>
                        </td>
                        <td class="opciones"><input name="c3" type="radio" class="1" value=1></td>
                        <td class="opciones"><input name="c3" type="radio" class="1" value=2></td>
                        <td class="opciones"><input name="c3" type="radio" class="1" value=3></td>
                        <td class="opciones"><input name="c3" type="radio" class="1" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc3" name="txtAreaObservacionesc3" class="form-control" maxlength="130"                                      rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5 id="pregunta4">34.Existe un control diario sobre las raciones entregadas a los beneficiarios del servicio en el establecimiento educativo. (Formato control de ración servida en físico).</h5>
                        </td>
                        <td class="opciones"><input name="c4" type="radio" class="1" value=1></td>
                        <td class="opciones"><input name="c4" type="radio" class="1" value=2></td>
                        <td class="opciones"><input name="c4" type="radio" class="1" value=3></td>
                        <td class="opciones"><input name="c4" type="radio" class="1" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc4" name="txtAreaObservacionesc4" class="form-control" maxlength="130"                                      rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5 id="pregunta5">35.El Formato de Control de raciones se encuentra debidamente diligenciado.</h5>
                        </td>
                        <td class="opciones"><input name="c5" type="radio" class="1" value=1></td>
                        <td class="opciones"><input name="c5" type="radio" class="1" value=2></td>
                        <td class="opciones"><input name="c5" type="radio" class="1" value=3></td>
                        <td class="opciones"><input name="c5" type="radio" class="1" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc5" name="txtAreaObservacionesc5" class="form-control" maxlength="130"                                      rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5 id="pregunta6">36.La cantidad de los alimentos está acorde con el acta de entrega de víveres.</h5>
                        </td>
                        <td class="opciones"><input name="c6" type="radio" class="1" value=1></td>
                        <td class="opciones"><input name="c6" type="radio" class="1" value=2></td>
                        <td class="opciones"><input name="c6" type="radio" class="1" value=3></td>
                        <td class="opciones"><input name="c6" type="radio" class="1" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc6" name="txtAreaObservacionesc6" class="form-control" maxlength="130"                                      rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5 id="pregunta7">37.Existen avisos que refuercen las normas de BPM, en el restaurante escolar orientados a los docentes, escolares y manipuladoras de alimentos.</h5>
                        </td>
                        <td class="opciones"><input name="c7" type="radio" class="1" value=1></td>
                        <td class="opciones"><input name="c7" type="radio" class="1" value=2></td>
                        <td class="opciones"><input name="c7" type="radio" class="1" value=3></td>
                        <td class="opciones"><input name="c7" type="radio" class="1" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc7" name="txtAreaObservacionesc7" class="form-control" maxlength="130"                                      rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5 id="pregunta8">38.En la Institución Educativa se evidencia conformación y acciones de Comité Institucional del PAE (Acta conformación, Reuniones, etc.).</h5>
                        </td>
                        <td class="opciones"><input name="c8" type="radio" class="1" value=1></td>
                        <td class="opciones"><input name="c8" type="radio" class="1" value=2></td>
                        <td class="opciones"><input name="c8" type="radio" class="1" value=3></td>
                        <td class="opciones"><input name="c8" type="radio" class="1" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc8" name="txtAreaObservacionesc8" class="form-control" maxlength="130"                                      rows="3"></textarea></td>

                    </tr>

                    <tr>
                        <td rowspan="2" colspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td class="opciones">
                            <h5>NA</h5>
                        </td>
                        <td class="opciones">
                            <h5>NO</h5>
                        </td>
                        <td class="opciones" rowspan="2">
                            <h5>(&Sigma; CUMPLE/8-NA)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto1" id="totalCumpleAspecto1"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto1" id="totalNoCumpleAspecto1" min="1"
                                   value=""/>
                        </td>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalNoAplicaAspecto1" id="totalNoAplicaAspecto1"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoObservaAspecto1" id="totalNoObservaAspecto1" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h5>Porcentaje cumplimiento desarrollo el servicio.</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto1"
                                   id="porcentajeCumplimientoAspecto1" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="10" class="actividad" >
                            <h5><b>2. Edificación e instalaciones</b></h5>
                        </td>
                        <td>
                            <h5>39. El restaurante escolar se encuentra aislado de focos de insalubridad que representen riesgos potenciales para la contaminación de los alimentos. </h5>
                        </td>
                        <td class="opciones"><input name="c21" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c21" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c21" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c21" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc21" name="txtAreaObservacionesc21" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>40. Se evidencia la presencia de animales en el área del restaurante escolar.</h5>
                        </td>
                        <td class="opciones"><input name="c22" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c22" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c22" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c22" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc22" name="txtAreaObservacionesc22" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>41. El restaurante escolar cuenta con agua potable</h5>
                        </td>
                        <td class="opciones"><input name="c23" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c23" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c23" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c23" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc23" name="txtAreaObservacionesc23" class="form-control" maxlength="130"                                                          rows="3" placeholder="¿ Cuál ?"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>42. Frente a la ausencia de agua potable se cuenta con plan de contingencia para la preparación de bebidas (jugos, avenas).</h5>
                        </td>
                        <td class="opciones"><input name="c24" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c24" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c24" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c24" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc24" name="txtAreaObservacionesc24" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>43. Los residuos sólidos generados son ubicados de manera tal que no representen riesgo de contaminación al alimento, a los ambientes o superficies de potencial contacto con este y son removidos frecuentemente del área de preparación.</h5>
                        </td>
                        <td class="opciones"><input name="c25" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c25" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c25" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c25" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc25" name="txtAreaObservacionesc25" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>44. Hay avisos que recuerden a las personas la necesidad de lavarse las manos después de ir al baño, antes de comer, al cambiar de actividad y antes de preparar los alimentos.</h5>
                        </td>
                        <td class="opciones"><input name="c26" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c26" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c26" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c26" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc26" name="txtAreaObservacionesc26" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>45. Las ventanas y aberturas poseen mallas anti-insectos y permite ventilar el lugar. (Diagnóstico Resolución 2674/2013).</h5>
                        </td>
                        <td class="opciones"><input name="c27" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c27" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c27" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c27" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc27" name="txtAreaObservacionesc27" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>46. La Institución Educativa cuenta con comedor escolar. </h5>
                        </td>
                        <td class="opciones"><input name="c28" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c28" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c28" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c28" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc28" name="txtAreaObservacionesc28" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>47. El servicio del Programa de Alimentación Escolar se presta por turnos.</h5>
                        </td>
                        <td class="opciones"><input name="c29" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c29" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c29" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c29" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc29" name="txtAreaObservacionesc29" class="form-control" maxlength="130"                                                          rows="3" placeholder="No.turnos, No niños por turno"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>48. Dentro de la unidad de Servicio no se evidencian unidades sanitarias.</h5>
                        </td>
                        <td class="opciones"><input name="c210" type="radio" class="2" value=1></td>
                        <td class="opciones"><input name="c210" type="radio" class="2" value=2></td>
                        <td class="opciones"><input name="c210" type="radio" class="2" value=3></td>
                        <td class="opciones"><input name="c210" type="radio" class="2" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc210" name="txtAreaObservacionesc210" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>

                    <tr>
                        <td rowspan="2" colspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td class="opciones">
                            <h5>NA</h5>
                        </td>
                        <td class="opciones">
                            <h5>NO</h5>
                        </td>
                        <td class="opciones" rowspan="2">
                            <h5>(&Sigma; CUMPLE/10-NA)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto2" id="totalCumpleAspecto2"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto2" id="totalNoCumpleAspecto2" min="1"
                                   value=""/>
                        </td>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalNoAplicaAspecto2" id="totalNoAplicaAspecto2"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoObservaAspecto2" id="totalNoObservaAspecto2" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h5>Porcentaje cumplimiento desarrollo el servicio.</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto2"
                                   id="porcentajeCumplimientoAspecto2" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="4" class="actividad" >
                            <h5><b>3. Equipos y utensilios</b></h5>
                        </td>
                        <td>
                            <h5>49. La unidad aplicativa cuenta con suficientes equipos (fogón, nevera, licuadora) para la producción de los alimentos y están en buen estado.</h5>
                        </td>
                        <td class="opciones"><input name="c31" type="radio" class="3" value=1></td>
                        <td class="opciones"><input name="c31" type="radio" class="3" value=2></td>
                        <td class="opciones"><input name="c31" type="radio" class="3" value=3></td>
                        <td class="opciones"><input name="c31" type="radio" class="3" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc31" name="txtAreaObservacionesc31" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>50. La unidad aplicativa cuenta con suficientes utensilios (olla, vasijas, cucharas mezcladores, etc) para la producción de los alimentos en material sanitario resistente al uso y a la corrosión.</h5>
                        </td>
                        <td class="opciones"><input name="c32" type="radio" class="3" value=1></td>
                        <td class="opciones"><input name="c32" type="radio" class="3" value=2></td>
                        <td class="opciones"><input name="c32" type="radio" class="3" value=3></td>
                        <td class="opciones"><input name="c32" type="radio" class="3" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc32" name="txtAreaObservacionesc32" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>51. La Unidad Aplicativa cuenta con mesas, sillas y menaje (plato, vaso o pocillo, cucharas) suficientes para la atención de los niños y las niñas participantes del PAE.</h5>
                        </td>
                        <td class="opciones"><input name="c33" type="radio" class="3" value=1></td>
                        <td class="opciones"><input name="c33" type="radio" class="3" value=2></td>
                        <td class="opciones"><input name="c33" type="radio" class="3" value=3></td>
                        <td class="opciones"><input name="c33" type="radio" class="3" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc33" name="txtAreaObservacionesc33" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>52. Las superficies en contacto directo con el alimento poseen acabado liso, no poroso, no absorbente, libres de grietas o irregularidades que puedan atrapar partículas de alimentos o microrganismos que afectan la inocuidad de los alimentos.</h5>
                        </td>
                        <td class="opciones"><input name="c34" type="radio" class="3" value=1></td>
                        <td class="opciones"><input name="c34" type="radio" class="3" value=2></td>
                        <td class="opciones"><input name="c34" type="radio" class="3" value=3></td>
                        <td class="opciones"><input name="c34" type="radio" class="3" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc34" name="txtAreaObservacionesc34" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td rowspan="2" colspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td class="opciones">
                            <h5>NA</h5>
                        </td>
                        <td class="opciones">
                            <h5>NO</h5>
                        </td>
                        <td class="opciones" rowspan="2">
                            <h5>(&Sigma; CUMPLE/4-NA)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto3" id="totalCumpleAspecto3"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto3" id="totalNoCumpleAspecto3" min="1"
                                   value=""/>
                        </td>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalNoAplicaAspecto3" id="totalNoAplicaAspecto3"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoObservaAspecto3" id="totalNoObservaAspecto3" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h5>Porcentaje cumplimiento desarrollo el servicio.</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto3"
                                   id="porcentajeCumplimientoAspecto3" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="9" class="actividad" >
                            <h5><b>4. Requisitos Higiénicos de Fabricación</b></h5>
                        </td>
                        <td>
                            <h5>53. Las materias primas se someten a limpieza con agua potable u otro medio adecuado de ser requerido y, si le aplica, a la descontaminación previa a la etapa de preparación.</h5>
                        </td>
                        <td class="opciones"><input name="c41" type="radio" class="4" value=1></td>
                        <td class="opciones"><input name="c41" type="radio" class="4" value=2></td>
                        <td class="opciones"><input name="c41" type="radio" class="4" value=3></td>
                        <td class="opciones"><input name="c41" type="radio" class="4" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc41" name="txtAreaObservacionesc41" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>54. El almacenamiento de los alimentos refrigerados se realiza a temperaturas	entre 0°C a 4°C y se llevan registros</h5>
                        </td>
                        <td class="opciones"><input name="c42" type="radio" class="4" value=1></td>
                        <td class="opciones"><input name="c42" type="radio" class="4" value=2></td>
                        <td class="opciones"><input name="c42" type="radio" class="4" value=3></td>
                        <td class="opciones"><input name="c42" type="radio" class="4" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc42" name="txtAreaObservacionesc42" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>55. El almacenamiento de alimentos congelados se realiza a temperaturas de -18°C y se llevan registros</h5>
                        </td>
                        <td class="opciones"><input name="c43" type="radio" class="4" value=1></td>
                        <td class="opciones"><input name="c43" type="radio" class="4" value=2></td>
                        <td class="opciones"><input name="c43" type="radio" class="4" value=3></td>
                        <td class="opciones"><input name="c43" type="radio" class="4" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc43" name="txtAreaObservacionesc43" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>56. Los alimentos se almacenan en condiciones que garantizan la calidad e inocuidad de estos, en recipientes de material sanitario, sobre estibas, en óptimas condiciones de higiene.</h5>
                        </td>
                        <td class="opciones"><input name="c44" type="radio" class="4" value=1></td>
                        <td class="opciones"><input name="c44" type="radio" class="4" value=2></td>
                        <td class="opciones"><input name="c44" type="radio" class="4" value=3></td>
                        <td class="opciones"><input name="c44" type="radio" class="4" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc44" name="txtAreaObservacionesc44" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>57. Los productos que se encuentran empacados y rotulados, cumplen con la normatividad sanitaria vigente. Resolución 5109/2005</h5>
                        </td>
                        <td class="opciones"><input name="c45" type="radio" class="4" value=1></td>
                        <td class="opciones"><input name="c45" type="radio" class="4" value=2></td>
                        <td class="opciones"><input name="c45" type="radio" class="4" value=3></td>
                        <td class="opciones"><input name="c45" type="radio" class="4" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc45" name="txtAreaObservaciones55" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>58. Los productos se encuentran dentro de su vida útil, con fecha de vencimiento vigente y son aptos para el consumo.</h5>
                        </td>
                        <td class="opciones"><input name="c46" type="radio" class="4" value=1></td>
                        <td class="opciones"><input name="c46" type="radio" class="4" value=2></td>
                        <td class="opciones"><input name="c46" type="radio" class="4" value=3></td>
                        <td class="opciones"><input name="c46" type="radio" class="4" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc46" name="txtAreaObservacionesc56" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>59.Las operaciones de preparación se realizan en forma secuencial y continua para que no se produzcan retrasos indebidos que permitan el crecimiento de microorganismos y contribuyan a otros tipos de deterioro o contaminación de alimento.</h5>
                        </td>
                        <td class="opciones"><input name="c47" type="radio" class="4" value=1></td>
                        <td class="opciones"><input name="c47" type="radio" class="4" value=2></td>
                        <td class="opciones"><input name="c47" type="radio" class="4" value=3></td>
                        <td class="opciones"><input name="c47" type="radio" class="4" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc47" name="txtAreaObservacionesc57" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>60. Los procedimientos mecánicos de manufactura, tales como, lavar, pelar, cortar, clasificar, desmenuzar, extraer, batir, secar, entre otros, se realizan de manera tal que se protejan los alimentos y las materias primas de la contaminación.</h5>
                        </td>
                        <td class="opciones"><input name="c48" type="radio" class="4" value=1></td>
                        <td class="opciones"><input name="c48" type="radio" class="4" value=2></td>
                        <td class="opciones"><input name="c48" type="radio" class="4" value=3></td>
                        <td class="opciones"><input name="c48" type="radio" class="4" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc48" name="txtAreaObservacionesc48" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>61. Se evidencian utensilios, superficies u otros, en material de vidrio que puedan ocasionar riesgo de contaminación a los alimentos por ruptura.</h5>
                        </td>
                        <td class="opciones"><input name="c49" type="radio" class="4" value=1></td>
                        <td class="opciones"><input name="c49" type="radio" class="4" value=2></td>
                        <td class="opciones"><input name="c49" type="radio" class="4" value=3></td>
                        <td class="opciones"><input name="c49" type="radio" class="4" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc49" name="txtAreaObservacionesc49" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td rowspan="2" colspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td class="opciones">
                            <h5>NA</h5>
                        </td>
                        <td class="opciones">
                            <h5>NO</h5>
                        </td>
                        <td class="opciones" rowspan="2">
                            <h5>(&Sigma; CUMPLE/9-NA)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto4" id="totalCumpleAspecto4"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto4" id="totalNoCumpleAspecto4" min="1"
                                   value=""/>
                        </td>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalNoAplicaAspecto4" id="totalNoAplicaAspecto4"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoObservaAspecto4" id="totalNoObservaAspecto4" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h5>Porcentaje cumplimiento desarrollo el servicio.</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto4"
                                   id="porcentajeCumplimientoAspecto4" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="4" class="actividad" >
                            <h5><b>5. Almacenamiento, distribución, transporte y comercialización de alimentos</b></h5>
                        </td>
                        <td>
                            <h5>62. Se lleva un control de entradas y salidas, Kárdex y rotación de productos - PEPS </h5>
                        </td>
                        <td class="opciones"><input name="c51" type="radio" class="5" value=1></td>
                        <td class="opciones"><input name="c51" type="radio" class="5" value=2></td>
                        <td class="opciones"><input name="c51" type="radio" class="5" value=3></td>
                        <td class="opciones"><input name="c51" type="radio" class="5" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc51" name="txtAreaObservacionesc51" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>63. Se evidencian alimentos no conformes, que no estén debidamente separados e identificados.</h5>
                        </td>
                        <td class="opciones"><input name="c52" type="radio" class="5" value=1></td>
                        <td class="opciones"><input name="c52" type="radio" class="5" value=2></td>
                        <td class="opciones"><input name="c52" type="radio" class="5" value=3></td>
                        <td class="opciones"><input name="c52" type="radio" class="5" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc52" name="txtAreaObservacionesc52" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>64. Se conserva la temperatura de los alimentos, según características de los mismos, hasta el momento de la distribución.</h5>
                        </td>
                        <td class="opciones"><input name="c53" type="radio" class="5" value=1></td>
                        <td class="opciones"><input name="c53" type="radio" class="5" value=2></td>
                        <td class="opciones"><input name="c53" type="radio" class="5" value=3></td>
                        <td class="opciones"><input name="c53" type="radio" class="5" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc53" name="txtAreaObservacionesc53" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>65. Durante el proceso de distribución de alimentos se toman medidas para la protección de los mismos.</h5>
                        </td>
                        <td class="opciones"><input name="c54" type="radio" class="5" value=1></td>
                        <td class="opciones"><input name="c54" type="radio" class="5" value=2></td>
                        <td class="opciones"><input name="c54" type="radio" class="5" value=3></td>
                        <td class="opciones"><input name="c54" type="radio" class="5" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc54" name="txtAreaObservacionesc54" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td rowspan="2" colspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td class="opciones">
                            <h5>NA</h5>
                        </td>
                        <td class="opciones">
                            <h5>NO</h5>
                        </td>
                        <td class="opciones" rowspan="2">
                            <h5>(&Sigma; CUMPLE/4-NA)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto5" id="totalCumpleAspecto5"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto5" id="totalNoCumpleAspecto5" min="1"
                                   value=""/>
                        </td>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalNoAplicaAspecto5" id="totalNoAplicaAspecto5"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoObservaAspecto5" id="totalNoObservaAspecto5" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h5>Porcentaje cumplimiento desarrollo el servicio.</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto5"
                                   id="porcentajeCumplimientoAspecto5" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="6" class="actividad" >
                            <h5><b>6. Saneamiento</b></h5>
                        </td>
                        <td>
                            <h5>66. Se evidencia un Plan de Saneamiento en la Institución. (físico)</h5>
                        </td>
                        <td class="opciones"><input name="c61" type="radio" class="6" value=1></td>
                        <td class="opciones"><input name="c61" type="radio" class="6" value=2></td>
                        <td class="opciones"><input name="c61" type="radio" class="6" value=3></td>
                        <td class="opciones"><input name="c61" type="radio" class="6" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc61" name="txtAreaObservacionesc61" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>67. El Plan de Saneamiento cuenta con los cuatro programas básicos (limpieza y desinfección, manejo de residuos sólidos, control de plagas y vectores y Abastecimiento de Aguas).</h5>
                        </td>
                        <td class="opciones"><input name="c62" type="radio" class="6" value=1></td>
                        <td class="opciones"><input name="c62" type="radio" class="6" value=2></td>
                        <td class="opciones"><input name="c62" type="radio" class="6" value=3></td>
                        <td class="opciones"><input name="c62" type="radio" class="6" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc62" name="txtAreaObservacionesc62" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>68. Se registran las diferentes acciones relacionadas en el plan de saneamiento (procedimientos, periodicidad, responsable). </h5>
                        </td>
                        <td class="opciones"><input name="c63" type="radio" class="6" value=1></td>
                        <td class="opciones"><input name="c63" type="radio" class="6" value=2></td>
                        <td class="opciones"><input name="c63" type="radio" class="6" value=3></td>
                        <td class="opciones"><input name="c63" type="radio" class="6" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc63" name="txtAreaObservacionesc63" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>69. Se cuenta con los insumos necesarios para realizar los procedimientos de limpieza y desinfección.</h5>
                        </td>
                        <td class="opciones"><input name="c64" type="radio" class="6" value=1></td>
                        <td class="opciones"><input name="c64" type="radio" class="6" value=2></td>
                        <td class="opciones"><input name="c64" type="radio" class="6" value=3></td>
                        <td class="opciones"><input name="c64" type="radio" class="6" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc64" name="txtAreaObservacionesc64" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td>
                            <h5>70. Los plaguicidas, detergentes, desinfectantes y otras sustancias peligrosas se encuentran almacenados en áreas independientes con separación física y están debidamente identificadas.</h5>
                        </td>
                        <td class="opciones"><input name="c65" type="radio" class="6" value=1></td>
                        <td class="opciones"><input name="c65" type="radio" class="6" value=2></td>
                        <td class="opciones"><input name="c65" type="radio" class="6" value=3></td>
                        <td class="opciones"><input name="c65" type="radio" class="6" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc65" name="txtAreaObservaciones65" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>71. La institución cuenta con acta de inspección sanitaria por parte de la entidad competente.</h5>
                        </td>
                        <td class="opciones"><input name="c66" type="radio" class="6" value=1></td>
                        <td class="opciones"><input name="c66" type="radio" class="6" value=2></td>
                        <td class="opciones"><input name="c66" type="radio" class="6" value=3></td>
                        <td class="opciones"><input name="c66" type="radio" class="6" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc66" name="txtAreaObservacionesc66" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>

                    </tr>
                    <tr>
                        <td rowspan="2" colspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td class="opciones">
                            <h5>NA</h5>
                        </td>
                        <td class="opciones">
                            <h5>NO</h5>
                        </td>
                        <td class="opciones" rowspan="2">
                            <h5>(&Sigma; CUMPLE/6-NA)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto6" id="totalCumpleAspecto6"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto6" id="totalNoCumpleAspecto6" min="1"
                                   value=""/>
                        </td>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalNoAplicaAspecto6" id="totalNoAplicaAspecto6"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoObservaAspecto6" id="totalNoObservaAspecto6" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h5>Porcentaje cumplimiento desarrollo el servicio.</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto6"
                                   id="porcentajeCumplimientoAspecto6" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="5" class="actividad" >
                            <h5><b>7. Personal Manipulador</b></h5>
                        </td>
                        <td>
                            <h5>72.  El personal manipulador de alimentos dispone de certificados de salud vigente.</h5>
                        </td>
                        <td class="opciones"><input name="c71" type="radio" class="7" value=1></td>
                        <td class="opciones"><input name="c71" type="radio" class="7" value=2></td>
                        <td class="opciones"><input name="c71" type="radio" class="7" value=3></td>
                        <td class="opciones"><input name="c71" type="radio" class="7" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc71" name="txtAreaObservacionesc71" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>73. El personal manipulador de alimentos dispone de certificados de manipulación de alimentos vigente.</h5>
                        </td>
                        <td class="opciones"><input name="c72" type="radio" class="7" value=1></td>
                        <td class="opciones"><input name="c72" type="radio" class="7" value=2></td>
                        <td class="opciones"><input name="c72" type="radio" class="7" value=3></td>
                        <td class="opciones"><input name="c72" type="radio" class="7" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc72" name="txtAreaObservacionesc72" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>74. El personal manipulador de alimentos utiliza la vestimenta adecuada (delantal, calzado tapado, tapa bocas, gorro).</h5>
                        </td>
                        <td class="opciones"><input name="c73" type="radio" class="7" value=1></td>
                        <td class="opciones"><input name="c73" type="radio" class="7" value=2></td>
                        <td class="opciones"><input name="c73" type="radio" class="7" value=3></td>
                        <td class="opciones"><input name="c73" type="radio" class="7" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc73" name="txtAreaObservacionesc73" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>75. El personal manipulador no usa aretes, argollas, joyas u otros accesorios</h5>
                        </td>
                        <td class="opciones"><input name="c74" type="radio" class="7" value=1></td>
                        <td class="opciones"><input name="c74" type="radio" class="7" value=2></td>
                        <td class="opciones"><input name="c74" type="radio" class="7" value=3></td>
                        <td class="opciones"><input name="c74" type="radio" class="7" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc74" name="txtAreaObservacionesc74" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>76. El personal Manipulador conoce como se realizan los procesos de Limpieza y Desinfección (Cantidad Desinfectante, Periodicidad).</h5>
                        </td>
                        <td class="opciones"><input name="c75" type="radio" class="7" value=1></td>
                        <td class="opciones"><input name="c75" type="radio" class="7" value=2></td>
                        <td class="opciones"><input name="c75" type="radio" class="7" value=3></td>
                        <td class="opciones"><input name="c75" type="radio" class="7" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc75" name="txtAreaObservaciones75" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>

                    <tr>
                        <td rowspan="2" colspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td class="opciones">
                            <h5>NA</h5>
                        </td>
                        <td class="opciones">
                            <h5>NO</h5>
                        </td>
                        <td class="opciones" rowspan="2">
                            <h5>(&Sigma; CUMPLE/5-NA)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto7" id="totalCumpleAspecto7"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto7" id="totalNoCumpleAspecto7" min="1"
                                   value=""/>
                        </td>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalNoAplicaAspecto7" id="totalNoAplicaAspecto7"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoObservaAspecto7" id="totalNoObservaAspecto7" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h5>Porcentaje cumplimiento desarrollo el servicio.</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto7"
                                   id="porcentajeCumplimientoAspecto7" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="5" class="actividad" >
                            <h5><b>8. Docente</b></h5>
                        </td>
                        <td>
                            <h5>77.  El docente responsable conoce el número de cupos asignados a la unidad aplicativa</h5>
                        </td>
                        <td class="opciones"><input name="c81" type="radio" class="8" value=1></td>
                        <td class="opciones"><input name="c81" type="radio" class="8" value=2></td>
                        <td class="opciones"><input name="c81" type="radio" class="8" value=3></td>
                        <td class="opciones"><input name="c81" type="radio" class="8" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc81" name="txtAreaObservacionesc81" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>78. El docente responsable conoce la cantidad de alimentos que le debe llegar en cada entrega. </h5>
                        </td>
                        <td class="opciones"><input name="c82" type="radio" class="8" value=1></td>
                        <td class="opciones"><input name="c82" type="radio" class="8" value=2></td>
                        <td class="opciones"><input name="c82" type="radio" class="8" value=3></td>
                        <td class="opciones"><input name="c82" type="radio" class="8" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc82" name="txtAreaObservacionesc82" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>79. El docente responsable conoce la calidad de los alimentos que le debe llegar (marcas, gramaje, presentación).</h5>
                        </td>
                        <td class="opciones"><input name="c83" type="radio" class="8" value=1></td>
                        <td class="opciones"><input name="c83" type="radio" class="8" value=2></td>
                        <td class="opciones"><input name="c83" type="radio" class="8" value=3></td>
                        <td class="opciones"><input name="c83" type="radio" class="8" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc83" name="txtAreaObservacionesc83" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>80. El docente responsable conoce los procedimientos para la realización para el reporte de anomalías e inconsistencias.</h5>
                        </td>
                        <td class="opciones"><input name="c84" type="radio" class="8" value=1></td>
                        <td class="opciones"><input name="c84" type="radio" class="8" value=2></td>
                        <td class="opciones"><input name="c84" type="radio" class="8" value=3></td>
                        <td class="opciones"><input name="c84" type="radio" class="8" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc84" name="txtAreaObservacionesc84" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>81. Cuando se presentan inconsistencias en la entrega de víveres el docente realiza reclamos.</h5>
                        </td>
                        <td class="opciones"><input name="c85" type="radio" class="8" value=1></td>
                        <td class="opciones"><input name="c85" type="radio" class="8" value=2></td>
                        <td class="opciones"><input name="c85" type="radio" class="8" value=3></td>
                        <td class="opciones"><input name="c85" type="radio" class="8" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc85" name="txtAreaObservaciones85" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>

                    <tr>
                        <td rowspan="2" colspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td class="opciones">
                            <h5>NA</h5>
                        </td>
                        <td class="opciones">
                            <h5>NO</h5>
                        </td>
                        <td class="opciones" rowspan="2">
                            <h5>(&Sigma; CUMPLE/5-NA)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto8" id="totalCumpleAspecto8"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto8" id="totalNoCumpleAspecto8" min="1"
                                   value=""/>
                        </td>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalNoAplicaAspecto8" id="totalNoAplicaAspecto8"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoObservaAspecto8" id="totalNoObservaAspecto8" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h5>Porcentaje cumplimiento desarrollo el servicio.</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto8"
                                   id="porcentajeCumplimientoAspecto8" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">
            <div class="panel-body">

                <table class="miyazaki">
                    <thead>

                    </thead>
                    <tbody>
                    <tr>
                        <td rowspan="3" class="actividad" >
                            <h5><b>9. Proveedor</b></h5>
                        </td>
                        <td>
                            <h5>82. Los productos enviados por el proveedor cumplen con las especificaciones de calidad. </h5>
                        </td>
                        <td class="opciones"><input name="c91" type="radio" class="9" value=1></td>
                        <td class="opciones"><input name="c91" type="radio" class="9" value=2></td>
                        <td class="opciones"><input name="c91" type="radio" class="9" value=3></td>
                        <td class="opciones"><input name="c91" type="radio" class="9" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc91" name="txtAreaObservacionesc91" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>83. Los productos enviados por el proveedor cumplen con las especificaciones de cantidad.</h5>
                        </td>
                        <td class="opciones"><input name="c92" type="radio" class="9" value=1></td>
                        <td class="opciones"><input name="c92" type="radio" class="9" value=2></td>
                        <td class="opciones"><input name="c92" type="radio" class="9" value=3></td>
                        <td class="opciones"><input name="c92" type="radio" class="9" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc92" name="txtAreaObservacionesc92" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <h5>84. Se realiza una entrega oportuna por parte del operador que permita dar cumplimiento al ciclo de menú.</h5>
                        </td>
                        <td class="opciones"><input name="c93" type="radio" class="9" value=1></td>
                        <td class="opciones"><input name="c93" type="radio" class="9" value=2></td>
                        <td class="opciones"><input name="c93" type="radio" class="9" value=3></td>
                        <td class="opciones"><input name="c93" type="radio" class="9" value=4></td>
                        <td class="comentarios"><textarea id="txtAreaObservacionesc93" name="txtAreaObservacionesc93" class="form-control" maxlength="130"                                                          rows="3"></textarea></td>
                    </tr>
                    <tr>
                        <td rowspan="2" colspan="2">
                            <h5>Total ítem evaluados</h5>
                        </td>
                        <td class="opciones">
                            <h5>C</h5>
                        </td>
                        <td class="opciones">
                            <h5>NC</h5>
                        </td>
                        <td class="opciones">
                            <h5>NA</h5>
                        </td>
                        <td class="opciones">
                            <h5>NO</h5>
                        </td>
                        <td class="opciones" rowspan="2">
                            <h5>(&Sigma; CUMPLE/3-NA)*100</h5>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalCumpleAspecto9" id="totalCumpleAspecto9"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoCumpleAspecto9" id="totalNoCumpleAspecto9" min="1"
                                   value=""/>
                        </td>
                        <td style="text-align: center;">
                            <input readonly style="width: 50px; height: 30px; display:inline-block;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="totalNoAplicaAspecto9" id="totalNoAplicaAspecto9"
                                   min="1"
                                   value=""/>
                        </td>
                        <td>
                            <input readonly style="width: 50px; height: 30px; text-align: center;" placeholder=""
                                   class="form-control" type="text" name="totalNoObservaAspecto9" id="totalNoObservaAspecto9" min="1"
                                   value=""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <h5>Porcentaje cumplimiento desarrollo el servicio.</h5>
                        </td>
                        <td>
                            <input readonly
                                   style="padding-left:0px; padding-right:0px; width: 52px; height: 30px; margin: 0 auto;text-align: center;"
                                   placeholder="" class="form-control" type="text" name="porcentajeCumplimientoAspecto9"
                                   id="porcentajeCumplimientoAspecto9" min="1" value=""/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="panel panel-default">

            <div class="panel-body">
                <table class="miyazaki">
                    <thead>
                    <tr>
                        <th>producto</th>
                        <th>Marca comercial</th>
                        <th>Marca comercial<br>C/NC</th>
                        <th>Etiquetado<br>C/NC</th>
                        <th>Empacado<br>C/NC</th>
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
                        <td><input name="txtMarcaComercial1" id="txtMarcaComercial1" class="form-control" type="text"/></td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snMarcaComercialA1" value=true checked>SI</label>
                                <label><input type="radio" name="snMarcaComercialA1" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEtiquetadoA1" value=true checked>SI</label>
                                <label><input type="radio" name="snEtiquetadoA1" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEmpacadoA1" value=true checked>SI</label>
                                <label><input type="radio" name="snEmpacadoA1" value=false>NO</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado2" id="alimentoRegistrado2">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>

                        <td><input name="txtMarcaComercial2" id="txtMarcaComercial2" class="form-control" type="text"/></td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snMarcaComercialA2" value=true checked>SI</label>
                                <label><input type="radio" name="snMarcaComercialA2" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEtiquetadoA2" value=true checked>SI</label>
                                <label><input type="radio" name="snEtiquetadoA2" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEmpacadoA2" value=true checked>SI</label>
                                <label><input type="radio" name="snEmpacadoA2" value=false>NO</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado3" id="alimentoRegistrado3">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input name="txtMarcaComercial3" id="txtMarcaComercial3" class="form-control" type="text"/></td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snMarcaComercialA3" value=true checked>SI</label>
                                <label><input type="radio" name="snMarcaComercialA3" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEtiquetadoA3" value=true checked>SI</label>
                                <label><input type="radio" name="snEtiquetadoA3" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEmpacadoA3" value=true checked>SI</label>
                                <label><input type="radio" name="snEmpacadoA3" value=false>NO</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado4" id="alimentoRegistrado4">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input name="txtMarcaComercial4" id="txtMarcaComercial4" class="form-control" type="text"/></td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snMarcaComercialA4" value=true checked>SI</label>
                                <label><input type="radio" name="snMarcaComercialA4" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEtiquetadoA4" value=true checked>SI</label>
                                <label><input type="radio" name="snEtiquetadoA4" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEmpacadoA4" value=true checked>SI</label>
                                <label><input type="radio" name="snEmpacadoA4" value=false>NO</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><select class="form-control alimento" name="alimentoRegistrado5" id="alimentoRegistrado5">
                            <option value="-1" label="--- Select ---"/>
                            <c:forEach var="alimentoRegistrado" items="${listaAlimentosRegistrados}">
                                <option value="${alimentoRegistrado.id}"> ${alimentoRegistrado.nombre}</option>
                            </c:forEach>
                        </select></td>
                        <td><input name="txtMarcaComercial5" id="txtMarcaComercial5" class="form-control" type="text"/></td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snMarcaComercialA5" value=true checked>SI</label>
                                <label><input type="radio" name="snMarcaComercialA5" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEtiquetadoA5" value=true checked>SI</label>
                                <label><input type="radio" name="snEtiquetadoA5" value=false>NO</label>
                            </div>
                        </td>
                        <td>
                            <div class="radio">
                                <label><input type="radio" name="snEmpacadoA5" value=true checked>SI</label>
                                <label><input type="radio" name="snEmpacadoA5" value=false>NO</label>
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
                <h3 class="panel-title" style="text-align: center">
                    <b>Observaciones Generales</b>
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

            <div class="panel-body">
                <table class="miyazaki">
                    <thead>
                    <tr>
                        <th colspan="3">Cumplimiento por responsable y global</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><b>Desarrollo del servicio</b></td>
                        <td>(&Sigma; Item operador/(&Sigma; item operador-NA))*100 </td>
                        <td><input name="txtTotalAspecto1" id="txtTotalAspecto1" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td><b>Edificación e Instalaciones</b></td>
                        <td>(&Sigma; Item operador/(&Sigma; item operador-NA))*100 </td>
                        <td><input name="txtTotalAspecto2" id="txtTotalAspecto2" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td><b>Equipos y utensilios</b></td>
                        <td>(&Sigma; Item operador/(&Sigma; item operador-NA))*100 </td>
                        <td><input name="txtTotalAspecto3" id="txtTotalAspecto3" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td><b>Requisitos higiénicos de fabricación</b></td>
                        <td>(&Sigma; Item operador/(&Sigma; item operador-NA))*100 </td>
                        <td><input name="txtTotalAspecto4" id="txtTotalAspecto4" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td><b>Almacenamiento, distribución, transporte y comercialización </b></td>
                        <td>(&Sigma; Item operador/(&Sigma; item operador-NA))*100 </td>
                        <td><input name="txtTotalAspecto5" id="txtTotalAspecto5" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td><b>Saneamiento </b></td>
                        <td>(&Sigma; Item operador/(&Sigma; item operador-NA))*100 </td>
                        <td><input name="txtTotalAspecto6" id="txtTotalAspecto6" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td><b>Personal Manipulador </b></td>
                        <td>(&Sigma; Item operador/(&Sigma; item operador-NA))*100 </td>
                        <td><input name="txtTotalAspecto7" id="txtTotalAspecto7" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td><b>Docente </b></td>
                        <td>(&Sigma; Item operador/(&Sigma; item operador-NA))*100 </td>
                        <td><input name="txtTotalAspecto8" id="txtTotalAspecto8" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td><b>Proveedor </b></td>
                        <td>(&Sigma; Item operador/(&Sigma; item operador-NA))*100 </td>
                        <td><input name="txtTotalAspecto9" id="txtTotalAspecto9" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><b>Porcentaje de cumplimiento global del servicio (&Sigma; Cumplimiento responsable/9</b></td>
                        <td><input name="txtTotalGlobal" id="txtTotalGlobal" class="form-control" type="text" readonly/></td>
                    </tr>
                    <tr>
                        <td colspan="3"><h5 class="col-md-3"><b>En codiciones adecuadas del servicio</b></h5><h5 class="col-md-1"><b>80%</b> </h5>
                            <h5 class="col-md-3"><b>Regular condición del servicio</b></h5><h5 class="col-md-2"><b>60 a 79%</b></h5><h5 class="col-md-2"><b>Critica condición del servicio</b></h5><h5 class="col-md-1"><b><60%</b> </h5></td>
                    </tr>
                    </tbody>
                </table>
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
                        <th >Docente Encargado</th>
                        <th >Manipulador de Alimentos</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 id="nombreResponsable" style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Nombre</h5>
                                <div class="col-md-10 control-label" style=" padding-left:0px; padding-right:0px;">
                                    <input placeholder="" id="txtNombreDocenteEncargado" class="form-control" type="text"
                                           name="txtNombreDocenteEncargado"
                                           value=""/>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </td>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 id="nombreProfesional" style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Nombre</h5>
                                <div class="col-md-10 control-label" style=" padding-left:0px; padding-right:0px;">
                                    <input placeholder="" id="txtNombreManipulador" class="form-control" type="text"
                                           name="txtNombreManipulador"
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
                                    <input type="hidden" class="form-control" name="firma1" id="firma1">
                                    <p>
                                        <button type="button" id="clearBtnFirmaDocente" class="btn btn-default"
                                                onclick="institucionesEducativasController.limpiarFirmaDocente();">Limpiar
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td >
                            <div class="col-md-12 control-label">
                                <h5 style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Firma
                                </h5>
                                <div class="col-md-10 control-label" style="text-align: left; padding-left:0px; padding-right:0px;">
                                    <div class='js-signature'>
                                    </div>
                                    <input type="hidden" class="form-control" name="firma2" id="firma2">
                                    <p>
                                        <button type="button" id="clearBtnFirmaManipulador" class="btn btn-default"
                                                onclick="institucionesEducativasController.limpiarFirmaManipulador();">
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
                        <th>Profesional Realizó Visita</th>
                        <th>Revisó</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 id="nombreReviso" style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Nombre</h5>
                                <div class="col-md-10 control-label" style=" padding-left:0px; padding-right:0px;">
                                    <input placeholder="" id="txtNombreProfesional" class="form-control" type="text"
                                           name="txtNombreProfesional"
                                           value=""/>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 id="nombreDigito"style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Nombre</h5>
                                <div class="col-md-10 control-label" style=" padding-left:0px; padding-right:0px;">
                                    <input placeholder="" id="txtNombreReviso" class="form-control" type="text"
                                           name="txtNombreReviso"
                                           value=""/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 style="text-align: left; padding-left:0px; padding-right:0px;"  class="col-md-2 control-label">Firma
                                </h5>
                                <div class="col-md-10 control-label" style="text-align: left; padding-left:0px; padding-right:0px;">
                                    <div class='js-signature'>

                                    </div>
                                    <input type="hidden" class="form-control" name="firma3" id="firma3">
                                    <p>
                                        <button type="button" id="clearBtnFirmaProfesional" class="btn btn-default"
                                                onclick="institucionesEducativasController.limpiarFirmaProfesional();">Limpiar
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-12 control-label">
                                <h5 style="text-align: left; padding-left:0px; padding-right:0px;"  class="col-md-2 control-label">Firma
                                </h5>
                                <div class="col-md-10 control-label" style="text-align: left; padding-left:0px; padding-right:0px;">
                                    <div class='js-signature'>
                                    </div>
                                    <input type="hidden" class="form-control" name="firma4" id="firma4">
                                    <p>
                                        <button type="button" id="clearBtnFirmaReviso" class="btn btn-default"
                                                onclick="institucionesEducativasController.limpiarFirmaReviso();">
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
                        <th>Digito</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div style=" margin: 0 auto; width: 40%">
                                <h5 style="text-align: left; padding-left:0px; padding-right:0px;" class="col-md-2 control-label">Nombre</h5>
                                <div class="col-md-9 control-label" style=" padding-left:0px; padding-right:0px;">
                                    <input placeholder="" id="txtNombreDigito" class="form-control" type="text"
                                           name="txtNombreDigito"
                                           value=""/>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <div control-label style=" margin: 0 auto; width: 40%">
                                <h5 style="text-align: left; padding-left:0px; padding-right:0px;"  class="col-md-2 control-label">Firma
                                </h5>
                                <div class="col-md-10 control-label" style="text-align: left; padding-left:0px; padding-right:0px;">
                                    <div class='js-signature'>

                                    </div>
                                    <input type="hidden" class="form-control" name="firma5" id="firma5">
                                    <p>
                                        <button type="button" id="clearBtnFirmaDigito" class="btn btn-default"
                                                onclick="institucionesEducativasController.limpiarFirmaDigito();">Limpiar
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
                            onclick="institucionesEducativasController.enviarFormulario()">Enviar
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>