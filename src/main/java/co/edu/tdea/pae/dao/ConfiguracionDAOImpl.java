package co.edu.tdea.pae.dao;

import co.edu.tdea.pae.model.ConfiguracionEntity;
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
public class ConfiguracionDAOImpl implements ConfiguracionDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public String getConfiguracion(String nombre) {
        return entityManager.find(ConfiguracionEntity.class, nombre).getValor();
    }
}
