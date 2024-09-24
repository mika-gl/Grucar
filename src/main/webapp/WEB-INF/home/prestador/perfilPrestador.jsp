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
        <ul>
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="servicios.jsp">Servicios</a></li>
            <li><a href="planes.jsp">Planes</a></li>
            <li><a href="contacto.jsp">Contacto</a></li>
        </ul>
        <div class="nav-buttons">
            <a href="login.jsp" class="btn">Iniciar Sesión</a>
            <a href="registro.jsp" class="btn-register">Registro</a>
        </div>
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

            <!-- Sección derecha: formulario con todas las etiquetas -->
            <div id="formulario">
                <form class="profile-form">
                    <label for="nombre">Nombre:</label>
                    <span>${usuario.name}</span>

                    <label for="apellido">Apellido:</label>
                    <span>${usuario.apellido}</span>

                    <label for="edad">Edad:</label>
                    <span>${usuario.edad}</span>

                    <label for="genero">Género:</label>
                    <span>${usuario.genero}</span>

                    <label for="email">Email:</label>
                    <span>${usuario.email}</span>

                    <label for="fechaRegistro">Fecha de registro:</label>
                    <span>${usuario.fechaRegistro}</span>

                    <label for="ultimaActualizacion">Última actualización:</label>
                    <span>${usuario.ultimaActualizacion}</span>

                    <div class="buttons">
                        <button type="button" class="btn-password" aria-label="Cambiar Contraseña">Cambiar Contraseña</button>
                        <button type="button" class="btn-delete" aria-label="Eliminar Cuenta">Eliminar Cuenta</button>
                    </div>
                </form>
            </div>
        </div> <!-- Cierra profile-content -->
    </div> <!-- Cierra perfil-container -->
</body>
</html>