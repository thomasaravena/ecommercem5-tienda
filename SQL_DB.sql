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