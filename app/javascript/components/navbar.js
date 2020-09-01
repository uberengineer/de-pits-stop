let prevScrollpos = window.pageYOffset;
const navbar = document.getElementById("navbar")


window.addEventListener('scroll', event => {
  const currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    navbar.style.top = "0";
  } else {
    navbar.style.top = "-70px";
  }
  prevScrollpos = currentScrollPos;
})
