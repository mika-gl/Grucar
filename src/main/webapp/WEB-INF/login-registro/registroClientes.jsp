<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Clientes</title>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/styles2.css"/>
    <link rel="stylesheet" href="/css/forms.css"/>
</head>
<body>
    <header>
        <div class="logo">
            <img src="images/logo-grucar.png" alt="GRUCAR Logo" />
            <h2>GRU</h2>
            <h1>CAR</h1>
        </div>
        <nav>
            <ul>
            <li><a href="#inicio">Inicio</a></li>
            <li><a href="#servicios">Servicios</a></li>
            <li><a href="#contacto">Contacto</a></li>
            <li><a href="">Perfil de usuario</a></li>
            </ul>
            <a href="/login" class="btn-login">Iniciar Sesión</a>
        </nav>
        </header>
    </header>

    <div id="frase"></div>
        <h1>CON GRUCAR TENDRÁS LA TRANQUILIDAD QUE TANTO NECESITAS</h1>
    </div>


    <form:form action="/registro/nuevo?tipoDeUsuario=cliente" method="POST" modelAttribute="baseUser">
        <div>
            <form:label path="name">Nombre:</form:label>
        </div>
        <div>
            <form:input path="name"/>
        </div>
        <form:errors class="error" path="name"/>
        <div>
            <form:label path="email">Email</form:label>
        </div>
        <div>
            <form:input path="email"/>
        </div>
        <form:errors class="error" path="email"/>        
        <div>
            <form:label path="passwordForm">Contrasena</form:label>
        </div>
        <div>
            <form:input path="passwordForm"/>
        </div>
        <form:errors class="error" path="passwordForm"/>        
        <div>
            <form:label path="passwordConfirm">Confirmar Contrasena</form:label>
        </div>
        <div>
            <form:errors class="error" path="passwordConfirm"/>
        </div>
        <form:input path="passwordConfirm"/>
        <div>
            <form:label path="genero">Genero</form:label>
        </div>
        <div>
            <form:errors class="error" path="genero"/>
        </div>
        <form:input path="genero"/>

        <button type="submit">Registrarse</button>
    </form:form>
    <footer>
        <p>&copy; 2024 GRUCAR. Todos los derechos reservados.</p>
    </footer>
</body>
</html>