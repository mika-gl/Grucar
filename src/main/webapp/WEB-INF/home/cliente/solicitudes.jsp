<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hacer Solicitud - GruAsistencia</title>
    <link rel="stylesheet" href="/css/base.css" />
    <link rel="stylesheet" href="/css/vistacliente.css" />
    <link rel="stylesheet" href="/css/vistacliente-celular.css" />
    <link rel="stylesheet" href="/css/popup.css" />
        <!-- Leaflet CSS para el mapa -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
    />
  </head>
  </head>
  <body>
    <!-- Encabezado -->
      <header>
      <div class="logo">
        <img src="/images/logo-grucar3.png" alt="Logo GRUCAR" />
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
        <p><em>Gru ${currentUser.nombre} conectado!</em></p>
        <button onclick="window.location.href='/'" class="btn-login">Inicio</button>
      </nav>
    </header>
    <main>
      <!-- Contenido principal -->
      <div class="container">
        <!-- Columna izquierda (S.O.S) -->
        <div class="column left-column">
          <div class="sos-container">
            <button id="popupBtn" class="sos-btn">S.O.S. Emergencia</button>
            <div class="info-area">
              <h3>Consejos de Auxilio</h3>
              <p>1. Mantén la calma y evalúa la situación.</p>
              <p>
                2. Si es seguro hacerlo, mueve el vehículo a un lugar seguro.
              </p>
              <p>
                3. Proporciona la mayor cantidad de información posible al
                solicitar asistencia.
              </p>
            </div>
          </div>
        </div>

        <!-- Columna central (Formulario de problemas) -->
        <div class="column middle-column">
          <div class="form-container">
            <h2>Seleccione el Problema</h2>
            <form:form action="/solicitudes/nueva" method="POST" modelAttribute="solicitud">
                <div class="form-group">
                    <form:label path="averia">Problema:</form:label>
                    <form:select path="averia">
                        <option value="">Seleccione un problema</option>
                        <option value="0">Problemas con el motor</option>
                        <option value="1">Pinchazo de llanta</option>
                        <option value="2">Batería agotada</option>
                        <option value="3">Falta de combustible</option>
                        <option value="4">Problemas de frenos</option>
                        <option value="5">Problemas eléctricos</option>
                        <option value="6">Problemas de refrigeración del motor</option>
                        <option value="7">Problemas de transmisión/option>
                        <option value="8">Llave dentro del vehículo</option>
                        <option value="9">Vehículo atascado</option>
                        <option value="10">Problemas con las luces</option>
                        <option value="11">Sobrecalentamiento del vehículo</option>
                        <option value="12">Falla del sistema de dirección</option>
                        <option value="o">Otro</option>
                    </form:select>
                </div>
                <form:errors path="averia"/>

              <div class="form-group">
                <form:label path="detalles">Detalle:</form:label>
                <form:textarea
                  path="detalles"
                  rows="4"
                  placeholder="Escriba detalles adicionales aquí..."
                ></form:textarea>
              </div>
              <form:errors path="detalles" />

              <form:input
                path="cliente"
                type="hidden"
                readonly="true"
                value="${currentUser.clienteId}"
              />

              <button type="submit" class="submit-btn">Pedir Asistencia</button>
            </form:form>
          </div>
        </div>

        <!-- Columna derecha (Mapa o imagen) -->
        <div class="column right-column">
          <section class="map-section">
            <div id="map"></div>
          </section>
        </div>
      </div>

      <style>
        .leaflet-top, .leaflet-bottom {
            position: absolute;
            z-index: 1000;
            pointer-events: none;
        }
        .leaflet-top, .leaflet-bottom {
            position: unset;
            z-index: 1000;
            pointer-events: none;
        }
      </style>


      <!-- Popup de emergencia -->
      <div id="miModal" class="modal">
        <div class="modal-content">
          <span class="close">&times;</span>
          <h3>Números de Emergencia</h3>
          <p>Ambulancia: 131</p>
          <p>Bomberos: 132</p>
          <p>Carabineros: 133</p>
        </div>
      </div>

      <!-- JS para controlar el popup -->
      <script>
        var modal = document.getElementById("miModal");
        var btn = document.getElementById("popupBtn");
        var span = document.getElementsByClassName("close")[0];

        btn.onclick = function () {
          modal.style.display = "block";
        };

        span.onclick = function () {
          modal.style.display = "none";
        };

        window.onclick = function (event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        };
      </script>

      <!-- Leaflet JS para el mapa -->
      <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
      <script src="script.js"></script>
    </main>

    <!-- Iniciar el mapa con Leaflet.js en script.js -->
    <!-- JS para iniciar el mapa centrado en Santiago -->
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        var map = L.map("map").setView([-33.4489, -70.6693], 13); // Santiago
        L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
          attribution:
            'Datos del mapa © <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> colaboradores',
        }).addTo(map);
        L.marker([-33.4489, -70.6693])
          .addTo(map)
          .bindPopup("Estás aquí")
          .openPopup();
        });

// Botón desplegable
const collapseButtons = document.querySelectorAll('.collapse-button');
collapseButtons.forEach((button) => {
  button.addEventListener('click', () => {
    button.classList.toggle('active');
    const content = button.nextElementSibling;
    if (content.style.maxHeight) {
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    }
  });
});
</script>
</main>
</body>
</html>
