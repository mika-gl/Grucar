<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es">
<header>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario</title>
    <link rel="stylesheet" type="text/css" href="/css/perfilPrestador.css"> <!-- Vinculando el estilo CSS --> 
</header>
<body>
    <!-- NavBar -->
    <nav>
        <div class="logo">
            <img src="logo.png" alt="Logo GRUCAR">
            <span>GRUCAR</span>
        </div>
            <form action="/" method="get">
                <a href="/">Inicio</a>
            </form>
            <form action="/#servicios" method="get">
                <a href="/#servicios">Servicios</a>
            </form>
            <form action="/#contacto" method="get">
                <a href="/#contacto">Contacto</a>
            </form>
        </div>
        <form action="/login/logout" method="POST">
            <input type="hidden" name="_method" value="DELETE"/>
            <button type="submit" class="logout-btn">Cerrar sesión</button>
        </form>
    </nav>

    <!-- Perfil de Usuario -->
    <div class="perfil-container">
        <!-- Título centrado -->
        <div class="perfil-title">Perfil</div>

        <!-- Contenedor principal para imagen + switch + formulario (flexbox horizontal) -->
        <div class="profile-content">
            <!-- Sección izquierda: imagen y estado -->
            <div class="profile-card">
                <div class="profile-image">
                    <img src="profile-placeholder.png" alt="Foto de Perfil">
                    <button class="add-photo-btn" aria-label="Añadir Foto"><span>+</span></button>
                </div>
                <div class="user-status">
                    <p>Disponible</p>
                    <label class="switch">
                        <input type="checkbox" aria-label="Cambiar Estado">
                        <span class="slider"></span>
                    </label>
                </div>
            </div>
            <form class="profile-form">
                    <label for="nombre">Nombre:</label>
                    <span>${usuario.nombre}</span>

                    <label for="apellido">Apellido:</label>
                    <span>${usuario.apellido}</span>

                    <label for="genero">Género:</label>
                    <span>${usuario.genero}</span>

                    <label for="rut">Rut:</label>
                    <span>${usuario.rut}</span>

                    <label for="email">Email:</label>
                    <span>${usuario.email}</span>

                    <label for="numero">Contacto:</label>
                    <span>${usuario.numero}</span>

                    <label for="licencia">Licencia:</label>
                    <span>${usuario.licencia}</span>

                    <label for="tipoDePersona">Tipo de Persona:</label>
                    <span>${usuario.tipoDePersona}</span>

                    <label for="createdAt">Fecha de registro:</label>
                    <span>${usuario.createdAt}</span>

                <div class="buttons">
                    <button type="button" class="btn-password" aria-label="Cambiar Contraseña">Cambiar Contraseña</button>
                    <button type="button" class="btn-delete" aria-label="Eliminar Cuenta">Eliminar Cuenta</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>