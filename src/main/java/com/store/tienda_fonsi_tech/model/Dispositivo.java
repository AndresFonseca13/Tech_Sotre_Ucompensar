package com.store.tienda_fonsi_tech.model;

import java.util.Date;

public class Dispositivo {
    private int id;
    private String nombre;
    private String descripcion;
    private String imagenUrl;
    private double precio;
    private Date fechaLanzamiento;
    private String especificaciones;

    private int categoriaId;
    private int marcaId;

    public Dispositivo(){
    }

    public Dispositivo(int id, String nombre, String descripcion, String imagenUrl, double precio, Date fechaLanzamiento, String especificaciones, int categoriaId, int marcaId) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.imagenUrl = imagenUrl;
        this.precio = precio;
        this.fechaLanzamiento = fechaLanzamiento;
        this.especificaciones = especificaciones;
        this.categoriaId = categoriaId;
        this.marcaId = marcaId;
    }

    // Getter y Setters

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getImagenUrl() {
        return imagenUrl;
    }

    public double getPrecio() {
        return precio;
    }

    public Date getFechaLanzamiento() {
        return fechaLanzamiento;
    }

    public String getEspecificaciones() {
        return especificaciones;
    }

    public int getCategoriaId() {
        return categoriaId;
    }

    public int getMarcaId() {
        return marcaId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setImagenUrl(String imagenUrl) {
        this.imagenUrl = imagenUrl;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public void setFechaLanzamiento(Date fechaLanzamiento) {
        this.fechaLanzamiento = fechaLanzamiento;
    }

    public void setEspecificaciones(String especificaciones) {
        this.especificaciones = especificaciones;
    }

    public void setCategoriaId(int categoriaId) {
        this.categoriaId = categoriaId;
    }

    public void setMarcaId(int marcaId) {
        this.marcaId = marcaId;
    }
}
