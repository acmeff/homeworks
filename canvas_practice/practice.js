document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = "green";
  ctx.fillRect(0,0, 500,500);

  ctx.beginPath();
  ctx.arc(300, 150, 100, 20, 18);
  ctx.strokeStyle = 'yellow';
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = 'blue';
  ctx.fill();
});
