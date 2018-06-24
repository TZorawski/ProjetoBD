package model;

public class Pessoa {

    public Pessoa(String cpf, String nome, String email, String registro, String observacao, Curso curso) {
        this.cpf = cpf;
        this.nome = nome;
        this.email = email;
        this.registro = registro;
        this.observacao = observacao;
        this.curso = curso;
    }

    public Pessoa() {
    }

    private String cpf;
    private String nome;
    private String email;
    private String  registro;
    private String  observacao;
    private Curso curso;

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRegistro() {
        return  registro;
    }

    public void setRegistro(String  registro) {
        this. registro =  registro;
    }

    public String getObservacao() {
        return  observacao;
    }

    public void setObservacao(String  observacao) {
        this. observacao =  observacao;
    }
}
