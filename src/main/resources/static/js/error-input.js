var divs = document.querySelectorAll('.form-element div');

divs.forEach((div) => {
  let id = div.nextElementSibling.id;
  if (id.slice(-6) === "errors") {
    div.firstElementChild.nextElementSibling.classList.add("input-error");
  } else {
    div.firstElementChild.nextElementSibling.classList.remove("input-error");
  }
});