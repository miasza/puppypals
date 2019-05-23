const navbar = document.querySelector(".navbar");

window.onscroll = function(){
  if (window.pageYOffset > 70) {
    navbar.style.background = "white";
  }
  else {
    navbar.style.background = "#99DDC8";
  }
}


