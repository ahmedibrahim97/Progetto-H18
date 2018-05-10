import java.util.ArrayList;

public class Compagnia {

    private String nome;
    private ArrayList<Viaggio> viaggi;
    private ArrayList<Treno> treni;

    public Compagnia(String nome, ArrayList<Viaggio> viaggi, ArrayList<Treno> treni) {
        this.nome = nome;
        this.viaggi = viaggi;
        this.treni = treni;
    }


}
