package co.edu.tdea.pae.dao;

import co.edu.tdea.pae.model.ResponsableEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class ResponsableDAOImpl implements ResponsableDAO {
    @PersistenceContext
    private EntityManager manager;

    public void addResponsable(ResponsableEntity responsable) {
        manager.persist(responsable);
    }

    public void updateResponsable(ResponsableEntity responsable) {
        manager.persist(responsable);
    }

    public void deleteResponsable(Integer id) {
        ResponsableEntity responsable = manager.find(ResponsableEntity.class, id);
        manager.remove(responsable);
    }

    public List<ResponsableEntity> getAllResponsables() {
        List<ResponsableEntity> listaResponsables = manager.createQuery("Select a From ResponsableEntity a", ResponsableEntity.class).getResultList();
        return listaResponsables;
    }

    public ResponsableEntity getResponsableById(Integer id) {
        return manager.find(ResponsableEntity.class, id);
    }

}