package model;

public class Curso {

    private String sigla;
    private String nome;

    public String getNome() {
        return nome;
    }

    @Override
    public String toString() {
        return sigla + "-" + nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }
}
