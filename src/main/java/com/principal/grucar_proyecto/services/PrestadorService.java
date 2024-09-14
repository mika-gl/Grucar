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

        public Prestador findByEmail(String email) {
        return prestadorRepository.findByEmail(email);
    }

    public Prestador save(Prestador prestador) {
        return prestadorRepository.save(prestador);
    }
    
    public Prestador convertBaseUserToPrestador(BaseUser baseUser) {
    Prestador prestador = new Prestador();
    prestador.setName(baseUser.getName());        
    prestador.setEmail(baseUser.getEmail());
    prestador.setGenero(baseUser.getGenero());
    prestador.setPassword(baseUser.getPassword());
    prestador.setPasswordForm(baseUser.getPasswordForm());
    return prestador;
    }
}
