package co.edu.tdea.pae.service;

import co.edu.tdea.pae.model.MunicipioEntity;

import java.util.ArrayList;

/**
 * Created by WilliamEduardo on 18/08/2016.
 */
public interface MunicipioService {
    public ArrayList<MunicipioEntity> getMunicipiosxSubregion(int subregion);
}
