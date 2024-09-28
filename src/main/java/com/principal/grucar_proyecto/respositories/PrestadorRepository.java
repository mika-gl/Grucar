package com.principal.grucar_proyecto.respositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.principal.grucar_proyecto.models.Prestador;
import java.util.List;


@Repository
public interface PrestadorRepository extends CrudRepository<Prestador, Long>{
    Prestador findByNumero(String numero);
}
