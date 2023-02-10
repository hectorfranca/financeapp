
package Beans;

import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Conta")
public class ContaBean {
    @Id
    @Column(name = "Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @OneToMany(mappedBy = "conta")
    private Set<RegistroBean> categorias;
    
    @OneToMany(mappedBy = "conta")
    private Set<RegistroBean> registros;
    
    @Column(name = "Nome", nullable = false, length = 40)
    private String nome;
    
    @Column(name = "Email", nullable = false, length = 100)
    private String email;
    
    @Column(name = "Senha", nullable = false, length = 64)
    private String senha;
    
    @Column(name = "Senha_token", nullable = true, length = 64)
    private String senhaToken;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set<RegistroBean> getCategorias() {
        return categorias;
    }

    public void setCategorias(Set<RegistroBean> categorias) {
        this.categorias = categorias;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getSenhaToken() {
        return senhaToken;
    }

    public void setSenhaToken(String senhaToken) {
        this.senhaToken = senhaToken;
    }

    @Override
    public String toString() {
        return "ContaBean{" + "id=" + id + ", categorias=" + categorias + ", registros=" + registros + ", nome=" + nome + ", email=" + email + ", senha=" + senha + ", senhaToken=" + senhaToken + '}';
    }
    

}