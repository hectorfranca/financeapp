package Beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.Date;

/**
 *
 * @author Hector
 */

@Entity
@Table(name = "Registro")
public class RegistroBean {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    @OneToMany(mappedBy = "Categoria")
    private CategoriaBean categoria;
    
    @Column(nullable = false, length = 60)
    private String nome;
    
    @Column(nullable = false)
    private Date data;
    
    @Column(nullable = false)
    private double valor;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public CategoriaBean getCategoria() {
        return categoria;
    }

    public void setCategoria(CategoriaBean categoria) {
        this.categoria = categoria;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    @Override
    public String toString() {
        return "RegistroBean{" + "id=" + id + ", categoria=" + categoria + ", nome=" + nome + ", data=" + data + ", valor=" + valor + '}';
    }
    
}
