const seletorDespesas = document.getElementById('seletorDespesas'),
        listaDespesas = document.getElementById('listaDespesas'),
        itemDespesas = document.getElementsByClassName('itemDespesas');
for (let item of itemDespesas) {
    item.addEventListener("click", (e) => {
        seletorDespesas.classList.add("show-menu");
        seletorDespesas.classList.remove("hidden-menu");

        item.addEventListener("mouseout", (e) => {
            seletorDespesas.classList.add("hidden-menu");
            seletorDespesas.classList.remove("show-menu");
        });
    });
}




