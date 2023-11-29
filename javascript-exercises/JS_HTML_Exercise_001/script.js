function minhaFuncao() {
    return "Minha função está sendo chamada.";
}

// Chamar a função três vezes
for (let i = 0; i < 3; i++) {
    const resultado = minhaFuncao();
    const paragrafo = document.createElement("p");
    const texto = document.createTextNode(resultado);
    paragrafo.appendChild(texto);
    document.body.appendChild(paragrafo);
}
const documento = document
console.log(documento)