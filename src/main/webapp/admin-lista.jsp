<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
  <title>Administración | TechStore</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link href="css/common.css" rel="stylesheet">
  <link href="css/admin.css" rel="stylesheet">
</head>
<body>

<fmt:setLocale value="es_CO" />

<nav class="ts-navbar-admin">
  <div class="container d-flex align-items-center justify-content-between">
    <a class="ts-brand-admin" href="admin">
      <span class="brand-icon"><i class="bi bi-shield-lock"></i></span>
      TechStore
      <span class="badge-admin">Admin</span>
    </a>
    <a href="catalogo" class="ts-btn-store">
      <i class="bi bi-shop"></i> Ir a Tienda Pública
    </a>
  </div>
</nav>

<div class="container mt-4">

  <!-- Encabezado de página -->
  <div class="admin-page-header">
    <h2 class="admin-page-title">
      <span class="title-icon"><i class="bi bi-box-seam"></i></span>
      Gestión de <span class="title-accent">Inventario</span>
    </h2>
    <a href="admin?action=new" class="ts-btn-new">
      <i class="bi bi-plus-lg"></i> Nuevo Dispositivo
    </a>
  </div>

  <!-- Tarjetas de estadísticas -->
  <div class="admin-stats">
    <div class="admin-stat-card">
      <div class="stat-icon purple"><i class="bi bi-phone"></i></div>
      <div class="stat-label">Total Productos</div>
      <div class="stat-value">${listaDispositivos.size()}</div>
    </div>
    <div class="admin-stat-card">
      <div class="stat-icon red"><i class="bi bi-tags"></i></div>
      <div class="stat-label">Categorías</div>
      <div class="stat-value">3</div>
    </div>
    <div class="admin-stat-card">
      <div class="stat-icon green"><i class="bi bi-check-circle"></i></div>
      <div class="stat-label">Estado</div>
      <div class="stat-value">Activo</div>
    </div>
  </div>

  <!-- Tabla de productos -->
  <div class="admin-table-card">
    <table class="ts-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Imagen</th>
          <th>Nombre</th>
          <th>Precio</th>
          <th>Marca</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="d" items="${listaDispositivos}">
          <tr>
            <td><span class="id-badge">#${d.id}</span></td>
            <td><img src="${d.imagenUrl}" class="table-product-img" alt="${d.nombre}"></td>
            <td><span class="table-product-name">${d.nombre}</span></td>
          <td>
            <span class="table-product-price">
              <span class="currency">$</span>
              <fmt:formatNumber value="${d.precio}" type="number" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" />
            </span>
          </td>
            <td><span class="marca-badge">${marcasMap[d.marcaId]}</span></td>
            <td>
              <div class="action-btns">
                <a href="admin?action=edit&id=${d.id}" class="ts-btn-edit" title="Editar">
                  <i class="bi bi-pencil"></i>
                </a>
                <a href="admin?action=delete&id=${d.id}" class="ts-btn-delete" title="Eliminar"
                   onclick="return confirm('¿Seguro que deseas eliminar este producto?')">
                  <i class="bi bi-trash3"></i>
                </a>
              </div>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <c:if test="${empty listaDispositivos}">
      <div class="table-empty">
        <i class="bi bi-inbox"></i>
        <p>No hay dispositivos registrados aún.</p>
      </div>
    </c:if>
  </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
