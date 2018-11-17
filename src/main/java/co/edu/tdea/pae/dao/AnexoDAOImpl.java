package co.edu.tdea.pae.dao;

import co.edu.tdea.pae.model.AnexoEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by WilliamEduardo on 21/08/2016.
 */
@Repository
@Transactional
public class AnexoDAOImpl implements AnexoDAO {
    @PersistenceContext
    private EntityManager manager;

    public void addAnexo(AnexoEntity anexo) {
        manager.persist(anexo);
    }
}
