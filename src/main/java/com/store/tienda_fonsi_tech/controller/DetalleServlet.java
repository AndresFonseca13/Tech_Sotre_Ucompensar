package com.store.tienda_fonsi_tech.controller;

import com.store.tienda_fonsi_tech.dao.DispositivoDAO;
import com.store.tienda_fonsi_tech.model.Comentario;
import com.store.tienda_fonsi_tech.model.Dispositivo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetalleServlet", value = "/detalle")
public class DetalleServlet extends HttpServlet {

    private DispositivoDAO dispositivoDAO;

    @Override
    public void init() throws ServletException {
        dispositivoDAO = new DispositivoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Obtener el ID que viene en la URL
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);

                // 2. Buscar el dispositivo en BD
                Dispositivo dispositivo = dispositivoDAO.obtenerPorId(id);

                if (dispositivo != null) {
                    // Cargar los comentarios de este dispositivo
                    List<Comentario> comentarios = dispositivoDAO.listarComentarios(id);
                    request.setAttribute("comentarios", comentarios); // Enviarlos al JSP

                    request.setAttribute("dispositivo", dispositivo);
                    request.getRequestDispatcher("detalle.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                System.out.print("Numero de Id invalido");
            }
        }


        response.sendRedirect("catalogo");
    }
}
