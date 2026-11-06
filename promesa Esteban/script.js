const promesaCumplida = true;

const miPromesa = new Promise((resolve, reject) =>{
    setTimeout(()=>{
        promesaCumplida ? resolve("Promesa Cumplida!") : reject("Promesa Rechazada...");
    }, 3000);
});

const manejarPromesaCumplida = (valor) =>{
    console.log(valor)
}

const manejarPromesaRechazada = (razonRechazo) =>{
    console.log(razonRechazo);
}

miPromesa.then(manejarPromesaCumplida, manejarPromesaRechazada);

const estatusPedido = () => {
    const status = Math.floor(Math.random()*10);
    console.log(status)
    status >= 5 ? console.log("Logrado") : console.log("Rechazado");
}

estatusPedido();