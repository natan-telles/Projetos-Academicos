/*document.getElementById('dark-button').addEventListener('click', function() {
    document.querySelectorAll('.content, .menu, .social-icons').forEach(function(element) {
        element.classList.toggle("dark");
        element.classList.toggle("background-dark");
    });

    document.getElementById('menu').classList.toggle("bg-dark");
    document.getElementsByClassName('navbar-nav').classList.toggle('color-white');
});*/
var contador = 0;

document.getElementById('dark-button').addEventListener('click', function () {
    contador = contador + 1;
    document.getElementById('menu').classList.remove('bg-white');
    document.getElementById('menu').classList.add('bg-dark');

    if (contador % 2 == 0) {
        document.getElementById('menu').classList.remove('bg-dark');
        document.getElementById('menu').classList.add('bg-white');
    }


});


