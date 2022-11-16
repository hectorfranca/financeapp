package Beans;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Héctor França
 */

@Entity
@Table(name = "Categoria")
public class CategoriaBean {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @OneToMany(mappedBy = "categoria")
    private Set<RegistroBean> registros;
    
    @Column(name = "Nome", nullable = false, length = 40)
    private String nome;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Set<RegistroBean> getRegistros() {
        return registros;
    }

    public void setRegistros(Set<RegistroBean> registros) {
        this.registros = registros;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return "CategoriaBean{" + "id=" + id + ", registros=" + registros + ", nome=" + nome + '}';
    }

}
