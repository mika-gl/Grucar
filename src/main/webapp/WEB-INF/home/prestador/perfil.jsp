<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil</title>
</head>
<body>
    <header>
        <div class="logo">Mi Plataforma</div>
        <div>
            <form action="/" method="get">
                <a href="/">Inicio</a>
            </form>
            <form action="/#servicios" method="get">
                <a href="/#servicios">Servicios</a>
            </form>
            <form action="/#contacto" method="get">
                <a href="/#contacto">Contacto</a>
            </form>
        </div>
        <form method="POST" action="/login/logout"></form>
            <input type="hidden" name="_method" value="DELETE"/>
            <button type="submit">logout</button>
        </form>
    </header>
    <h1>Perfil</h1>
    <div class="container">
        <h1>Perfil del Usuario</h1>
    
        <div class="user-info">
            <label>Nombre:</label> 
            <p>${user.name}</p>
        </div>
    

    
        <div class="user-info">
            <label>Correo:</label>
            <p>${user.email}</p>
        </div>
    
    </div>
</body>
</html>