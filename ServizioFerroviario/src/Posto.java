public class Posto {
    private String id;

    public Posto(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Posto{" +
                "id='" + id + '\'' +
                '}';
    }
}