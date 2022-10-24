package Beans;

<<<<<<< HEAD
import java.util.Set;
=======
>>>>>>> 61b161ea09572a12218733897032eac80fa3d81d
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
<<<<<<< HEAD
import javax.persistence.OneToMany;
=======
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
>>>>>>> 61b161ea09572a12218733897032eac80fa3d81d
import javax.persistence.Table;

/**
 *
 * @author Héctor França
 */

@Entity
@Table(name = "Categoria")
public class CategoriaBean {
    @Id
<<<<<<< HEAD
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    @OneToMany(mappedBy = "categoria")
    private Set<RegistroBean> registros;
    
    @Column(name = "Nome", nullable = false, length = 40)
    private String nome;
    
    @Column(name = "Tipo", nullable = false, length = 1)
=======
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    
    @ManyToOne
    @JoinColumn(name = "categorias", insertable = false, updatable = false, nullable = false)
    private RegistroBean registro;
    
    @Column(nullable = false, length = 40)
    private String nome;
    
    @Column(nullable = false, length = 1)
>>>>>>> 61b161ea09572a12218733897032eac80fa3d81d
    private char tipo;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

<<<<<<< HEAD
    public Set<RegistroBean> getRegistros() {
        return registros;
    }

    public void setRegistros(Set<RegistroBean> registros) {
        this.registros = registros;
=======
    public RegistroBean getRegistro() {
        return registro;
    }

    public void setRegistro(RegistroBean registro) {
        this.registro = registro;
>>>>>>> 61b161ea09572a12218733897032eac80fa3d81d
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
<<<<<<< HEAD
        return "CategoriaBean{" + "id=" + id + ", registros=" + registros + ", nome=" + nome + ", tipo=" + tipo + '}';
=======
        return "CategoriaBean{" + "id=" + id + ", registro=" + registro + ", nome=" + nome + ", tipo=" + tipo + '}';
>>>>>>> 61b161ea09572a12218733897032eac80fa3d81d
    }

}
