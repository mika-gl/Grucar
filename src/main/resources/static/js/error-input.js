var divs = document.querySelectorAll('.form-element > div');

divs.forEach((div) => {
  let id = div.nextElementSibling.id;
  if (id.slice(-6) === "errors") {
    if (div.firstElementChild.nextElementSibling.id === "codigo-numero") {
      div.firstElementChild.nextElementSibling.querySelector("#numero").classList.add("input-error");
    } else {
      div.firstElementChild.nextElementSibling.classList.add("input-error");
    }
  } else {
    if (div.firstElementChild.nextElementSibling.id === "codigo-numero") {
      div.firstElementChild.nextElementSibling.querySelector("#numero").classList.remove("input-error");
    } else {
    div.firstElementChild.nextElementSibling.classList.remove("input-error");
    }
  }
});