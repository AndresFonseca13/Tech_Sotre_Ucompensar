package com.store.tienda_fonsi_tech.dao;


import com.store.tienda_fonsi_tech.config.DatabaseConnection;
import com.store.tienda_fonsi_tech.model.Marca;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MarcaDAO {
    public List<Marca> listar() {
        List<Marca> lista = new ArrayList<>();
        // Ordenamos por nombre para que el menú se vea ordenado
        String sql = "SELECT * FROM marcas ORDER BY nombre";

        try (Connection conn = DatabaseConnection.getInstance();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                lista.add(new Marca(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("pais_origen")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return lista;
    }
}
