<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro conductores</title>
    <link rel="stylesheet" href="/css/base.css"/>
</head>
<body>
    <form:form action="/registro/nuevo?tipoDeUsuario=prestador" method="POST" modelAttribute="baseUser">
        <div>
            <form:label path="name">Nombre:</form:label>
            <form:input path="name"/>
        </div>
        <form:errors class="error" path="name"/>
        <div>
            <form:label path="email">Email</form:label>
            <form:input path="email"/>
        </div>
        <form:errors class="error" path="email"/>        
        <div>
            <form:label path="passwordForm">Contrasena</form:label>
            <form:input path="passwordForm"/>
        </div>
        <form:errors class="error" path="passwordForm"/>        
        <div>
            <form:label path="passwordConfirm">Confirmar Contrasena</form:label>
            <form:input path="passwordConfirm"/>
        </div>
        <form:errors class="error" path="passwordConfirm"/>

        <div>
            <form:label path="genero">Genero</form:label>
            <form:input path="genero"/>
        </div>
        <form:errors class="error" path="genero"/>

        <!-- CARNET DE IDENTIDAD, O DE CONDUCIR -->

        <button type="submit">Registrar</button>
    </form:form>
</body>
</html>