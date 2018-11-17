package co.edu.tdea.pae.dao;

import co.edu.tdea.pae.model.MunicipioEntity;

import java.util.ArrayList;

/**
 * Created by WilliamEduardo on 18/08/2016.
 */
public interface MunicipioDAO {
    public ArrayList<MunicipioEntity> getMunicipiosxSubregion(int subregion);
}
