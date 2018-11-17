/**
 * Created by WilliamEduardo on 19/08/2016.
 */

/*Manejo de la firma digital en upload page*/

var verificacionTransporteController = {
    nombreFormulario: "verificacionTransporteForm",
    validator :"",
    path : window.location.pathname.substring(0,window.location.pathname.lastIndexOf("/")),
    areaEvaluada: {
        nombre : "Verificacion de las condiciones de transporte de viveres",
        encabezadoTransporte : {},
        aspectosEvaluados : [],
        responsables: [],
        comentarios : ""
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
                firma3: {
                    required : true
                },
                firma4: {
                    required : true
                },
                txtFechaVisita: {
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
                txtOperador: {
                    required: true
                },
                txtProveedor: {
                    required: true
                },
                txtAlimentosProvee: {
                    required: true
                },
                txtDireccionProveedor: {
                    required: true
                },
                txtTelefonoProveedor: {
                    required: true,
                    number: true
                },
                txtOperadorCabecera: {
                    required: true
                },
                txtCabeceraUnidad: {
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
                txtNombreResponsable: {
                    required: true
                },
                txtNombreProfesional: {
                    required: true
                },
                txtNombreReviso: {
                    required: true
                },
                txtNombreDigito: {
                    required: true
                }
            },
            messages: {
                txtFechaVisita: "Campo Obligatorio",
                subregion: "La subregion es obligatoria",
                municipios: "El municipio es obligatorio",
                txtOperador: "Campo Obligatorio",
                txtProveedor: "Campo Obligatorio",
                txtAlimentosProvee: "Campo Obligatorio",
                txtDireccionProveedor: "Campo Obligatorio",
                txtTelefonoProveedor : "Campo Obligatorio",
                txtOperadorCabecera: "Campo Obligatorio",
                txtCabeceraUnidad: "Campo Obligatorio",
                c1: "Campo Obligatorio",
                c2: "Campo Obligatorio",
                c3: "Campo Obligatorio",
                c4: "Campo Obligatorio",
                c5: "Campo Obligatorio",
                c6: "Campo Obligatorio",
                c7: "Campo Obligatorio",
                c8: "Campo Obligatorio",
                c9: "Campo Obligatorio",
                txtNombreResponsable: "Campo Obligatorio",
                txtNombreProfesional: "Campo Obligatorio",
                txtNombreReviso: "Campo Obligatorio",
                txtNombreDigito: "Campo Obligatorio"
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

        /*Encabezado Verificacion Transporte*/
        if ($("#"+this.nombreFormulario).valid()) {
            if (confirm('¿Estas seguro de enviar este formulario?')){
                this.areaEvaluada.encabezadoTransporte.subregion = {
                    id : $("#subregion").val()
                };
                this.areaEvaluada.encabezadoTransporte.municipio = {
                    id : $("#municipios").val()
                };

                this.areaEvaluada.encabezadoTransporte.fechaVisita = $("#txtFechaVisita").val();
                this.areaEvaluada.encabezadoTransporte.operador = $("#txtOperador").val();
                this.areaEvaluada.encabezadoTransporte.nombreProveedor = $("#txtProveedor").val();
                this.areaEvaluada.encabezadoTransporte.alimentoProvee = $("#txtAlimentosProvee").val();
                this.areaEvaluada.encabezadoTransporte.telefonoProveedor = $("#txtTelefonoProveedor").val();
                this.areaEvaluada.encabezadoTransporte.direccionProveedor = $("#txtDireccionProveedor").val();
                this.areaEvaluada.encabezadoTransporte.transporteCabeceraMunicipal = $("#txtOperadorCabecera").val();
                this.areaEvaluada.encabezadoTransporte.transporteUnidadAplicativa = $("#txtCabeceraUnidad").val();

                /*Items Evaluados Verificacion Transporte*/
                var pregunta = $("[class='pregunta']").length / 2 + $("[class='pregunta valid']").length / 2;

                /*En este numero inicial las preguntas del formulario de verificacion de transporte*/
                var id_pregunta = 35;

                /*Items Evaluados Logistic Entrega*/
                this.areaEvaluada.aspectosEvaluados[0].nombre = "Condiciones de transporte de viveres";
                for(var i= 1; i<= pregunta ;i++){
                    var estadoPregunta = $("[name=c"+i+"]:checked").val() =="true" ? 1 : 2;
                    this.areaEvaluada.aspectosEvaluados[0].itemEvaluados[i-1] ={
                        pregunta : {
                            id : id_pregunta
                        },
                        estadoPregunta : {
                            id : estadoPregunta
                        },
                    }
                    id_pregunta++;
                }

                /*Responsables Verificacion Transporte*/
                /*Responsable*/
                this.areaEvaluada.responsables[0] = {
                    nombre : $("#txtNombreResponsable").val(),
                };

                /*Profesional*/
                this.areaEvaluada.responsables[1] = {
                    nombre : $("#txtNombreProfesional").val(),
                };

                /*Reviso*/
                this.areaEvaluada.responsables[2] = {
                    nombre : $("#txtNombreReviso").val(),
                };
                /*Digito*/
                this.areaEvaluada.responsables[3] = {
                    nombre : $("#txtNombreDigito").val(),
                };

                /*comentarios*/
                this.areaEvaluada.comentarios = $("#txtComentario").val();

                var formData = new FormData();
                formData.append("areaEvaluada", JSON.stringify(this.areaEvaluada));

                formData.append("FirmaResponsable", this.convertirDataURIToBlob($('.js-signature').eq(0).jqSignature('getDataURL')));
                formData.append("FirmaProfesional", this.convertirDataURIToBlob($('.js-signature').eq(1).jqSignature('getDataURL')));
                formData.append("FirmaReviso", this.convertirDataURIToBlob($('.js-signature').eq(2).jqSignature('getDataURL')));
                formData.append("FirmaDigito", this.convertirDataURIToBlob($('.js-signature').eq(3).jqSignature('getDataURL')));

                $.ajax({
                    type: "POST",
                    async: true,
                    processData: false,
                    contentType: false,
                    url: 'guardarFormulario3',
                    dataType : 'text',
                    data: formData,
                    success: function(data) {
                        console.log("servicio Exitoso: " + data );
                        window.open(verificacionTransporteController.path+"/mostrarFormularioPdf?id="+data,"_self");
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("Error del servicio");
                    }
                });
            }
        }else{
            verificacionTransporteController.validator.focusInvalid();
        }

    },
    limpiarFirmaResponsable: function () {
        $('.js-signature').eq(0).jqSignature('clearCanvas');
        $("#firma1").rules('add',{
            required : true
        });
    },
    limpiarFirmaProfesional: function () {
        $('.js-signature').eq(1).jqSignature('clearCanvas');
        $("#firma2").rules('add',{
            required : true
        });
    },
    limpiarFirmaReviso: function () {
        $('.js-signature').eq(2).jqSignature('clearCanvas');
        $("#firma3").rules('add',{
            required : true
        });
    },
    limpiarFirmaDigito: function () {
        $('.js-signature').eq(3).jqSignature('clearCanvas');
        $("#firma4").rules('add',{
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
    /*Manejo del formulario*/
    $("#txtFechaVisita").datepicker({ dateFormat: 'dd/mm/yy' });
    $("#btnFechaVisita").click(function () {
        $("#txtFechaVisita").focus();
    });
    /*Recarga dinamica de municipios*/
    $("#subregion").change(function () {
        verificacionTransporteController.consultarMunicipios();
    });
    verificacionTransporteController.addValidationForm();
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
    /*Inicializacion de aspectos Evaluados (1 en este formulario)*/
    verificacionTransporteController.areaEvaluada.aspectosEvaluados[0] = {
        itemEvaluados : [],
        nombre : "",
        totalItemsCumplidos : 0,
        totalItemsNoCumplidos : 0,
        porcentajeCumplimiento : 0
    };
    /*Calculo de totales*/
    verificacionTransporteController.totalItemsItemsEvaluados = $("[class=pregunta]").length / 2;
    $("[class='pregunta']").change(function () {

        verificacionTransporteController.areaEvaluada.aspectosEvaluados[0].totalItemsCumplidos = $(".pregunta:checked[value=true]").length;
        //$("#totalCumpleAspecto1").attr('value', verificacionTransporteController.areaEvaluada.aspectosEvaluados[0].totalItemsCumplidos);
        verificacionTransporteController.areaEvaluada.aspectosEvaluados[0].porcentajeCumplimiento = (verificacionTransporteController.areaEvaluada.aspectosEvaluados[0].totalItemsCumplidos / verificacionTransporteController.totalItemsItemsEvaluados) * 100;
        //$("#porcentajeCumplimientoAspecto1").attr('value', (verificacionTransporteController.areaEvaluada.aspectosEvaluados[0].porcentajeCumplimiento));
        verificacionTransporteController.areaEvaluada.aspectosEvaluados[0].totalItemsNoCumplidos = $(".pregunta:checked[value=false]").length;
        //$("#totalNoCumpleAspecto1").attr('value', verificacionTransporteController.areaEvaluada.aspectosEvaluados[0].totalItemsNoCumplidos);
    });
    /*Mensaje de validacion de campos dinamicos*/
    $.validator.messages.required = 'Este campo es obligatorio';
});



