package co.edu.tdea.pae.controller;

import co.edu.tdea.pae.model.AreaEvaluadaEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@Controller
public class GuardarFormularioController {

    private Map colecciones = new HashMap();

    @RequestMapping(value = "/test1", method = RequestMethod.POST)
    public String guardarFormulario(@PathVariable("atributo") String atributo) {
        return atributo;
    }


    @RequestMapping(value = "/guardaLogisticaEntrega", method = RequestMethod.POST)
    public String guardarLogisticaEntrega(@Valid @ModelAttribute("logisticaEntrega") AreaEvaluadaEntity areaEvaluada,
                                          BindingResult result) {
        if (result.hasErrors()) {
            return "formulario1";
        }
        //    List<Proveedor> proveedores = proveedorService.getAllProveedores();
        return "verificacionviveres";
    }
}