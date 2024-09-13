package com.principal.grucar_proyecto.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.principal.grucar_proyecto.models.Cliente;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class BaseService {

    // @Autowired
    // private PrestadorService prestadorRepository;
    // @Autowired
    // private ClienteService clienteService;
    

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

    // public BindingResult validateUser(Cliente user, BindingResult result) {
    //     Cliente userExists = clienteRepository.findByEmail(user.getEmail());
    //     if (userExists != null) {
    //         result.rejectValue("email", "errorEmail", "Este email ya está registrado");
    //     } else if (!user.getPasswordForm().equals(user.getPasswordConfirm())) {
    //         result.rejectValue("passwordConfirm", "errorConfirm", "Las contraseñas no coinciden");
    //     } else {
    //         // Encriptamos la contraseña si todo está bien.
    //         String hashedPassword = BCrypt.hashpw(user.getPasswordForm(), BCrypt.gensalt());
    //         user.setPassword(hashedPassword);
    //     }
    //     return result;
    // }
}
