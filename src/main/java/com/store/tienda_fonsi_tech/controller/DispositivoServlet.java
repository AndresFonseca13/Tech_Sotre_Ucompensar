package com.store.tienda_fonsi_tech.controller;

import com.store.tienda_fonsi_tech.dao.CategoriaDAO;
import com.store.tienda_fonsi_tech.dao.DispositivoDAO;
import com.store.tienda_fonsi_tech.dao.MarcaDAO;
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
    private CategoriaDAO categoriaDAO;
    private MarcaDAO marcaDAO;


    @Override
    public void init() {
        dispositivoDAO = new DispositivoDAO();
        categoriaDAO = new CategoriaDAO();
        marcaDAO = new MarcaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("listaCategorias", categoriaDAO.listar());
        request.setAttribute("listaMarcas", marcaDAO.listar());

        try {
            // Recibimos los parámetros del formulario HTML
            String busqueda = request.getParameter("q");      // q = query (texto)
            String marca = request.getParameter("marca");     // id de marca
            String categoria = request.getParameter("tipo");  // id de categoria

            List<Dispositivo> lista;

            // Si hay algún filtro, usamos el metodo de búsqueda
            if ((busqueda != null && !busqueda.isEmpty()) ||
                    (marca != null && !marca.equals("0")) ||
                    (categoria != null && !categoria.equals("0"))) {

                lista = dispositivoDAO.filtrar(busqueda, marca, categoria);

            } else {
                // Si no hay filtros, traemos todo
                lista = dispositivoDAO.listarDispositivos();
            }

            request.setAttribute("dispositivos", lista);

            // Reenviamos los parámetros para mantener los filtros seleccionados en la vista
            request.setAttribute("paramBusqueda", busqueda);
            request.setAttribute("paramMarca", marca);
            request.setAttribute("paramTipo", categoria);

            request.getRequestDispatcher("catalogo.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error: " + e.getMessage());
        }
    }


}
