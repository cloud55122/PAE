package co.edu.tdea.pae.service;

import co.edu.tdea.pae.dao.SubregionDAO;
import co.edu.tdea.pae.model.SubregionEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by WilliamEduardo on 18/08/2016.
 */
@Service
public class SubregionServiceImpl implements SubregionService {
    @Autowired
    SubregionDAO subregionDAO;

    public ArrayList<SubregionEntity> getSubregiones() {
        return subregionDAO.getSubregiones();
    }
}
