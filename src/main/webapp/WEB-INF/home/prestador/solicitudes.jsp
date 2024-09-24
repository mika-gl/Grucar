<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista solicitudes</title>
    </head>
    <body>

        <nav>
            <div class="logo">
                <img src="logo.png" alt="Logo GRUCAR">
                <span>GRUCAR</span>
            </div>
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
            <p>Logeado como: ${currentUser.nombre}</p>
            <form action="/login/logout" method="POST">
                <input type="hidden" name="_method" value="DELETE"/>
                <button type="submit" class="logout-btn">Cerrar sesión</button>
            </form>

            
            <h3>prestador</h3>

        </nav>
        <table>
            <tr>
                <th>cliente</th>
                <th>Averia</th>
                <th>Detalles</th>
                <th>Prestador</th>
                <th>Fecha emision</th>
                <th>Accion</th>
            </tr>
            <c:if test="${solicitud.solicitudActiva}">
                <c:if test="${solicitud.prestador == null}">
                    <c:forEach items="${solicitudes}" var="solicitud">
                        <tr>
                            <td>${solicitud.cliente.nombre}</td>
                            <td>${solicitud.averia}</td>
                            <td>${solicitud.detalles}</td>
                            <td>${solicitud.prestador.nombre}</td>
                            <td>${solicitud.createdAt}</td>
                            <td>
                                <form action="/solicitudes/aceptar/${solicitud.solicitudId}" method="POST">
                                    <input type="hidden" name="_method" value="PUT"/>
                                    <button type="submit">aceptar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </c:if>
        </table>
    </body>
</html>