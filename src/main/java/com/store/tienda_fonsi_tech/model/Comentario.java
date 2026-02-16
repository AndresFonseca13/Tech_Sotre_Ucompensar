package com.store.tienda_fonsi_tech.model;
import java.util.Date;

public class Comentario {
    private int id;
    private String autor;
    private String texto;
    private int calificacion;
    private Date fechaCreacion;
    private int dispositivoId;

    public Comentario() {}

    public Comentario(String autor, String texto, int calificacion, int dispositivoId) {
        this.autor = autor;
        this.texto = texto;
        this.calificacion = calificacion;
        this.dispositivoId = dispositivoId;
        this.fechaCreacion = new Date();
    }

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getAutor() { return autor; }
    public void setAutor(String autor) { this.autor = autor; }
    public String getTexto() { return texto; }
    public void setTexto(String texto) { this.texto = texto; }
    public int getCalificacion() { return calificacion; }
    public void setCalificacion(int calificacion) { this.calificacion = calificacion; }
    public Date getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(Date fechaCreacion) { this.fechaCreacion = fechaCreacion; }
    public int getDispositivoId() { return dispositivoId; }
    public void setDispositivoId(int dispositivoId) { this.dispositivoId = dispositivoId; }
}
