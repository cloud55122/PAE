package co.edu.tdea.pae.service;

import co.edu.tdea.pae.model.AreaEvaluadaEntity;

import java.util.ArrayList;

public interface AreaEvaluadaService {
    void addAreaEvaluada(AreaEvaluadaEntity areaEvaluada);
    ArrayList<AreaEvaluadaEntity> getAreasEvaluadas();
    AreaEvaluadaEntity getAreaEvaluada(Integer id);
    void updateAreaEvaluada(AreaEvaluadaEntity areaEvaluada);
}
