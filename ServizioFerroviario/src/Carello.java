import java.util.ArrayList;

public class Carello {
    private float saldo;
    private ArrayList<Prenotazione> prenotazioniEffettuate;
    private String metodoDiPagamento;

    public Carello(float saldo, ArrayList<Prenotazione> prenotazioniEffettuate, String metodoDiPagamento) {
        this.saldo = saldo;
        this.prenotazioniEffettuate = prenotazioniEffettuate;
        this.metodoDiPagamento = metodoDiPagamento;
    }
}
