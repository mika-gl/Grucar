<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Show info</title>
        <link rel="stylesheet" href="/css/base.css">
        <link rel="stylesheet" href="/css/courses.css">
    </head>
    <body>
        <main>            
            <div class="filterRow">
                <h1>${show.title}</h1>
                <p>Network: ${show.network}</p>
                <h2>Users who rated this show</h2>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Rating</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var='rating' items='${currentRatings}'>
                        <tr>
                            <td>${rating.user.name}</td>
                            <td>${rating.ratingValue}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div >
                <button  onclick='window.location.href="/shows/${show.showId}/edit"'>Edit</button>
            </div>
            
            <form:form action="/shows/${show.showId}/rate" method="POST" modelAttribute="rating">
                <input type="hidden" name="_method" value="PUT" />
                <div>
                    <form:label path="ratingValue">Leave a rating</form:label>
                    <form:input path="ratingValue"/>
                </div>
                <form:errors path="ratingValue"/>
                <button  type="submit">Rate!</button>
            </form:form>
        </main>
    </body>
</html>