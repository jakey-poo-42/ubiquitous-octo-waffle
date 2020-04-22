function makeid() 
{
  var x = document.getElementById("code")
  x.innerHTML = parseInt(Math.floor((Math.random() * 10000000) + 1));
  return x;
}