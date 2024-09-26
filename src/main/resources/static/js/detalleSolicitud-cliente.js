var balls = document.querySelectorAll(".loading-img div");
var ball1 = document.getElementById("div1");


balls.forEach((ball) => {
  let lit=false;
  var i = 1;
  setInterval(() => {
    if (ball.id==="1"&&i===1) {
      lightBall(ball);
      i++;
    } else if (ball.id==="2"&&i===2) {
      lightBall(ball);
      i++;
    } else if (ball.id==="3"&&i===3) {
      lightball(ball);
    }

    if (i===3) {
      i=1;
    }
  }, 1000);
  i++
});

function lightBall(ball) {
  ball1.classList.toggle("lit-ball");
}