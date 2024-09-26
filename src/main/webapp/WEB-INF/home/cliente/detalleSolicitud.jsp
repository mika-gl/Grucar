<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/detalleSolicitud-cliente.css"/>
        <title>Tu Solicitud</title>
    </head>
    <body>
        <main>            
            <div class="filterRow">
                <h1>Buscando ayudante para resolver: ${solicitud.averiaTraduccion}...</h1>
            </div>
            <div class="loading-img">
                <div id="div1">
                </div>
                <div id="div2">
                </div>
                <div id="div3">
                </div>
            </div>
            <p>Tus especificaciones: ${solicitud.detalles}</p>
            <c:if test="${solicitud.prestador != null}">
                <!-- agregar link a perfil de prestador-->
                <h3>Ayudante <a href="">${solicitud.prestador.nombre}</a> encontrado!</h3>
            
                <button class="call-button" onclick="window.location.href = '/+56${solicitud.prestador.numero}'">llamar</button>
            </c:if>

            <!-- botones para modificar, cancelar, finalizar-->
            <div >
                <c:if test="${solicitud.prestador == null}">
                    <button  onclick='window.location.href="/solicitudes/${solicitud.solicitudId}/modificar"'>modificar</button>
                </c:if>
            </div>
            <c:choose>
                <c:when test="${solicitud.prestador != null}">
                    <form:form action="/solicitudes/${solicitud.solicitudId}/finalizar" method="POST">
                        <input type="hidden" name="_method" value="PUT"/>
                        <button type="submit">finalizar</button>
                    </form:form>
                </c:when>
                <c:otherwise>
                    <form:form action="/solicitudes/${solicitud.solicitudId}/cancelar" method="POST">
                        <input type="hidden" name="_method" value="DELETE"/>
                        <button type="submit">cancelar</button>
                    </form:form>
                </c:otherwise>
            </c:choose>
        </main>
        <script src="/js/detalleSolicitud-cliente.js"></script>
    </body>
</html>