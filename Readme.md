# 📱 TechStore - Catálogo de Dispositivos Inteligentes

> **Materia:** Desarrollo de Software Web Backend  
> **Arquitectura:** MVC (Modelo-Vista-Controlador) con Jakarta EE

## 📖 Descripción del Proyecto

TechStore es una aplicación web Full-Stack diseñada para gestionar un catálogo de dispositivos tecnológicos (Celulares, Portátiles y Tablets). El sistema permite a los usuarios buscar, filtrar y comentar productos, mientras que ofrece un panel administrativo  para la gestión de inventario (CRUD).

Este proyecto fue desarrollado bajo una arquitectura por capas, separando la lógica de negocio, el acceso a datos y la presentación, simulando un entorno de despliegue real utilizando contenedores Docker para la base de datos.

## 🚀 Características Principales

### 👤 Módulo Público (Cliente)
* **Catálogo Interactivo:** Visualización de productos con imágenes de alta calidad.
* **Búsqueda Avanzada:** Barra de búsqueda por nombre y filtros dinámicos por **Marca** y **Categoría** (cargados desde BD).
* **Detalle de Producto:** Vista individual con especificaciones técnicas, precio y fecha de lanzamiento.
* **Sistema de Comentarios:** Los usuarios pueden dejar reseñas y calificaciones (1-5 estrellas) en cada dispositivo.

### ⚙️ Módulo Administrativo (Back-office)
* **Gestión de Inventario (CRUD):**
    * Crear nuevos dispositivos.
    * Editar información existente.
    * Eliminar productos del catálogo.
* **Listado de Gestión:** Tabla resumen con acciones rápidas.

---

## 🛠️ Stack Tecnológico

El proyecto utiliza tecnologías estándar de la industria Java Enterprise:

| Área | Tecnología | Versión |
| :--- | :--- | :--- |
| **Lenguaje** | Java (JDK) | 21 (LTS) |
| **Framework** | Jakarta EE (Servlets, JSP) | 10 / 11 |
| **Servidor** | Apache Tomcat | 11.0.x |
| **Base de Datos** | MySQL (Dockerizado) | 8.0 |
| **Frontend** | HTML5, CSS3, Bootstrap | 5.3 |
| **Motor de Plantillas** | JSTL (JSP Standard Tag Library) | 3.0 |
| **Construcción** | Apache Maven | 3.8+ |

---

## 🏗️ Arquitectura del Software

El sistema sigue el patrón de diseño **MVC (Modelo-Vista-Controlador)** para garantizar la escalabilidad y mantenibilidad:

1.  **Modelo (Model & DAO):** * Clases POJO (`Dispositivo`, `Marca`, `Categoria`) que representan las tablas de la BD.
    * Patrón **DAO** (`DispositivoDAO`) para abstraer las consultas SQL y la conexión JDBC.
2.  **Vista (View):** * Archivos `.jsp` renderizados en el servidor.
    * Uso de Bootstrap para diseño responsivo.
3.  **Controlador (Controller):** * `DispositivoServlet`: Gestiona el catálogo y los filtros.
    * `AdminServlet`: Gestiona las operaciones CRUD y seguridad básica.

---

## 🗄️ Diseño de Base de Datos

El sistema utiliza una base de datos relacional MySQL normalizada.

**Estructura:**
* **Tablas Maestras:** `categorias`, `marcas`.
* **Tabla Principal:** `dispositivos` (con Llaves Foráneas a categorías y marcas).
* **Tabla Transaccional:** `comentarios` (relación 1:N con dispositivos).

### Diagrama Entidad-Relación (MER)

<img width="467" height="755" alt="image" src="https://github.com/user-attachments/assets/291d6187-414f-42c6-a2e7-12bf9b5a8e14" />

> *Nota: El script de inicialización `init.sql` incluye la estructura completa y 15 productos de prueba (Seed Data).*

---

## 🔧 Guía de Instalación y Ejecución

Sigue estos pasos para desplegar el proyecto en tu máquina local.

### Prerrequisitos
* Tener instalado **Java JDK 21**.
* Tener instalado **Docker Desktop** (para la base de datos).
* Un IDE como **IntelliJ IDEA** o **Cursor** (con extensiones Java).
* Servidor **Apache Tomcat 11** descargado localmente.

### Paso 1: Clonar el Repositorio
```bash
git clone [https://github.com/tu-usuario/TechStore.git](https://github.com/tu-usuario/TechStore.git)
cd TechStore
```

### Paso 2: Levantar la Base de Datos (Docker)
El proyecto incluye un archivo `docker-compose.yml` que configura MySQL y carga los datos automáticamente.

* Abre una terminal en la raíz del proyecto.
* Ejecuta el siguiente comando:
```bash
docker-compose up -d
```
* Docker descargará la imagen de MySQL, creará el contenedor y ejecutará el script `init.sql`.

### Paso 3: Ejecutar la Aplicación (IntellJ Idea)
1. Abre el proyecto en IntelliJ.

2. Configura el servidor Tomcat Local:
* Ve a Run/Debug Configurations.

* Añade una nueva configuración "Tomcat Server > Local".

* Selecciona la carpeta de instalación de tu Tomcat 11.

* En la pestaña Deployment, añade el artefacto: tu-proyecto:war exploded.

* Presiona el botón Run (Play).

3. Presiona el botón Run (Play)

### Opción B: Ejecución en Eclipse IDE
Si prefieres usar Eclipse (versión "Enterprise Java and Web Developers"):

1.  **Importar el Proyecto:**
    * Ve a `File > Import > Maven > Existing Maven Projects`.
    * Selecciona la carpeta raíz donde clonaste el repositorio y dale a `Finish`.
2.  **Configurar el Runtime (Tomcat):**
    * Haz clic derecho sobre el proyecto en el explorador > `Properties`.
    * Ve a `Target Runtimes` (o *Project Facets > Runtimes*).
    * Marca la casilla de **Apache Tomcat 11** (si no aparece, haz clic en *New...*, selecciona Apache Tomcat v10.1/11.0 y busca la carpeta donde lo descargaste).
    * Aplica los cambios (`Apply and Close`).
3.  **Correr el Servidor:**
    * Haz clic derecho sobre el proyecto > `Run As > Run on Server`.
    * Selecciona el servidor Tomcat configurado y finaliza.
* ## 📍 Rutas de la Aplicación (Endpoints)

Una vez que el servidor arranque, la URL base dependerá de la configuración de tu Tomcat.
* Ejemplo común: `http://localhost:8080/TechStore` o `http://localhost:8080/MiProyecto`.

A partir de esa URL base, estas son las rutas disponibles para navegar:

| Ruta Relativa | Descripción |
| :--- | :--- |
| `/catalogo` | **Inicio / Tienda.** Listado público de todos los dispositivos, incluye buscador y filtros. |
| `/detalle` | **Ficha Técnica.** Requiere un ID (ej: `/detalle?id=1`) para mostrar la info completa y comentarios. |
| `/admin` | **Back-office.** Panel de gestión tipo CRUD. Muestra la tabla de inventario. |
| `/admin?action=new`| **Alta de Producto.** Formulario para ingresar un nuevo dispositivo a la base de datos. |

> **Nota:** El sistema redirige automáticamente al `/catalogo` si intentas entrar a la raíz `/` del contexto.


### 📝 Autor
Proyecto desarrollado para la asignatura de Desarrollo Web Backend por Andres Felipe Fonseca Ochoa.
