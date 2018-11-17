package co.edu.tdea.pae.dao;

import co.edu.tdea.pae.model.AlimentoEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@Transactional
public class AlimentoRecibidoDAOImpl implements AlimentoRecibidoDAO {
    @PersistenceContext
    private EntityManager manager;

    public void addAlientoRecibido(AlimentoEntity alimento) {
        manager.persist(alimento);
    }
}
