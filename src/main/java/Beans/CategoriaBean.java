package Beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Héctor França
 */

@Entity
@Table(name = "Categoria")
public class CategoriaBean {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    @ManyToOne
    @JoinColumn(name = "categorias", insertable = false, updatable = false, nullable = false)
    private RegistroBean registro;
    
    @Column(nullable = false, length = 40)
    private String nome;
    
    @Column(nullable = false, length = 1)
    private char tipo;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public RegistroBean getRegistro() {
        return registro;
    }

    public void setRegistro(RegistroBean registro) {
        this.registro = registro;
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

    @Override
    public String toString() {
        return "CategoriaBean{" + "id=" + id + ", registro=" + registro + ", nome=" + nome + ", tipo=" + tipo + '}';
    }

}
