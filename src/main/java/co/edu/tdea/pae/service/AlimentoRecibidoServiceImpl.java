package co.edu.tdea.pae.service;

import co.edu.tdea.pae.dao.AlimentoRecibidoDAO;
import co.edu.tdea.pae.model.AlimentoEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlimentoRecibidoServiceImpl implements AlimentoRecibidoService {
    @Autowired
    AlimentoRecibidoDAO alimentoRecibidoDAO;

    public void addAlientoRecibido(AlimentoEntity alimento) {
        alimentoRecibidoDAO.addAlientoRecibido(alimento);
    }
}
