<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${dispositivo.nombre} | Detalle</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link href="css/common.css" rel="stylesheet">
  <link href="css/detalle.css" rel="stylesheet">
</head>
<body>

<fmt:setLocale value="es_CO" />
<nav class="ts-navbar mb-4">
  <div class="container d-flex align-items-center justify-content-between">
    <a class="ts-brand" href="catalogo">
      <span class="brand-icon"><i class="bi bi-cpu"></i></span>
      TechStore
    </a>
    <a href="catalogo" class="ts-btn-back">
      <i class="bi bi-arrow-left"></i> Volver al Catálogo
    </a>
  </div>
</nav>

<div class="container">
  <!-- Producto principal -->
  <div class="product-detail-wrapper">
    <div class="row g-4">
      <!-- Imagen del producto -->
      <div class="col-lg-5">
        <div class="product-image-container">
          <div class="product-image-bg">
            <img src="${dispositivo.imagenUrl}" class="product-main-image" alt="${dispositivo.nombre}">
          </div>
        </div>
      </div>

      <!-- Información del producto -->
      <div class="col-lg-7">
        <div class="product-info">
          <div class="product-badge">
            <i class="bi bi-star-fill"></i>
            <span>Dispositivo Premium</span>
          </div>
          
          <h1 class="product-title">${dispositivo.nombre}</h1>
          
          <div class="product-price-section">
            <span class="price-label">Precio</span>
            <div class="product-price">
              <span class="currency">$</span>
              <fmt:formatNumber value="${dispositivo.precio}" type="number" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" />
            </div>
          </div>

          <div class="product-description">
            <p>${dispositivo.descripcion}</p>
          </div>

          <div class="product-specs">
            <h3 class="specs-title">
              <i class="bi bi-gear"></i>
              Especificaciones Técnicas
            </h3>
            <div class="specs-content">
              <p>${dispositivo.especificaciones}</p>
            </div>
            <div class="product-meta">
              <span class="meta-item">
                <i class="bi bi-calendar3"></i>
                Lanzamiento: ${dispositivo.fechaLanzamiento}
              </span>
            </div>
          </div>

          <div class="product-actions">
            <button class="ts-btn-buy">
              <i class="bi bi-cart-plus"></i>
              Comprar ahora
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Sección de comentarios -->
  <div class="reviews-section">
    <div class="reviews-header">
      <h2 class="reviews-title">
        <i class="bi bi-chat-dots"></i>
        Opiniones de usuarios
      </h2>
    </div>

    <!-- Formulario de comentario -->
    <div class="review-form-card">
      <h3 class="review-form-title">
        <i class="bi bi-pencil-square"></i>
        Deja tu opinión
      </h3>
      <form action="agregarComentario" method="post" class="review-form">
        <input type="hidden" name="idDispositivo" value="${dispositivo.id}">
        <div class="row g-3">
          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label">
                <i class="bi bi-person"></i>
                Tu nombre
              </label>
              <input type="text" name="autor" class="form-control-modern" placeholder="Ingresa tu nombre" required>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label">
                <i class="bi bi-star"></i>
                Calificación
              </label>
              <select name="calificacion" class="form-control-modern">
                <option value="5">⭐⭐⭐⭐⭐ Excelente</option>
                <option value="4">⭐⭐⭐⭐ Muy bueno</option>
                <option value="3">⭐⭐⭐ Regular</option>
                <option value="2">⭐⭐ Malo</option>
                <option value="1">⭐ Pésimo</option>
              </select>
            </div>
          </div>
        </div>
        <div class="form-group mt-3">
          <label class="form-label">
            <i class="bi bi-chat-text"></i>
            Tu opinión
          </label>
          <textarea name="texto" class="form-control-modern" rows="4" placeholder="¿Qué te pareció este dispositivo?" required></textarea>
        </div>
        <button type="submit" class="ts-btn-submit-review">
          <i class="bi bi-send"></i>
          Publicar Comentario
        </button>
      </form>
    </div>

    <!-- Lista de comentarios -->
    <div class="reviews-list">
      <c:if test="${empty comentarios}">
        <div class="reviews-empty">
          <i class="bi bi-inbox"></i>
          <p>Aún no hay comentarios. ¡Sé el primero en opinar!</p>
        </div>
      </c:if>

      <c:forEach var="c" items="${comentarios}">
        <div class="review-card">
          <div class="review-header">
            <div class="review-author">
              <div class="author-avatar">
                <i class="bi bi-person-circle"></i>
              </div>
              <div class="author-info">
                <h4 class="author-name">${c.autor}</h4>
                <span class="review-date">
                  <i class="bi bi-clock"></i>
                  ${c.fechaCreacion}
                </span>
              </div>
            </div>
            <div class="review-rating">
              <c:forEach begin="1" end="${c.calificacion}">
                <i class="bi bi-star-fill"></i>
              </c:forEach>
              <c:forEach begin="${c.calificacion + 1}" end="5">
                <i class="bi bi-star"></i>
              </c:forEach>
            </div>
          </div>
          <div class="review-content">
            <p>${c.texto}</p>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
