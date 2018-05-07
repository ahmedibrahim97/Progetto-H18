import java.util.Date;

public class Utente {
    private String nome;
    private String cognome;
    private String mail;
    private Date dataNascita;

    public Utente(String nome, String cognome, String mail, Date dataNascita) {
        this.nome = nome;
        this.cognome = cognome;
        this.mail = mail;
        this.dataNascita = dataNascita;
    }
}
