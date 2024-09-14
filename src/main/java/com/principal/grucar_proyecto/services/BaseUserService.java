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

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class BaseUserService {

    @Autowired
    private PrestadorService prestadorRepository;
    @Autowired
    private ClienteRepository clienteRepository;
    

    // public Cliente create(Cliente user) {
    //     return clienteRepository.save(user);
    // }
    // public Cliente update(Cliente user) {
    //     return clienteRepository.save(user);
    // }
    // public List<Cliente> findAll() {
    //     return clienteRepository.findAll();
    // }
    // public Cliente findById(Long id) {
    //     return clienteRepository.findById(id).orElse(null);
    // }
    // public void deleteById(Long id) {
    //     clienteRepository.deleteById(id);
    // }

    // public Cliente findByEmail(String email) {
    //     return clienteRepository.findByEmail(email);
    // }

    // Metodo para revisar si ya existen usuarios con el mismo email (y el mismo tipo de cuenta, cliente o prestador),
    // si la confirmacion de la pass esta bien, y para encriptar la contrasena.
    // Devuelve el BindingResult respectivo segun los errores.
    public BindingResult validateUser(BaseUser baseUser, BindingResult result, String tipoDeUsuario) {
        Cliente existingCliente = clienteRepository.findByEmail(baseUser.getEmail());
        Prestador existingPrestador = prestadorRepository.findByEmail(baseUser.getEmail());

        // CODIGO PERMITE CREACION DE CUENTA CLIENTE Y PRESTADOR CON MISMO EMAIL
        // if (existingCliente != null && tipoDeUsuario.equals("cliente")) {
        //     result.rejectValue("email", "errorEmail", "Este email ya está registrado"); //ya hay un CLIENTE con ese email
        // } else if (existingPrestador != null && tipoDeUsuario.equals("prestador")) {
        //     result.rejectValue("email", "errorEmail", "Este email ya está registrado"); //ya hay un PRESTADOR con ese email
        // }

        if (existingCliente != null || existingPrestador != null) {
        result.rejectValue("email", "errorEmail", "Este email ya está registrado"); //ya hay un CLIENTE con ese email
        
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
