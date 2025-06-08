-- Script de inicialización para PostgreSQL (NutriApp)

-- Crear tabla de roles
CREATE TABLE IF NOT EXISTS roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(32) NOT NULL UNIQUE
);

-- Crear tabla de usuarios
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(64) NOT NULL UNIQUE,
    email VARCHAR(128) NOT NULL UNIQUE,
    password_hash VARCHAR(128) NOT NULL,
    role_id INTEGER REFERENCES roles(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar roles de ejemplo
INSERT INTO roles (name) VALUES ('admin'), ('professional'), ('patient')
    ON CONFLICT (name) DO NOTHING;

-- Insertar usuario admin de ejemplo
INSERT INTO users (username, email, password_hash, role_id)
SELECT 'admin', 'admin@nutriapp.local', 'changeme', id FROM roles WHERE name = 'admin'
    ON CONFLICT (username, email) DO NOTHING; 