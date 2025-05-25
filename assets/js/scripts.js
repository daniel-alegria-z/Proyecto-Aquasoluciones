//Ejecución de funciones
document.getElementById("btn_login").addEventListener("click", iniciarSesion);
document.getElementById("btn_register").addEventListener("click", registrarUsuario);
document.getElementById("passwd").addEventListener("click", confirmarCorreo);
document.getElementById("go-back").addEventListener("click", volverAtras);

window.addEventListener("resize", anchoPage);


//Variables
var formulario_login = document.getElementById("form_login");
var formulario_register = document.getElementById("form_register");
var contenedor_login_register = document.getElementById("contenedor_login_register");
var caja_trasera_login = document.getElementById("caja_trasera_login");
var caja_trasera_register = document.getElementById("caja_trasera_register");
var formulario_correo = document.getElementById("form_correo");
var trasera = document.getElementById("trasera");
var estadoFormulario = "login";
const msg = document.getElementById("mensaje-x");
const msg2 = document.getElementById("mensaje_sesion");
const msg3 = document.getElementById("mensaje_registro");


//Funciones
function anchoPage() {
    if (window.innerWidth > 1081) {
        caja_trasera_login.style.display = "block";
        caja_trasera_register.style.display = "block";
        formulario_login.style.display = "flex";
        formulario_register.style.display = "none";
        formulario_correo.style.display = "none";
        contenedor_login_register.style.left = "10px";
        caja_trasera_login.style.opacity = "0";
        caja_trasera_register.style.opacity = "1";
    } else {
        caja_trasera_register.style.display = "block";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.opacity = "0";
        caja_trasera_login.style.display = "none";
        formulario_login.style.display = "flex";
        contenedor_login_register.style.left = "10px";
        formulario_register.style.display = "none";
        formulario_correo.style.display = "none";

    }

    // Mostrar el formulario según el estado
    if (estadoFormulario === "login") {
        formulario_login.style.display = "flex";
        formulario_register.style.display = "none";
        formulario_correo.style.display = "none";
    } else if (estadoFormulario === "register") {
        formulario_login.style.display = "none";
        formulario_register.style.display = "flex";
        formulario_correo.style.display = "none";
    } else if (estadoFormulario === "correo") {
        formulario_login.style.display = "none";
        formulario_register.style.display = "none";
        formulario_correo.style.display = "flex";
    }
}

anchoPage();

function iniciarSesion() {
    estadoFormulario = "login";
    if (window.innerWidth > 1081) {
        formulario_register.style.display = "none";
        contenedor_login_register.style.left = "10px";
        formulario_login.style.display = "flex";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.opacity = "0";
    } else {
        formulario_register.style.display = "none";
        contenedor_login_register.style.left = "10px";
        formulario_login.style.display = "flex";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.opacity = "0";
        caja_trasera_login.style.display = "none";
        caja_trasera_register.style.display = "flex";
        caja_trasera_register.style.flexDirection = "column";
    }
}

function registrarUsuario() {
    estadoFormulario = "register";
    if (window.innerWidth > 1081) {
        formulario_register.style.display = "flex";
        contenedor_login_register.style.left = "410px";
        formulario_login.style.display = "none";
        caja_trasera_register.style.opacity = "0";
        caja_trasera_login.style.opacity = "1";
        msg.style.display = 'nonedisplay: block !important;';
        msg.style.opacity = "0"; 
        msg2.style.display = 'nonedisplay: block !important;';
        msg2.style.opacity = "0";
        msg3.style.display = 'nonedisplay: block !important;';
        msg3.style.opacity = "0";
    } else {
        formulario_register.style.display = "flex";
        contenedor_login_register.style.left = "10px";
        formulario_login.style.display = "none";
        caja_trasera_register.style.opacity = "0";
        caja_trasera_login.style.opacity = "1";
        caja_trasera_register.style.display = "none";
        caja_trasera_login.style.display = "flex";
        caja_trasera_login.style.flexDirection = "column";
        msg.style.display = 'nonedisplay: block !important;';
        msg.style.opacity = "0"; 
        msg2.style.display = 'nonedisplay: block !important;';
        msg2.style.opacity = "0";
        msg3.style.display = 'nonedisplay: block !important;';
        msg3.style.opacity = "0";
    }

}

function confirmarCorreo() {
    estadoFormulario = "correo";
    if (window.innerWidth > 1081) {
        caja_trasera_register.style.opacity = "0";
        caja_trasera_login.style.opacity = "0";
        formulario_login.style.display = "none";
        formulario_register.style.display = "none";
        caja_trasera_register.style.display = "none";
        formulario_correo.style.display = "flex";
        contenedor_login_register.style.left = "410px";
        msg.style.display = 'nonedisplay: block !important;';
        msg.style.opacity = "0"; 
        msg2.style.display = 'nonedisplay: block !important;';
        msg2.style.opacity = "0";
        msg3.style.display = 'nonedisplay: block !important;';
        msg3.style.opacity = "0";
        
    } else {
        formulario_correo.style.display = "flex";
        contenedor_login_register.style.left = "10px";
        formulario_login.style.display = "none";
        trasera.style.display = "none";
        formulario_register.style.display = "none";
        caja_trasera_register.style.opacity = "0";
        caja_trasera_login.style.opacity = "0";
        caja_trasera_register.style.display = "none";
        msg.style.display = 'nonedisplay: block !important;';
        msg.style.opacity = "0"; 
        msg2.style.display = 'nonedisplay: block !important;';
        msg2.style.opacity = "0";
        msg3.style.display = 'nonedisplay: block !important;';
        msg3.style.opacity = "0";
        
    }

}

function volverAtras() {
    estadoFormulario = "login";
    if (window.innerWidth > 1081) {
        caja_trasera_login.style.display = "block";
        caja_trasera_register.style.display = "block";
        formulario_login.style.display = "flex";
        formulario_register.style.display = "none";
        formulario_correo.style.display = "none";
        contenedor_login_register.style.left = "10px";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.opacity = "0";
    } else {
        caja_trasera_register.style.display = "block";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.display = "none";
        formulario_login.style.display = "flex";
        contenedor_login_register.style.left = "10px";
        formulario_register.style.display = "none";
        trasera.style.display = "block";
        formulario_correo.style.display = "none";

    }
}