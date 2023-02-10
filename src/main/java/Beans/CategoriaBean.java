package Beans;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Categoria")
public class CategoriaBean {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "Conta_id", nullable = false)
    private ContaBean conta;
    
    @OneToMany(mappedBy = "categoria")
    private Set<RegistroBean> registros;
    
    @Column(name = "Nome", nullable = false, length = 20)
    private String nome;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ContaBean getConta() {
        return conta;
    }

    public void setConta(ContaBean conta) {
        this.conta = conta;
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
        return "CategoriaBean{" + "id=" + id + ", conta=" + conta + ", registros=" + registros + ", nome=" + nome + '}';
    }
  
}
