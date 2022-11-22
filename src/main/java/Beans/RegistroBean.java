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

@Entity
@Table(name = "Registro")
public class RegistroBean {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "Categoria_id", nullable = false)
    private CategoriaBean categoria;
    
    @Column(name = "Nome", nullable = false, length = 60)
    private String nome;
    
    @Column(name = "Tipo", nullable = false, length = 1)
    private char tipo;
    
    @Column(name = "Data", nullable = false)
    private Date data;
    
    @Column(name = "Valor", nullable = false)
    private double valor;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
    
    public char getTipo() {
        return tipo;
    }

    public void setTipo(char tipo) {
        this.tipo = tipo;
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
        return "RegistroBean{" + "id=" + id + ", categoria=" + categoria + ", nome=" + nome + ", tipo=" + tipo + ", data=" + data + ", valor=" + valor + '}';
    }
    
}
