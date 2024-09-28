package com.principal.grucar_proyecto.services;

import java.util.Date;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.principal.grucar_proyecto.models.BaseUser;
import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;
import com.principal.grucar_proyecto.respositories.ClienteRepository;
import com.principal.grucar_proyecto.respositories.PrestadorRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class BaseUserService {

    @Autowired
    private PrestadorRepository prestadorRepository;
    @Autowired
    private ClienteRepository clienteRepository;
    
    // Metodo para revisar si ya existen usuarios con el mismo Numero (y el mismo tipo de cuenta, cliente o prestador),
    // si la confirmacion de la pass esta bien, y para encriptar la contrasena.
    // Devuelve el BindingResult respectivo segun los errores.
    public BindingResult validateUser(BaseUser baseUser, BindingResult result, String tipoDeUsuario) {
        Cliente existingCliente = clienteRepository.findByNumero(baseUser.getNumero());
        Prestador existingPrestador = prestadorRepository.findByNumero(baseUser.getNumero());

        if (existingCliente != null || existingPrestador != null) {
        result.rejectValue("numero", "errorNumero", "Este numero ya está registrado"); //ya hay alguien con ese numero
        
        } else if (!baseUser.getPasswordForm().equals(baseUser.getPasswordConfirm())) { //revisa si la confirmacion de pass esta bien escrita
            result.rejectValue("passwordConfirm", "errorConfirm", "Las contraseñas no coinciden");
        } else {

            // Encriptamos la contraseña si todo está bien.
            String hashedPassword = BCrypt.hashpw(baseUser.getPasswordForm(), BCrypt.gensalt());
            baseUser.setPassword(hashedPassword);
        }
        return result;
    }

    public BaseUser setPresetAllDates(BaseUser baseUser) {
        baseUser.setUpdatedAt(new Date());
        baseUser.setCreatedAt(new Date());
        return baseUser;
    }
}
