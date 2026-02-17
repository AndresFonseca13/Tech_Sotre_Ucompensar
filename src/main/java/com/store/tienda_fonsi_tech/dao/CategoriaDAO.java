package com.store.tienda_fonsi_tech.dao;

import com.store.tienda_fonsi_tech.config.DatabaseConnection;
import com.store.tienda_fonsi_tech.model.Categoria;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {
    public List<Categoria> listar() {
        List<Categoria> lista = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getInstance();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM categorias ORDER BY nombre")) {
            while (rs.next()) {
                lista.add(new Categoria(rs.getInt("id"), rs.getString("nombre")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }
}
