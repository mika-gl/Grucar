package com.principal.grucar_proyecto.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.respositories.ClienteRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class ClienteService {
    @Autowired
    private ClienteRepository clienteRepository;

    public Cliente findByEmail(String email) {
        return clienteRepository.findByEmail(email);
    }

}
