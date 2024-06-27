document.addEventListener('DOMContentLoaded', () => {
    const hamburger = document.querySelector('.hamburger');
    const navLinks = document.querySelector('.nav-links');
    const closeBtn = document.querySelector('.close-btn');

    hamburger.addEventListener('click', () => {
        navLinks.classList.toggle('active');
        hamburger.classList.toggle('active');
        closeBtn.classList.toggle('active');
    });

    closeBtn.addEventListener('click', () => {
        navLinks.classList.toggle('active');
        hamburger.classList.toggle('active');
        closeBtn.classList.toggle('active');
    });

    // Cerrar el menú cuando se hace clic en un enlace
    const navLinksList = document.querySelectorAll('.nav-links li a');
    navLinksList.forEach(link => {
        link.addEventListener('click', () => {
            navLinks.classList.remove('active');
            hamburger.classList.remove('active');
            closeBtn.classList.remove('active');
        });
    });
});

window.addEventListener('scroll', function() {
    const header = document.getElementById('main-header');
    if (window.scrollY > 0) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});




let slideIndex = 1;
showSlides(slideIndex)

function plusSlides(n){
    showSlides(slideIndex += n)
}
function currentSlide(n){
    showSlides(slideIndex = n)
}
function showSlides(n){
    let i;
    let slides = document.querySelectorAll(".mySlides");
    let quadrates = document.querySelectorAll(".quadrate"); 
    if(n > slides.length) slideIndex = 1
    if(n < 1) slideIndex = slides.length
    for(i = 0; i < slides.length; i++){
        slides[i].style.display = "none"
    }
    for(i = 0; i < quadrates.length;i++){
        quadrates[i].className = quadrates[i].className.replace("active","")
    }
    slides[slideIndex-1].style.display = "block";
    quadrates[slideIndex-1].className += " active";
}