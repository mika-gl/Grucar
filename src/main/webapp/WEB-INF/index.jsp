<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>GRUCAR - Asistencia en carretera</title>
    <link rel="stylesheet" href="css/stylesindex.css"/>
    <link rel="stylesheet" href="css/base.css"/>
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
          <form action="/perfil" method="get">
            <li><a href="/perfil">Perfil de Usuario</a></li>
        </form>
        </ul>
        <c:choose>
          <c:when test="${currentUser == null}">
            <a href="/login" class="btn-login">Iniciar Sesión</a>
          </c:when>
          <c:otherwise>
            <form action="/login/logout" method="POST">
              <input type="hidden" name="_method" value="DELETE"/>
              <button type="submit" class="btn-login">Cerrar sesión</button>
            </form>
          </c:otherwise>
        </c:choose>
      </nav>
    </header>

    <main>
      <section id="inicio" class="hero">
        <div class="hero-text">
          <h2>Bienvenido a <span>GRUCAR</span></h2>
          <p>
            Tu asistencia en carretera, rápida, confiable y siempre disponible.
          </p>
          <p>
            Con GRUCAR, tienes asistencia en carretera en tiempo real, con
            tarifas claras y personal altamente capacitado. Nos aseguramos de
            que siempre tengas una solución rápida para cualquier emergencia
            vehicular.
          </p>
          <c:if test="${currentUser == null}">
            <div class="register-options">
              <div class="register-button">
                <p>Registrarse como solicitador:</p>
                <a href="/registro?userType=cliente" class="btn-solicitador"
                  >GRUAMIGO</a
                >
              </div>
              <div class="register-button">
                <p>Registrarse como prestador:</p>
                <a href="/registro?userType=prestador" class="btn-prestador"
                  >GRUCAR</a
                >
              </div>
            </div>
          </c:if>
        </div>
        <div class="image-section">
          <img
            src="images/roadside-assistance.png"
            alt="Asistencia en carretera"
          />
        </div>
      </section>

      <!-- Nueva sección de Servicios para Clientes y Prestadores -->
      <section id="servicios" class="services">
        <h2>Nuestros Servicios</h2>
        <div class="services-container">
          <!-- Para Solicitadores -->
          <div class="service-box">
            <h3>Para gruAmigos!</h3>
            <ul>
              <li>
                <strong>Asistencia Inmediata:</strong> Respuesta rápida para
                emergencias en carretera.
              </li>
              <li>
                <strong>Tarifas Claras y Estimadas:</strong> Costos
                transparentes antes de confirmar el servicio.
              </li>
              <li>
                <strong>Seguimiento en Tiempo Real:</strong> Monitoreo del
                vehículo de asistencia durante el proceso.
              </li>
            </ul>
          </div>
          <!-- Para Prestadores -->
          <div class="service-box">
            <h3>Para gruCars!</h3>
            <ul>
              <li>
                <strong>Registro como Proveedor de Servicios:</strong>
                Oportunidad para conductores y técnicos de ofrecer asistencia en
                carretera.
              </li>
              <li>
                <strong>Acceso a una Red de Clientes:</strong> Conexión con
                usuarios que necesitan asistencia vehicular.
              </li>
              <li>
                <strong>Gestión Eficiente de Servicios:</strong> Plataforma
                moderna para gestionar pedidos y pagos.
              </li>
            </ul>
          </div>
        </div>
      </section>

      <!-- Sección de contacto -->
      <section id="contacto" class="contact">
        <h2>Contacto</h2>
        <p>Email: grucar@asistencia.com</p>
        <p>Teléfono: +56 9 1234 5678</p>

        <!-- Formulario de contacto -->
        <form action="/enviarComentario" method="post">
          <label for="nombre">Nombre:</label>
          <input type="text" id="nombre" name="nombre" required />

          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required />

          <label for="comentario">Comentario:</label>
          <textarea id="comentario" name="comentario" required></textarea>

          <button type="submit" class="btn-enviar">Enviar Comentario</button>
        </form>
      </section>
    </main>

    <footer>
      <p>&copy; 2024 GRUCAR. Todos los derechos reservados.</p>
    </footer>
  </body>
</html>
