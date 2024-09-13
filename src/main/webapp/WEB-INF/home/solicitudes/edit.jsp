<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Show</title>
        <link rel="stylesheet" href="/css/base.css">
        <link rel="stylesheet" href="/css/home.css">
    </head>
    <body>
        <main >
            <h1>Edit show: ${currentShow.title}</h1>
            <form:form action="/shows/${currentShow.showId}/edit" method="POST" modelAttribute="show">
                <input type="hidden" name="_method" value="PUT" />
                <div>
                    <form:label path="title">Show:</form:label>
                    <form:input path="title" type="text" value="${currentShow.title}"/>
                    <form:errors path="title" class="error"/>
                </div>
                <div>
                    <form:label path="network">Network:</form:label>
                    <form:input path="network" type="text" value="${currentShow.network}"/>
                    <form:errors path="network" class="error"/>
                </div>
                <button  type="submit">Update</button>
            </form:form>
            <form:form action="/shows/${show.showId}/delete" method="POST">
                <input type="hidden" name="_method" value="DELETE" />
                <button  type="submit">Delete</button>
            </form:form>
        </main>
    </body>
</html>