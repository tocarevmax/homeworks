document.addEventListener("DOMContentLoaded", function(){

});

var canvas = document.getElementById('mycanvas');
var ctx = canvas.getContext('2d');
ctx.fillStyle = 'rgb(100,0,0)';
ctx.fillRect(10, 10, 200, 200);
ctx.beginPath();
ctx.strokeStyle = 'blue';
ctx.lineWidth = 20;
ctx.arc(300, 300, 100, 0, 2 * Math.PI);
ctx.fillStyle = 'rgb(100,100,100)';
ctx.fill();
ctx.stroke();
