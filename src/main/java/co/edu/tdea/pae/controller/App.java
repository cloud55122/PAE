package co.edu.tdea.pae.controller;

import co.edu.tdea.pae.model.*;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.view.JasperViewer;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class App {
    private static final String RESOURCES_PATH = "\\src\\main\\webapp\\resources\\";

    //private static final String REPORT_PATH = RESOURCES_PATH + "jasper\\1_0_Verificacion_Viveres.jasper";
    private static final String REPORT_PATH = RESOURCES_PATH + "jasper\\2_0_Verificacion_Bodegas.jasper";

    private static final String REPORT_EXPORT_PATH = "test.pdf";

    public static void main(String[] args) {
        try {
            // Generamos el informe
            ArrayList<AreaEvaluadaEntity> areas = App.getAreas();
            //Map con los posibles otros parametros del informe
            Map<String, Object> parameters = new HashMap<String, Object>();
            App.exportPDF(areas, parameters);

        } catch (JRException e) {
            e.printStackTrace();
        }

    }

    public static ArrayList<AreaEvaluadaEntity> getAreas() {
        // Recuperamos la lista ojetos que mostraremos en el informe
        ArrayList<AreaEvaluadaEntity> areas = new ArrayList<AreaEvaluadaEntity>();
        AreaEvaluadaEntity area = new AreaEvaluadaEntity();

        EncabezadoLogisticaEntregaEntity encabezado = getEncabezadoLogisticaEntrega();
        area.setEncabezadoLogisticaEntrega(encabezado);

        EncabezadoBodegaEntity encabezadoBodega = getEncabezadoBodega();
        area.setEncabezadoBodega(encabezadoBodega);

        ArrayList<AspectoEvaluadoEntity> aspectos = getAspectosEvaluados();
        area.setAspectosEvaluados(aspectos);

        ArrayList<AlimentoEntity> alimentos = getAlimentos();
        area.setAlimentos(alimentos);

        ArrayList<ResponsableEntity> responsables = getResponsables();
        area.setResponsables(responsables);

        ArrayList<AnexoEntity> anexos = getAnexos();
        area.setAnexos(anexos);

        area.setComentarios("Hola");
        areas.add(area);
        return areas;
    }

    public static void exportPDF(ArrayList<AreaEvaluadaEntity> areas, Map<String, Object> parameters) throws JRException {
        File currentDirectory = new File(new File(".").getAbsolutePath() + REPORT_PATH);
        // Definimos cual sera nuestra fuente de datos
        JRBeanCollectionDataSource ds = new JRBeanCollectionDataSource(areas);

        JasperPrint print = JasperFillManager.fillReport(currentDirectory.getAbsolutePath(), parameters, ds);

        JasperViewer jasperViewer = new JasperViewer(print);
        jasperViewer.setVisible(true);

        // Exportamos el informe a formato PDF
        JasperExportManager.exportReportToPdfFile(print, REPORT_EXPORT_PATH);
    }


    private static EncabezadoLogisticaEntregaEntity getEncabezadoLogisticaEntrega() {
        SubregionEntity subregion = new SubregionEntity();
        subregion.setNombre("Antioquia");
        MunicipioEntity municipio = new MunicipioEntity();
        municipio.setNombre("Medellin");
        EncabezadoLogisticaEntregaEntity encabezado = new EncabezadoLogisticaEntregaEntity();
        encabezado.setSubregion(subregion);
        encabezado.setMunicipio(municipio);
        encabezado.setSnProveedorLocal(true);
        encabezado.setOperador("Edward");
        encabezado.setNombreProveedor("Mi Vaquita");
        encabezado.setIdentificacionProveedor("1065789158");
        encabezado.setTelefonoProveedor("56987415");
        encabezado.setDireccionProveedor("Cra de mi casa punto com");
        encabezado.setFechaEntrega("10/02/2016");
        encabezado.setHoraInicio("1:00 pm");
        encabezado.setHoraFinal("3:00 pm");
        encabezado.setResponsableEntrega("Juan");
        encabezado.setResponsableRecepcion("Lucas");
        encabezado.setSemanasEntregadas("1|2|3");
        encabezado.setDiasEntregados(10);
        encabezado.setDesde("10/02/2016");
        encabezado.setHasta("10/04/2016");
        return encabezado;
    }
    private static EncabezadoBodegaEntity getEncabezadoBodega() {
        SubregionEntity subregion = new SubregionEntity();
        subregion.setNombre("Antioquia");
        MunicipioEntity municipio = new MunicipioEntity();
        municipio.setNombre("Medellin");
        EncabezadoBodegaEntity encabezado = new EncabezadoBodegaEntity();
        encabezado.setSubregion(subregion);
        encabezado.setMunicipio(municipio);
        encabezado.setModeloOperacion("centralizado");
        encabezado.setNombreProveedor("Mi Vaquita");
        encabezado.setIdentificacionProveedor("1065789158");
        encabezado.setProductoSuministra("muchos");
        encabezado.setTipoModalidad("Desayuno|Racion");
        encabezado.setTelefonoProveedor("56987415");
        encabezado.setEmailProveedor("email@hotmail.com");
        encabezado.setHoraVisita("3:00 pm");
        encabezado.setDireccionProveedor("Cra de mi casa punto com");
        encabezado.setFechaVisita("15/03/2015");
        encabezado.setRecibeVisita("pepito");
        encabezado.setRealizaVisita("juanito");
        encabezado.setIdentificacionrecibeVisita("1090398999");
        encabezado.setIdentificacionrealizaVisita("88899988");
        return encabezado;
    }

    private static ArrayList<AspectoEvaluadoEntity> getAspectosEvaluados() {
        ArrayList<AspectoEvaluadoEntity> aspectos = new ArrayList<AspectoEvaluadoEntity>();
        for(int i=0;i<9;i++) {
            AspectoEvaluadoEntity aspecto = new AspectoEvaluadoEntity();
            aspecto.setNombre("Aspecto "+i);
            ArrayList<ItemEvaluadoEntity> items = new ArrayList<ItemEvaluadoEntity>();
            EstadoPreguntaEntity estadoPregunta1 = new EstadoPreguntaEntity();
            estadoPregunta1.setId(1);
            EstadoPreguntaEntity estadoPregunta2 = new EstadoPreguntaEntity();
            estadoPregunta2.setId(1);
            for (int j = 0; j < 8; j++) {
                ItemEvaluadoEntity item = new ItemEvaluadoEntity();
                item.setId((j + 1));
                PreguntaEntity pregunta = new PreguntaEntity();
                pregunta.setDescripcion((j + 1) + ". Esta es la pregunta "+ i + "." + (j + 1));
                item.setPregunta(pregunta);
                if (j % 2 == 0) {
                    item.setEstadoPregunta(estadoPregunta1);
                } else {
                    item.setEstadoPregunta(estadoPregunta2);
                }

                item.setObservaciones("Ejemplo de observaciones en la tabla "+ i + "." + (j + 1));
                items.add(item);
            }
            aspecto.setItemEvaluados(items);
            aspecto.setTotalItemsCumplidos(10);
            aspecto.setTotalItemsNoCumplidos(2);
            aspecto.setPorcentajeCumplimiento(BigDecimal.valueOf(80));

            aspectos.add(aspecto);
        }
        return aspectos;
    }

    private static ArrayList<ResponsableEntity> getResponsables() {
        ArrayList<ResponsableEntity> responsables = new ArrayList<ResponsableEntity>();
        ResponsableEntity responsable1 = new ResponsableEntity();
        responsable1.setNombre("Edward");
        responsable1.setCargo("Almirante");
        responsable1.setDocumentoIdentidad("1056159652");
        responsable1.setEmail("hola@hotmail.com");
        responsable1.setTelefono("5461226");

        ResponsableEntity responsable2 = new ResponsableEntity();
        responsable2.setNombre("Edward2");
        responsable2.setCargo("Almirante2");
        responsable2.setDocumentoIdentidad("2056159652");
        responsable2.setEmail("hola2@hotmail.com");
        responsable2.setTelefono("2461220");

        ResponsableEntity responsable3 = new ResponsableEntity();
        responsable3.setNombre("Maria");

        ResponsableEntity responsable4 = new ResponsableEntity();
        responsable4.setNombre("Carolina");

        ResponsableEntity responsable5 = new ResponsableEntity();
        responsable5.setNombre("Juan Jose");

        File pathToFile = new File(new File(".").getAbsolutePath() + RESOURCES_PATH + "images\\todosporunpaislogo.png");

        try {
            BufferedImage image = ImageIO.read(pathToFile);
            responsable1.setFirmaJasper(image);
            responsable2.setFirmaJasper(image);
            responsable3.setFirmaJasper(image);
            responsable4.setFirmaJasper(image);
            responsable5.setFirmaJasper(image);
        } catch (IOException e) {
            e.printStackTrace();
        }

        responsables.add(responsable1);
        responsables.add(responsable2);
        responsables.add(responsable3);
        responsables.add(responsable4);
        responsables.add(responsable5);
        return responsables;
    }

    private static ArrayList<AlimentoEntity> getAlimentos() {
        ArrayList<AlimentoEntity> alimentos = new ArrayList<AlimentoEntity>();
        AlimentoRegistradoEntity alimentoRegistrado1 = new AlimentoRegistradoEntity();
        alimentoRegistrado1.setNombre("Atun");
        AlimentoRegistradoEntity alimentoRegistrado2 = new AlimentoRegistradoEntity();
        alimentoRegistrado2.setNombre("Cereal");

        AlimentoEntity alimento1 = new AlimentoEntity();
        alimento1.setAlimentoRegistrado(alimentoRegistrado1);
        alimento1.setMarca("Van Camps");
        alimento1.setSnAprobacionGsan(true);
        AlimentoEntity alimento2 = new AlimentoEntity();
        alimento2.setAlimentoRegistrado(alimentoRegistrado2);
        alimento2.setMarca("Kellogs");
        alimento2.setSnAprobacionGsan(false);

        alimentos.add(alimento1);
        alimentos.add(alimento2);
        return alimentos;
    }

    private static ArrayList<AnexoEntity> getAnexos() {
        ArrayList<AnexoEntity> anexos = new ArrayList<AnexoEntity>();
        File pathToFile = new File(new File(".").getAbsolutePath() + RESOURCES_PATH + "images\\todosporunpaislogo.png");
        for (int i = 0; i < 2; i++) {
            AnexoEntity anexo = new AnexoEntity();
            try {
                BufferedImage image = ImageIO.read(pathToFile);
                anexo.setFotoJasper(image);
                anexo.setNombre("Anexo "+ (i+1));
            } catch (IOException e) {
                e.printStackTrace();
            }
            anexos.add(anexo);
        }
        return anexos;
    }

}