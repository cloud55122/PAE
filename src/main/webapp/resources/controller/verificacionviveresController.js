/**
 * Created by WilliamEduardo on 19/08/2016.
 */

    var verificacionViveresController = {
        nombreFormulario: "logisticaEntregaForm",
        validator :"",
        path : window.location.pathname.substring(0,window.location.pathname.lastIndexOf("/")),
        LogistaEntrega: {
            nombre : "Verificacion entrega de viveres a satisfaccion",
            encabezadoLogisticaEntrega : {},
            aspectosEvaluados : [
                {
                    itemEvaluados : [],
                    nombre : "",
                    totalItemsCumplidos : 0,
                    totalItemsNoCumplidos : 0,
                    porcentajeCumplimiento : 0
                }
            ],
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
        addValidationForm : function(){
            // add the rule valueNotEquals
            $.validator.addMethod("valueNotEquals", function(value, element, arg){
                return arg != value;
            });
            $.validator.setDefaults({
                ignore: []
            });
            this.validator = $("#"+this.nombreFormulario).validate({
                debug : true,
                errorElement: 'div',
                rules : {
                    firma1: {
                        required : true
                    },
                    firma2: {
                        required : true
                    },
                    txtOperador: {
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
                    snProveedor: {
                        required : true
                    },
                    txtNombreProveedor: {
                        required : true
                    },
                    txtIdentificacionProveedor: {
                        required : true
                    },
                    txtTelefonoProveedor: {
                        required : true,
                        number: true
                    },
                    txtDireccionProveedor: {
                        required : true
                    },
                    txtFechaEntrega: {
                        required : true
                    },
                    horaInicioEntrega: {
                        required : true
                    },
                    horaFinEntrega: {
                        required : true
                    },
                    txtNombreResponsableEntrega: {
                        required : true
                    },
                    txtNombreResponsableRecepcion: {
                        required : true
                    },
                    checkboxSemanasEntregadas: {
                        required : true
                    },
                    numDiasEntregados: {
                        required : true
                    },
                    txtFechaDesde: {
                        required : true
                    },
                    txtFechaHasta: {
                        required : true
                    },
                    c1: {
                        required : true
                    },
                    c2: {
                        required : true
                    },
                    c3: {
                        required : true
                    },
                    c4: {
                        required : true
                    },
                    c5: {
                        required : true
                    },
                    c6: {
                        required : true
                    },
                    c7: {
                        required : true
                    },
                    c8: {
                        required : true
                    },
                    alimentoRegistrado1 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    alimentoRegistrado2 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    alimentoRegistrado3 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    alimentoRegistrado4 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    alimentoRegistrado5 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    alimentoRegistrado6 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    alimentoRegistrado7 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    alimentoRegistrado8 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    alimentoRegistrado9 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    alimentoRegistrado10 : {
                        required : true,
                        valueNotEquals: "-1"
                    },
                    txtMarcaAlimento1: {
                        required : true
                    },
                    aprobacionGsanAlimento1: {
                        required : true
                    },
                    txtMarcaAlimento2: {
                        required : true
                    },
                    aprobacionGsanAlimento2: {
                        required : true
                    },
                    txtMarcaAlimento3: {
                        required : true
                    },
                    aprobacionGsanAlimento3: {
                        required : true
                    },
                    txtMarcaAlimento4: {
                        required : true
                    },
                    aprobacionGsanAlimento4: {
                        required : true
                    },
                    txtMarcaAlimento5: {
                        required : true
                    },
                    aprobacionGsanAlimento5: {
                        required : true
                    },
                    txtMarcaAlimento6: {
                        required : true
                    },
                    aprobacionGsanAlimento6: {
                        required : true
                    },
                    txtMarcaAlimento7: {
                        required : true
                    },
                    aprobacionGsanAlimento7: {
                        required : true
                    },
                    txtMarcaAlimento8: {
                        required : true
                    },
                    aprobacionGsanAlimento8: {
                        required : true
                    },
                    txtMarcaAlimento9: {
                        required : true
                    },
                    aprobacionGsanAlimento9: {
                        required : true
                    },
                    txtMarcaAlimento10: {
                        required : true
                    },
                    aprobacionGsanAlimento10: {
                        required : true
                    },
                    txtNombreOperador: {
                        required : true
                    },
                    txtNombreResponsable: {
                        required : true
                    },
                    txtCedulaOperador: {
                        required : true
                    },
                    txtCedulaResponsable: {
                        required : true
                    },
                    txtCargoOperador: {
                        required : true
                    },
                    txtCargoResponsable: {
                        required : true
                    },
                    txtTelefonoOperador: {
                        required : true
                    },
                    txtTelefonoResponsable: {
                        required : true
                    },
                    txtEmailOperador: {
                        required : true,
                        email : true
                    },
                    txtEmailResponsable: {
                        required : true,
                        email : true
                    }
                },
                messages : {
                    txtOperador: "El nombre del operador es obligatorio",
                    subregion: "La subregion es obligatoria",
                    municipios: "El municipio es obligatorio",
                    snProveedor: "seleccionar si tiene proveedor local es obligatorio",
                    txtNombreProveedor: "El nombre del proveedor es obligatorio",
                    txtIdentificacionProveedor: "La identificacion del proveedor es obligatoria",
                    txtTelefonoProveedor: "El telefono del proveedor es obligatorio",
                    txtDireccionProveedor: "La direccion del proveedor es obligatoria",
                    txtFechaEntrega: "La fecha de entrega es obligatoria",
                    horaInicioEntrega: "La hora de inicio de entrega es obligatoria",
                    horaFinEntrega: "La hora fin de entrega es obligatoria",
                    txtNombreResponsableEntrega: "El nombre del responsable de entrega es obligatorio",
                    txtNombreResponsableRecepcion: "El nombre del responsable de recepcion es obligatorio",
                    checkboxSemanasEntregadas: "El numero de semanas entregadas es obligatorio",
                    numDiasEntregados: "El numero de dias entregados es obligatorio",
                    txtFechaDesde: "Este campo es obligatorio",
                    txtFechaHasta: "Este campo es obligatorio",
                    c1: "La pregunta 1 es obligatoria",
                    c2: "La pregunta 2 es obligatoria",
                    c3: "La pregunta 3 es obligatoria",
                    c4: "La pregunta 4 es obligatoria",
                    c5: "La pregunta 5 es obligatoria",
                    c6: "La pregunta 6 es obligatoria",
                    c7: "La pregunta 7 es obligatoria",
                    c8: "La pregunta 8 es obligatoria",
                    alimentoRegistrado1: "El tipo de alimento 1 es obligatorio",
                    txtMarcaAlimento1: "La marca del alimento 1 es obligatoria",
                    aprobacionGsanAlimento1: "Requerido",
                    alimentoRegistrado2: "El tipo de alimento 2 es obligatorio",
                    txtMarcaAlimento2: "La marca del alimento 2 es obligatoria",
                    aprobacionGsanAlimento2: "Requerido",
                    alimentoRegistrado3: "El tipo de alimento 3 es obligatorio",
                    txtMarcaAlimento3: "La marca del alimento 3 es obligatoria",
                    aprobacionGsanAlimento3: "Requerido",
                    alimentoRegistrado4: "El tipo de alimento 4 es obligatorio",
                    txtMarcaAlimento4: "La marca del alimento 4 es obligatoria",
                    aprobacionGsanAlimento4: "Requerido",
                    alimentoRegistrado5: "El tipo de alimento 5 es obligatorio",
                    txtMarcaAlimento5: "La marca del alimento 5 es obligatoria",
                    aprobacionGsanAlimento5: "Requerido",
                    alimentoRegistrado6: "El tipo de alimento 6 es obligatorio",
                    txtMarcaAlimento6: "La marca del alimento 6 es obligatoria",
                    aprobacionGsanAlimento6: "Requerido",
                    alimentoRegistrado7: "El tipo de alimento 7 es obligatorio",
                    txtMarcaAlimento7: "La marca del alimento 7 es obligatoria",
                    aprobacionGsanAlimento7: "Requerido",
                    alimentoRegistrado8: "El tipo de alimento 8 es obligatorio",
                    txtMarcaAlimento8: "La marca del alimento 8 es obligatoria",
                    aprobacionGsanAlimento8: "Requerido",
                    alimentoRegistrado9: "El tipo de alimento 9 es obligatorio",
                    txtMarcaAlimento9: "La marca del alimento 9 es obligatoria",
                    aprobacionGsanAlimento9: "Requerido",
                    alimentoRegistrado10: "El tipo de alimento 10 es obligatorio",
                    txtMarcaAlimento10: "La marca del alimento 10 es obligatoria",
                    aprobacionGsanAlimento10: "Requerido",
                    txtNombreOperador: "El nombre del operador/proveedor es obligatorio",
                    txtNombreResponsable: "El nombre del responsable es obligatorio",
                    txtCedulaOperador: "La cedula del operador es obligatoria",
                    txtCedulaResponsable: "La cedula del responsable es obligatoria",
                    txtCargoOperador: "El cargo del operador es obligatorio",
                    txtCargoResponsable: "El cargo del responsable es obligatorio",
                    txtTelefonoOperador: "El telefono del operador es obligatorio",
                    txtTelefonoResponsable: "El telefono del responsable es obligatorio",
                    txtEmailOperador: "El email del operador es obligatorio y debe estar en formta e-mail",
                    txtEmailResponsable: "El email del responsable es obligatorio y debe estar en formta e-mail",
                    firma1: "El campo es obligatorio",
                    firma2: "El campo es obligatorio"
                },
                errorPlacement: function(error, element) {
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
      consultarMunicipios : function () {
          $.ajax({
              type: "GET",
              async: true,
              dataType: 'json',
              url: 'getMunicipiosxSubregion',
              data: "id="+$('#subregion').val(),
              success: function(data) {
                  $('#municipios').empty();
                  $('#municipios').append($('<option>', {
                      value: "-1",
                      text: "--- Select ---"
                  }));
                  data.forEach(function(municipio){
                      $('#municipios').append($('<option>', {
                          value: municipio.id,
                          text: '' + municipio.nombre + ''
                      }));
                  });
              },
              error: function(XMLHttpRequest, textStatus, errorThrown) {
                  alert("Error del servicio1");
              }
          });
      },
    enviarFormulario: function () {

        /*Encabezado Logistica Entrega*/
        if ($("#"+this.nombreFormulario).valid()) {
            if (confirm('¿Estas seguro de enviar este formulario?')){
                this.LogistaEntrega.encabezadoLogisticaEntrega.subregion = {
                    id : $("#subregion").val()
                };
                this.LogistaEntrega.encabezadoLogisticaEntrega.municipio = {
                    id : $("#municipios").val()
                };
                this.LogistaEntrega.encabezadoLogisticaEntrega.operador = $("#txtOperador").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.snProveedorLocal = $("[name=snProveedor]:checked").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.nombreProveedor = $("#txtNombreProveedor").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.identificacionProveedor = $("#txtIdentificacionProveedor").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.telefonoProveedor = $("#txtTelefonoProveedor").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.direccionProveedor = $("#txtDireccionProveedor").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.fechaEntrega = $("#txtFechaEntrega").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.horaInicio = $("#horaInicioEntrega").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.horaFinal = $("#horaFinEntrega").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.responsableEntrega = $("#txtNombreResponsableEntrega").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.responsableRecepcion = $("#txtNombreResponsableRecepcion").val();

                var semanasEntregadas = $("[name=checkboxSemanasEntregadas]:checked").map(function(){
                    return $(this).val();
                }).get().join("|");

                this.LogistaEntrega.encabezadoLogisticaEntrega.semanasEntregadas = semanasEntregadas;

                this.LogistaEntrega.encabezadoLogisticaEntrega.diasEntregados = $("#numDiasEntregados").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.desde = $("#txtFechaDesde").val();
                this.LogistaEntrega.encabezadoLogisticaEntrega.hasta = $("#txtFechaHasta").val();
                /*Items Evaluados Logistic Entrega*/
                this.LogistaEntrega.aspectosEvaluados[0].nombre = "Logistica Entrega Viveres";
                for(var i= 1; i<=$("[class='pregunta']").length/2 + $("[class='pregunta valid']").length/2;i++){
                    var estadoPregunta = $("[name=c"+i+"]:checked").val() =="true" ? 1 : 2;
                    this.LogistaEntrega.aspectosEvaluados[0].itemEvaluados[i-1] ={
                        pregunta : {
                            id : i
                        },
                        estadoPregunta : {
                            id : estadoPregunta
                        },
                        observaciones : $("#txtAreaObservacionesc"+i).val()
                    }
                }

                /*Alimentos Recibidos Logistica Entrega*/

                for(var i= 1; i<=$("[class='form-control alimento valid']").length + $("[class='form-control alimento']").length;i++){
                    this.LogistaEntrega.alimentos[i-1] = {
                        alimentoRegistrado : {
                            id : $("#alimentoRegistrado"+i).val()
                        },
                        marca : $("#txtMarcaAlimento"+i).val(),
                        snAprobacionGsan : $("[name=aprobacionGsanAlimento"+i+"]:checked").val()
                    }
                }

                /*Responsables Logistica Entrega*/
                /*Responsable Operador*/
                this.LogistaEntrega.responsables[0] = {
                    nombre : $("#txtNombreOperador").val(),
                    documentoIdentidad : $("#txtCedulaOperador").val(),
                    cargo : $("#txtCargoOperador").val(),
                    telefono : $("#txtTelefonoOperador").val(),
                    email : $("#txtEmailOperador").val()
                };

                /*Responsable Verificacion*/
                this.LogistaEntrega.responsables[1] = {
                    nombre : $("#txtNombreResponsable").val(),
                    documentoIdentidad : $("#txtCedulaResponsable").val(),
                    cargo : $("#txtCargoResponsable").val(),
                    telefono : $("#txtTelefonoResponsable").val(),
                    email : $("#txtEmailResponsable").val()
                };

                /*Logistica Entrega comentarios*/
                this.LogistaEntrega.comentarios = $("#txtComentario").val();


                var formData = new FormData();
                formData.append("areaEvaluada", JSON.stringify(this.LogistaEntrega));

                formData.append("FirmaOperador", this.convertirDataURIToBlob($('.js-signature').eq(0).jqSignature('getDataURL')));
                formData.append("FirmaVerificador", this.convertirDataURIToBlob($('.js-signature').eq(1).jqSignature('getDataURL')));


                $.each($("input[type='file'][name^='foto']"), function(i, file) {
                    formData.append("Foto", file.files[0]);
                });

                $.ajax({
                    type: "POST",
                    async: true,
                    processData: false,
                    contentType: false,
                    url: 'guardarFormulario',
                    dataType : 'text',
                    data: formData,
                    success: function(data) {
                        console.log("servicio Exitoso: " + data );
                        window.open(verificacionViveresController.path+"/mostrarFormularioPdf?id="+data,"_self");
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("Error del servicio");
                    }
                });
            }
        }else{
            verificacionViveresController.validator.focusInvalid();
        }

    },
    limpiarFirmaOperador: function (){
        $('.js-signature').eq(0).jqSignature('clearCanvas');
        $("#firma1").rules('add',{
            required : true
        });
    },

    limpiarFirmaVerificador: function (){
        $('.js-signature').eq(1).jqSignature('clearCanvas');
        $("#firma2").rules('add',{
            required : true
        });

    },

    agregarArchivo: function() {
        var fileIndex = $('#fileTable tr').children().length - 1;
        $('#fileTable').append(
            '<br>'
            + '<tr><td>'
            + '   <input type="file" name="foto['+ fileIndex +']" />'
            + '</td></tr>');
    },
    convertirDataURIToBlob : function (dataURI) {
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
        return new Blob([ia], {type:mimeString});
    }

};
    $( document ).ready(function() {
        verificacionViveresController.addOnlyNumber("#txtIdentificacionProveedor")
        /*Manejo del formulario*/
        $("#txtFechaEntrega").datepicker({ dateFormat: 'dd/mm/yy' });
        $("#btnFechaEntrega").click(function() {
            $("#txtFechaEntrega").focus();
        });
        $("#txtFechaDesde").datepicker({ dateFormat: 'dd/mm/yy' });
        $("#btnFechaDesde").click(function() {
            $("#txtFechaDesde").focus();
        });
        $("#txtFechaHasta").datepicker({ dateFormat: 'dd/mm/yy' });
        $("#btnFechaHasta").click(function() {
            $("#txtFechaHasta").focus();
        });
        /*Recarga dinamica de municipios*/
        $("#subregion").change(function () {
            verificacionViveresController.consultarMunicipios();
        });
        verificacionViveresController.addValidationForm();
        /*Manejo de la Firma Digital*/
        if ($('.js-signature').length) {
            $('.js-signature').jqSignature();
        };
        $('.js-signature').eq(0).on('jq.signature.changed', function() {
            $("#firma1").rules('remove');
        });
        $('.js-signature').eq(1).on('jq.signature.changed', function() {
            $("#firma2").rules('remove');
        });
        /*Validacion de Fechas*/
        $("#txtFechaEntrega, #txtFechaDesde, #txtFechaHasta").change(function(){
            var fechaDesde = $("#txtFechaDesde").datepicker("getDate");
            var fechaHasta = $("#txtFechaHasta").datepicker("getDate");
            var fechaEntrega = $("#txtFechaEntrega").datepicker("getDate");

            if(fechaDesde != null){
                if(fechaHasta != null && (fechaHasta <= fechaDesde) ){
                    alert("La fecha desde debe ser menor a la fecha hasta minimo un día");
                    $(this).val("");
                }
                if(fechaEntrega != null && (fechaEntrega >= fechaDesde) ){
                    alert("La fecha desde debe ser mayor a la fecha de entrega minimo un día");
                    $(this).val("");
                }
            }

        });
        /*Validacion Horas*/

        $("#horaInicioEntrega, #horaFinEntrega").change(function(){
            if($("#horaInicioEntrega").val() != "" && $("#horaFinEntrega").val() != ""){
                if($("#horaInicioEntrega").val().replace(":","") > $("#horaFinEntrega").val().replace(":","")){
                    alert("La hora de inicio de entrega debe ser menor a la hora fin de entrega");
                    $(this).val("");
                }
            }
        });
        /*Calculo de totales*/
        var totalItemsEvaluados = $("[class=pregunta]").length/2;
        $("[class='pregunta']").change(function () {
            var txtAreaObservaciones = $("#txtAreaObservaciones"+$(this).attr("name")+"");
            if($(this).val() == "true"){
                txtAreaObservaciones.rules('remove');
            }else{
                txtAreaObservaciones.rules('add',{
                    required : true
                });
            }
            verificacionViveresController.LogistaEntrega.aspectosEvaluados[0].totalItemsCumplidos = $(".pregunta:checked[value=true]").length;
            $("#totalCumple").attr('value', verificacionViveresController.LogistaEntrega.aspectosEvaluados[0].totalItemsCumplidos);
            verificacionViveresController.LogistaEntrega.aspectosEvaluados[0].porcentajeCumplimiento =
                (verificacionViveresController.LogistaEntrega.aspectosEvaluados[0].totalItemsCumplidos/totalItemsEvaluados)*100;
            $("#porcentajeCumplimiento").attr('value',
                (verificacionViveresController.LogistaEntrega.aspectosEvaluados[0].totalItemsCumplidos/totalItemsEvaluados)*100);
            verificacionViveresController.LogistaEntrega.aspectosEvaluados[0].totalItemsNoCumplidos = $(".pregunta:checked[value=false]").length;
            $("#totalNoCumple").attr('value', verificacionViveresController.LogistaEntrega.aspectosEvaluados[0].totalItemsNoCumplidos);
        });
        $("[name=snProveedor]").change(function() {
            if($(this).val()=="false"){
                //$("#txtOperador").attr('disabled',true);
                $("#txtNombreProveedor").attr('disabled',true);
                $("#txtIdentificacionProveedor").attr('disabled',true);
                $("#txtTelefonoProveedor").attr('disabled',true);
                $("#txtDireccionProveedor").attr('disabled',true);

            }else{
                //$("#txtOperador").attr('disabled',false);
                $("#txtNombreProveedor").attr('disabled',false);
                $("#txtIdentificacionProveedor").attr('disabled',false);
                $("#txtTelefonoProveedor").attr('disabled',false);
                $("#txtDireccionProveedor").attr('disabled',false);
            }
        });
        $('#agregarFoto').click(verificacionViveresController.agregarArchivo);
        /*Mensaje de validacion de campos dinamicos*/
        $.validator.messages.required = 'Este campo es obligatorio';
    });



