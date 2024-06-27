// traer los datos de los campos a una variable //


//2 Validacion de loa campos
function validar(){
    let nombre= document.querySelector('#nombre').value;
    let apellido= document.querySelector('#apellido').value;
    let telefono= document.querySelector('#telefono').value;
    let correo= document.querySelector('#email').value;
    let comentario=document.querySelector('#caja').value;
   

    let datosValidos= true; //hipotesis
    let mensajeError=' Datos Invalidos: '

    //comprobar el nombre y el apellido
    let soloPalabras= /^[a-zA-z\s]+$/;
    let verificaTel= /^\+?\d{2}(\s\d\s){1}(\d{2})\s(\d{4}\s)\d{4}$/;
    let verificaEmail= /^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z.]+$/;
    

    //verificacion de nombre
    if(nombre==='' || !soloPalabras.test(nombre) ){
        datosValidos=false;
        mensajeError +=' Nombre.';
    }

    //verificar apellido
    if(apellido==='' || !soloPalabras.test(apellido)){
        datosValidos=false;
        mensajeError += ' Apellido.'
    }

    //Verificar Telefono

    if(telefono==='' || !verificaTel.test(telefono)){
        datosValidos=false;
        mensajeError += ' Telefono.'
    }

    // verifica Correo Electronico
    if(correo==='' || !verificaEmail.test(correo)){
        datosValidos=false;
        mensajeError += ' Correo electronico incorrecto.'
    }

    // Verifica que el ususario haya ingresado un comentario
    if(comentario===''){
        datosValidos=false;
        mensajeError += ' Ingrese comentario.'
    }



    let mensaje=document.querySelector('#respForm')
    if (datosValidos){
        mensaje.innerHTML='Se recibieron datos'
    } else{
        mensaje.innerHTML=mensajeError
        }
}   



// 1 capturo el formulario y escucho el evennto
const formulario= document.querySelector('#formTotal');
formulario.addEventListener('submit', evento=> {
    // console.log("presionado");
    validar();
    evento.preventDefault()
});

