var formButton = document.querySelectorAll(".formButton");
var backButton = document.getElementById("backButton");
var nextButton = document.getElementById("nextButton");
var count = 0;

var rutInput = document.getElementById("rut").placeholder = "rut";

function clickNormal() {
    window.location.href = '/';
}
backButton.addEventListener('click', clickNormal);

if (window.innerWidth < 800) { //solo celulares
    backButton.removeEventListener('click', clickNormal);

    formButton.forEach((button) => {
        button.addEventListener("click", function buttonHandle() {
            
            let form1 = this.parentElement.firstElementChild;
            let form2 = form1.nextElementSibling;
            let form3 = form2.nextElementSibling;

            switch (count) {
            case 0:
                if (this.id === "nextButton") {
                    form1.style.transform = "translateX(-100vw)";
                    form2.style.transform = "translateX(-100vw)";
                    backButton.innerHTML = "atras";
                    backButton.onClick = null;
                    count++;
                } else if (this.id = "backButton") {
                    window.location.href = '/';
                }
                break;
            case 1:
                if (this.id === "nextButton") {
                    form2.style.transform = "translateX(-200vw)";
                    form3.style.transform = "translateX(-100vw)";
                    nextButton.innerHTML = "registrarse";
                    nextButton.style.backgroundColor = "#8a2be2";
                    count++;
                } else if (this.id === "backButton") {
                    form2.style.transform = "translateX(0vw)";
                    form1.style.transform = "translateX(0vw)";
                    backButton.innerHTML = "volver al inicio";
                    count--;
                }
                break;
            case 2:
                if (this.id === "nextButton") {
                    nextButton.type = "submit";
                } else if (this.id === "backButton") {
                    form3.style.transform = "translateX(0vw)";
                    form2.style.transform = "translateX(-100vw)";
                    nextButton.style.backgroundColor = "#17a2b8";
                    nextButton.innerHTML = "siguiente";
                    count--;
                }
                break;
            }
        });
    });
} else {
    nextButton.innerHTML = "Registrarse";
    nextButton.type = "submit";
}
// TODO: input-error en rojo algunos no se marcan
// TODO: desplazar form hacia parte que tiene error
// TODO: arreglar que boton se cambie al tercer boton al apretar rapido solo 2 veces y envie form, o vuelva a home