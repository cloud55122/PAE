/**
 * Created by WilliamEduardo on 19/08/2016.
 */
var totalItemsItemsEvaluados ={
    aspectos :  [],
    totalItemsNoAplica : [],
    totalItemsNoObserva : [],
    totalGlobal : 0
}

var institucionesEducativasController = {
    nombreFormulario: "institucionesEducativasForm",
    validator :"",
    path : window.location.pathname.substring(0,window.location.pathname.lastIndexOf("/")),
    areaEvaluada: {
        nombre : "Instituciones Educativas",
        encabezadoInstEducativa : {},
        aspectosEvaluados : [],
        alimentos : [],
        responsables: [],
        comentarios : ""
    },
    addOnlyNumber: function(selector) {
        //Agrega Validacion para que el usuario solo pueda digitar numeros
        $(selector).keydown(function(e) {
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [189,109, 190, 46, 8, 9, 13, 196]) !== -1 ||
                // Allow: Ctrl+A
                (e.keyCode == 65 && e.ctrlKey === true) ||
                // Allow: home, end, left, right, down, up
                (e.keyCode >= 35 && e.keyCode <= 40)) {
                // let it happen, don't do anything
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });
    },
    addValidationForm: function () {
        $.validator.addMethod("valueNotEquals", function(value, element, arg){
            return arg != value;
        });
        $.validator.setDefaults({
            ignore: []
        });
        this.validator =$("#" + this.nombreFormulario).validate({
            debug: true,
            errorElement: 'div',
            rules: {
                firma1: {
                    required : true
                },
                firma2: {
                    required : true
                },
                firma3: {
                    required : true
                },
                firma4: {
                    required : true
                },
                firma5: {
                    required : true
                },
                subregion: {
                    valueNotEquals: "-1",
                    required : true
                },
                municipios: {
                    required : true,
                    valueNotEquals: "-1"
                },
                txtCorregimiento: {
                    required: true
                },
                txtFechaVisita: {
                    required: true
                },
                txtBarrio: {
                    required: true
                },
                txtModeloOperacion: {
                    required: true
                },
                txtNombreIE: {
                    required: true,
                },
                txtNombreSedeIE: {
                    required: true
                },
                txtCodigoDane: {
                    required: true,
                },
                txtNombreRector: {
                    required: true
                },
                txtTelefonoRector: {
                    required: true
                },
                txtDocentePrograma: {
                    required: true
                },
                txtTelefonoDocente: {
                    required: true
                },
                txtManipuladorAlimientos: {
                    required: true
                },
                txtTelefonoManipuladorAlimientos: {
                    required: true
                },
                txtProfesionalVisita: {
                    required: true
                },
                txtCargoProfesional: {
                    required: true
                },
                txtNiñosMatriculados: {
                    required: true
                },
                txtNiñosAtendidosRestaurante: {
                    required: true
                },
                snMinutaMejorada: {
                    required: true
                },
                tipoModalidad: {
                    required: true,
                    valueNotEquals: "-1"
                },
                txtNiñosAtendidosGobernacion: {
                    required: true
                },
                txtNiñosAtendidosMunicipio: {
                    required: true
                },
                txtNiñosMatriculadosSecundaria: {
                    required: true
                },
                txtNumIndigenas: {
                    required: true
                },
                txtNumDesplazados: {
                    required: true
                },
                txtNumDiscapacitados: {
                    required: true
                },
                snCoberturaPAE: {
                    required: true
                },
                snCobroParticipacion: {
                    required: true
                },
                txtValorcobro: {
                    required: true
                },
                c1: {
                    required: true
                },
                c2: {
                    required: true
                },
                c3: {
                    required: true
                },
                c4: {
                    required: true
                },
                c5: {
                    required: true
                },
                c6: {
                    required: true
                },
                c7: {
                    required: true
                },
                c8: {
                    required: true
                },
                c21: {
                    required: true
                },
                c22: {
                    required: true
                },
                c23: {
                    required: true
                },
                c24 : {
                    required: true
                },
                c25 : {
                    required: true
                },
                c26 : {
                    required: true
                },
                c27 : {
                    required: true
                },
                c28 : {
                    required: true
                },
                c29 : {
                    required: true
                },
                c210 : {
                    required: true
                },
                c31 : {
                    required: true
                },
                c32 : {
                    required: true
                },
                c33 : {
                    required: true
                },
                c34 : {
                    required: true
                },
                c41 : {
                    required: true
                },
                c42 : {
                    required: true
                },
                c43 : {
                    required: true
                },
                c44 : {
                    required: true
                },
                c45 : {
                    required: true
                },
                c46 : {
                    required: true
                },
                c47 : {
                    required: true
                },
                c48 : {
                    required: true
                },
                c49 : {
                    required: true
                },
                c51 : {
                    required: true
                },
                c52 : {
                    required: true
                },
                c53 : {
                    required: true
                },
                c54 : {
                    required: true
                },
                c61 : {
                    required: true
                },

                c46 : {
                    required: true
                },
                c47 : {
                    required: true
                },
                c48 : {
                    required: true
                },
                c49 : {
                    required: true
                },
                c51 : {
                    required: true
                },
                c52 : {
                    required: true
                },
                c53 : {
                    required: true
                },
                c54 : {
                    required: true
                },
                c61 : {
                    required: true
                },
                c62 : {
                    required: true
                },
                c63 : {
                    required: true
                },
                c64 : {
                    required: true
                },
                c65 : {
                    required: true
                },
                c66 : {
                    required: true
                },
                c71 : {
                    required: true
                },
                c72 : {
                    required: true
                },
                c73 : {
                    required: true
                },
                c74 : {
                    required: true
                },
                c75 : {
                    required: true
                },
                c81 : {
                    required: true
                },
                c82 : {
                    required: true
                },
                c83 : {
                    required: true
                },
                c84 : {
                    required: true
                },
                c85 : {
                    required: true
                },
                c91 : {
                    required: true
                },
                c92 : {
                    required: true
                },
                c93 : {
                    required: true
                },
                alimentoRegistrado1 : {
                    required: true,
                    valueNotEquals: "-1"
                },
                alimentoRegistrado2 : {
                    required: true,
                    valueNotEquals: "-1"
                },
                alimentoRegistrado3 : {
                    required: true,
                    valueNotEquals: "-1"
                },
                alimentoRegistrado4 : {
                    required: true,
                    valueNotEquals: "-1"
                },
                alimentoRegistrado5 : {
                    required: true,
                    valueNotEquals: "-1"
                },
                txtMarcaComercial1 : {
                    required: true
                },
                txtMarcaComercial2 : {
                    required: true
                },
                txtMarcaComercial3 : {
                    required: true
                },
                txtMarcaComercial4 : {
                    required: true
                },
                txtMarcaComercial5 : {
                    required: true
                },
                txtNombreDocenteEncargado : {
                    required: true
                },
                txtNombreManipulador : {
                    required: true
                },
                txtNombreProfesional : {
                    required: true
                },
                txtNombreReviso : {
                    required: true
                },
                txtNombreDigito: {
                    required: true
                }
            },
            messages: {

                txtCorregimiento: "Campo Obligatorio",
                subregion: "La subregion es obligatoria",
                municipios: "El municipio es obligatorio",
                txtFechaVisita: "Campo Obligatorio",
                txtModeloOperacion: "Campo Obligatorio",
                txtNombreIE: "Campo Obligatorio",
                txtNombreSedeIE: "Campo Obligatorio",
                txtCodigoDane : "Campo Obligatorio",
                txtNombreRector: "Campo Obligatorio",
                txtTelefonoRector: "Campo Obligatorio",
                txtDocentePrograma: "Campo Obligatorio",
                txtTelefonoDocente: "Campo Obligatorio",
                txtManipuladorAlimientos: "Campo Obligatorio",
                txtTelefonoManipuladorAlimientos : "Campo Obligatorio",
                txtProfesionalVisita : "Campo Obligatorio",
                txtCargoProfesional : "Campo Obligatorio",
                txtNiñosMatriculados : "Campo Obligatorio",
                snMinutaMejorada: "Campo Obligatorio",
                txtModalidadAtencion : "Campo Obligatorio",
                txtNiñosAtendidosGobernacion : "Campo Obligatorio",
                txtNiñosAtendidosMunicipio : "Campo Obligatorio",
                txtNiñosMatriculadosSecundaria: "Campo Obligatorio",
                txtNumIndigenas : "Campo Obligatorio",
                txtNumDesplazados : "Campo Obligatorio",
                txtNumDiscapacitados : "Campo Obligatorio",
                snCoberturaPAE : "Campo Obligatorio",
                snCobroParticipacion: "Campo Obligatorio",
                txtValorcobro : "Campo Obligatorio",

                c1: "Campo Obligatorio",
                c2: "Campo Obligatorio",
                c3: "Campo Obligatorio",
                c4: "Campo Obligatorio",
                c5: "Campo Obligatorio",
                c6: "Campo Obligatorio",
                c7: "Campo Obligatorio",
                c8: "Campo Obligatorio",

                c21: "Campo Obligatorio",
                c22: "Campo Obligatorio",
                c23: "Campo Obligatorio",
                c24: "Campo Obligatorio",
                c25: "Campo Obligatorio",
                c26: "Campo Obligatorio",
                c27: "Campo Obligatorio",
                c28: "Campo Obligatorio",
                c29: "Campo Obligatorio",
                c210: "Campo Obligatorio",

                c31: "Campo Obligatorio",
                c32: "Campo Obligatorio",
                c33: "Campo Obligatorio",
                c34: "Campo Obligatorio",

                c41: "Campo Obligatorio",
                c42: "Campo Obligatorio",
                c43: "Campo Obligatorio",
                c44: "Campo Obligatorio",
                c45: "Campo Obligatorio",
                c46: "Campo Obligatorio",
                c47: "Campo Obligatorio",
                c48: "Campo Obligatorio",
                c49: "Campo Obligatorio",

                c51: "Campo Obligatorio",
                c52: "Campo Obligatorio",
                c53: "Campo Obligatorio",
                c54: "Campo Obligatorio",

                c61: "Campo Obligatorio",
                c62: "Campo Obligatorio",
                c63: "Campo Obligatorio",
                c64: "Campo Obligatorio",
                c65: "Campo Obligatorio",
                c66: "Campo Obligatorio",

                c71: "Campo Obligatorio",
                c72: "Campo Obligatorio",
                c73: "Campo Obligatorio",
                c74: "Campo Obligatorio",
                c75: "Campo Obligatorio",

                c81: "Campo Obligatorio",
                c82: "Campo Obligatorio",
                c83: "Campo Obligatorio",
                c84: "Campo Obligatorio",
                c85: "Campo Obligatorio",

                c91: "Campo Obligatorio",
                c92: "Campo Obligatorio",
                c93: "Campo Obligatorio",
                txtNombreDocenteEncargado : "Campo Obligatorio",
                txtNombreManipulador : "Campo Obligatorio",
                txtNombreProfesional : "Campo Obligatorio",
                txtNombreReviso : "Campo Obligatorio",
                txtNombreDigito : "Campo Obligatorio",

            },
            errorPlacement: function (error, element) {
                var isClassError = $(element).attr("class");

                if (isClassError == "error" || isClassError.indexOf("hasDatepicker") == -1) {
                    error.insertAfter(element);
                } else {
                    error.css("display", "table-row");
                    error.insertAfter(element.next());
                }
            }
        });
    },
    consultarMunicipios: function () {
        $.ajax({
            type: "GET",
            async: true,
            dataType: 'json',
            url: 'getMunicipiosxSubregion',
            data: "id=" + $('#subregion').val(),
            success: function (data) {
                $('#municipios').empty();
                $('#municipios').append($('<option>', {
                    value: "-1",
                    text: "--- Select ---"
                }));
                data.forEach(function (municipio) {
                    $('#municipios').append($('<option>', {
                        value: municipio.id,
                        text: '' + municipio.nombre + ''
                    }));
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("Error del servicio1");
            }
        });
    },
    enviarFormulario: function () {

        /*Encabezado Instituciones Educativas*/
        if ($("#"+this.nombreFormulario).valid()) {
            if (confirm('¿Estas seguro de enviar este formulario?')){
                this.areaEvaluada.encabezadoInstEducativa.subregion = {
                    id : $("#subregion").val()
                };
                this.areaEvaluada.encabezadoInstEducativa.municipio = {
                    id : $("#municipios").val()
                };

                this.areaEvaluada.encabezadoInstEducativa.corregimiento= $("#txtCorregimiento").val();
                this.areaEvaluada.encabezadoInstEducativa.fechaVisita= $("#txtFechaVisita").val();
                this.areaEvaluada.encabezadoInstEducativa.barrioOVereda= $("#txtBarrio").val();
                this.areaEvaluada.encabezadoInstEducativa.modeloOperacion= $("[name=modeloOperacion]:checked").val();
                this.areaEvaluada.encabezadoInstEducativa.nombreInstEducativa= $("#txtNombreIE").val();
                this.areaEvaluada.encabezadoInstEducativa.nombreSedeEducativa= $("#txtNombreSedeIE").val();
                this.areaEvaluada.encabezadoInstEducativa.codigoDane= $("#txtCodigoDane").val();
                this.areaEvaluada.encabezadoInstEducativa.nombreRector= $("#txtNombreRector").val();
                this.areaEvaluada.encabezadoInstEducativa.telefonoRector= $("#txtTelefonoRector").val();
                this.areaEvaluada.encabezadoInstEducativa.docenteEncargadoPrograma= $("#txtDocentePrograma").val();
                this.areaEvaluada.encabezadoInstEducativa.telefonoDocenteEncargado= $("#txtTelefonoDocente").val();
                this.areaEvaluada.encabezadoInstEducativa.nombreManipuladorAlimento= $("#txtManipuladorAlimientos").val();
                this.areaEvaluada.encabezadoInstEducativa.telefonoManipuladorAlimento= $("#txtTelefonoManipuladorAlimientos").val();
                this.areaEvaluada.encabezadoInstEducativa.profesionalRealizaVisita= $("#txtProfesionalVisita").val();
                this.areaEvaluada.encabezadoInstEducativa.cargoProfesionalVisita= $("#txtCargoProfesional").val();
                this.areaEvaluada.encabezadoInstEducativa.ninosMatriPrimaria= $("#txtNiñosMatriculados").val();
                this.areaEvaluada.encabezadoInstEducativa.ninosAtiendeRestaurante= $("#txtNiñosAtendidosRestaurante").val();;
                this.areaEvaluada.encabezadoInstEducativa.snMinutaMejorada= $("[name=snMinutaMejorada]:checked").val();//Este falta arreglarlo en la visual
                this.areaEvaluada.encabezadoInstEducativa.modalidadAtencion= $("#tipoModalidad").val();
                this.areaEvaluada.encabezadoInstEducativa.cuposAtendidosGovernacion= $("#txtNiñosAtendidosGobernacion").val();
                this.areaEvaluada.encabezadoInstEducativa.cuposAtendidosMunicipio= $("#txtNiñosAtendidosMunicipio").val();
                this.areaEvaluada.encabezadoInstEducativa.escolaresMatriSecundaria= $("#txtNiñosMatriculadosSecundaria").val();
                this.areaEvaluada.encabezadoInstEducativa.indigenas= $("#txtNumIndigenas").val();
                this.areaEvaluada.encabezadoInstEducativa.desplazados= $("#txtNumDesplazados").val();
                this.areaEvaluada.encabezadoInstEducativa.discapacitados= $("#txtNumDiscapacitados").val();
                this.areaEvaluada.encabezadoInstEducativa.snCoberturaPoblacionPae= $("[name=snCoberturaPAE]:checked").val();
                this.areaEvaluada.encabezadoInstEducativa.snExisteCobroParticipacion= $("[name=snCobroParticipacion]:checked").val();
                this.areaEvaluada.encabezadoInstEducativa.valorCobroParticipacion= $("#txtValorcobro").val();

                /*En este numero inicial las preguntas del formulario de instituciones educativas*/
                var id_pregunta = 43;

                /*Items Evaluados Instituciones Educativas*/
                /*Aspectos Evaluados*/
                this.areaEvaluada.aspectosEvaluados[0].nombre = "Desarrollo del servicio";
                this.areaEvaluada.aspectosEvaluados[1].nombre = "Edificacion e instalaciones";
                this.areaEvaluada.aspectosEvaluados[2].nombre = "Equipos y utensilios";
                this.areaEvaluada.aspectosEvaluados[3].nombre = "Requisitos Higienicos de Fabricacion";
                this.areaEvaluada.aspectosEvaluados[4].nombre = "Almacenamiento, distribucion, transporte y comercializacion de alimentos";
                this.areaEvaluada.aspectosEvaluados[5].nombre = "Saneamiento";
                this.areaEvaluada.aspectosEvaluados[6].nombre = "Personal Manipulador";
                this.areaEvaluada.aspectosEvaluados[7].nombre = "Docente ";
                this.areaEvaluada.aspectosEvaluados[8].nombre = "Proveedor";

                for(var puntero = 1; puntero <= 9 ; puntero++){
                    var nombrePregunta = puntero == 1 ? "c" : "c"+puntero;
                    for(var i= 1; i<= totalItemsItemsEvaluados.aspectos[puntero];i++){
                        var estadoPregunta = $("[name="+nombrePregunta+i+"]:checked").val();
                        this.areaEvaluada.aspectosEvaluados[puntero-1].itemEvaluados[i-1] ={
                            pregunta : {
                                id : id_pregunta
                            },
                            estadoPregunta : {
                                id : estadoPregunta
                            },
                            observaciones : $("#txtAreaObservaciones"+nombrePregunta+i).val()
                        }
                        id_pregunta++;
                    }
                }

                /*Alimentos Recibidos Logistica Entrega*/
                var cantidadAlimentos = $("[class='form-control alimento valid']").length + $("[class='form-control alimento']").length;
                for(var i= 1; i<=cantidadAlimentos ;i++){
                    this.areaEvaluada.alimentos[i-1] = {
                        alimentoRegistrado : {
                            id : $("#alimentoRegistrado"+i).val()
                        },
                        marca : $("#txtMarcaComercial"+i).val(),
                        snCumpleMarcaComercial : $("[name=snMarcaComercialA"+i+"]:checked").val(),
                        snCumpleEtiquetado : $("[name=snEtiquetadoA"+i+"]:checked").val(),
                        snCumpleEmpaque : $("[name=snEmpacadoA"+i+"]:checked").val()

                    }
                }
                /*Responsables Instituciones Educativas*/
                /*Docente*/
                this.areaEvaluada.responsables[0] = {
                    nombre : $("#txtNombreDocenteEncargado").val(),
                };

                /*Manipulador*/
                this.areaEvaluada.responsables[1] = {
                    nombre : $("#txtNombreManipulador").val(),
                };

                /*Profesional*/
                this.areaEvaluada.responsables[2] = {
                    nombre : $("#txtNombreProfesional").val(),
                };
                /*Reviso*/
                this.areaEvaluada.responsables[3] = {
                    nombre : $("#txtNombreReviso").val(),
                };
                /*Digito*/
                this.areaEvaluada.responsables[4] = {
                    nombre : $("#txtNombreDigito").val(),
                };
                /*comentarios*/
                this.areaEvaluada.comentarios = $("#txtComentario").val();


                var formData = new FormData();
                formData.append("areaEvaluada", JSON.stringify(this.areaEvaluada));

                formData.append("FirmaDocenteEncargado", this.convertirDataURIToBlob($('.js-signature').eq(0).jqSignature('getDataURL')));
                formData.append("FirmaManipulador", this.convertirDataURIToBlob($('.js-signature').eq(1).jqSignature('getDataURL')));
                formData.append("FirmaProfesional", this.convertirDataURIToBlob($('.js-signature').eq(2).jqSignature('getDataURL')));
                formData.append("FirmaReviso", this.convertirDataURIToBlob($('.js-signature').eq(3).jqSignature('getDataURL')));
                formData.append("FirmaDigito", this.convertirDataURIToBlob($('.js-signature').eq(4).jqSignature('getDataURL')));


                $.ajax({
                    type: "POST",
                    async: true,
                    processData: false,
                    contentType: false,
                    url: 'guardarFormulario4',
                    dataType : 'text',
                    data: formData,
                    success: function(data) {
                        console.log("servicio Exitoso: " + data );
                        window.open(institucionesEducativasController.path+"/mostrarFormularioPdf?id="+data,"_self");
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("Error del servicio");
                    }
                });
            }
        }else{
            institucionesEducativasController.validator.focusInvalid();
        }

    },
    limpiarFirmaDocente: function () {
        $('.js-signature').eq(0).jqSignature('clearCanvas');
        $("#firma1").rules('add',{
            required : true
        });
    },
    limpiarFirmaManipulador: function () {
        $('.js-signature').eq(1).jqSignature('clearCanvas');
        $("#firma2").rules('add',{
            required : true
        });
    },
    limpiarFirmaProfesional: function () {
        $('.js-signature').eq(2).jqSignature('clearCanvas');
        $("#firma3").rules('add',{
            required : true
        });
    },
    limpiarFirmaReviso: function () {
        $('.js-signature').eq(3).jqSignature('clearCanvas');
        $("#firma4").rules('add',{
            required : true
        });
    },
    limpiarFirmaDigito: function () {
        $('.js-signature').eq(4).jqSignature('clearCanvas');
        $("#firma5").rules('add',{
            required : true
        });
    },

    convertirDataURIToBlob: function (dataURI) {
        var byteString;
        if (dataURI.split(',')[0].indexOf('base64') >= 0)
            byteString = atob(dataURI.split(',')[1]);
        else
            byteString = unescape(dataURI.split(',')[1]);
        // separate out the mime component
        var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
        // write the bytes of the string to a typed array
        var ia = new Uint8Array(byteString.length);
        for (var i = 0; i < byteString.length; i++) {
            ia[i] = byteString.charCodeAt(i);
        }
        return new Blob([ia], {type: mimeString});
    }

};
$(document).ready(function () {
    institucionesEducativasController.addOnlyNumber("#txtIdentificacionProveedor");
    /*Manejo del formulario*/
    $("#txtFechaVisita").datepicker({ dateFormat: 'dd/mm/yy' });
    $("#btnFechaVisita").click(function () {
        $("#txtFechaVisita").focus();
    });
    /*Recarga dinamica de municipios*/
    $("#subregion").change(function () {
        institucionesEducativasController.consultarMunicipios();
    });
    $("#txtNiñosAtendidosRestaurante, #txtNiñosAtendidosGobernacion, #txtNiñosAtendidosMunicipio").change(function () {
        if($("#txtNiñosAtendidosRestaurante").val() != "" && $("#txtNiñosAtendidosRestaurante").val() < $("#txtNiñosAtendidosGobernacion").val()){
            alert("El numero de niños atendidos por la gobernacion debe ser menor o igual al numero de niños atendidos por el restaurante");
            $(this).val("");
        }
        if($("#txtNiñosAtendidosRestaurante").val() != "" && $("#txtNiñosAtendidosRestaurante").val() < $("#txtNiñosAtendidosMunicipio").val()){
            alert("El numero de niños atendidos por el municipio debe ser menor o igual al numero de niños atendidos por el restaurante");
            $(this).val("");
        }
    });
    $("#txtNiñosMatriculadosSecundaria, #txtNumIndigenas, #txtNumDesplazados, #txtNumDiscapacitados").change(function () {
        if($("#txtNiñosMatriculadosSecundaria").val() != "" && parseInt($("#txtNiñosMatriculadosSecundaria").val()) < parseInt($("#txtNumIndigenas").val())){
            alert("El numero de niños de la poblacion indigena debe ser menor o igual al numero de niños matriculados en secundaria");
            $(this).val("");
        };
        if($("#txtNiñosMatriculadosSecundaria").val() != "" && parseInt($("#txtNiñosMatriculadosSecundaria").val()) < parseInt($("#txtNumDesplazados").val())){
            alert("El numero de niños de la poblacion desplazada debe ser menor o igual al numero de niños matriculados en secundaria");
            $(this).val("");
        };
        if($("#txtNiñosMatriculadosSecundaria").val() != "" && parseInt($("#txtNiñosMatriculadosSecundaria").val()) < parseInt($("#txtNumDiscapacitados").val())){
            alert("El numero de niños de la poblacion discapacitada debe ser menor o igual al numero de niños matriculados en secundaria");
            $(this).val("");
        };
    });
    institucionesEducativasController.addValidationForm();
    /*Manejo de la Firma Digital*/
    if ($('.js-signature').length) {
        $('.js-signature').jqSignature();
    }
    ;
    $('.js-signature').eq(0).on('jq.signature.changed', function() {
        $("#firma1").rules('remove');
    });
    $('.js-signature').eq(1).on('jq.signature.changed', function () {
        $("#firma2").rules('remove');
    });
    $('.js-signature').eq(2).on('jq.signature.changed', function () {
        $("#firma3").rules('remove');
    });
    $('.js-signature').eq(3).on('jq.signature.changed', function () {
        $("#firma4").rules('remove');
    });
    $('.js-signature').eq(4).on('jq.signature.changed', function () {
        $("#firma5").rules('remove');
    });
    /*Validacion cobro Participacion*/
    $("[name=snCobroParticipacion]").change(function() {
        if($(this).val()=="false"){
            //$("#txtOperador").attr('disabled',true);
            $("#txtValorcobro").attr('disabled',true);
        }else{
            //$("#txtOperador").attr('disabled',false);
            $("#txtValorcobro").attr('disabled',false);
        }
    });
    /*Inicializacion de aspectos Evaluados (5 en este formulario)*/
    for(var j=0; j<9; j++){
        institucionesEducativasController.areaEvaluada.aspectosEvaluados[j] = {
            itemEvaluados : [],
            nombre : "",
            totalItemsCumplidos : 0,
            totalItemsNoCumplidos : 0,
            totalItemsNoAplica : 0,
            totalItemsNoObserva : 0,
            porcentajeCumplimiento : 0
        };
    }
    /*Calculo de totales*/
    for(var i=1; i<=9; i++){
        totalItemsItemsEvaluados.aspectos[i] = $("[class="+i+"]").length / 4;
        totalItemsItemsEvaluados.totalItemsNoAplica[i] = 0;
        totalItemsItemsEvaluados.totalItemsNoObserva[i] = 0;
    }

    $("[class='1'], [class='2'], [class='3'], [class='4'], [class='5'], [class='6'], [class='7'], [class='8'], [class='9']").change(function () {

        var totalItemsItemsEvaluadosAspecto =[];

        var txtAreaObservaciones = $("#txtAreaObservaciones" + $(this).attr("name") + "");
        var pregunta = $(this).attr("class");
        if ($(this).val() == "2") {
            txtAreaObservaciones.rules('add', {
                required: true
            });
        } else {
            txtAreaObservaciones.rules('remove');
        }

        //totalItemsItemsEvaluados.totalItemsNoAplica[pregunta] = $("."+pregunta+":checked[value=3]").length;
        institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsNoAplica = $("."+pregunta+":checked[value=3]").length;
        $("#totalNoAplicaAspecto"+pregunta+"").attr('value', institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsNoAplica);
        //totalItemsItemsEvaluados.totalItemsNoObserva[pregunta] = $("."+pregunta+":checked[value=4]").length;
        institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsNoObserva = $("."+pregunta+":checked[value=4]").length;
        $("#totalNoObservaAspecto"+pregunta+"").attr('value', institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsNoObserva);
        institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsCumplidos = $("."+pregunta+":checked[value=1]").length;
        $("#totalCumpleAspecto"+pregunta+"").attr('value', institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsCumplidos);
        institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].porcentajeCumplimiento = ((institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsCumplidos)/ (totalItemsItemsEvaluados.aspectos[pregunta] - institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsNoAplica)) * 100;
        $("#porcentajeCumplimientoAspecto"+pregunta+"").attr('value', ((institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].porcentajeCumplimiento)));
        institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsNoCumplidos = $("."+pregunta+":checked[value=2]").length;
        $("#totalNoCumpleAspecto"+pregunta+"").attr('value', institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].totalItemsNoCumplidos);
        /*Tabla de totales*/
        $("#txtTotalAspecto"+pregunta+"").attr('value', (institucionesEducativasController.areaEvaluada.aspectosEvaluados[pregunta - 1].porcentajeCumplimiento));
        /*Calculo de porcentaje de cumplimiento global del servicio*/
        totalItemsItemsEvaluados.totalGlobal = 0;
        for(var a = 0; a<9; a++){
            totalItemsItemsEvaluados.totalGlobal += institucionesEducativasController.areaEvaluada.aspectosEvaluados[a].porcentajeCumplimiento;
        }
        $("#txtTotalGlobal").attr('value', (totalItemsItemsEvaluados.totalGlobal/9));

    });

    /*Mensaje de validacion de campos dinamicos*/
    $.validator.messages.required = 'Este campo es obligatorio';
    $.validator.messages.valueNotEquals = 'Este campo es obligatorio';
});



