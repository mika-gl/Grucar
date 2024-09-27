<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Perfil de Usuario</title>
    <link rel="stylesheet" type="text/css" href="/css/perfilCliente.css" />
    <link rel="stylesheet" type="text/css" href="/css/base.css" />
  </head>
  <body>
    <header>
      <div class="logo">
        <img src="/images/logo-grucar3.png" alt="GRUCAR Logo" />
        <h2>GRU</h2>
        <h1>CAR</h1>
      </div>
      <nav>
        <ul>
          <li><a href="/">Inicio</a></li>
          <li><a href="/#servicios">Servicios</a></li>
          <li><a href="/#contacto">Contacto</a></li>
          <li><a href="/solicitudes">GruAsistencia</a></li>
        </ul>
        <form action="/login/logout" method="POST">
          <input type="hidden" name="_method" value="DELETE" />
          <button type="submit" class="logout-btn">Cerrar sesión</button>
        </form>
      </nav>
    </header>

    <main>
      <div class="perfil-container">
        <h1 class="perfil-title">Perfil de Usuario: ${usuario.nombre}</h1>

        <div class="profile-content">
          <div class="profile-card">
            <div class="profile-image">
              <img
                src="${pageContext.request.contextPath}/images/profile.jpg"
                alt="Imagen de perfil"
              />
              <button class="add-photo-btn" aria-label="Añadir Foto">
                <span>+</span>
              </button>
            </div>
            <div class="user-status">
              <p>Disponible</p>
              <div class="switch-container">
                <label class="switch">
                  <input type="checkbox" aria-label="Cambiar Estado" />
                  <span class="slider"></span>
                </label>
              </div>
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
            <div class="email-container">
                <input type="email" id="email" name="email" value="${usuario.email}" placeholder="ejemplo@correo.com" required />
                <button type="submit" class="guardar-btn" aria-label="Guardar Email">Guardar</button>
            </div>
        
            <label for="numero">Contacto:</label>
            <span>${usuario.numero}</span>
        
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
    </main>
  </body>
</html>
