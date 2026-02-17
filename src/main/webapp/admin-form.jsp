<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <title>Formulario Producto</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card shadow">
        <div class="card-header bg-primary text-white">
          <h4>
            <c:if test="${dispositivo != null}">Editar Dispositivo (ID: ${dispositivo.id})</c:if>
            <c:if test="${dispositivo == null}">Nuevo Dispositivo</c:if>
          </h4>
        </div>
        <div class="card-body">
          <form action="admin" method="post">
            <c:if test="${dispositivo != null}">
              <input type="hidden" name="id" value="${dispositivo.id}">
            </c:if>

            <div class="mb-3">
              <label>Nombre del Modelo</label>
              <input type="text" name="nombre" class="form-control" value="${dispositivo.nombre}" required>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label>Precio</label>
                <input type="number" step="0.01" name="precio" class="form-control" value="${dispositivo.precio}" required>
              </div>
              <div class="col-md-6 mb-3">
                <label>Fecha de Lanzamiento</label>
                <input type="date" name="fecha" class="form-control" value="${dispositivo.fechaLanzamiento}" required>
              </div>
            </div>

            <div class="mb-3">
              <label>URL de la Imagen</label>
              <input type="url" name="imagenUrl" class="form-control" value="${dispositivo.imagenUrl}" placeholder="https://..." required>
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
              <textarea name="descripcion" class="form-control" rows="2" required>${dispositivo.descripcion}</textarea>
            </div>

            <div class="mb-3">
              <label>Especificaciones (Detalle)</label>
              <textarea name="especificaciones" class="form-control" rows="3">${dispositivo.especificaciones}</textarea>
            </div>

            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-success">Guardar Cambios</button>
              <a href="admin" class="btn btn-secondary">Cancelar</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
