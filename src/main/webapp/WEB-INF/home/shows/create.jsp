<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create New Show</title>
        <link rel="stylesheet" href="/css/base.css">
        <link rel="stylesheet" href="/css/home.css">
    </head>
    <body>
        <main >
            <h1>Create new Show</h1>
            <section >
                <form:form action="/shows/new" method="POST" modelAttribute="show">
                    <div>
                        <form:label path="title">Title:</form:label>
                        <form:input path="title" type="text" />
                        <form:errors path="title" class="error"/>
                    </div>
                    <div>
                        <form:label path="network">Network:</form:label>
                        <form:input path="network" type="text" />
                        <form:errors path="network" class="error"/>
                    </div>  
                    <button  type="submit">Create</button>
                </form:form>
            </section>
        </main>
    </body>
</html>