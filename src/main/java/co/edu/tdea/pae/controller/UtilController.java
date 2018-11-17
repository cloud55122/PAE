package co.edu.tdea.pae.controller;

import co.edu.tdea.pae.model.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

public class UtilController {

    public static void appendFirmas2AreaEvaluada(ArrayList<MultipartFile> firmas, AreaEvaluadaEntity areaEvaluada) throws IOException {
        for (int i = 0; i < areaEvaluada.getResponsables().size(); i++) {
            areaEvaluada.getResponsables().get(i).setFirma(firmas.get(i).getBytes());
            areaEvaluada.getResponsables().get(i).setAreaEvaluada(areaEvaluada);
        }
    }

    public static void appendAnexos2AreaEvaluada(Collection<MultipartFile> files, AreaEvaluadaEntity areaEvaluada) throws IOException {
        ArrayList<AnexoEntity> anexos = new ArrayList<AnexoEntity>();
        for (MultipartFile file : files) {
            AnexoEntity anexo = new AnexoEntity();
            anexo.setNombre(file.getName());
            anexo.setFoto(file.getBytes());
            anexo.setAreaEvaluada(areaEvaluada);
            anexos.add(anexo);
        }
        areaEvaluada.setAnexos(anexos);
    }

    public static AreaEvaluadaEntity convertJsonAreaEvaluada2Object(String areaEvaluadaStr) throws IOException, CloneNotSupportedException {
        ObjectMapper mapper = new ObjectMapper();
        AreaEvaluadaEntity areaEvaluada =
                (AreaEvaluadaEntity) mapper.readValue(areaEvaluadaStr, AreaEvaluadaEntity.class).clone();

        for (AlimentoEntity alimento : areaEvaluada.getAlimentos()) {
            alimento.setAreaEvaluada(areaEvaluada);
        }

        for (AspectoEvaluadoEntity aspectoEvaluado : areaEvaluada.getAspectosEvaluados()) {
            aspectoEvaluado.setAreaEvaluada(areaEvaluada);
            for (ItemEvaluadoEntity itemEvaluado : aspectoEvaluado.getItemEvaluados()) {
                itemEvaluado.setAspectoEvaluado(aspectoEvaluado);
            }
        }
        return areaEvaluada;
    }
    public static AreaEvaluadaEntity convertJsonAreaEvaluada2Object2(String areaEvaluadaStr) throws IOException, CloneNotSupportedException {
        ObjectMapper mapper = new ObjectMapper();
        AreaEvaluadaEntity areaEvaluada =
                (AreaEvaluadaEntity) mapper.readValue(areaEvaluadaStr, AreaEvaluadaEntity.class).clone();

        for (AspectoEvaluadoEntity aspectoEvaluado : areaEvaluada.getAspectosEvaluados()) {
            aspectoEvaluado.setAreaEvaluada(areaEvaluada);
            for (ItemEvaluadoEntity itemEvaluado : aspectoEvaluado.getItemEvaluados()) {
                itemEvaluado.setAspectoEvaluado(aspectoEvaluado);
            }
        }
        return areaEvaluada;
    }
}
