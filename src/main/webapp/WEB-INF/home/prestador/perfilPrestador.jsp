<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil de Usuario</title>
    <link rel="stylesheet" type="text/css" href="styles3.css"> <!-- Vinculando el archivo CSS -->
</head>
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
        <div class="profile-card">
            <div class="profile-image">
                <img src="profile-placeholder.png" alt="Foto de Perfil">
                <button class="add-photo-btn" aria-label="Añadir Foto">+</button>
            </div>
            <div class="user-status">
                <p>Disponible</p>
                <label class="switch">
                    <input type="checkbox" aria-label="Cambiar Estado">
                    <span class="slider"></span>
                </label>
            </div>
            <form class="profile-form">
                <label for="nombre">Nombre:</label>
                <span>${user.name}</span>

                

                <label>Género:</label>
                <span>${user.genero}</span>

                <label for="email">Email:</label>
                <span>${user.email}</span>

                <div>
                    <label>Fecha de registro:</label>
                    <span>${user.createdAt}</span>
                </div>

                <div class="buttons">
                    <button type="button" class="btn-password" aria-label="Cambiar Contraseña">Cambiar Contraseña</button>
                    <button type="button" class="btn-delete" aria-label="Eliminar Cuenta">Eliminar Cuenta</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
