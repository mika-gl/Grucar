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
    
    @NotBlank(message = "Nombre requerido")
    private String nombre;

    @NotBlank(message = "Apellido requerido")
    private String apellido;

    @NotBlank(message = "Tipo de persona requerido")
    private String tipoDePersona; // nat = natural / jur = jurídica

    private String email; // opcional
    private String comuna; // opcional
    private String region; // opcional
    private String direccion; // opcional

    @NotBlank(message = "Número requerido")
    @Pattern(regexp = "^\\d{9}$", message = "Debe ser un número válido") // regex para solo números y que sean nueve dígitos
    private String numero; // sin el +56

    @NotBlank(message = "RUT requerido")
    private String rut;

    private String password;

    @NotNull(message = "Contraseña requerida")
    @Size(min = 8, message = "La contraseña debe tener al menos 8 caracteres")
    @Transient
    private String passwordForm;

    @Transient
    private String passwordConfirm;

    @NotNull(message = "Género requerido")
    private String genero;

    private String licencia; // tipo de dato? String por mientras

    // TODO: validación de identidad por cámara

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false, name = "created_at")
    private Date createdAt;

    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;
}
