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

    public Cliente findByNumero(String numero) {
        return clienteRepository.findByNumero(numero);
    }
    public Cliente findById(Long id) {
        return clienteRepository.findById(id).orElse(null);
    }
    public Cliente save(Cliente cliente) {
        return clienteRepository.save(cliente);
    }
    public Cliente update(Cliente cliente) {
        return clienteRepository.save(cliente);
    }

    public Cliente convertBaseUserToCliente(BaseUser baseUser) {
    Cliente cliente = new Cliente();
    cliente.setNombre(baseUser.getNombre());        
    cliente.setNumero(baseUser.getNumero());
    cliente.setGenero(baseUser.getGenero());
    cliente.setPassword(baseUser.getPassword());
    cliente.setPasswordForm(baseUser.getPasswordForm());
    cliente.setRut(baseUser.getRut());
    cliente.setApellido(baseUser.getApellido());
    cliente.setLicencia("");
    cliente.setTipoDePersona(baseUser.getTipoDePersona());
    return cliente;
    }
}
