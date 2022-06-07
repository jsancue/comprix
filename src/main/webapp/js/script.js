let navbar = document.querySelector('.header .flex .navbar');
let perfil = document.querySelector('.header .flex .perfil');

document.querySelector('#menu-btn').onclick = () =>{
    navbar.classList.toggle('active');
    perfil.classList.remove('active');
}

document.querySelector('#user-btn').onclick = () =>{
    perfil.classList.toggle('active');
    navbar.classList.remove('active');
}


window.onscroll = () =>{
    navbar.classList.remove('active');
    perfil.classList.remove('active');
}