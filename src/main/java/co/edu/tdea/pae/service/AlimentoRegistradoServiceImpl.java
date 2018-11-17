package co.edu.tdea.pae.service;

import co.edu.tdea.pae.dao.AlimentoRegistradoDAO;
import co.edu.tdea.pae.model.AlimentoRegistradoEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by WilliamEduardo on 27/08/2016.
 */
@Service
public class AlimentoRegistradoServiceImpl implements AlimentoRegistradoService {
    @Autowired
    AlimentoRegistradoDAO alimentoRegistradoDAO;

    public ArrayList<AlimentoRegistradoEntity> getAlimentoRegistrado() {
        return alimentoRegistradoDAO.getAlimentoRegistrado();
    }
}
