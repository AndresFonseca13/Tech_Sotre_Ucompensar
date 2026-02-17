<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <title>Formulario Producto | TechStore</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link href="css/common.css" rel="stylesheet">
  <link href="css/admin.css" rel="stylesheet">
</head>
<body>

<nav class="ts-navbar-admin">
  <div class="container d-flex align-items-center justify-content-between">
    <a class="ts-brand-admin" href="admin">
      <span class="brand-icon"><i class="bi bi-shield-lock"></i></span>
      TechStore
      <span class="badge-admin">Admin</span>
    </a>
    <a href="admin" class="ts-btn-back-admin">
      <i class="bi bi-arrow-left"></i> Volver al Panel
    </a>
  </div>
</nav>

<div class="container mt-4 mb-5">
  <div class="row justify-content-center">
    <div class="col-lg-8">

      <!-- Encabezado de página -->
      <div class="admin-page-header mb-4">
        <h2 class="admin-page-title">
          <span class="title-icon">
            <c:if test="${dispositivo != null}"><i class="bi bi-pencil-square"></i></c:if>
            <c:if test="${dispositivo == null}"><i class="bi bi-plus-circle"></i></c:if>
          </span>
          <c:if test="${dispositivo != null}">Editar <span class="title-accent">Dispositivo</span></c:if>
          <c:if test="${dispositivo == null}">Nuevo <span class="title-accent">Dispositivo</span></c:if>
        </h2>
      </div>

      <!-- Formulario -->
      <div class="admin-form-card">
        <div class="admin-form-header">
          <span class="header-icon">
            <c:if test="${dispositivo != null}"><i class="bi bi-pencil"></i></c:if>
            <c:if test="${dispositivo == null}"><i class="bi bi-plus-lg"></i></c:if>
          </span>
          <h4>
            <c:if test="${dispositivo != null}">Editando dispositivo <span class="form-badge">ID: ${dispositivo.id}</span></c:if>
            <c:if test="${dispositivo == null}">Completa la información del producto</c:if>
          </h4>
        </div>

        <div class="admin-form-body">
          <form action="admin" method="post">
            <c:if test="${dispositivo != null}">
              <input type="hidden" name="id" value="${dispositivo.id}">
            </c:if>

            <div class="mb-3">
              <label>Nombre del Modelo</label>
              <input type="text" name="nombre" class="form-control" value="${dispositivo.nombre}"
                     placeholder="Ej: iPhone 15 Pro Max" required>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label>Precio</label>
                <input type="text" name="precio" class="form-control"
                       value="${dispositivo.precio}" placeholder="0" required>
              </div>
              <div class="col-md-6 mb-3">
                <label>Fecha de Lanzamiento</label>
                <input type="date" name="fecha" class="form-control"
                       value="${dispositivo.fechaLanzamiento}" required>
              </div>
            </div>

            <div class="mb-3">
              <label>URL de la Imagen</label>
              <input type="url" name="imagenUrl" class="form-control"
                     value="${dispositivo.imagenUrl}" placeholder="https://ejemplo.com/imagen.png" required>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label>Marca</label>
                <select name="marcaId" class="form-select">
                  <option value="1" ${dispositivo.marcaId == 1 ? 'selected' : ''}>Apple</option>
                  <option value="2" ${dispositivo.marcaId == 2 ? 'selected' : ''}>Samsung</option>
                  <option value="3" ${dispositivo.marcaId == 3 ? 'selected' : ''}>Xiaomi</option>
                  <option value="4" ${dispositivo.marcaId == 4 ? 'selected' : ''}>Lenovo</option>
                  <option value="5" ${dispositivo.marcaId == 5 ? 'selected' : ''}>Asus</option>
                </select>
              </div>
              <div class="col-md-6 mb-3">
                <label>Categoría</label>
                <select name="categoriaId" class="form-select">
                  <option value="1" ${dispositivo.categoriaId == 1 ? 'selected' : ''}>Celular</option>
                  <option value="2" ${dispositivo.categoriaId == 2 ? 'selected' : ''}>Portátil</option>
                  <option value="3" ${dispositivo.categoriaId == 3 ? 'selected' : ''}>Tablet</option>
                </select>
              </div>
            </div>

            <div class="mb-3">
              <label>Descripción Corta</label>
              <textarea name="descripcion" class="form-control" rows="2"
                        placeholder="Breve descripción del dispositivo..." required>${dispositivo.descripcion}</textarea>
            </div>

            <div class="mb-4">
              <label>Especificaciones (Detalle)</label>
              <textarea name="especificaciones" class="form-control" rows="3"
                        placeholder="Especificaciones técnicas detalladas...">${dispositivo.especificaciones}</textarea>
            </div>

            <div class="d-grid gap-2">
              <button type="submit" class="ts-btn-save">
                <i class="bi bi-check-lg"></i> Guardar Cambios
              </button>
              <a href="admin" class="ts-btn-cancel">
                <i class="bi bi-x-lg"></i> Cancelar
              </a>
            </div>
          </form>
        </div>
      </div>

    </div>
  </div>
</div>

<script>
  (function() {
    const form = document.querySelector('.admin-form-body form');
    const precioInput = form ? form.querySelector('input[name="precio"]') : null;

    if (!precioInput) return;

    const formatter = new Intl.NumberFormat('es-CO', {
      minimumFractionDigits: 0,
      maximumFractionDigits: 0
    });

    function formatPrecioValue(value) {
      const numeric = (value || '').toString().replace(/\D/g, '');
      if (!numeric) return '';
      const number = parseInt(numeric, 10);
      if (isNaN(number)) return '';
      return formatter.format(number);
    }

    // Formatear valor inicial si viene desde edición
    if (precioInput.value) {
      precioInput.value = formatPrecioValue(precioInput.value);
    }

    // Formatear mientras el usuario escribe
    precioInput.addEventListener('input', function (e) {
      const cursorPosFromEnd = this.value.length - this.selectionStart;
      const formatted = formatPrecioValue(this.value);
      this.value = formatted;
      // Recolocar el cursor al final manteniendo distancia desde el final
      const newPos = Math.max(this.value.length - cursorPosFromEnd, 0);
      this.setSelectionRange(newPos, newPos);
    });

    // Antes de enviar, dejar solo números para que el backend pueda parsear
    if (form) {
      form.addEventListener('submit', function () {
        if (!precioInput.value) return;
        const numeric = precioInput.value.replace(/\D/g, '');
        precioInput.value = numeric;
      });
    }
  })();
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
