const navbar = document.getElementById("navbar");
const messages = document.getElementById("message-link");


const scroll = window.onscroll = function(){
  if (window.pageYOffset > 80) {
    navbar.style.background = "white";
     messages.style.color = "black";
  }
  else {
    navbar.style.background = "transparent";
    messages.style.color = $blue;
  }
}

export {scroll};
