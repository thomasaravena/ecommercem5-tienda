<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Administración - Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark mb-4">
        <div class="container">
            <span class="navbar-brand">E-Commerce Admin</span>
        </div>
    </nav>

    <div class="container">
        <div class="card shadow">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h3 class="mb-0">Gestión de Catálogo</h3>
                <a href="productos?accion=nuevo" class="btn btn-primary">Nuevo Producto</a>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${lista}">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.nombre}</td>
                                <td>$ ${p.precio}</td>
                                <td>${p.stock}</td>
                                <td>
                                    <a href="productos?accion=editar&id=${p.id}" class="btn btn-sm btn-warning">Editar</a>
                                    <a href="productos?accion=eliminar&id=${p.id}" class="btn btn-sm btn-danger" onclick="return confirm('¿Eliminar?')">Borrar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${empty lista}">
                    <div class="alert alert-info text-center">No hay productos en la base de datos.</div>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>