E-commerce Admin System - Modulo 5 (JEE + MVC)

Este proyecto es una aplicacion web desarrollada en Java Enterprise Edition (JEE) que implementa un sistema de administracion de productos para un E-commerce. Utiliza el patron de arquitectura MVC (Modelo-Vista-Controlador) y se conecta a una base de datos PostgreSQL.
Requisitos del Proyecto

    Vistas: JSP con JSTL y EL.

    Controlador: Servlets para gestion de peticiones GET y POST.

    Modelo/Datos: DAO (Data Access Object) con JDBC.

    Servidor: Apache Tomcat 10 o superior.

    Base de datos: PostgreSQL 15 o superior (pgAdmin 4).

Instrucciones de Ejecucion
1. Configuracion de la Base de Datos

En pgAdmin 4, crea una base de datos y ejecuta el siguiente script SQL:

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INTEGER NOT NULL DEFAULT 0,
    categoria_id INTEGER REFERENCES categorias(id)
);

-- Datos de prueba
INSERT INTO categorias (nombre) VALUES ('Electrónica'), ('Hogar'), ('Ropa');
INSERT INTO productos (nombre, descripcion, precio, stock, categoria_id) 
VALUES ('Laptop', 'Gaming Pro', 1200.00, 10, 1);

2. Configuracion en Eclipse

    Importa el proyecto como Dynamic Web Project.

    Asegurar de que el archivo postgresql-42.x.x.jar y jstl-1.2.jar esten en la carpeta src/main/webapp/WEB-INF/lib/.

    Modifica la clase com.tienda.config.Conexion con tu usuario y contraseña de PostgreSQL.

3. Despliegue (WAR)

    Clic derecho al proyecto > Export > WAR file.

    Nombre del archivo: ecommercem5.war.

    Sube el archivo al Tomcat Manager (http://localhost:8080/manager/html).

Rutas Principales (URLs de Prueba)

    Inicio: /ecommercem5/ (Redireccion automatica al listado).

    Listar: /admin/productos (Vista general del catalogo CRUD).

    Nuevo: /admin/productos?accion=nuevo (Formulario para crear).

    Editar: /admin/productos?accion=editar&id=1 (Formulario con datos cargados del producto ID 1).

Estructura del Proyecto (MVC)

    com.tienda.model: Contiene la clase Producto.java (POJO).

    com.tienda.dao: Contiene ProductoDAO.java con logica JDBC.

    com.tienda.controller: ProductoServlet.java que gestiona el flujo.

    com.tienda.config: Clase Conexion.java (Patron Singleton).

    webapp/vistas: Archivos JSP (lista, formulario, error).

Validaciones Implementadas

    Precio: El campo precio no acepta valores menores o iguales a 0.

    Campos Obligatorios: Uso de atributo required en formularios.

    Integridad: Manejo de excepciones SQL mediante paginas de error amigables.

Enlace Repositorio GitHub

   https://github.com/thomasaravena/ecommercem5-tienda


Desarrollado para: Modulo 5 - Desarrollo de Aplicaciones Java EE.
Estudiante: Thomas Aravena Cárdenas
