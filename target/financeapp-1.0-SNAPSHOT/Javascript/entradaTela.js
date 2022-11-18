const seletorEntradas = document.getElementById('seletorEntradas'),
        listaEntradas = document.getElementById('listaEntradas'),
        itemEntradas = document.getElementsByClassName('itemEntradas');
        
for (let item of itemEntradas) {
    item.addEventListener("click", (e) => {
        seletorEntradas.classList.add("show-menu");
        listaEntradas.style.marginBottom="100px";
        seletorEntradas.classList.remove("hidden-menu");

        item.addEventListener("mouseout", (e) => {
            seletorEntradas.classList.add("hidden-menu");
            listaEntradas.style.marginBottom="0px";
            seletorEntradas.classList.remove("show-menu");
        });
    });
}





