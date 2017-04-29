document.addEventListener("DOMContentLoaded", function(){

  const canvasEl = document.getElementById("mycanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "lime";
  ctx.fillRect(10, 10, 50, 70);


  // var canvas = document.getElementById('canvas');
  // var ctx = canvas.getContext('2d');

  // ctx.beginPath();
  // ctx.arc(50, 50, 50, 0, 2 * Math.PI, false);
  // ctx.stroke();

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "black";
  ctx.fill();

});
