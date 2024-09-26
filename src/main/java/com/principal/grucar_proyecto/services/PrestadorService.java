package com.principal.grucar_proyecto.services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.principal.grucar_proyecto.models.BaseUser;
import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;
import com.principal.grucar_proyecto.respositories.PrestadorRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class PrestadorService {
    @Autowired
    private PrestadorRepository prestadorRepository;

    public Prestador findByNumero(String numero) {
        return prestadorRepository.findByNumero(numero);
    }
    public Prestador findById(Long id) {
        return prestadorRepository.findById(id).orElse(null);
    }
    public Prestador save(Prestador prestador) {
        return prestadorRepository.save(prestador);
    }
    public Prestador update(Prestador prestador) {
        return prestadorRepository.save(prestador);
    }
    
    public Prestador convertBaseUserToPrestador(BaseUser baseUser) {
    Prestador prestador = new Prestador();
    prestador.setNombre(baseUser.getNombre());        
    prestador.setNumero(baseUser.getNumero());
    prestador.setGenero(baseUser.getGenero());
    prestador.setPassword(baseUser.getPassword());
    prestador.setPasswordForm(baseUser.getPasswordForm());
    prestador.setRut(baseUser.getRut());
    prestador.setApellido(baseUser.getApellido());
    prestador.setLicencia(baseUser.getLicencia());
    prestador.setTipoDePersona(baseUser.getTipoDePersona());

    return prestador;
    }
}
