<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Clientes</title>
    <link rel="stylesheet" href="/css/base.css"/>
    <link rel="stylesheet" href="/css/login.css"/>
</head>
<body>
    <form:form action="/registro/nuevo?tipoDeUsuario=cliente" method="POST" modelAttribute="baseUser">
        <div>
            <form:label path="nombre">Nombre:</form:label>
            <form:input path="nombre"/>
        </div>
        <form:errors class="error" path="nombre"/>
        <div>
            <form:label path="apellido">Apellido:</form:label>
            <form:input path="apellido"/>
        </div>
        <form:errors class="error" path="apellido"/>
        <div>
            <form:label path="rut">Rut:</form:label>
            <form:input path="rut"/>
        </div>
        <form:errors class="error" path="rut"/>   
        <div>
            <form:label path="numero">Numero</form:label>
            <form:input path="numero"/>
        </div>
        <form:errors class="error" path="numero"/>        
        <div>
            <form:label path="passwordForm">Contrasena</form:label>
            <form:input path="passwordForm"/>
        </div>
        <form:errors class="error" path="passwordForm"/>        

        <div>
            <form:label path="passwordConfirm">Confirmar Contrasena</form:label>
            <form:errors class="error" path="passwordConfirm"/>
        </div>
        <form:input path="passwordConfirm"/>

        <div>
            <form:label path="genero">Genero</form:label>
            <form:errors class="error" path="genero"/>
        </div>
        <form:input path="genero"/>

        <button type="submit">Registrar</button>
    </form:form>
</body>
</html>
