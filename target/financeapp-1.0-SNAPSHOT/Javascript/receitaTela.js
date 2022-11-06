const seletorReceitas = document.getElementById('seletorReceitas'),
        listaReceitas = document.getElementById('listaReceitas'),
        itemReceitas = document.getElementsByClassName('itemReceitas');
        
for (let item of itemReceitas) {
    item.addEventListener("click", (e) => {
        seletorReceitas.classList.add("show-menu");
        listaReceitas.style.marginBottom="100px";
        seletorReceitas.classList.remove("hidden-menu");

        item.addEventListener("mouseout", (e) => {
            seletorReceitas.classList.add("hidden-menu");
            listaReceitas.style.marginBottom="0px";
            seletorReceitas.classList.remove("show-menu");
        });
    });
}






