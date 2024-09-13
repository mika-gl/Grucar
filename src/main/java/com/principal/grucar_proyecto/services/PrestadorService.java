package com.principal.grucar_proyecto.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
