<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>login y register</title>
        <link rel="stylesheet" href="/css/base.css">
        <link rel="stylesheet" href="/css/home.css">
        <link rel="stylesheet" href="/css/login.css">
    </head>
    <body>
        <main >
            <section >
                <h1>Register</h1>
                <form:form action="/users/new" method="POST" modelAttribute="user">
                    <div>
                        <form:label path="name">Name:</form:label>
                        <form:input path="name" type="text"/>
                        <form:errors path="name" class="error"/>
                    </div>
                    <div>
                        <form:label path="email">Email:</form:label>
                        <form:input path="email" type="text" />
                        <form:errors path="email" class="error"/>
                    </div>
                    <div>
                        <form:label path="passwordForm">Password:</form:label>
                        <form:input path="passwordForm" type="password" />
                    </div>
                    <form:errors path="passwordForm" class="error"/>
                    <div>
                        <form:label path="passwordConfirm">Password Confirm:</form:label>
                        <form:input path="passwordConfirm" type="password" />
                    </div>
                    <form:errors path="passwordConfirm" class="error"/>
                    <button  type="submit">Register</button>
                </form:form>
            </section>
            <section >
                <h1>Login</h1>
                <form:form action="/session" method="POST" modelAttribute="session">
                    <div>
                        <form:label path="email">Email:</form:label>
                        <form:input path="email" type="text" />
                    </div>
                    <form:errors path="email" class="error"/>
                    <div>
                        <form:label path="password">Password:</form:label>
                        <form:input path="password" type="password" />
                    </div>
                    <form:errors path="password" class="error"/>
                    <button  type="submit">Login</button>
                </form:form>
            </section>
        </main>
    </body>
</html>