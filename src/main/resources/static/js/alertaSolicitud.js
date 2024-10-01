document.addEventListener("DOMContentLoaded", function() {
  // Verificar si estamos en la página "solicitudes.jsp"
  if (window.location.pathname === "/solicitudes") {
    // Selecciona los elementos
    const servicioSelect = document.getElementById("servicio");
    const problemaSelect = document.getElementById("problema");
    const submitBtn = document.getElementById("submit-btn");

    // Variable para verificar si se ha hecho clic en el botón submit-btn
    let submitBtnClicked = false;
    let alertClosed = false;

    // Agrega un evento de cambio a los select
    servicioSelect.addEventListener("change", verificarSeleccion);
    problemaSelect.addEventListener("change", verificarSeleccion);

    // Agrega un evento de clic al botón submit-btn
    submitBtn.addEventListener("click", function(event) {
      if (servicioSelect.value === "asistencia" && (problemaSelect.value === "2" || problemaSelect.value === "5" || problemaSelect.value === "11" || problemaSelect.value === "o")) {
        // Si se ha cumplido la condición principal, mostrar la ventana emergente
        submitBtnClicked = true;
        verificarSeleccion();
        event.preventDefault();
      } else {
        // Si no se ha cumplido la condición principal, permitir que el botón de submit funcione correctamente
        alertClosed = true;
      }
    });

    // Función para verificar la selección
    function verificarSeleccion() {
      console.log("verificarSeleccion ejecutada");
      const selectedService = servicioSelect.value;
      console.log("selectedService:", selectedService);
      const selectedProblem = problemaSelect.value;
      console.log("selectedProblem:", selectedProblem);

      if (servicioSelect.value === "asistencia" && (problemaSelect.value === "2" || problemaSelect.value === "5" || problemaSelect.value === "11" || problemaSelect.value === "o") && submitBtnClicked) {
        // Solo se activa si se selecciona "asistencia" y una de las cuatro opciones específicas y se hace clic en el botón submit-btn
        console.log("Condición cumplida");
        // Mostrar la ventana emergente
        const ventanaEmergente = document.createElement("div");
        ventanaEmergente.innerHTML = `
          <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); display: flex; justify-content: center; align-items: center;">
            <div style="background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);">
              <h2 style="margin-top: 0;">Aguarde por favor.</h2>
              <p>Para proteger su seguridad, un mecánico lo contactará a la brevedad.</p>
              <button style="background-color: #4CAF50; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">Aceptar</button>
            </div>
          </div>
        `;
        document.body.appendChild(ventanaEmergente);

        // Agregar evento de clic al botón de aceptar
        ventanaEmergente.querySelector("button").addEventListener("click", function() {
          ventanaEmergente.remove();
          window.location.href = "/solicitudes";
        });
      } else {
        // No se activa si no se cumple la condición principal
        console.log("Condición no cumplida");

        document.addEventListener("DOMContentLoaded", function() {
          // Verificar si estamos en la página "solicitudes.jsp"
          if (window.location.pathname === "/solicitudes") {
            // Resto del código para el modal y la lógica de verificación...
          }
        });        
      }
    }
  }
});
