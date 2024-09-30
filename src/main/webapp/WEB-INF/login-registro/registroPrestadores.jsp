<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registro Prestadores</title>
    <link rel="stylesheet" href="/css/base.css" />
    <link rel="stylesheet" href="/css/stylesregistro.css" />
    <link rel="stylesheet" href="/css/stylesprestador.css" />
  </head>
  <body>
    <header>
      <div class="logo">
        <img src="/images/logo-grucar3.png" alt="GRUCAR Logo" />
        <h2>GRU</h2>
        <h1>CAR</h1>
      </div>
      <nav></nav>
    </header>

    <section id="frase">
      <h1>ÚNETE A GRUCAR Y AUMENTA TUS INGRESOS</h1>
      <p>
        OFRECIENDO ASISTENCIA EN CARRETERA. CONÉCTATE CON MÁS CLIENTES, GESTIONA
        TUS SERVICIOS FÁCILMENTE Y CRECE CON NOSOTROS.
      </p>
    </section>

    <section id="registro">
      <div class="superiorformulario">
        <h2>Regístrate como GruCar</h2>
      </div>
      <form:form
        action="/registro/nuevo?tipoDeUsuario=prestador"
        method="POST"
        modelAttribute="baseUser"
      >
        <!-- Datos personales -->
        <!-- Nombre y Apellido -->
        <div class="form-element form-parte-1">
          <form:label path="nombre">Nombre:</form:label>
          <div class="input-group">
            <form:input path="nombre" placeholder="Introduce tu nombre" />
          </div>
          <form:errors class="error" path="nombre" />

          <form:label path="apellido">Apellido:</form:label>
          <div class="input-group">
            <form:input path="apellido" placeholder="Introduce tu apellido" />
          </div>
          <form:errors class="error" path="apellido" />
        </div>


        <!-- Rut -->
        <div class="form-element">
          <form:label path="rut">Rut:</form:label>
          <div class="input-group">
            <form:input path="rut" placeholder="ej: 12123456-0" />
          </div>
        </div>
        <form:errors class="error" path="rut" />

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
        <form:errors class="error" path="genero" />

        <!--Tipo de Prestador -->
        <div class="form-element form-parte-2">
          <form:label path="tipoDePersona">Tipo de Prestador:</form:label>
          <form:select path="tipoDePersona">
            <option value="">Selecciona el tipo de prestador</option>
            <option value="nat">Persona Natural</option>
            <option value="jur">Persona Jurídica</option>
          </form:select>
        </div>
        <form:errors class="error" path="tipoDePersona" />

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

        <!-- Tipo de Licencia de Conducir -->
        <div>
          <form:label path="licencia">Licencia de conducir:</form:label>
          <form:select path="licencia">
            <option value="">Selecciona tu licencia</option>
            <option value="A1">Clase A1 - Taxis</option>
            <option value="A2">
              Clase A2 - Taxis, ambulancias, transporte de hasta 17 pasajeros
            </option>
            <option value="A3">
              Clase A3 - Transporte público sin límite de asientos
            </option>
            <option value="A4">
              Clase A4 - Transporte de carga superior a 3,500 kg
            </option>
            <option value="A5">
              Clase A5 - Vehículos de carga pesada superior a 3,500 kg
            </option>
            <option value="B">Clase B - Vehículos particulares</option>
            <option value="C">Clase C - Motocicletas</option>
            <option value="D">Clase D - Maquinaria pesada</option>
            <option value="E">Clase E - Vehículos de tracción animal</option>
            <option value="F">
              Clase F - Vehículos de fuerzas armadas y policiales
            </option>
          </form:select>
        </div>
        <form:errors class="error" path="licencia" />

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
