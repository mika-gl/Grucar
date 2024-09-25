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
                <h1>Solicitud de cliente: ${solicitud.averia}</h1>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Cliente</th>
                        <th>Averia</th>
                        <th>Detalles</th>
                        <th>Prestador</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${solicitud.cliente.nombre}</td>
                        <td>${solicitud.averia}</td>
                        <td>${solicitud.detalles}</td>
                        <td>${solicitud.prestador.nombre}</td>
                    </tr>
                </tbody>
            </table>
            <div >
                <button>contactar cliente</button>
            </div>
            <form:form action="/solicitudes/${solicitud.solicitudId}/finalizar" method="POST">
                <input type="hidden" name="_method" value="PUT"/>
                <button type="submit">finalizar</button>
            </form:form>
        </main>
    </body>
</html>