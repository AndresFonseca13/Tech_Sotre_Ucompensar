<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <title>Administración | TechStore</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-primary mb-4">
  <div class="container">
    <a class="navbar-brand" href="admin">Panel Admin - TechStore</a>
    <a href="catalogo" class="btn btn-outline-light btn-sm">Ir a Tienda Pública</a>
  </div>
</nav>

<div class="container">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Gestión de Inventario</h2>
    <a href="admin?action=new" class="btn btn-success"><i class="bi bi-plus-lg"></i> Nuevo Dispositivo</a>
  </div>

  <div class="card shadow">
    <div class="card-body p-0">
      <table class="table table-hover table-striped mb-0">
        <thead class="table-dark">
        <tr>
          <th>ID</th>
          <th>Imagen</th>
          <th>Nombre</th>
          <th>Precio</th>
          <th>Marca (ID)</th>
          <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="d" items="${listaDispositivos}">
          <tr>
            <td>${d.id}</td>
            <td><img src="${d.imagenUrl}" width="50" height="50" style="object-fit: contain;"></td>
            <td>${d.nombre}</td>
            <td>$ ${d.precio}</td>
            <td>${d.marcaId}</td>
            <td>
              <a href="admin?action=edit&id=${d.id}" class="btn btn-sm btn-warning"><i class="bi bi-pencil"></i></a>
              <a href="admin?action=delete&id=${d.id}" class="btn btn-sm btn-danger"
                 onclick="return confirm('¿Seguro que deseas eliminar este producto?')"><i class="bi bi-trash"></i></a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>

</body>
</html>
