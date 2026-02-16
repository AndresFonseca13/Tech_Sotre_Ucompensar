package com.store.tienda_fonsi_tech.controller;

import com.store.tienda_fonsi_tech.dao.DispositivoDAO;
import com.store.tienda_fonsi_tech.model.Dispositivo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

// Esta anotación define la URL. Cuando se entre a /catalogo, se ejecuta esto.
@WebServlet(name = "DispositivoServlet", value = "/catalogo")
public class DispositivoServlet extends HttpServlet {

    private DispositivoDAO dispositivoDAO;

    @Override
    public void init() throws ServletException {
        // Inicializamos el DAO una sola vez
        dispositivoDAO = new DispositivoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1. Obtenemos la lista de la base de datos
            List<Dispositivo> lista = dispositivoDAO.listarDispositivos();

            // 2. Guardamos la lista en el request para pasarla al JSP
            request.setAttribute("dispositivos", lista);

            // 3. Redirigimos a la vista (JSP)
            request.getRequestDispatcher("catalogo.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener datos: " + e.getMessage());
        }
    }
}
