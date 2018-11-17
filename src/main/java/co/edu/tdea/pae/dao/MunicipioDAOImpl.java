package co.edu.tdea.pae.dao;

import co.edu.tdea.pae.model.MunicipioEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by WilliamEduardo on 18/08/2016.
 */
@Repository
@Transactional
public class MunicipioDAOImpl implements MunicipioDAO {
    @PersistenceContext
    private EntityManager entityManager;

    public ArrayList<MunicipioEntity> getMunicipiosxSubregion(int subregion) {
        List listaMunicipios = entityManager.createQuery("select m From MunicipioEntity m where m.subregion.id=" + subregion, MunicipioEntity.class).getResultList();
        return (ArrayList<MunicipioEntity>) listaMunicipios;
    }
}
