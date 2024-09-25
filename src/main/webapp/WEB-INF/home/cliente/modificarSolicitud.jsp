<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/vistacliente.css">
    <link rel="stylesheet" href="/css/popup.css"> 
    <title>Editar Solicitud</title>
</head>
<body>
    <header>
        <div class="logo">Mi Plataforma</div>
        <div>
            <form action="/" method="get">
                <a href="/">Inicio</a>
            </form>
            <form action="/#servicios" method="get">
                <a href="/#servicios">Servicios</a>
            </form>
            <form action="/#contacto" method="get">
                <a href="/#contacto">Contacto</a>
            </form>
            <form action="/" method="get">
                <a href="/perfil">Perfil</a>
            </form>
        </div>
        <div class="user-info">
            <p>Logeado como: ${currentUser.nombre}</p>
            <form action="/login/logout" method="POST">
                <input type="hidden" name="_method" value="DELETE"/>
                <button type="submit" class="logout-btn">Cerrar sesión</button>
            </form>
        </div>
    </header>

    <!-- Contenido principal -->
    <div class="container">
        <!-- Columna izquierda (S.O.S) -->
        <div class="column left-column">
            <button id="popupBtn" class="sos-btn">S.O.S. Emergencia</button>
        </div>

        <!-- Columna central (Formulario de problemas) -->
        <div class="column middle-column">
            <h2>Seleccione el problema</h2>
            <form:form action="${pageContext.request.contextPath}/solicitudes/${solicitud.solicitudId}/modificar" method="POST" modelAttribute="solicitud">
                <input type="hidden" name="_method" value="PUT"/>

                <div class="form-group">
                    <form:label path="averia">Problema:</form:label>
                    <form:select path="averia">
                        <option value="">Seleccione un problema</option>
                        <option value="Problemas con el motor">Problemas con el motor</option>
                        <option value="Pinchazo de llanta">Pinchazo de llanta</option>
                        <option value="Batería agotada">Batería agotada</option>
                        <option value="otro">Otro</option>
                    </form:select>
                </div>
                <form:errors path="averia" cssClass="error-message" />

                <div class="form-group">
                    <form:label path="detalles">Detalle:</form:label>
                    <form:textarea path="detalles" rows="4" placeholder="Escriba detalles adicionales aquí..."></form:textarea>
                </div>
                <form:errors path="detalles"/>

                <form:input path="cliente" type="hidden" readonly="true" value="${currentUser.clienteId}"/>

                <button type="submit" class="submit-btn">Pedir Asistencia</button>
            </form:form>
        </div>

        <!-- Columna derecha (Mapa o imagen) -->
        <div class="column right-column">
            <img src="ruta-a-imagen-placeholder.jpg" alt="Mapa placeholder">
        </div>
    </div>

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

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>




</body>
</html>