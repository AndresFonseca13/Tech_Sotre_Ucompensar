<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Dispositivos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-img-top {
            height: 200px; /* Altura fija para las imágenes */
            object-fit: contain; /* Para que la imagen se ajuste sin deformarse */
            padding: 10px;
        }
    </style>
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="catalogo">TechStore</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navFilters">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navFilters">
            <form action="catalogo" method="get" class="d-lg-flex w-100 align-items-center gap-2">
                <input class="form-control me-2" type="search" name="q" placeholder="Buscar..." value="${paramBusqueda}">

                <select class="form-select me-2" name="marca" style="max-width: 150px;">
                    <option value="0">Todas las Marcas</option>
                    <c:forEach var="m" items="${listaMarcas}">
                        <option value="${m.id}" ${paramMarca == String.valueOf(m.id) ? 'selected' : ''}>
                                ${m.nombre}
                        </option>
                    </c:forEach>
                </select>

                <select class="form-select me-2" name="tipo" style="max-width: 150px;">
                    <option value="0">Todos los Tipos</option>
                    <c:forEach var="cat" items="${listaCategorias}">
                        <option value="${cat.id}" ${paramTipo == String.valueOf(cat.id) ? 'selected' : ''}>
                                ${cat.nombre}
                        </option>
                    </c:forEach>
                </select>

                <button class="btn btn-outline-success" type="submit">Filtrar</button>
                <a href="catalogo" class="btn btn-outline-secondary ms-1">Limpiar</a>
            </form>

            <ul class="navbar-nav ms-3">
                <li class="nav-item">
                    <a class="btn btn-danger btn-sm" href="admin">⚙️ Admin</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="text-center mb-4">Nuestros Dispositivos</h1>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="d" items="${dispositivos}">
            <div class="col">
                <div class="card h-100 shadow-sm">
                    <img src="${d.imagenUrl}" class="card-img-top" alt="${d.nombre}">

                    <div class="card-body">
                        <h5 class="card-title text-primary">${d.nombre}</h5>
                        <p class="card-text text-muted small">${d.descripcion}</p>
                        <h4 class="text-success">$ ${d.precio}</h4>
                    </div>

                    <div class="card-footer bg-white border-top-0 d-grid">
                        <a href="detalle?id=${d.id}" class="btn btn-primary">Ver Detalles</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
