package com.principal.grucar_proyecto.models.forms;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Login {

    @NotBlank(message = "El numero es requerido")
    private String numero;

    @NotBlank(message = "La contraseña es requerida")
    private String password;

}
