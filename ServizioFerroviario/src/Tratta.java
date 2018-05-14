import java.util.Date;

public class Tratta {
    private Stazione stazione1;
    private Stazione stazione2;
    private Date durata; //durata

    public Tratta(Stazione stazione1, Stazione stazione2, Date durata) {
        this.stazione1 = stazione1;
        this.stazione2 = stazione2;
        this.durata = durata;
    }

    public Stazione getStazione1() {
        return stazione1;
    }

    public Stazione getStazione2() {
        return stazione2;
    }

    public Date getDurata() {
        return durata;
    }
}
