package com.store.tienda_fonsi_tech.model;

public class Marca {
    private int id;
    private String nombre;
    private String paisOrigen;

    public Marca() {}

    public Marca(int id, String nombre, String paisOrigen) {
        this.id = id;
        this.nombre = nombre;
        this.paisOrigen = paisOrigen;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getPaisOrigen() { return paisOrigen; }
    public void setPaisOrigen(String paisOrigen) { this.paisOrigen = paisOrigen; }
}
