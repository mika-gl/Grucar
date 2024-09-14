<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hacer solicitud</title>
</head>
<body>
    <h1>Logeado como: ${currentUser.name}</h1>
    <h3>cliente</h3>
    <form action="/login/logout" method="POST">
        <input type="hidden" name="_method" value="DELETE"/>
        <button type="submit">logout</button>
    </form>

    <form:form action="/solicitudes/nueva" method="POST" modelAttribute="solicitud">
        <div>
            <form:label path="averia"></form:label>
            <form:input path="averia"/>
        </div>
        <form:errors path="averia"/>
        <form:input path="cliente" type="hidden" readonly="true" value="${currentUser.clienteId}"/> <!-- para agregar atributo cliente en Solicitud-->
        <button type="submit">solicitar</button>
    </form:form>
</body>
</html>