package co.edu.tdea.pae.service;

import co.edu.tdea.pae.dao.MunicipioDAO;
import co.edu.tdea.pae.model.MunicipioEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by WilliamEduardo on 18/08/2016.
 */
@Service
public class MunicipioServiceImpl implements MunicipioService {
    @Autowired
    MunicipioDAO municipioDAO;

    public ArrayList<MunicipioEntity> getMunicipiosxSubregion(int subregion) {
        return municipioDAO.getMunicipiosxSubregion(subregion);
    }
}
