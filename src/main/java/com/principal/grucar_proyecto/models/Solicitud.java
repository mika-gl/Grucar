package com.principal.grucar_proyecto.models;

import java.util.Date;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "solicitudes")
public class Solicitud {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "solicitud_id")
    private Long solicitudId;

    @NotBlank(message = "especificar averia")
    private String averia; //deberia ser un modelo? ej. Averia averia

    /*@Size(max = 500, message = "El campo detalles no puede exceder los 500 caracteres")
    @Column(name = "detalles", length = 500)
    private String detalles; */

    private String detalles;

    @ManyToOne
    @JoinColumn(name = "cliente_id")
    @NotNull(message = "Error: solicitud sin cliente")
    private Cliente cliente;

    @ManyToOne
    @JoinColumn(name = "prestador_id")
    private Prestador prestador;

    @Transient
    private boolean prestadorFinalizo; // true cuando prestador 'finalice' la solicitud del cliente
    @Transient
    private boolean clienteFinalizo; // true cuando cliente 'finalice' su solicitud

    @NotNull
    private boolean solicitudActiva = true; // se vuelve false cuando prestadorFinalizo && clienteFinalizo son true

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(updatable = false, name = "created_at")
    private Date createdAt;

    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;
}
