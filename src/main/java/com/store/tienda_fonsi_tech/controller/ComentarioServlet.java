package com.store.tienda_fonsi_tech.controller;

import com.store.tienda_fonsi_tech.dao.DispositivoDAO;
import com.store.tienda_fonsi_tech.model.Comentario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ComentarioServlet", value = "/agregarComentario")
public class ComentarioServlet extends HttpServlet {

    private DispositivoDAO dao;

    @Override
    public void init() {
        dao = new DispositivoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Recibir datos del formulario
            int idDispositivo = Integer.parseInt(request.getParameter("idDispositivo"));
            String autor = request.getParameter("autor");
            String texto = request.getParameter("texto");
            int calificacion = Integer.parseInt(request.getParameter("calificacion"));

            // Crear objeto y guardar
            Comentario nuevo = new Comentario(autor, texto, calificacion, idDispositivo);
            dao.agregarComentario(nuevo);

            // Redirigir de vuelta a la página del detalle para ver el comentario
            response.sendRedirect("detalle?id=" + idDispositivo);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("catalogo");
        }
    }
}
