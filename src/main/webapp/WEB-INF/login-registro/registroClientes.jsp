<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Unirse a GRUCAR</title>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/stylesregistro.css"/>
    <link rel="stylesheet" href="/css/stylescliente.css"/>
</head>
<body>
<header>
    <div class="logo">
        <img src="/images/logo-grucar3.png" alt="GRUCAR Logo"/>
        <h2>GRU</h2><h1>CAR</h1>
    </div>
</header>

<section id="frase">
    <h1>CON GRUCAR TENDRÁS LA TRANQUILIDAD QUE TANTO NECESITAS</h1>
</section>

<section id="registro">
    <div class="superiorformulario">
        <h2>Regístrate como GruAmigo</h2>
    </div>

    <form:form action="/registro/nuevo?tipoDeUsuario=cliente" method="POST" modelAttribute="baseUser">
        <!-- Nombre y Apellido -->
        <div class="form-element form-parte-1">
            <form:label path="nombre">Nombre:</form:label>
            <div class="input-group">
                <form:input path="nombre" placeholder="Introduce tu nombre"/>
            </div>
            <form:errors class="error" path="nombre"/>

            <form:label path="apellido">Apellido:</form:label>
            <div class="input-group">
                <form:input path="apellido" placeholder="Introduce tu apellido"/>
            </div>
            <form:errors class="error" path="apellido"/>
        </div>

        <!-- Rut -->
        <div class="form-element ">
            <form:label path="rut">Rut:</form:label>
            <div class="input-group">
                <form:input path="rut" placeholder="ej: 12123456-0"/>
            </div>
          </div>
            <form:errors class="error" path="rut"/>
       

        <!-- Género -->
        <div class="form-element form-parte-2">
            <form:label path="genero">Género:</form:label>
            <form:select path="genero">
                <option value="">Selecciona tu género</option>
                <option value="femenino">Femenino</option>
                <option value="masculino">Masculino</option>
                <option value="otro">Otro</option>
            </form:select>
          </div>
            <form:errors class="error" path="genero"/>
      
        <!--Tipo de Cliente -->
        <div class="form-element form-parte-2">
            <form:label path="tipoDePersona">Tipo de Cliente:</form:label>
            <form:select path="tipoDePersona">
                <option value="">Selecciona el tipo de cliente</option>
                <option value="nat">Persona Natural</option>
                <option value="jur">Persona Jurídica</option>
            </form:select>
          </div>
            <form:errors class="error" path="tipoDePersona"/>
        

         <!-- Número de celular con formato mejorado -->
         <div class="form-element telefono-input">
          <div id="codigo-numero" style="display: flex;"></div>
          <form:label path="numero" aria-label="Número Celular">Número de celular:</form:label>
          <div class="input-group">
              <div class="country-code">
                  <img src="/images/chile-flag.png" alt="CL" class="flag-img">
                  <span>+56</span>
              </div>
              <form:input path="numero" type="text" placeholder="ej. 912345678" aria-required="true" maxlength="9"/>
          </div>
          <form:errors path="numero" class="error"/>
      </div>

        <!-- Contraseña y Confirmación -->
        <div class="form-element form-parte-3">
            <form:label path="passwordForm">Contraseña:</form:label>
            <div class="input-group">
                <form:password path="passwordForm" placeholder="Introduce tu contraseña"/>
                
            <form:errors class="error" path="passwordForm"/>

            <form:label path="passwordConfirm">Confirmar Contraseña:</form:label>
            <div class="input-group">
                <form:password path="passwordConfirm" placeholder="Confirma tu contraseña"/>
                
            <form:errors class="error" path="passwordConfirm"/>
        </div>

        <!-- Botones -->
        <div class="form-actions">
            <button class="formButton" id="nextButton" type="submit">Registrarse</button>
            <button class="formButton secondary" id="backButton" type="button" onclick="window.location.href='/'">Volver al Inicio</button>
        </div>

    </form:form>
</section>

<footer>
    <p>&copy; 2024 GRUCAR. Todos los derechos reservados.</p>
</footer>
 <!--Quitado a proposito, a considerar después -->
<script src="/js/registro-celular.js"></script>
<script src="/js/error-input.js"></script>
</body>
</html>

