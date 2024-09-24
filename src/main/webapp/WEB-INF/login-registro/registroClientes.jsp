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
    <link rel="stylesheet" href="/css/stylesregistro.css"/>
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
      

    <div id="frase">
        <h1 >CON GRUCAR TENDRÁS LA TRANQUILIDAD QUE TANTO NECESITAS</h1>
    </div>
    <div class="superiorformulario">
        <h2>Registrate como GruAmigo</h2>
    </div>
<<<<<<< HEAD

=======
>>>>>>> 9a9a56f300277c6b75be3f97516383a41bea9081
        <form:form action="/registro/nuevo?tipoDeUsuario=cliente" method="POST" modelAttribute="baseUser">
            <div>
                <form:label path="nombre">Nombre:</form:label>
                <form:input path="nombre"/>
            </div>
            <form:errors class="error" path="nombre"/>
            <div>
                <form:label path="apellido">Apellido:</form:label>
                <form:input path="apellido"/>
            </div>
            <form:errors class="error" path="apellido"/>
            <div>
                <form:label path="rut">Rut:</form:label>
                <form:input path="rut"/>
            </div>
            <form:errors class="error" path="rut"/>   
            <div>
                <form:label path="numero">Numero</form:label>
                <form:input path="numero"/>
            </div>
            <form:errors class="error" path="numero"/>        
            <div>
                <form:label path="passwordForm">Contrasena</form:label>
                <form:input path="passwordForm"/>
            </div>
            <form:errors class="error" path="passwordForm"/>  

            <button type="submit">Registrarse</button>
        </form:form>
    <footer>
        <p>&copy; 2024 GRUCAR. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
