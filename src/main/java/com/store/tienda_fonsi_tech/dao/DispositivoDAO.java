package com.store.tienda_fonsi_tech.dao;

import com.store.tienda_fonsi_tech.config.DatabaseConnection;
import com.store.tienda_fonsi_tech.model.Comentario;
import com.store.tienda_fonsi_tech.model.Dispositivo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DispositivoDAO {

    // Metodo para listar todos los dispositivos
    public List<Dispositivo> listarDispositivos() {
        List<Dispositivo> dispositivos = new ArrayList<>();
        String sql = "SELECT * FROM dispositivos";

        try (Connection conn = DatabaseConnection.getInstance();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Dispositivo d = new Dispositivo();
                d.setId(rs.getInt("id"));
                d.setNombre(rs.getString("nombre"));
                d.setDescripcion(rs.getString("descripcion"));
                d.setImagenUrl(rs.getString("imagen_url"));
                d.setPrecio(rs.getDouble("precio"));
                d.setFechaLanzamiento(rs.getDate("fecha_lanzamiento"));
                d.setEspecificaciones(rs.getString("especificaciones"));
                d.setCategoriaId(rs.getInt("categoria_id"));
                d.setMarcaId(rs.getInt("marca_id"));

                dispositivos.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dispositivos;
    }

    public Dispositivo obtenerPorId(int id) {
        Dispositivo d = null;
        String sql = "SELECT * FROM dispositivos WHERE id = ?";

        try (Connection conn = DatabaseConnection.getInstance();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    d = new Dispositivo();
                    d.setId(rs.getInt("id"));
                    d.setNombre(rs.getString("nombre"));
                    d.setDescripcion(rs.getString("descripcion"));
                    d.setImagenUrl(rs.getString("imagen_url"));
                    d.setPrecio(rs.getDouble("precio"));
                    d.setFechaLanzamiento(rs.getDate("fecha_lanzamiento"));
                    d.setEspecificaciones(rs.getString("especificaciones"));
                    d.setCategoriaId(rs.getInt("categoria_id"));
                    d.setMarcaId(rs.getInt("marca_id"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }

    // Metodo para listar comentarios de un dispositivo específico
    public List<Comentario> listarComentarios(int dispositivoId) {
        List<Comentario> comentarios = new ArrayList<>();
        String sql = "SELECT * FROM comentarios WHERE dispositivo_id = ? ORDER BY fecha_creacion DESC";

        try (Connection conn = DatabaseConnection.getInstance();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, dispositivoId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Comentario c = new Comentario();
                c.setId(rs.getInt("id"));
                c.setAutor(rs.getString("autor"));
                c.setTexto(rs.getString("texto"));
                c.setCalificacion(rs.getInt("calificacion"));
                c.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                c.setDispositivoId(rs.getInt("dispositivo_id"));
                comentarios.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comentarios;
    }

    // Metodo para guardar un nuevo comentario
    public void agregarComentario(Comentario c) {
        String sql = "INSERT INTO comentarios (autor, texto, calificacion, dispositivo_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getInstance();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, c.getAutor());
            stmt.setString(2, c.getTexto());
            stmt.setInt(3, c.getCalificacion());
            stmt.setInt(4, c.getDispositivoId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Metodo para búsqueda dinámica
    public List<Dispositivo> filtrar(String textoBusqueda, String marcaId, String categoriaId) {
        List<Dispositivo> dispositivos = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT * FROM dispositivos WHERE 1=1");
        List<Object> parametros = new ArrayList<>();

        if (textoBusqueda != null && !textoBusqueda.trim().isEmpty()) {
            sql.append(" AND nombre LIKE ?");
            parametros.add("%" + textoBusqueda + "%"); // Búsqueda parcial
        }

        if (marcaId != null && !marcaId.isEmpty() && !marcaId.equals("0")) {
            sql.append(" AND marca_id = ?");
            parametros.add(Integer.parseInt(marcaId));
        }

        if (categoriaId != null && !categoriaId.isEmpty() && !categoriaId.equals("0")) {
            sql.append(" AND categoria_id = ?");
            parametros.add(Integer.parseInt(categoriaId));
        }

        sql.append(" ORDER BY fecha_lanzamiento DESC");

        try (Connection conn = DatabaseConnection.getInstance();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < parametros.size(); i++) {
                stmt.setObject(i + 1, parametros.get(i));
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Dispositivo d = new Dispositivo();
                    d.setId(rs.getInt("id"));
                    d.setNombre(rs.getString("nombre"));
                    d.setDescripcion(rs.getString("descripcion"));
                    d.setImagenUrl(rs.getString("imagen_url"));
                    d.setPrecio(rs.getDouble("precio"));
                    d.setFechaLanzamiento(rs.getDate("fecha_lanzamiento"));
                    d.setEspecificaciones(rs.getString("especificaciones"));
                    d.setCategoriaId(rs.getInt("categoria_id"));
                    d.setMarcaId(rs.getInt("marca_id"));
                    dispositivos.add(d);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dispositivos;
    }

    public boolean insertar(Dispositivo d) {
        String sql = "INSERT INTO dispositivos (nombre, descripcion, imagen_url, precio, fecha_lanzamiento, especificaciones, categoria_id, marca_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getInstance();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, d.getNombre());
            stmt.setString(2, d.getDescripcion());
            stmt.setString(3, d.getImagenUrl());
            stmt.setDouble(4, d.getPrecio());
            stmt.setDate(5, (Date) d.getFechaLanzamiento());
            stmt.setString(6, d.getEspecificaciones());
            stmt.setInt(7, d.getCategoriaId());
            stmt.setInt(8, d.getMarcaId());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizar(Dispositivo d) {
        String sql = "UPDATE dispositivos SET nombre=?, descripcion=?, imagen_url=?, precio=?, fecha_lanzamiento=?, especificaciones=?, categoria_id=?, marca_id=? WHERE id=?";
        try (Connection conn = DatabaseConnection.getInstance();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, d.getNombre());
            stmt.setString(2, d.getDescripcion());
            stmt.setString(3, d.getImagenUrl());
            stmt.setDouble(4, d.getPrecio());
            stmt.setDate(5, (Date) d.getFechaLanzamiento());
            stmt.setString(6, d.getEspecificaciones());
            stmt.setInt(7, d.getCategoriaId());
            stmt.setInt(8, d.getMarcaId());
            stmt.setInt(9, d.getId()); // El ID va al final en el WHERE

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM dispositivos WHERE id=?";
        try (Connection conn = DatabaseConnection.getInstance();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
