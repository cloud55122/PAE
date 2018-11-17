package co.edu.tdea.pae.dao;

import co.edu.tdea.pae.model.AlimentoRegistradoEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by WilliamEduardo on 27/08/2016.
 */
@Repository
@Transactional
public class AlimentoRegistradoDAOImpl implements AlimentoRegistradoDAO {
    @PersistenceContext
    private EntityManager entityManager;

    public ArrayList<AlimentoRegistradoEntity> getAlimentoRegistrado() {
        List listaAlimentosRegistrados = entityManager.createQuery("select a From AlimentoRegistradoEntity a", AlimentoRegistradoEntity.class).getResultList();
        return (ArrayList<AlimentoRegistradoEntity>) listaAlimentosRegistrados;
    }
}
