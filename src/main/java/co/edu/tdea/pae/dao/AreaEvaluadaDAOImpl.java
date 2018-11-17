package co.edu.tdea.pae.dao;

import co.edu.tdea.pae.model.AreaEvaluadaEntity;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.ArrayList;

@Repository
@Transactional
public class AreaEvaluadaDAOImpl implements AreaEvaluadaDAO {
    @PersistenceContext
    private EntityManager manager;

    public void addAreaEvaluada(AreaEvaluadaEntity areaEvaluada) {
        manager.persist(areaEvaluada);
        manager.flush();
    }

    public ArrayList<AreaEvaluadaEntity> getAreasEvaluadas() {
        Query query = manager.createQuery("SELECT area FROM AreaEvaluadaEntity area");
        return (ArrayList<AreaEvaluadaEntity>) query.getResultList();
    }

    public AreaEvaluadaEntity getAreaEvaluada(Integer id) {
        return manager.find(AreaEvaluadaEntity.class, id);
    }

    @Override
    public void updateAreaEvaluada(AreaEvaluadaEntity areaEvaluada) {
        manager.merge(areaEvaluada);
    }
}
