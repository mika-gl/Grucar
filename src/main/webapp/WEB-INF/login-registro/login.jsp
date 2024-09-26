<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login y Registro</title>
    <link rel="stylesheet" href="/css/login.css"/>
    <link rel="stylesheet" href="/css/login-celular.css"/>
</head>
<body>
    <main>
        <section id="login" aria-labelledby="login-title">
            <h1 id="login-title">Accede a tu cuenta</h1>
            <form:form action="/login" method="POST" modelAttribute="login" autocomplete="off">
                <div class="form-element">
                    <div class="telefono-input">
                        <form:label path="numero" aria-label="Número Celular"></form:label>
                        <div class="input-group">
                            <div class="country-code">
                                <img src="/images/chile-flag.png" alt="CL" class="flag-img">
                                <span>+56</span>
                            </div>
                            <form:input path="numero" type="text" placeholder="ej. 912345678" aria-required="true" maxlength="9"/>
                        </div>
                    </div>
                    <form:errors path="numero" class="error"/>
                
                    <!-- Contenedor para la contraseña, similar al del número -->
                    <div class="password-group">
                        <div class="password-label">Contraseña</div>
                        <form:input path="password" type="password" placeholder="Escribir contraseña" aria-required="true"/>
                    </div>
                    <form:errors path="password" class="error"/>
                </div>
                
                <button type="submit" aria-label="Iniciar sesión">¡Empezando la aventura!</button>
            </form:form>
            <a href="/" class="back-link">Volver atrás</a>
        </section>
    </main>
    <script src="/js/error-input.js"></script>
</body>
</html>

