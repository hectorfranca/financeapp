package Beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Héctor França
 */

@Entity
@Table(name = "Registro")
public class RegistroBean {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    @ManyToOne
    @JoinColumn(name = "registros", insertable = false, updatable = false, nullable = false)
    private CategoriaBean categoria;
    
    @Column(name = "Nome", nullable = false, length = 60)
    private String nome;
    
    @Column(name = "Data", nullable = false)
    private Date data;
    
    @Column(name = "Valor", nullable = false)
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
