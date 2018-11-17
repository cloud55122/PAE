package co.edu.tdea.pae.dao;

import co.edu.tdea.pae.model.SubregionEntity;
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
public class SubregionDAOImpl implements SubregionDAO {
    @PersistenceContext
    private EntityManager entityManager;

    public ArrayList<SubregionEntity> getSubregiones() {
        List listaSubregiones = entityManager.createQuery("select s From SubregionEntity s", SubregionEntity.class).getResultList();
        return (ArrayList<SubregionEntity>) listaSubregiones;
    }


}
