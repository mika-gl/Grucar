<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Clientes</title>
</head>
<body>
    <form:form action="/registro/nuevo">
        <form:label path="name"/>
        <form:input path="name"/>
        <form:error path="name"/>

        <form:label path="email"/>
        <form:input path="email"/>
        <form:error path="email"/>        

        <form:label path="passwordForm"/>
        <form:input path="passwordForm"/>
        <form:error path="passwordForm"/>        

        <form:label path="passwordConfirm"/>
        <form:error path="passwordConfirm"/>
        <form:input path="passwordConfirm"/>

        <form:label path="genero"/>
        <form:error path="genero"/>
        <form:input path="genero"/>
    </form:form>
</body>
</html>