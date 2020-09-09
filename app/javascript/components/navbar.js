let prevScrollpos = window.pageYOffset;
const navbar = document.getElementById("navbar-desktop")

window.addEventListener('scroll', event => {

  const currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {

    navbar.style.top = "0";
  } else {
    navbar.style.top = "-70px";
  }
  prevScrollpos = currentScrollPos;

});

let prevScrollposm = window.pageYOffset;
const navbarMobile = document.getElementById("navbar-mobile")

window.addEventListener('scroll', event => {

  const currentScrollPosm = window.pageYOffset;
  if (prevScrollposm > currentScrollPosm) {

    navbarMobile.style.top = "0";
  } else {
    navbarMobile.style.top = "-70px";
  }
  prevScrollposm = currentScrollPosm;

});


function mobileMenuNav() {
$('.navTrigger').click(function () {
  $(this).toggleClass('active');
  $("#mainListDiv").toggleClass("show_list");
  $("#mainListDiv").fadeIn();
});
};
export { mobileMenuNav };


const slider = document.querySelector('.items');
let isDown = false;
let startX;
let scrollLeft;

if (slider){
    slider.addEventListener('mousedown', (e) => {
    isDown = true;
    slider.classList.add('active');
    startX = e.pageX - slider.offsetLeft;
    scrollLeft = slider.scrollLeft;
  });
  slider.addEventListener('mouseleave', () => {
    isDown = false;
    slider.classList.remove('active');
  });
  slider.addEventListener('mouseup', () => {
    isDown = false;
    slider.classList.remove('active');
  });
  slider.addEventListener('mousemove', (e) => {
    if(!isDown) return;
    e.preventDefault();
    const x = e.pageX - slider.offsetLeft;
    const walk = (x - startX) * 3; //scroll-fast
    slider.scrollLeft = scrollLeft - walk;
    console.log(walk);
  });
}



