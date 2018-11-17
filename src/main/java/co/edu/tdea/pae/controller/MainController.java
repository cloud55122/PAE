package co.edu.tdea.pae.controller;

import co.edu.tdea.pae.model.*;
import co.edu.tdea.pae.service.*;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class MainController {
    @Autowired
    SubregionService subregionService;
    @Autowired
    MunicipioService municipioService;
    @Autowired
    AreaEvaluadaService areaEvaluadaService;
    @Autowired
    AlimentoRegistradoService alimentoRegistradoService;
    @Autowired
    AnexoService anexoService;
    @Autowired
    ConfiguracionService configuracionService;
    @Autowired
    ServletContext context;
    String local_path;

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Login Form - Database Authentication");
        model.addObject("message", "This page is for ROLE_ADMIN only!");
        model.setViewName("admin");

        return model;
    }

    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");

        return model;
    }

    @RequestMapping(value = "/loginBoostrap", method = RequestMethod.GET)
    public ModelAndView loginBoostrap() {

        ModelAndView model = new ModelAndView();
        model.setViewName("prueba");
        return model;
    }

    @RequestMapping(value = "/rest/getMunicipiosxSubregion", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<MunicipioEntity> getMunicipiosxSubregion(@RequestParam("id") String id) {
        return municipioService.getMunicipiosxSubregion(Integer.valueOf(id));
    }

    @RequestMapping(value = "/rest/guardarFormulario", method = RequestMethod.POST)
    @ResponseBody
    public String guardarFormulario(MultipartHttpServletRequest multipartData) {
        AreaEvaluadaEntity areaEvaluada = null;
        try {
            areaEvaluada = UtilController.convertJsonAreaEvaluada2Object(multipartData.getParameter("areaEvaluada"));
            ArrayList<MultipartFile> firmas = new ArrayList<MultipartFile>();
            firmas.add(multipartData.getFile("FirmaOperador"));
            firmas.add(multipartData.getFile("FirmaVerificador"));

            UtilController.appendAnexos2AreaEvaluada(multipartData.getFiles("Foto"), areaEvaluada);
            UtilController.appendFirmas2AreaEvaluada(firmas, areaEvaluada);

            areaEvaluadaService.addAreaEvaluada(areaEvaluada);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return areaEvaluada.getId() + "";
    }

    @RequestMapping(value = "/rest/guardarFormulario2", method = RequestMethod.POST)
    @ResponseBody
    public String guardarFormulario2(MultipartHttpServletRequest multipartData) {
        AreaEvaluadaEntity areaEvaluada = null;
        try {
            areaEvaluada = UtilController.convertJsonAreaEvaluada2Object2(multipartData.getParameter("areaEvaluada"));
            ArrayList<MultipartFile> firmas = new ArrayList<MultipartFile>();
            firmas.add(multipartData.getFile("FirmaOperador"));
            firmas.add(multipartData.getFile("FirmaVerificador"));

            UtilController.appendFirmas2AreaEvaluada(firmas, areaEvaluada);

            areaEvaluadaService.addAreaEvaluada(areaEvaluada);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return areaEvaluada.getId() + "";
    }

    @RequestMapping(value = "/rest/guardarFormulario3", method = RequestMethod.POST)
    @ResponseBody
    public String guardarFormulario3(MultipartHttpServletRequest multipartData) {
        AreaEvaluadaEntity areaEvaluada = null;
        try {
            areaEvaluada = UtilController.convertJsonAreaEvaluada2Object2(multipartData.getParameter("areaEvaluada"));
            ArrayList<MultipartFile> firmas = new ArrayList<MultipartFile>();
            firmas.add(multipartData.getFile("FirmaResponsable"));
            firmas.add(multipartData.getFile("FirmaProfesional"));
            firmas.add(multipartData.getFile("FirmaReviso"));
            firmas.add(multipartData.getFile("FirmaDigito"));

            UtilController.appendFirmas2AreaEvaluada(firmas, areaEvaluada);

            areaEvaluadaService.addAreaEvaluada(areaEvaluada);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return areaEvaluada.getId() + "";
    }

    @RequestMapping(value = "/rest/guardarFormulario4", method = RequestMethod.POST)
    @ResponseBody
    public String guardarFormulario4(MultipartHttpServletRequest multipartData) {
        AreaEvaluadaEntity areaEvaluada = null;
        try {
            areaEvaluada = UtilController.convertJsonAreaEvaluada2Object(multipartData.getParameter("areaEvaluada"));
            ArrayList<MultipartFile> firmas = new ArrayList<MultipartFile>();
            firmas.add(multipartData.getFile("FirmaDocenteEncargado"));
            firmas.add(multipartData.getFile("FirmaManipulador"));
            firmas.add(multipartData.getFile("FirmaProfesional"));
            firmas.add(multipartData.getFile("FirmaReviso"));
            firmas.add(multipartData.getFile("FirmaDigito"));

            UtilController.appendFirmas2AreaEvaluada(firmas, areaEvaluada);

            areaEvaluadaService.addAreaEvaluada(areaEvaluada);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return areaEvaluada.getId() + "";
    }

    //for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {

        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);

            model.addObject("username", userDetail.getUsername());
        }

        model.setViewName("403");
        return model;
    }

    @RequestMapping(value = {"/index"}, method = RequestMethod.GET)
    public ModelAndView index() {

        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        return model;
    }

    @RequestMapping(value = "/rest/verificacionviveres", method = RequestMethod.GET)
    public ModelAndView verifiacionviveres() {

        ModelAndView model = new ModelAndView();
        ArrayList<SubregionEntity> listaSubregiones = subregionService.getSubregiones();
        ArrayList<AlimentoRegistradoEntity> listaAlimentosRegistrados = alimentoRegistradoService.getAlimentoRegistrado();
        model.addObject("listaSubregiones", listaSubregiones);
        model.addObject("listaAlimentosRegistrados", listaAlimentosRegistrados);
        model.setViewName("verificacionviveres");
        return model;
    }


    @RequestMapping(value = "/rest/verificacionbodegas", method = RequestMethod.GET)
    public ModelAndView verificacionBodegas() {

        ModelAndView model = new ModelAndView();
        ArrayList<SubregionEntity> listaSubregiones = subregionService.getSubregiones();
        model.addObject("listaSubregiones", listaSubregiones);
        model.setViewName("verificacionBodegas");
        return model;
    }

    @RequestMapping(value = "/rest/verificaciontransporteviveres", method = RequestMethod.GET)
    public ModelAndView verificacionTransporte() {

        ModelAndView model = new ModelAndView();
        ArrayList<SubregionEntity> listaSubregiones = subregionService.getSubregiones();
        model.addObject("listaSubregiones", listaSubregiones);
        model.setViewName("verificaciontransporteviveres");
        return model;
    }

    @RequestMapping(value = "/rest/institucioneseducativas", method = RequestMethod.GET)
    public ModelAndView institucionesEducativas() {

        ModelAndView model = new ModelAndView();
        ArrayList<SubregionEntity> listaSubregiones = subregionService.getSubregiones();
        ArrayList<AlimentoRegistradoEntity> listaAlimentosRegistrados = alimentoRegistradoService.getAlimentoRegistrado();
        model.addObject("listaSubregiones", listaSubregiones);
        model.addObject("listaAlimentosRegistrados", listaAlimentosRegistrados);
        model.setViewName("institucioneseducativas");
        return model;
    }


    @RequestMapping(value = "/rest/mostrarFormularioPdf", method = RequestMethod.GET)
    @ResponseBody
    public void mostrarFormularioPdf(HttpServletResponse response, @RequestParam("id") Integer id) {

        AreaEvaluadaEntity areaEvaluada = areaEvaluadaService.getAreaEvaluada(id);
        for(AspectoEvaluadoEntity aspectoEvaluadoEntity: areaEvaluada.getAspectosEvaluados()){
            Object a[] = aspectoEvaluadoEntity.getItemEvaluados().toArray();
            Arrays.sort(a);
            List<Object> b = Arrays.asList(a);
            aspectoEvaluadoEntity.setItemEvaluados((List<ItemEvaluadoEntity>)(Object)b);
        }

        try {
            String name = "formulario";
            byte[] reportePdf;

            if (StringUtils.isEmpty(areaEvaluada.getFilePath())) {
                reportePdf = createPdf(areaEvaluada);
                String path = savePdf(areaEvaluada, reportePdf);
                areaEvaluada.setFilePath(path);
                areaEvaluadaService.updateAreaEvaluada(areaEvaluada);
            } else {
                File filePdf = new File(areaEvaluada.getFilePath());
                reportePdf = FileUtils.readFileToByteArray(filePdf);
            }

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", String.format("inline; filename=\"" + name + id + "\""));
            response.setContentLength(reportePdf.length);
            FileCopyUtils.copy(reportePdf, response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private byte[] createPdf(AreaEvaluadaEntity areaEvaluada) throws IOException, JRException {
        for (ResponsableEntity responsable : areaEvaluada.getResponsables()) {
            InputStream in = new ByteArrayInputStream(responsable.getFirma());
            BufferedImage image = ImageIO.read(in);
            responsable.setFirmaJasper(image);
        }
        if(null != areaEvaluada.getAnexos()){
            for (AnexoEntity anexo : areaEvaluada.getAnexos()) {
                InputStream in = new ByteArrayInputStream(anexo.getFoto());
                BufferedImage image = ImageIO.read(in);
                anexo.setFotoJasper(image);
            }
        }

        String reportPath = null;
        if (null != areaEvaluada.getEncabezadoLogisticaEntrega()) {
            reportPath = context.getRealPath("") + "\\resources\\jasper\\1_0_Verificacion_Viveres.jasper";
        } else if (null != areaEvaluada.getEncabezadoBodega()) {
            reportPath = context.getRealPath("") + "\\resources\\jasper\\2_0_Verificacion_Bodegas.jasper";
        } else if (null != areaEvaluada.getEncabezadoTransporte()) {
            reportPath = context.getRealPath("") + "\\resources\\jasper\\3_0_Verificacion_Transporte.jasper";
        } else if (null != areaEvaluada.getEncabezadoInstEducativa()) {
            reportPath = context.getRealPath("") + "\\resources\\jasper\\4_0_Instituciones_Educativas.jasper";
        }

        ArrayList<AreaEvaluadaEntity> areas = new ArrayList<AreaEvaluadaEntity>();
        areas.add(areaEvaluada);

        JRBeanCollectionDataSource ds = new JRBeanCollectionDataSource(areas);
        Map<String, Object> map = new HashMap<String, Object>();
        JasperPrint print = JasperFillManager.fillReport(reportPath, map, ds);
        return JasperExportManager.exportReportToPdf(print);
    }

    private String savePdf(AreaEvaluadaEntity areaEvaluada, byte[] reportePdf) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm");
        String[] fecha = sdf.format(new Date()).split(" ");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user = auth.getName();

        String tipo = null;
        if (null != areaEvaluada.getEncabezadoLogisticaEntrega()) {
            tipo = "Verificacion Viveres";
        } else if (null != areaEvaluada.getEncabezadoBodega()) {
            tipo = "Verificacion Bodegas";
        } else if (null != areaEvaluada.getEncabezadoTransporte()) {
            tipo = "Verificacion Transporte";
        } else if (null != areaEvaluada.getEncabezadoInstEducativa()) {
            tipo = "Verificacion Instituciones";
        }

        File filePdf = new File(local_path + File.separator + tipo + File.separator + fecha[0] + File.separator + user + "-" + fecha[1] + ".pdf");
        filePdf.getParentFile().mkdirs();
        try {
            FileCopyUtils.copy(reportePdf, filePdf);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return filePdf.getAbsolutePath();
    }

    @PostConstruct
    public void setConfiguracion() {
        String unidad = configuracionService.getConfiguracion("unidad");
        String path = configuracionService.getConfiguracion("path");
        local_path = unidad + ":" + File.separator + path;
    }

}