<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>login y register</title>
        <link rel="stylesheet" href="/css/base.css"/>
    </head>
    <body>
        <main >
            <section >
                <h1>Login</h1>
                <form:form action="/login" method="POST" modelAttribute="login">
                    <div>
                        <form:label path="email">email:</form:label>
                        <form:input path="email" type="text" />
                    </div>
                    <form:errors path="email" class="error"/>
                    <div>
                        <form:label path="password">Contrasena:</form:label>
                        <form:input path="password" type="password" />
                    </div>
                    <form:errors path="password" class="error"/>
                    <button  type="submit">Login</button>
                </form:form>
            </section>
        </main>
    </body>
</html>