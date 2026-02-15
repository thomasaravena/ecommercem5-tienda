<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulario de Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">${producto != null ? 'Modificar Producto' : 'Nuevo Producto'}</h4>
                    </div>
                    <div class="card-body">
                        <form action="productos" method="POST">
                            <c:if test="${producto != null}">
                                <input type="hidden" name="id" value="${producto.id}">
                            </c:if>

                            <div class="mb-3">
                                <label class="form-label">Nombre del Producto</label>
                                <input type="text" name="nombre" class="form-control" value="${producto.nombre}" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Descripción</label>
                                <textarea name="descripcion" class="form-control" rows="3">${producto.descripcion}</textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Precio ($)</label>
                                    <input type="number" name="precio" class="form-control" step="0.01" value="${producto.precio}" required min="0.01">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Stock Unidades</label>
                                    <input type="number" name="stock" class="form-control" value="${producto.stock}" required min="0">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">ID Categoría (1-Electrónica, 2-Hogar, 3-Ropa)</label>
                                <input type="number" name="categoriaId" class="form-control" value="${producto.categoriaId}" required>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success">Guardar Datos</button>
                                <a href="productos" class="btn btn-secondary">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>