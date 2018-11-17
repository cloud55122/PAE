package co.edu.tdea.pae.service;

import co.edu.tdea.pae.dao.AreaEvaluadaDAO;
import co.edu.tdea.pae.model.AreaEvaluadaEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AreaEvaluadaServiceServiceImpl implements AreaEvaluadaService {
    @Autowired
    AreaEvaluadaDAO areaEvaluadaDAO;

    public void addAreaEvaluada(AreaEvaluadaEntity areaEvaluada) {
        areaEvaluadaDAO.addAreaEvaluada(areaEvaluada);
    }

    public ArrayList<AreaEvaluadaEntity> getAreasEvaluadas() {
        return areaEvaluadaDAO.getAreasEvaluadas();
    }

    public AreaEvaluadaEntity getAreaEvaluada(Integer id) {
        return areaEvaluadaDAO.getAreaEvaluada(id);
    }

    @Override
    public void updateAreaEvaluada(AreaEvaluadaEntity areaEvaluada) {
        areaEvaluadaDAO.updateAreaEvaluada(areaEvaluada);
    }
}
