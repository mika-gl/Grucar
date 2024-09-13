package com.principal.grucar_proyecto.respositories;

import org.springframework.data.repository.CrudRepository;

import com.principal.grucar_proyecto.models.Cliente;
import java.util.List;


public interface ClienteRepository extends CrudRepository<Cliente, Long>{
    Cliente findByEmail(String email);
}
