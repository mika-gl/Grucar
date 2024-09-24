<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registro Clientes</title>
    <link rel="stylesheet" href="/css/base.css" />
    <link rel="stylesheet" href="/css/stylesregistro.css" />
    <link rel="stylesheet" href="/css/stylescliente.css" />
  </head>
  <body>
    <header>
      <div class="logo">
        <img src="images/logo-grucar.png" alt="GRUCAR Logo" />
        <h2>GRU</h2>
        <h1>CAR</h1>
      </div>
      <nav></nav>
    </header>

    <section id="frase">
      <h1>CON GRUCAR TENDRÁS LA TRANQUILIDAD QUE TANTO NECESITAS</h1>
      <p></p>
    </section>

    <section id="registro">
      <div class="superiorformulario">
        <h2>Regístrate como GruAmigo</h2>
      </div>
      <form:form
        action="/registro/nuevo?tipoDeUsuario=cliente"
        method="POST"
        modelAttribute="baseUser"
      >
        <div>
          <form:label path="nombre">Nombre:</form:label>
          <form:input path="nombre" placeholder="Introduce tu nombre" />
        </div>
        <form:errors class="error" path="nombre" />

        <div>
          <form:label path="apellido">Apellido:</form:label>
          <form:input path="apellido" placeholder="Introduce tu apellido" />
        </div>
        <form:errors class="error" path="apellido" />

        <div>
          <form:label path="rut">Rut:</form:label>
          <form:input path="rut" placeholder="ej: 12123456-0" />
        </div>
        <form:errors class="error" path="rut" />

        <div>
          <form:label path="genero">Género:</form:label>
          <form:select path="genero">
            <option value="">Selecciona tu género</option>
            <option value="femenino">Femenino</option>
            <option value="masculino">Masculino</option>
            <option value="otro">Otro</option>
          </form:select>
        </div>
        <form:errors class="error" path="genero" />

        <div>
          <form:label path="numero">Número de celular:</form:label>
          <div style="display: flex; align-items: center">
            <span>+56</span>
            <form:input
              path="numero"
              maxlength="9"
              placeholder="912345678"
              pattern="\\d{9}"
              title="Debe ingresar solo 9 dígitos"
            />
          </div>
        </div>
        <form:errors class="error" path="numero" />

        <div>
          <form:label path="tipoDePersona">Tipo de Cliente:</form:label>
          <form:select path="tipoDePersona">
            <option value="">Selecciona el tipo de cliente</option>
            <option value="nat">Persona Natural</option>
            <option value="jur">Persona Jurídica</option>
          </form:select>
        </div>
        <form:errors class="error" path="tipoDePersona" />

        <div>
          <form:label path="passwordForm">Contraseña:</form:label>
          <form:password path="passwordForm" />
        </div>
        <form:errors class="error" path="passwordForm" />

        <div>
          <form:label path="passwordConfirm">Confirmar Contraseña:</form:label>
          <form:password path="passwordConfirm" />
        </div>
        <form:errors class="error" path="passwordConfirm" />

        <button type="submit">Registrarse</button>
      </form:form>

      <form action="/" method="get" class="salirBtn">
        <a href="/">Volver al Inicio</a>
      </form>
    </section>

    <footer>
      <p>&copy; 2024 GRUCAR. Todos los derechos reservados.</p>
    </footer>
  </body>
</html>

