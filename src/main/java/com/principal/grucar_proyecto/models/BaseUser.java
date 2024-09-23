package com.principal.grucar_proyecto.models;

import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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
    private String name;

    @NotBlank(message = "email requerido")
    @Email(message = "email no valido")
    private String email;

    private String password;

    @NotNull(message = "contraseña requerida")
    @Size(min=8 ,message = "la contraseña no tiene al menos 8 caracteres")
    @Transient
    private String passwordForm;
    @Transient
    private String passwordConfirm;

    @NotNull(message="genero requerido")
    private String genero;

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
