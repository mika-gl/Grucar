package com.principal.grucar_proyecto.models;

import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



@MappedSuperclass
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class BaseUser {
    
    @NotBlank(message = "nombre requerido")
    private String nombre;

    @NotBlank(message = "apellido requerido")
    private String apellido;

    private String tipoDePersona; //nat = natural / jur = juridica

    private String email; //opcional
    private String comuna; //opcional
    private String region; //opcional
    private String direccion; //oprional

    @NotBlank(message = "numero requerido")
    @Pattern(regexp="^\\d{9}$", message="debe ser un numero valido") //regex para solo numeros y que sean nueve digitos
    private String numero; // sin el +56

    @NotBlank(message= "rut requerido")
    private String rut;

    private String password;

    @NotNull(message = "contraseña requerida")
    @Size(min=8 ,message = "la contraseña no tiene al menos 8 caracteres")
    @Transient
    private String passwordForm;
    @Transient
    private String passwordConfirm;

    @NotNull(message="genero requerido")
    private String genero;

    private String licencia; // tipo de dato? String por mientras

    //TODO: validacion de identidad por camara

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false,name = "created_at")
    private Date createdAt;

    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;
}
