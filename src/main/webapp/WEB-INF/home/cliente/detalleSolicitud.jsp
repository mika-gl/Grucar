<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Show info</title>
    </head>
    <body>
        <main>            
            <div class="filterRow">
                <h1>tu solicitud: ${solicitud.averia}</h1>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Averia</th>
                        <th>Detalles</th>
                        <th>Prestador</th>
                        <th>Contacto</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${solicitud.averia}</td>
                        <td>${solicitud.detalles}</td>
                        <td>${solicitud.prestador.nombre}</td>
                        <td>+56 ${solicitud.prestador.numero}</td>
                    </tr>
                </tbody>
            </table>
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
    </body>
</html>