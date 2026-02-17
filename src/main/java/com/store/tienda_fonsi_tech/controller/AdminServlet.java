package com.store.tienda_fonsi_tech.controller;

import com.store.tienda_fonsi_tech.dao.DispositivoDAO;
import com.store.tienda_fonsi_tech.dao.MarcaDAO;
import com.store.tienda_fonsi_tech.model.Dispositivo;
import com.store.tienda_fonsi_tech.model.Marca;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {

    private DispositivoDAO dispositivoDAO;
    private MarcaDAO marcaDAO;

    @Override
    public void init() {
        dispositivoDAO = new DispositivoDAO();
        marcaDAO = new MarcaDAO();
    }

    // GET: Para mostrar pantallas (Listado, Formulario vacío, Formulario lleno, Borrar)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteDispositivo(request, response);
                break;
            default:
                listDispositivos(request, response);
                break;
        }
    }

    // POST: Para guardar los datos del formulario
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Leer datos del formulario
            String idStr = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String imagenUrl = request.getParameter("imagenUrl");
            double precio = Double.parseDouble(request.getParameter("precio"));
            Date fecha = Date.valueOf(request.getParameter("fecha")); // Formato YYYY-MM-DD
            String especificaciones = request.getParameter("especificaciones");
            int categoriaId = Integer.parseInt(request.getParameter("categoriaId"));
            int marcaId = Integer.parseInt(request.getParameter("marcaId"));

            Dispositivo d = new Dispositivo(0, nombre, descripcion, imagenUrl, precio, fecha, especificaciones, categoriaId, marcaId);

            if (idStr == null || idStr.isEmpty()) {
                // Es NUEVO
                dispositivoDAO.insertar(d);
            } else {
                // Es EDICIÓN
                d.setId(Integer.parseInt(idStr));
                dispositivoDAO.actualizar(d);
            }
            // Volver al listado
            response.sendRedirect("admin");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error guardando datos");
        }
    }

    // --- Métodos auxiliares ---

    private void listDispositivos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Dispositivo> list = dispositivoDAO.listarDispositivos();
        request.setAttribute("listaDispositivos", list);

        Map<Integer, String> marcasMap = new HashMap<>();
        for (Marca m : marcaDAO.listar()) {
            marcasMap.put(m.getId(), m.getNombre());
        }
        request.setAttribute("marcasMap", marcasMap);

        request.getRequestDispatcher("admin-lista.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admin-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Dispositivo existente = dispositivoDAO.obtenerPorId(id);
        request.setAttribute("dispositivo", existente);
        request.getRequestDispatcher("admin-form.jsp").forward(request, response);
    }

    private void deleteDispositivo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dispositivoDAO.eliminar(id);
        response.sendRedirect("admin");
    }
}
