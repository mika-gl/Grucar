package com.examen.grucar_proyecto.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.examen.grucar_proyecto.models.User;
import com.examen.grucar_proyecto.respositories.UserRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    

    public User create(User user) {
        return userRepository.save(user);
    }
    public User update(User user) {
        return userRepository.save(user);
    }
    public List<User> findAll() {
        return userRepository.findAll();
    }
    public User findById(Long id) {
        return userRepository.findById(id).orElse(null);
    }
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    public BindingResult validateUser(User user, BindingResult result) {
        User userExists = userRepository.findByEmail(user.getEmail());
        if (userExists != null) {
            result.rejectValue("email", "errorEmail", "Este email ya está registrado");
        } else if (!user.getPasswordForm().equals(user.getPasswordConfirm())) {
            result.rejectValue("passwordConfirm", "errorConfirm", "Las contraseñas no coinciden");
        } else {
            // Encriptamos la contraseña si todo está bien.
            String hashedPassword = BCrypt.hashpw(user.getPasswordForm(), BCrypt.gensalt());
            user.setPassword(hashedPassword);
        }
        return result;
    }
}
