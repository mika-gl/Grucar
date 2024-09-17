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
        <h1>Logeado como: ${currentUser.name}</h1>
        <h3>prestador</h3>
        <form method="POST" action="/login/logout">
            <input type="hidden" name="_method" value="DELETE"/>
            <button type="submit">logout</button>
        </form>
        <table>
            <tr>
                <th>cliente</th>
                <th>Averia</th>
                <th>Descripcion</th>
                <th>Prestador</th>
                <th>Fecha emision</th>
            </tr>
            <c:forEach items="${solicitudes}" var="solicitud">
                <tr>
                    <td>${solicitud.cliente.name}</td>
                    <td>${solicitud.averia}</td>
                    <td>${solicitud.descripcion}</td>
                    <td>${solicitud.prestador.name}</td>
                    <td>${solicitud.createdAt}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>