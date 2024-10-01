<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Modificar Solicitud - GruAsistencia</title>
    <link rel="stylesheet" href="/css/vistacliente.css" />
    <link rel="stylesheet" href="/css/base.css" />
    <link rel="stylesheet" href="/css/popup.css" />

    <link rel="stylesheet" href="/css/vistacliente-celular.css" />
    <!-- Leaflet CSS para el mapa -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
</head>
<body>
    <!-- Encabezado -->
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
                
                <li><a href="/perfil/redirect">Perfil de Usuario</a></li>
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
                        <p>2. Si es seguro hacerlo, mueve el vehículo a un lugar seguro.</p>
                        <p>3. Proporciona la mayor cantidad de información posible al solicitar asistencia.</p>
                    </div>
                </div>
            </div>

            <!-- Columna central (Formulario de modificación) -->
            <div class="column middle-column">
                <div class="form-container">
                    <h2>Modificar Problema</h2>
                    <form:form action="${pageContext.request.contextPath}/solicitudes/${solicitud.solicitudId}/modificar" method="POST" modelAttribute="solicitudActual">
                        <input type="hidden" name="_method" value="PUT"/>

                        <div class="form-group">
                            <form:label path="averia">Problema:</form:label>
                            <form:select path="averia">
                                <option value="">Seleccione un problema</option>
                                <option value="0" <c:if test="${solicitudActual.averia == '0'}">selected</c:if>>Problemas con el motor</option>
                                <option value="1" <c:if test="${solicitudActual.averia == '1'}">selected</c:if>>Pinchazo de llanta</option>
                                <option value="2" <c:if test="${solicitudActual.averia == '2'}">selected</c:if>>Batería agotada</option>
                                <option value="3" <c:if test="${solicitudActual.averia == '3'}">selected</c:if>>Falta de combustible</option>
                                <option value="4" <c:if test="${solicitudActual.averia == '4'}">selected</c:if>>Problemas de frenos</option>
                                <option value="5" <c:if test="${solicitudActual.averia == '5'}">selected</c:if>>Problemas eléctricos</option>
                                <option value="6" <c:if test="${solicitudActual.averia == '6'}">selected</c:if>>Problemas de refrigeración del motor</option>
                                <option value="7" <c:if test="${solicitudActual.averia == '7'}">selected</c:if>>Problemas de transmisión</option>
                                <option value="8" <c:if test="${solicitudActual.averia == '8'}">selected</c:if>>Llave dentro del vehículo</option>
                                <option value="9" <c:if test="${solicitudActual.averia == '9'}">selected</c:if>>Vehículo atascado</option>
                                <option value="10" <c:if test="${solicitudActual.averia == '10'}">selected</c:if>>Problemas con las luces</option>
                                <option value="11" <c:if test="${solicitudActual.averia == '11'}">selected</c:if>>Sobrecalentamiento del vehículo</option>
                                <option value="12" <c:if test="${solicitudActual.averia == '12'}">selected</c:if>>Falla del sistema de dirección</option>
                                <option value="o" <c:if test="${solicitudActual.averia == 'o'}">selected</c:if>>Otro</option>
                            </form:select>
                        </div>
                        <form:errors path="averia" cssClass="error-message"/>

                        <div class="form-group">
                            <form:label path="detalles">Detalle:</form:label>
                            <form:textarea path="detalles" rows="4" placeholder="Escriba detalles adicionales aquí..." />
                        </div>
                        <form:errors path="detalles" />

                        <form:input path="cliente" type="hidden" readonly="true" value="${currentUser.clienteId}" />

                        <button type="submit" class="submit-btn">Modificar Solicitud</button>
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

        <!-- JS para iniciar el mapa centrado en Santiago -->
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var map = L.map("map").setView([-33.4489, -70.6693], 13);
                L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
                    maxZoom: 19,
                }).addTo(map);
            });
        </script>
    </main>
</body>
</html>
