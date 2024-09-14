<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
        <link rel="stylesheet" href="/css/base.css">
        <link rel="stylesheet" href="/css/courses.css">
    </head>
    <body>
        <main>
            <h1>Welcome, ${currentUser.name}</h1>
            <form:form action="/session/logout" method="POST">
                <input type="hidden" name="_method" value="DELETE"/>
                <button type="submit">Salir</button>
            </form:form>
            <h2>TV shows</h2>
            <table>
                <thead>
                    <tr>
                        <th>Show</th>
                        <th>Network</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${shows}" var="show">
                        <tr>
                            <td ><a href="/shows/${show.showId}">${show.title}</a></td>                   
                            <td>${show.network}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button onClick='window.location.href="/shows/new"'>Add a show</button>
        </main>
    </body>
</html>