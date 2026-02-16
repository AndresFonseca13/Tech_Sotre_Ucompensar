<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>${dispositivo.nombre} | Detalle</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark mb-4">
  <div class="container">
    <a class="navbar-brand" href="catalogo">TechStore</a>
    <a href="catalogo" class="btn btn-outline-light btn-sm">Volver al Catálogo</a>
  </div>
</nav>

<div class="container">
  <div class="card shadow-sm">
    <div class="row g-0">
      <div class="col-md-5 bg-white d-flex align-items-center justify-content-center p-3">
        <img src="${dispositivo.imagenUrl}" class="img-fluid rounded-start" alt="${dispositivo.nombre}" style="max-height: 400px;">
      </div>

      <div class="col-md-7">
        <div class="card-body p-4">
          <h5 class="text-muted text-uppercase mb-2">Dispositivo Inteligente</h5>
          <h2 class="card-title fw-bold text-primary mb-3">${dispositivo.nombre}</h2>

          <h3 class="text-success mb-4">$ ${dispositivo.precio}</h3>

          <p class="card-text lead">${dispositivo.descripcion}</p>

          <hr class="my-4">

          <h5>Especificaciones Técnicas:</h5>
          <p class="text-muted">${dispositivo.especificaciones}</p>
          <p class="text-muted"><small>Fecha de lanzamiento: ${dispositivo.fechaLanzamiento}</small></p>

          <div class="d-grid gap-2 mt-4">
            <button class="btn btn-primary btn-lg">Comprar ahora</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="mt-5 mb-5">
    <h3 class="border-bottom pb-2">Opiniones de usuarios</h3>

    <div class="card mb-4 bg-light">
      <div class="card-body">
        <h5 class="card-title">Deja tu opinión</h5>
        <form action="agregarComentario" method="post">
          <input type="hidden" name="idDispositivo" value="${dispositivo.id}">
          <div class="row">
            <div class="col-md-6 mb-3">
              <input type="text" name="autor" class="form-control" placeholder="Tu nombre" required>
            </div>
            <div class="col-md-6 mb-3">
              <select name="calificacion" class="form-select">
                <option value="5">⭐⭐⭐⭐⭐ Excelente</option>
                <option value="4">⭐⭐⭐⭐ Muy bueno</option>
                <option value="3">⭐⭐⭐ Regular</option>
                <option value="2">⭐⭐ Malo</option>
                <option value="1">⭐ Pésimo</option>
              </select>
            </div>
          </div>
          <div class="mb-3">
            <textarea name="texto" class="form-control" rows="3" placeholder="¿Qué te pareció este dispositivo?" required></textarea>
          </div>
          <button type="submit" class="btn btn-success">Publicar Comentario</button>
        </form>
      </div>
    </div>

    <c:if test="${empty comentarios}">
      <div class="alert alert-info">Aún no hay comentarios. ¡Sé el primero en opinar!</div>
    </c:if>

    <c:forEach var="c" items="${comentarios}">
      <div class="card mb-3">
        <div class="card-body">
          <div class="d-flex justify-content-between">
            <h6 class="card-subtitle mb-2 text-muted fw-bold">${c.autor}</h6>
            <span class="text-warning">
                            <c:forEach begin="1" end="${c.calificacion}">★</c:forEach>
                        </span>
          </div>
          <p class="card-text">${c.texto}</p>
          <small class="text-muted">Publicado el: ${c.fechaCreacion}</small>
        </div>
      </div>
    </c:forEach>
  </div>
</div>

</body>
</html>
