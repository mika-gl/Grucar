// Constantes: se define un arreglo que contiene los valores de problema que se consideran como "Asistencia en ruta"
const PROBLEMA_ASISTENCIA_EN_RUTA = [2, 5, 11]; // Define los valores de problema que se consideran como "Asistencia en ruta"

// Función para verificar las opciones seleccionadas: se verifica si se seleccionó "Asistencia en ruta" y uno de los problemas específicos
function verificarSeleccion() { // Define la función verificarSeleccion
  const selectedService = document.getElementById("servicio").value; // Obtiene el valor seleccionado en el select con id "servicio"
  const selectedProblem = document.getElementById("problema").value; // Obtiene el valor seleccionado en el select con id "problema"

  if (selectedService === "asistencia" && PROBLEMA_ASISTENCIA_EN_RUTA.includes(parseInt(selectedProblem))) { // Verifica si se seleccionó "Asistencia en ruta" y uno de los problemas específicos
    alert("Aguarde por favor.\n\nUn mecánico lo contactará a la brevedad, para asesorarlo en cuanto al servicio que necesite."); // Muestra una alerta si se cumple la condición
  }
}

// Agregar event listeners a ambos selects: se agregan eventos de cambio a los selects para llamar a la función verificarSeleccion
document.getElementById("servicio").addEventListener("change", verificarSeleccion); // Agrega un evento de cambio al select con id "servicio"
document.getElementById("problema").addEventListener("change", verificarSeleccion); // Agrega un evento de cambio al select con id "problema"

