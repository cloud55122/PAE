package co.edu.tdea.pae.service;

import co.edu.tdea.pae.dao.AnexoDAO;
import co.edu.tdea.pae.model.AnexoEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by WilliamEduardo on 21/08/2016.
 */
@Service
public class AnexoServiceImpl implements AnexoService {
    @Autowired
    AnexoDAO anexoDAO;

    public void addAnexo(AnexoEntity anexo) {
        anexoDAO.addAnexo(anexo);
    }
}
