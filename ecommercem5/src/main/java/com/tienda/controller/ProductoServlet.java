package com.tienda.controller;

import com.tienda.dao.ProductoDAO;
import com.tienda.model.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/productos")
public class ProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductoDAO dao = new ProductoDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        try {
            if (accion == null || accion.isEmpty()) {
                List<Producto> lista = dao.listar();
                System.out.println("Productos cargados: " + lista.size()); // Ver en consola de Tomcat
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("/vistas/productos-lista.jsp").forward(request, response);
            } else if (accion.equals("nuevo")) {
                request.getRequestDispatcher("/vistas/productos-formulario.jsp").forward(request, response);
            } else if (accion.equals("editar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Producto p = dao.obtenerPorId(id);
                request.setAttribute("producto", p);
                request.getRequestDispatcher("/vistas/productos-formulario.jsp").forward(request, response);
            } else if (accion.equals("eliminar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(id);
                response.sendRedirect("productos");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        int catId = Integer.parseInt(request.getParameter("categoriaId"));

        Producto p = new Producto(0, nombre, precio, stock, catId);
        p.setDescripcion(descripcion);

        try {
            if (idStr == null || idStr.isEmpty()) {
                dao.insertar(p);
            } else {
                p.setId(Integer.parseInt(idStr));
                dao.actualizar(p);
            }
            response.sendRedirect("productos");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}