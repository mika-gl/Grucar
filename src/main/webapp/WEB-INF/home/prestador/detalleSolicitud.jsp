<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalle de la Solicitud</title>
        <link rel="stylesheet" href="/css/detalleSolicitud-cliente.css"/>
        <link rel="stylesheet" href="/css/base.css"/>
        <link rel="stylesheet" href="/css/popup.css" />
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="logo.png" alt="Logo GRUCAR" />
                <h2>GRU</h2>
                <h1>CAR</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="/">Inicio</a></li>
                    <li><a href="/#servicios">Servicios</a></li>
                    <li><a href="/#contacto">Contacto</a></li>
                    <p><em>Gru ${currentUser.nombre} conectado!</em></p>
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
        
        <main>            
            <!-- Contenedor principal de la solicitud -->
            <div class="card-container">
                <h1>Solicitud aceptada!</h1>
                <h3>Detalles</h3>
                
                <!-- Especificaciones de la solicitud -->
                <div class="card-body">
                    <p>Cliente: ${solicitud.cliente.nombre}</p>
                    <p>Avería: ${solicitud.averiaTraduccion}</p>
                    <p>Detalles: ${solicitud.detalles}</p>
                    <p>Prestador: ${solicitud.prestador.nombre}</p>
                </div>

                <!-- Botones de acción -->
                <div class="action-buttons">
                    <button id="popupBtn" class="sos-btn">Comunicarse con el cliente</button>
                    <form:form action="/solicitudes/${solicitud.solicitudId}/finalizar" method="POST">
                        <input type="hidden" name="_method" value="PUT"/>
                        <button type="submit">finalizar</button>
                    </form:form>
                </div>
            </div>

                        <!-- Popup de Llamada -->
            <div id="miModal" class="modal">
                <div class="modal-content">
                <span class="close">&times;</span>
                <h3>Avisando al cliente...</h3>
                    <div class="loading-img">
                        <div id="div1"></div>
                        <div id="div2"></div>
                        <div id="div3"></div>
                    </div>
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


            <!-- Historial de solicitudes similares -->
            <div class="history-container">
                <h2>Historial de solicitudes</h2>
                
                <div class="history-item">
                    <h3>Solicitud: ejemplo poner id de solicitud</h3>
                    <p>Detalles: ejemplo poner id de solicitud.</p>
                </div>
                <!-- Añadir más solicitudes si es necesario -->
            </div>
        </main>
    </body>
</html>
