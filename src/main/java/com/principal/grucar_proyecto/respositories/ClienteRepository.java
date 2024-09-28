package com.principal.grucar_proyecto.respositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.principal.grucar_proyecto.models.Cliente;
import java.util.List;

@Repository
public interface ClienteRepository extends CrudRepository<Cliente, Long>{
    Cliente findByNumero(String numero);
}
