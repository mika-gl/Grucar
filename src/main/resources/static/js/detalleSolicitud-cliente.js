var balls = document.querySelectorAll(".loading-img div");

if (balls != null) {
  var loadingTimer = 1;
  setInterval(() => {
    var ball1 = document.getElementById("div1");
    var ball2 = document.getElementById("div2");
    var ball3 = document.getElementById("div3");
  
    if (loadingTimer > 3) {
      unlightBall(ball3);
      loadingTimer=1;
    }
  
    if (loadingTimer === 1) {
      lightBall(ball1);
    } else if (loadingTimer === 2) {
      unlightBall(ball1);
      lightBall(ball2);
    } else if (loadingTimer === 3) {
      unlightBall(ball2);
      lightBall(ball3);
    }
  
    loadingTimer++;
  }, 400);
}

function lightBall(ball) {
  ball.classList.toggle("lit-ball");
}
function unlightBall(ball) {
  ball.classList.toggle("lit-ball");
}