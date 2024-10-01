<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cuenta Regresiva Lanzamiento App en Año Nuevo</title>
    <link rel="stylesheet" href="/css/appmovil/style.css" />
    <link rel="stylesheet" href="/css/base.css" />
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
          <form action="/perfil" method="get">
            <li><a href="/perfil/redirect">Perfil de Usuario</a></li>
          </form>
        </ul>
        <c:choose>
          <c:when test="${currentUser == null}">
            <button onclick="window.location.href='/login'" class="btn-login">Iniciar sesión</button>
          </c:when>
          <c:otherwise>
            <form action="/login/logout" method="POST">
              <input type="hidden" name="_method" value="DELETE"/>
              <button type="submit" class="btn-login logout-btn">Cerrar sesión</button>
            </form>
          </c:otherwise>
        </c:choose>
      </nav>
    </header>

    <div class="launch-message">
        <h2>¡Estamos esperando el lanzamiento de GruCar App Móvil!</h2>
      </div>
    <main>
      <!-- Contenedor de carga mientras se inicia la cuenta regresiva -->
      <div id="loading">Cargando...</div>

      <!-- Contenedor de la cuenta regresiva -->
      <div id="countdown">
        <div id="titulo">Cuenta regresiva</div>
        <div class="time-box">
          <div class="time">
            <h2 id="days">00</h2>
            <small>Días</small>
          </div>
          <div class="time">
            <h2 id="hours">00</h2>
            <small>Horas</small>
          </div>
          <div class="time">
            <h2 id="minutes">00</h2>
            <small>Minutos</small>
          </div>
          <div class="time">
            <h2 id="seconds">00</h2>
            <small>Segundos</small>
          </div>
        </div>
      </div>

      <!-- Imagen o animación que aparece cuando llega el Año Nuevo -->
      <div id="fogos">
        <img
          src="9d1b8fa0157d75f35eede28edc57bd82.gif"
          alt="Fuegos Artificiales"
        />
      </div>

      <!-- Incluimos el script.js en el archivo JSP -->
      <script>
        const secondsContainer = document.querySelector("#seconds");
        const minutesContainer = document.querySelector("#minutes");
        const hoursContainer = document.querySelector("#hours");
        const daysContainer = document.querySelector("#days");
        const spinnerLoading = document.querySelector("#loading");
        const countdownContainer = document.querySelector("#countdown");

        const newYearTime = new Date(`January 01 2025 00:00:00`);

        const getTimeUnit = (unit) => (unit < 10 ? "0" + unit : unit);

        const insertCountdownValues = ({ days, hours, minutes, seconds }) => {
          daysContainer.textContent = getTimeUnit(days);
          hoursContainer.textContent = getTimeUnit(hours);
          minutesContainer.textContent = getTimeUnit(minutes);
          secondsContainer.textContent = getTimeUnit(seconds);
        };

        const updateCountdown = () => {
          const currentTime = new Date();
          const difference = newYearTime - currentTime;
          const days = Math.floor(difference / 1000 / 60 / 60 / 24);
          const hours = Math.floor((difference / 1000 / 60 / 60) % 24);
          const minutes = Math.floor((difference / 1000 / 60) % 60);
          const seconds = Math.floor((difference / 1000) % 60);

          insertCountdownValues({ days, hours, minutes, seconds });
        };

        const handleCountdownDisplay = () => {
          spinnerLoading.remove();
          countdownContainer.style.display = "flex";
        };

        setTimeout(handleCountdownDisplay, 1000);
        setInterval(updateCountdown, 1000);
      </script>
    </main>
  </body>
</html>
