package Beans;

import java.util.List;

/**
 *
 * @author Hector
 */
public class ColecaoCategoriaBean {
    private List<CategoriaBean> categorias;
    
    public ColecaoCategoriaBean() {
        
    }

    public List<CategoriaBean> getCategorias() {
        return categorias;
    }

    public void setCategorias(List<CategoriaBean> categorias) {
        this.categorias = categorias;
    }
    
}
