<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de Solicitudes</title>
        <link rel="stylesheet" href="/css/vistaprestador.css">
        <link rel="stylesheet" href="/css/base.css">
    </head>
    <body>

        <header>
            <div class="logo">
                <img src="logo.png" alt="Logo GRUCAR">
                <h2>GRU</h2>
                <h1>CAR</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="/">Inicio</a></li>
                    <li><a href="/#servicios">Servicios</a></li>
                    <li><a href="/#contacto">Contacto</a></li>
                    <li><a href="/perfil">Perfil de Usuario</a></li>

                </ul>
                <form action="/login/logout" method="POST">
                    <input type="hidden" name="_method" value="DELETE"/>
                    <button type="submit" class="btn-login">Cerrar sesión</button>
                </form>
            </nav>
        </header>
        
        <main>
            <h1 class="h1style"><em>Gru ${currentUser.nombre} conectado!</em></h1>
            <h3>Solicitudes del GruAmigo</h3>
            <p class="pstyle">GruCar procesando...</p>
        
            <div class="table-container">
                <table>
                    <tr>
                        <th>Cliente</th>
                        <th>Avería</th>
                        <th>Detalles</th>
                        <th>Fecha de Solicitud</th>
                        <th>Prestador</th>
                        <th>Ir al Llamado</th>
                    </tr>
                    <c:forEach items="${solicitudes}" var="solicitud">
                        <c:if test="${solicitud.solicitudActiva}">
                            <c:if test="${solicitud.prestador == null}">
                                <tr>
                                    <td>${solicitud.cliente.nombre}</td>
                                    <td>${solicitud.averiaTraduccion}</td>
                                    <td>${solicitud.detalles}</td>
                                    <td>${solicitud.createdAt}</td>
                                    <td>${solicitud.prestador.nombre}</td>
                                    <td>
                                        <form action="/solicitudes/aceptar/${solicitud.solicitudId}" method="POST">
                                            <input type="hidden" name="_method" value="PUT"/>
                                            <button type="submit">Aceptar</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </table>
            </div> <!-- End of container -->
                <!-- Sección de Recomendaciones -->
    <section class="recommendations">
        <h2>Recomendaciones para ser un buen GruCar</h2>
        <div class="recommendation-box-container">
            <div class="recommendation-box">Recomendaciones para ser un buen GruCar</div>
            <div class="recommendation-box">Recomendaciones para ser un buen GruCar</div>
            <div class="recommendation-box">Recomendaciones para ser un buen GruCar</div>
        </div>
    </section>
        </main>        
    </body>
