package Beans;

import java.util.List;

/**
 *
 * @author Hector
 */
public class ColecaoRegistroBean {
    private List<RegistroBean> registros;
    
    public ColecaoRegistroBean() {
        
    }

    public List<RegistroBean> getRegistros() {
        return registros;
    }

    public void setRegistros(List<RegistroBean> registros) {
        this.registros = registros;
    }
    
}
