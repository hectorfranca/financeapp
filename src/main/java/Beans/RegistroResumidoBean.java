package Beans;

public class RegistroResumidoBean {
    private String nome;
    private float valor;
    private char tipo;

    public RegistroResumidoBean() {

    }
    
    public RegistroResumidoBean(String nome, float valor, char tipo) {
        this.nome = nome;
        this.valor = valor;
        this.tipo = tipo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }
    
    public char getTipo() {
        return tipo;
    }

    public void setTipo(char tipo) {
        this.tipo = tipo;
    }
   
}
