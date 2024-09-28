<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lista de Solicitudes</title>
    <link rel="stylesheet" href="/css/vistaprestador.css" />
    <link rel="stylesheet" href="/css/base.css" />
<<<<<<< HEAD
=======

    <link rel="stylesheet" href="/css/vistaprestador-celular.css"/>
>>>>>>> 91f2669ecd0caa14ab7f60ce989af11cff0297c3
  </head>
  <body>
    <header>
      <div class="logo">
        <img src="images/logo-grucar3.png" alt="Logo GRUCAR" />
        <h2>GRU</h2>
        <h1>CAR</h1>
      </div>
      <nav>
        <ul>
          <li><a href="/">Inicio</a></li>
          <li><a href="/#servicios">Servicios</a></li>
          <li><a href="/#contacto">Contacto</a></li>
          <form action="/perfil" method="get">
            <li><a href="/perfil/redirect">Perfil de Usuario</a></li>
          </form>
        </ul>
        <form action="/login/logout" method="POST">
          <input type="hidden" name="_method" value="DELETE" />
          <button type="submit" class="btn-login">Cerrar sesión</button>
        </form>
      </nav>
    </header>

    <main class="main-container">
      <h1 class="h1style"><em>Gru ${currentUser.nombre} conectado!</em></h1>
<<<<<<< HEAD
      <p class="pstyle">
        GruCar procesando
        <span class="dots">.</span><span class="dots">.</span><span class="dots">.</span>
      </p>
      <h3 class="h3style">Solicitudes del GruAmigo</h3>    
=======
      <h3 class="h3style">Solicitudes activas</h3>
      <c:if test="${solicitudes == null}">
      <p class="pstyle">
        <span class="dots">.</span><span class="dots">.</span><span class="dots">.</span>
      </p>
      </c:if>
>>>>>>> 91f2669ecd0caa14ab7f60ce989af11cff0297c3
      <div class="table-container">
        <table>
          <tr>
            <th>Cliente</th>
            <th>Avería</th>
            <th>Detalles</th>
            <th>Fecha de Solicitud</th>
<<<<<<< HEAD
            <th>Servicio</th>
            <th>Prestador</th>
=======
>>>>>>> 91f2669ecd0caa14ab7f60ce989af11cff0297c3
            <th>Ir al Llamado</th>
          </tr>
          <c:forEach items="${solicitudes}" var="solicitud">
            <c:if test="${solicitud.solicitudActiva}">
              <c:if test="${solicitud.prestador == null}">
                <tr>
                  <td>${solicitud.cliente.nombre}</td>
                  <td>${solicitud.averiaTraduccion}</td>
                  <td>${solicitud.detalles}</td>
<<<<<<< HEAD
                  <td>${solicitud.createdAt}</td>
                  <td>${solicitud.servicio}</td>
                  <td>${solicitud.prestador.nombre}</td>
=======
                  <td style="display: none;">${solicitud.createdAt}</td>
                  <td></td>
                  <script>
                        var createdAt = document.querySelector(".table-container tr td:nth-child(4)").innerText;
                        var formattedDateDay = createdAt.match(/(?<=-)[0-9]{2}(?=-)/);
                        var formattedDateHour = createdAt.match(/(?<= )[0-9:]{5}(?=:)/);
                        document.querySelector(".table-container tr td:nth-child(5)").innerHTML = "el "+formattedDateDay+" a las "+formattedDateHour;
                  </script>
>>>>>>> 91f2669ecd0caa14ab7f60ce989af11cff0297c3
                  <td>
                    <form
                      action="/solicitudes/aceptar/${solicitud.solicitudId}"
                      method="POST"
                    >
                      <input type="hidden" name="_method" value="PUT" />
                      <button type="submit">Aceptar</button>
                    </form>
                  </td>
                </tr>
              </c:if>
            </c:if>
          </c:forEach>
        </table>
      </div>
      <!-- End of container -->
      <!-- Sección de Recomendaciones -->
      <section class="recommendations">
        <h2>Recomendaciones para ser un buen GruCar</h2>
        <div class="recommendation-box-container">
          <div class="recommendation-box">
            <h2>Mantén la Comunicación Abierta</h2>
            <p>
              Establece una comunicación clara y constante con el cliente.
              Informa sobre tu tiempo estimado de llegada y mantén
              actualizaciones sobre el estado del servicio.
            </p>
          </div>
          <div class="recommendation-box">
            <h2>Ofrece Servicios de Calidad</h2>
            <p>
              Asegúrate de brindar asistencia profesional y soluciones
              efectivas. Realiza revisiones y mantenimientos regulares de tu
              equipo para garantizar un servicio seguro.
            </p>
          </div>
          <div class="recommendation-box">
            <h2>Sé Transparente y Accesible</h2>
            <p>
              Proporciona información clara sobre tarifas y servicios. Facilita
              el contacto y la accesibilidad para que los clientes se sientan
              cómodos al solicitar ayuda.
            </p>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
