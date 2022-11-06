const valorTicket = 200;

function calcularTotal(categoria, cantidad) {
    switch (categoria) {
        case 'Estudiante':
            descuento = 80; break;
        case 'Trainee':
            descuento = 50; break;
        case 'Junior':
            descuento = 15; break;
        default:
            descuento = 0; break;
    }
    
    valorFinal = (valorTicket - (valorTicket*descuento/100)) * cantidad;

    return valorFinal;
}

function procesarValores(){
    var cantidad = document.getElementById("cantidad").value;
    var categoria = document.getElementById("categoria").value;

    var valorTotal = calcularTotal(categoria, cantidad);

    document.getElementById("montoTotal").textContent = valorTotal
}

function cargarValoresByCard(categoria, cantidad){
    if(document.getElementById("categoria").value == categoria){
        valorAnterior = parseInt(document.getElementById("cantidad").value);

        document.getElementById("cantidad").value = valorAnterior + cantidad;
    }else{
        document.getElementById("cantidad").value = cantidad;
        document.getElementById("categoria").value = categoria;
    }
    procesarValores();
}