package com.principal.grucar_proyecto.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;
import com.principal.grucar_proyecto.respositories.ClienteRepository;
import com.principal.grucar_proyecto.respositories.PrestadorRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class LoginService {

    @Autowired
    private ClienteRepository clienteRepository;
    @Autowired
    private PrestadorRepository prestadorRepository;

    // Método para iniciar sesión
    public BindingResult validateLogin(String numero, String password, HttpSession session, BindingResult result) {
        // Validar que el numero y la contraseña sean correctos, sea de cliente o prestador
        Cliente cliente = clienteRepository.findByNumero(numero);
        Prestador prestador = prestadorRepository.findByNumero(numero);

        if (cliente == null && prestador == null) {
            result.rejectValue("numero", "error", "Numero no registrado");

        } else if (cliente != null && prestador == null) {
            if (BCrypt.checkpw(password, cliente.getPassword())) {
                session.setAttribute("currentUser", cliente);
            } else {
                result.rejectValue("password", "error", "Contraseña incorrecta");
            }
        } else if (cliente == null && prestador != null) {
            if (BCrypt.checkpw(password, prestador.getPassword())) {
                session.setAttribute("currentUser", prestador);
            } else {
                result.rejectValue("password", "error", "Contraseña incorrecta");
            }
        } else {
            result.rejectValue("password", "error", "Contraseña incorrecta");
        }
        return result;
    }

    //cerrar sesión
    public void logout(HttpSession session) {
        session.invalidate();
    }

}
