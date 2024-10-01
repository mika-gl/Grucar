<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu Solicitud</title>
    <link rel="stylesheet" href="/css/detalleSolicitud-cliente.css"/>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/detalleSolicitud-celular.css"/>
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
          <p><em>Gru ${currentUser.nombre} conectado!</em></p>
        </nav>
      </header>
    <main>            
        <!-- Contenedor principal de la solicitud -->
        <div class="card-container">
            
            <!-- Especificaciones de la solicitud -->
            <div class="card-body">
                <c:if test="${solicitud.prestador == null}"> <!-- para que aparezca "buscando" solo cuando se esta buscando -->
                    <h2>Buscando ayudante para resolver:</h2>
                    <h2 style="color: #8a2be2;">${solicitud.averiaTraduccion}</h2>
                </c:if>
                <p>Tus especificaciones: ${solicitud.detalles}</p>
                            <!-- Cargando... -->
                <c:if test="${solicitud.prestador == null}"> <!-- asi desaparecen las bolas cuando ya se encuentra el prestador -->
                    <div class="loading-img">
                        <div id="div1"></div>
                        <div id="div2"></div>
                        <div id="div3"></div>
                    </div>
                </c:if>
                
                <!-- Ayudante encontrado -->
                <c:if test="${solicitud.prestador != null}">
                    <h3>Ayudante <a href="/perfil/prestador/${solicitud.prestador.prestadorId}">${solicitud.prestador.nombre}</a> encontrado!</h3>
                    <p>en breve se pondra en contacto contigo</p>
                    <button class="call-button" onclick="window.location.href = 'tel:+56${solicitud.prestador.numero}'">llamar</button>
                    <button class="call-button whatsapp-button" onclick='window.location.href = "http\://wa.me/+56${solicitud.prestador.numero}"'>whatsapp</button>
                </c:if>
            </div>

            <!-- Botones de acción -->
            <div class="action-buttons">
                <c:if test="${solicitud.prestador == null}">
                    <button onclick='window.location.href="/solicitudes/${solicitud.solicitudId}/modificar"'>Modificar</button>
                </c:if>
                <c:choose>
                    <c:when test="${solicitud.prestador != null}">
                        <form:form action="/solicitudes/${solicitud.solicitudId}/finalizar" method="POST">
                            <input type="hidden" name="_method" value="PUT"/>
                            <button type="submit">Finalizar</button>
                        </form:form>
                    </c:when>
                    <c:otherwise>
                        <form:form action="/solicitudes/${solicitud.solicitudId}/cancelar" method="POST">
                            <input type="hidden" name="_method" value="DELETE"/>
                            <button type="submit">Cancelar</button>
                        </form:form>
                    </c:otherwise>
                </c:choose>
            </div>


        </div>

        <!-- Historial de solicitudes -->
        <div class="history-container">
            <h2>Historial de solicitudes</h2>

            <!-- Solicitudes anteriores -->
            <div class="history-item">
                <h3>Solicitud: ejemplo poner id de solicitud</h3>
                <p>Detalles: ejemplo poner id de solicitud.</p>
            </div>
            <div class="history-item">
                <h3>Solicitud: ejemplo poner id de solicitud</h3>
                <p>Detalles: ejemplo poner id de solicitud.</p>
            </div>
            <!-- Puedes añadir más items aquí -->
        </div>
    </main>
</body>
</html>
