/**
 * Created by WilliamEduardo on 19/08/2016.
 */
/*Manejo de la firma digital en upload page*/

var verificacionBodegasController = {
    nombreFormulario: "verificacionBodegasForm",
    validator :"",
    path : window.location.pathname.substring(0,window.location.pathname.lastIndexOf("/")),
    areaEvaluada: {
        nombre : "Verificacion a bodegas de proveedores",
        encabezadoBodega : {},
        aspectosEvaluados : [],
        responsables: [],
        comentarios : ""
    },
    totalItemsItemsEvaluadosAspecto1 : 0,
    totalItemsItemsEvaluadosAspecto2 : 0,
    totalItemsItemsEvaluadosAspecto3 : 0,
    totalItemsItemsEvaluadosAspecto4 : 0,
    totalItemsItemsEvaluadosAspecto5 : 0,

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
        this.validator = $("#" + this.nombreFormulario).validate({
            debug: true,
            errorElement: 'div',
            rules: {
                firma1: {
                    required : true
                },
                firma2: {
                    required : true
                },
                snCentralizado: {
                    required: true
                },
                subregion: {
                    valueNotEquals: "-1",
                    required : true
                },
                municipios: {
                    required : true,
                    valueNotEquals: "-1"
                },
                txtNombreProveedor: {
                    required: true
                },
                txtIdentificacionProveedor: {
                    required: true,
                },
                txtProductosSuministrados: {
                    required: true
                },
                tipoModalidad: {
                    required: true
                },
                txtTelefonoProveedor: {
                    required: true,
                    number: true
                },
                txtDireccionProveedor: {
                    required: true
                },
                txtCorreoElectronico: {
                    required: true,
                    email: true
                },
                txtFechaEntrega: {
                    required: true
                },
                horaInicioEntrega: {
                    required: true
                },
                txtNombreRecibe: {
                    required: true
                },
                txtIdentificacionRecibe: {
                    required: true
                },
                txtNombreRealizaVisitaEnc: {
                    required: true
                },
                txtIdentificacionRealizaVisitaEnc: {
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
                c9: {
                    required: true
                },
                c10: {
                    required: true
                },
                c11: {
                    required: true
                },
                c21 : {
                    required: true
                },
                c22 : {
                    required: true
                },
                c23 : {
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
                c51 : {
                    required: true
                },
                c52 : {
                    required: true
                },
                c53 : {
                    required: true
                },
                txtNombreRealizaVisita: {
                    required: true
                },
                txtNombreAtiendeVisita: {
                    required: true
                },
                txtCedulaRealizaVisita: {
                    required: true
                },
                txtCedulaAtiendeVisita: {
                    required: true
                },
                txtCargoRealizaVisita: {
                    required: true
                },
                txtCargoAtiendeVisita: {
                    required: true
                },
                txtTelefonoRealizaVisita: {
                    required: true
                },
                txtTelefonoAtiendeVisita: {
                    required: true
                }
            },
            messages: {
                snCentralizado: "Campo Obligatorio",
                subregion: "La subregion es obligatoria",
                municipios: "El municipio es obligatorio",
                snProveedor: "Campo Obligatorio",
                txtNombreProveedor: "Campo Obligatorio",
                txtIdentificacionProveedor: "Campo Obligatorio",
                txtProductosSuministrados: "Campo Obligatorio",
                tipoModalidad : "Campo Obligatorio",
                txtTelefonoProveedor: "Campo Obligatorio",
                txtDireccionProveedor: "Campo Obligatorio",
                txtCorreoElectronico: "Campo Obligatorio y en formato email",
                txtFechaVisita: "Campo Obligatorio",
                horaVisita: "Campo Obligatorio",
                txtNombreRecibe : "Campo Obligatorio",
                txtIdentificacionRecibe : "Campo Obligatorio",
                txtNombreEntrega : "Campo Obligatorio",
                txtIdentificacionEntrega : "Campo Obligatorio",
                txtIdentificacionRealizaVisitaEnc: "Campo Obligatorio",

                c1: "Campo Obligatorio",
                c2: "Campo Obligatorio",
                c3: "Campo Obligatorio",
                c4: "Campo Obligatorio",
                c5: "Campo Obligatorio",
                c6: "Campo Obligatorio",
                c7: "Campo Obligatorio",
                c8: "Campo Obligatorio",
                c9: "Campo Obligatorio",
                c10: "Campo Obligatorio",
                c11: "Campo Obligatorio",

                c21: "Campo Obligatorio",
                c22: "Campo Obligatorio",
                c23: "Campo Obligatorio",

                c31: "Campo Obligatorio",
                c32: "Campo Obligatorio",
                c33: "Campo Obligatorio",
                c34: "Campo Obligatorio",

                c41: "Campo Obligatorio",
                c42: "Campo Obligatorio",
                c43: "Campo Obligatorio",
                c44: "Campo Obligatorio",
                c45: "Campo Obligatorio",
                c51: "Campo Obligatorio",
                c52: "Campo Obligatorio",
                c53: "Campo Obligatorio",
                txtNombreAtiendeVisita: "Campo Obligatorio",
                txtNombreRealizaVisita: "Campo Obligatorio",
                txtCedulaAtiendeVisita: "Campo Obligatorio",
                txtCedulaRealizaVisita: "Campo Obligatorio",
                txtCargoAtiendeVisita: "Campo Obligatorio",
                txtCargoRealizaVisita: "Campo Obligatorio",
                txtTelefonoAtiendeVisita: "Campo Obligatorio",
                txtTelefonoRealizaVisita: "Campo Obligatorio",
            },
            errorPlacement: function (error, element) {
                var isClassError = $(element).attr("class");

                if($(element).prop('type')=="checkbox") {
                    error.insertAfter(element.parent().parent());
                } else if (isClassError=="error" || isClassError.indexOf("hasDatepicker") == -1) {
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

        /*Encabezado Verificacion Bodegas*/
        if ($("#"+this.nombreFormulario).valid()) {
            if (confirm('¿Estas seguro de enviar este formulario?')){
                this.areaEvaluada.encabezadoBodega.subregion = {
                    id : $("#subregion").val()
                };
                this.areaEvaluada.encabezadoBodega.municipio = {
                    id : $("#municipios").val()
                };

                this.areaEvaluada.encabezadoBodega.modeloOperacion = $("[name=snCentralizado]:checked").val();
                this.areaEvaluada.encabezadoBodega.nombreProveedor = $("#txtNombreProveedor").val();
                this.areaEvaluada.encabezadoBodega.identificacionProveedor= $("#txtIdentificacionProveedor").val();
                this.areaEvaluada.encabezadoBodega.productoSuministra = $("#txtProductosSuministrados").val()

                var tipoModalidad = $("[name=tipoModalidad]:checked").map(function(){
                    return $(this).val();
                }).get().join("|");
                this.areaEvaluada.encabezadoBodega.tipoModalidad = tipoModalidad;

                this.areaEvaluada.encabezadoBodega.telefonoProveedor = $("#txtDireccionProveedor").val();
                this.areaEvaluada.encabezadoBodega.direccionProveedor = $("#txtTelefonoProveedor").val();
                this.areaEvaluada.encabezadoBodega.emailProveedor = $("#txtCorreoElectronico").val();
                this.areaEvaluada.encabezadoBodega.fechaVisita = $("#txtFechaVisita").val();
                this.areaEvaluada.encabezadoBodega.horaVisita = $("#horaVisita").val();
                this.areaEvaluada.encabezadoBodega.recibeVisita = $("#txtNombreRecibe").val();
                this.areaEvaluada.encabezadoBodega.identificacionrecibeVisita = $("#txtIdentificacionRecibe").val();
                this.areaEvaluada.encabezadoBodega.realizaVisita = $("#txtNombreRealizaVisitaEnc").val();
                this.areaEvaluada.encabezadoBodega.identificacionrealizaVisita = $("#txtIdentificacionRealizaVisitaEnc").val();


                /*Items Evaluados Verificacion Bodegas*/
                var pregunta1 = $("[class='pregunta1']").length / 2 + $("[class='pregunta1 valid']").length / 2;
                var pregunta2 = $("[class='pregunta2']").length / 2 + $("[class='pregunta2 valid']").length / 2;
                var pregunta3 = $("[class='pregunta3']").length / 2 + $("[class='pregunta3 valid']").length / 2;
                var pregunta4 = $("[class='pregunta4']").length / 2 + $("[class='pregunta4 valid']").length / 2;
                var pregunta5 = $("[class='pregunta5']").length / 2 + $("[class='pregunta5 valid']").length / 2;
                /*En este numero inicial las preguntas del formulario de verificacion de bodegas*/
                var id_pregunta = 9;

                /*Items Evaluados Logistic Entrega*/
                this.areaEvaluada.aspectosEvaluados[0].nombre = "Infraestructura";
                for(var i= 1; i<= pregunta1 ;i++){
                    var estadoPregunta = $("[name=c"+i+"]:checked").val() =="true" ? 1 : 2;
                    this.areaEvaluada.aspectosEvaluados[0].itemEvaluados[i-1] ={
                        pregunta : {
                            id : id_pregunta
                        },
                        estadoPregunta : {
                            id : estadoPregunta
                        },
                        observaciones : $("#txtAreaObservacionesc"+i).val()
                    }
                    id_pregunta++;
                }

                this.areaEvaluada.aspectosEvaluados[1].nombre = "Personal Manipulador de Alimentos";
                for(var i= 1; i<= pregunta2 ;i++){
                    var estadoPregunta = $("[name=c2"+i+"]:checked").val() =="true" ? 1 : 2;
                    this.areaEvaluada.aspectosEvaluados[1].itemEvaluados[i-1] ={
                        pregunta : {
                            id : id_pregunta
                        },
                        estadoPregunta : {
                            id : estadoPregunta
                        },
                        observaciones : $("#txtAreaObservacionesc2"+i).val()
                    }
                    id_pregunta++;
                }

                this.areaEvaluada.aspectosEvaluados[2].nombre = "Condiciones higienico sanitarias";
                for(var i= 1; i<= pregunta3 ;i++){
                    var estadoPregunta = $("[name=c3"+i+"]:checked").val() =="true" ? 1 : 2;
                    this.areaEvaluada.aspectosEvaluados[2].itemEvaluados[i-1] ={
                        pregunta : {
                            id : id_pregunta
                        },
                        estadoPregunta : {
                            id : estadoPregunta
                        },
                        observaciones : $("#txtAreaObservacionesc3"+i).val()
                    }
                    id_pregunta++;
                }

                this.areaEvaluada.aspectosEvaluados[3].nombre = "Condiciones del producto";
                for(var i= 1; i<= pregunta4 ;i++){
                    var estadoPregunta = $("[name=c4"+i+"]:checked").val() =="true" ? 1 : 2;
                    this.areaEvaluada.aspectosEvaluados[3].itemEvaluados[i-1] ={
                        pregunta : {
                            id : id_pregunta
                        },
                        estadoPregunta : {
                            id : estadoPregunta
                        },
                        observaciones : $("#txtAreaObservacionesc4"+i).val()
                    }
                    id_pregunta++;
                }

                this.areaEvaluada.aspectosEvaluados[4].nombre = "Obligaciones del operador para con el proveedor";
                for(var i= 1; i<= pregunta5 ;i++){
                    var estadoPregunta = $("[name=c5"+i+"]:checked").val() =="true" ? 1 : 2;
                    this.areaEvaluada.aspectosEvaluados[4].itemEvaluados[i-1] ={
                        pregunta : {
                            id : id_pregunta
                        },
                        estadoPregunta : {
                            id : estadoPregunta
                        },
                        observaciones : $("#txtAreaObservacionesc5"+i).val()
                    }
                    id_pregunta++;
                }

                /*Responsables Verificacion Bodegas*/
                /*Responsable Atiende Visita*/
                this.areaEvaluada.responsables[0] = {
                    nombre : $("#txtNombreAtiendeVisita").val(),
                    documentoIdentidad : $("#txtCedulaAtiendeVisita").val(),
                    cargo : $("#txtCargoAtiendeVisita").val(),
                    telefono : $("#txtTelefonoAtiendeVisita").val()
                };

                /*Responsable Realiza Visita*/
                this.areaEvaluada.responsables[1] = {
                    nombre : $("#txtNombreRealizaVisita").val(),
                    documentoIdentidad : $("#txtCedulaRealizaVisita").val(),
                    cargo : $("#txtCargoRealizaVisita").val(),
                    telefono : $("#txtTelefonoRealizaVisita").val()
                };

                /*comentarios*/
                this.areaEvaluada.comentarios = $("#txtComentario").val();


                var formData = new FormData();
                formData.append("areaEvaluada", JSON.stringify(this.areaEvaluada));

                formData.append("FirmaOperador", this.convertirDataURIToBlob($('.js-signature').eq(0).jqSignature('getDataURL')));
                formData.append("FirmaVerificador", this.convertirDataURIToBlob($('.js-signature').eq(1).jqSignature('getDataURL')));


                $.ajax({
                    type: "POST",
                    async: true,
                    processData: false,
                    contentType: false,
                    url: 'guardarFormulario2',
                    dataType : 'text',
                    data: formData,
                    success: function(data) {
                        console.log("servicio Exitoso: " + data );
                        window.open(verificacionBodegasController.path+"/mostrarFormularioPdf?id="+data,"_self");
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("Error del servicio");
                    }
                });
            }
        }else{
            verificacionBodegasController.validator.focusInvalid();
        }

    },
    limpiarFirmaOperador: function () {
        $('.js-signature').eq(0).jqSignature('clearCanvas');
        $("#firma1").rules('add',{
            required : true
        });
    },

    limpiarFirmaVerificador: function () {
        $('.js-signature').eq(1).jqSignature('clearCanvas');
        $("#firma2").rules('add',{
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
    verificacionBodegasController.addOnlyNumber("#txtIdentificacionProveedor");
    /*Manejo del formulario*/
    $("#txtFechaVisita").datepicker({ dateFormat: 'dd/mm/yy' });
    $("#btnFechaEntrega").click(function () {
        $("#txtFechaVisita").focus();
    });
    /*Recarga dinamica de municipios*/
    $("#subregion").change(function () {
        verificacionBodegasController.consultarMunicipios();
    });
    verificacionBodegasController.addValidationForm();
    /*Manejo de la Firma Digital*/
    if ($(".js-signature").length) {
        $(".js-signature").jqSignature();
    }
    $(".js-signature").eq(0).on("jq.signature.changed", function () {
        $("#firma1").rules("remove");
    });
    $(".js-signature").eq(1).on("jq.signature.changed", function () {
        $("#firma2").rules("remove");
    });

    $("#tipoModalidadAlmuerzo, #tipoModalidadDesayuno").change(function() {
        if ($(this).is(':checked')) {
            var id = $(this).prop('id');
            var compareId = id=="tipoModalidadAlmuerzo"?"tipoModalidadDesayuno":"tipoModalidadAlmuerzo";
            if ($("#" + compareId).is(':checked')) {
                $(this).prop( "checked", false );
                alert("No puedes seleccionar Almuerzo y Desayuno a la vez.");
            }
        }
    });

    /*Inicializacion de aspectos Evaluados (5 en este formulario)*/
    for(var j=0; j<5; j++){
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[j] = {
            itemEvaluados : [],
            nombre : "",
            totalItemsCumplidos : 0,
            totalItemsNoCumplidos : 0,
            porcentajeCumplimiento : 0
        };
    }
    /*Calculo de totales*/
    verificacionBodegasController.totalItemsItemsEvaluadosAspecto1 = $("[class=pregunta1]").length / 2;
    verificacionBodegasController.totalItemsItemsEvaluadosAspecto2 = $("[class=pregunta2]").length / 2;
    verificacionBodegasController.totalItemsItemsEvaluadosAspecto3 = $("[class=pregunta3]").length / 2;
    verificacionBodegasController.totalItemsItemsEvaluadosAspecto4 = $("[class=pregunta4]").length / 2;
    verificacionBodegasController.totalItemsItemsEvaluadosAspecto5 = $("[class=pregunta5]").length / 2;
    $("[class='pregunta1']").change(function () {
        var txtAreaObservaciones = $("#txtAreaObservaciones" + $(this).attr("name") + "");
        if ($(this).val() == "true") {
            txtAreaObservaciones.rules('remove');
        } else {
            txtAreaObservaciones.rules('add', {
                required: true
            });
        }
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[0].totalItemsCumplidos = $(".pregunta1:checked[value=true]").length;
        $("#totalCumpleAspecto1").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[0].totalItemsCumplidos);
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[0].porcentajeCumplimiento = (verificacionBodegasController.areaEvaluada.aspectosEvaluados[0].totalItemsCumplidos / verificacionBodegasController.totalItemsItemsEvaluadosAspecto1) * 100;
        $("#porcentajeCumplimientoAspecto1").attr('value', (verificacionBodegasController.areaEvaluada.aspectosEvaluados[0].porcentajeCumplimiento));
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[0].totalItemsNoCumplidos = $(".pregunta1:checked[value=false]").length;
        $("#totalNoCumpleAspecto1").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[0].totalItemsNoCumplidos);
    });

    $("[class='pregunta2']").change(function () {
        var txtAreaObservaciones = $("#txtAreaObservaciones" + $(this).attr("name") + "");
        if ($(this).val() == "true") {
            txtAreaObservaciones.rules('remove');
        } else {
            txtAreaObservaciones.rules('add', {
                required: true
            });
        }
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[1].totalItemsCumplidos = $(".pregunta2:checked[value=true]").length;
        $("#totalCumpleAspecto2").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[1].totalItemsCumplidos);
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[1].porcentajeCumplimiento = (verificacionBodegasController.areaEvaluada.aspectosEvaluados[1].totalItemsCumplidos / verificacionBodegasController.totalItemsItemsEvaluadosAspecto2) * 100;
        $("#porcentajeCumplimientoAspecto2").attr('value', (verificacionBodegasController.areaEvaluada.aspectosEvaluados[1].porcentajeCumplimiento));
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[1].totalItemsNoCumplidos = $(".pregunta2:checked[value=false]").length;
        $("#totalNoCumpleAspecto2").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[1].totalItemsNoCumplidos);
    });


    $("[class='pregunta3']").change(function () {
        var txtAreaObservaciones = $("#txtAreaObservaciones" + $(this).attr("name") + "");
        if ($(this).val() == "true") {
            txtAreaObservaciones.rules('remove');
        } else {
            txtAreaObservaciones.rules('add', {
                required: true
            });
        }
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[2].totalItemsCumplidos = $(".pregunta3:checked[value=true]").length;
        $("#totalCumpleAspecto3").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[2].totalItemsCumplidos);
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[2].porcentajeCumplimiento = (verificacionBodegasController.areaEvaluada.aspectosEvaluados[2].totalItemsCumplidos / verificacionBodegasController.totalItemsItemsEvaluadosAspecto3) * 100;
        $("#porcentajeCumplimientoAspecto3").attr('value', (verificacionBodegasController.areaEvaluada.aspectosEvaluados[2].porcentajeCumplimiento));
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[2].totalItemsNoCumplidos = $(".pregunta3:checked[value=false]").length;
        $("#totalNoCumpleAspecto3").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[2].totalItemsNoCumplidos);
    });

    $("[class='pregunta4']").change(function () {
        var txtAreaObservaciones = $("#txtAreaObservaciones" + $(this).attr("name") + "");
        if ($(this).val() == "true") {
            txtAreaObservaciones.rules('remove');
        } else {
            txtAreaObservaciones.rules('add', {
                required: true
            });
        }
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[3].totalItemsCumplidos = $(".pregunta4:checked[value=true]").length;
        $("#totalCumpleAspecto4").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[3].totalItemsCumplidos);
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[3].porcentajeCumplimiento = (verificacionBodegasController.areaEvaluada.aspectosEvaluados[3].totalItemsCumplidos / verificacionBodegasController.totalItemsItemsEvaluadosAspecto4) * 100;
        $("#porcentajeCumplimientoAspecto4").attr('value', (verificacionBodegasController.areaEvaluada.aspectosEvaluados[3].porcentajeCumplimiento));
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[3].totalItemsNoCumplidos = $(".pregunta4:checked[value=false]").length;
        $("#totalNoCumpleAspecto4").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[3].totalItemsNoCumplidos);
    });

    $("[class='pregunta5']").change(function () {
        var txtAreaObservaciones = $("#txtAreaObservaciones" + $(this).attr("name") + "");
        if ($(this).val() == "true") {
            txtAreaObservaciones.rules('remove');
        } else {
            txtAreaObservaciones.rules('add', {
                required: true
            });
        }
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[4].totalItemsCumplidos = $(".pregunta5:checked[value=true]").length;
        $("#totalCumpleAspecto5").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[4].totalItemsCumplidos);
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[4].porcentajeCumplimiento = (verificacionBodegasController.areaEvaluada.aspectosEvaluados[4].totalItemsCumplidos / verificacionBodegasController.totalItemsItemsEvaluadosAspecto5) * 100;
        $("#porcentajeCumplimientoAspecto5").attr('value', (verificacionBodegasController.areaEvaluada.aspectosEvaluados[4].porcentajeCumplimiento));
        verificacionBodegasController.areaEvaluada.aspectosEvaluados[4].totalItemsNoCumplidos = $(".pregunta5:checked[value=false]").length;
        $("#totalNoCumpleAspecto5").attr('value', verificacionBodegasController.areaEvaluada.aspectosEvaluados[4].totalItemsNoCumplidos);
    });
    /*Mensaje de validacion de campos dinamicos*/
    $.validator.messages.required = 'Este campo es obligatorio';
});



