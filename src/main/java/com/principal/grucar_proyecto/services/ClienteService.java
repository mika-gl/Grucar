package com.principal.grucar_proyecto.services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.principal.grucar_proyecto.models.BaseUser;
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
    public Cliente save(Cliente cliente) {
        return clienteRepository.save(cliente);
    }

    public Cliente convertBaseUserToCliente(BaseUser baseUser) {
    Cliente cliente = new Cliente();
    cliente.setName(baseUser.getName());        
    cliente.setEmail(baseUser.getEmail());
    cliente.setGenero(baseUser.getGenero());
    cliente.setPassword(baseUser.getPassword());
    cliente.setPasswordForm(baseUser.getPasswordForm());
    return cliente;
    }
}
