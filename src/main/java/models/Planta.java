package models;

public class Planta {
    
    private int idPlanta;
    private String tipo;
    private String nombre;
    private String descripcion;

    public Planta(int idPlanta, String tipo, String nombre, String descripcion) {
        this.idPlanta = idPlanta;
        this.tipo = tipo;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public int getIdPlanta() {
        return idPlanta;
    }

    public String getTipo() {
        return tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }
    
    
}
