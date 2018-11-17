package co.edu.tdea.pae.service;

import co.edu.tdea.pae.dao.ResponsableDAO;
import co.edu.tdea.pae.model.ResponsableEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by WilliamEduardo on 21/08/2016.
 */
@Service
public class ResponsableServiceImpl {
    @Autowired
    ResponsableDAO responsableDAO;

    public void addResponsable(ResponsableEntity responsable) {
        responsableDAO.addResponsable(responsable);
    }

}
