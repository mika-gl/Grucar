package com.principal.grucar_proyecto.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.principal.grucar_proyecto.models.Cliente;
import com.principal.grucar_proyecto.models.Prestador;
import com.principal.grucar_proyecto.respositories.ClienteRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class LoginService {

    @Autowired
    private ClienteService clienteService;
    @Autowired
    private PrestadorService prestadorService;

    // Método para iniciar sesión
    public BindingResult validateLogin(String email, String password, HttpSession session, BindingResult result) {
        // Validar que el email y la contraseña sean correctos, sea de cliente o prestador
        Cliente cliente = clienteService.findByEmail(email);
        Prestador prestador = prestadorService.findByEmail(email);

        if (cliente == null && prestador == null) {
            result.rejectValue("email", "error", "Email no registrado");

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
