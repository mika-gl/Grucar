<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/popup.css">
    <title>Hacer solicitud</title>
</head>
<body>
    <h1>Logeado como: ${currentUser.name}</h1>
    <h3>cliente</h3>
    <form action="/login/logout" method="POST">
        <input type="hidden" name="_method" value="DELETE"/>
        <button type="submit">logout</button>
    </form>

    <form:form action="/solicitudes/nueva" method="POST" modelAttribute="solicitud">
        <div>
            <form:label path="averia">Averia</form:label>
            <form:input path="averia"/>
        </div>
        <form:errors path="averia"/>
        <form:input path="cliente" type="hidden" readonly="true" value="${currentUser.clienteId}"/> <!-- para agregar atributo cliente en Solicitud-->
        
<!--         <div>
            <form:label path="averia">Problema:</form:label>
            <form:select path="averia">
                <form:option value="1">Cambio de llanta/rueda</form:option>
                <form:option value="2">Bateria sin carga</form:option>
                <form:option value="3">Otro (especificar)</form:option>
            </form:select>
            <form:errors path="averia" />
        </div> 
        Ejemplo de forma de lista, se tendria que cambiar el tipo de averia de string a integer, opiniones?
        en este caso funciona ya que toma el value como string xd -->

        <div>
            <form:label path="detalles">Detalles: </form:label>
            <form:input path="detalles" type="text" />
            <form:errors path="detalles" />
        </div>
        
        <button type="submit">solicitar</button>
    </form:form>


<!-- popup/ventana emergente con numeros de emergencia -->
<button id="popupBtn">SOS</button>

<div id="miModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h3>Numeros de Emergencia</h3>
        <p>Ambulancia: 131.</p>
        <p>Bomberos: 132.</p>
        <p>Carabineros: 133.</p>
    </div>
</div>

<!-- js para el popup -->
<script>
    var modal = document.getElementById("miModal");

    var btn = document.getElementById("popupBtn");

    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>