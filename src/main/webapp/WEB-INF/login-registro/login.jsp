<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>login y register</title>
        <link rel="stylesheet" href="/css/login.css"/>
        <link rel="stylesheet" href="/css/login-celular.css"/>
    </head>
    <body>
        <main >
            <section id="login">
                <h1>Accede a tu cuenta</h1>
                <form:form action="/login" method="POST" modelAttribute="login">
                    <div class="form-element">
                        <div>
                            <form:label path="numero">Número Celular:</form:label>
                            <div class="codigo-numero">+56</div>
                            <form:input path="numero" type="text" placeholder="ej. 123456789"/>
                        </div>
                        <form:errors path="numero" class="error"/>
                        <div>
                            <form:label path="password">Contraseña:</form:label>
                            <form:input path="password" placeholder="Contraseña" type="password" />
                        </div>
                        <form:errors path="password" class="error"/>
                    </div>
                    <button  type="submit">¡Empezando la aventura!</button>
                </form:form>
                <button onclick="window.location.href='/'">Volver atras</button>
            </section>
        </main>
    </body>
</html>

