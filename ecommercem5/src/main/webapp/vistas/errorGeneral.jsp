<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ups! Algo salió mal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">
    <div class="container text-center">
        <div class="card shadow p-5">
            <h1 class="display-1 text-danger">⚠️</h1>
            <h2 class="mb-4">Ha ocurrido un error inesperado</h2>
            <p class="text-muted">No te preocupes, esto puede deberse a un problema de conexión con la base de datos o un dato mal ingresado.</p>
            
            <div class="mt-4">
                <a href="${pageContext.request.contextPath}/admin/productos" class="btn btn-primary">Volver al Panel de Productos</a>
            </div>
        </div>
    </div>
</body>
</html>