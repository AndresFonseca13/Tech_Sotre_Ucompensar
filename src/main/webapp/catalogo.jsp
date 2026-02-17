<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Dispositivos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="css/common.css" rel="stylesheet">
    <link href="css/catalogo.css" rel="stylesheet">
</head>
<body>

<fmt:setLocale value="es_CO" />
<nav class="ts-navbar mb-4">
    <div class="container">
        <div class="d-flex align-items-center justify-content-between">
            <a class="ts-brand" href="catalogo">
                <span class="brand-icon"><i class="bi bi-cpu"></i></span>
                TechStore
            </a>

            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#navFilters">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse d-lg-flex justify-content-end" id="navFilters">
                <form action="catalogo" method="get" class="d-lg-flex align-items-center gap-2 nav-filter-row mt-3 mt-lg-0">
                    <div class="search-wrapper">
                        <i class="bi bi-search"></i>
                        <input class="ts-search" type="search" name="q" placeholder="Buscar dispositivos..." value="${paramBusqueda}">
                    </div>

                    <div class="filter-divider d-none d-lg-block"></div>

                    <select class="ts-select" name="marca">
                        <option value="0">Todas las Marcas</option>
                        <c:forEach var="m" items="${listaMarcas}">
                            <option value="${m.id}" ${paramMarca == String.valueOf(m.id) ? 'selected' : ''}>
                                    ${m.nombre}
                            </option>
                        </c:forEach>
                    </select>

                    <select class="ts-select" name="tipo">
                        <option value="0">Todos los Tipos</option>
                        <c:forEach var="cat" items="${listaCategorias}">
                            <option value="${cat.id}" ${paramTipo == String.valueOf(cat.id) ? 'selected' : ''}>
                                    ${cat.nombre}
                            </option>
                        </c:forEach>
                    </select>

                    <div class="filter-divider d-none d-lg-block"></div>

                    <button class="ts-btn-filter" type="submit">
                        <i class="bi bi-funnel"></i> Filtrar
                    </button>
                    <a href="catalogo" class="ts-btn-clear">
                        <i class="bi bi-x-circle"></i> Limpiar
                    </a>
                </form>

                <div class="filter-divider d-none d-lg-block ms-2"></div>

                <div class="nav-actions ms-lg-2 mt-2 mt-lg-0">
                    <a class="ts-btn-admin" href="admin">
                        <i class="bi bi-gear"></i> Admin
                    </a>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="catalogo-title text-center mb-4">
        Nuestros <span class="title-accent">Dispositivos</span>
    </h1>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:forEach var="d" items="${dispositivos}">
            <div class="col">
                <div class="ts-product-card h-100">
                    <div class="card-img-wrapper">
                        <img src="${d.imagenUrl}" alt="${d.nombre}">
                    </div>

                    <div class="card-body">
                        <h5 class="product-name">${d.nombre}</h5>
                        <p class="product-desc">${d.descripcion}</p>
                        <p class="product-price">
                            <span class="currency">$</span>
                            <fmt:formatNumber value="${d.precio}" type="number" groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" />
                        </p>
                    </div>

                    <div class="card-footer">
                        <a href="detalle?id=${d.id}" class="ts-btn-details">
                            Ver Detalles <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
