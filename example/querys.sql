-- Conectarse al Gestor de Base de Datos desde el terminal

mysql -h localhost -u root

-- Crear nuestra base de datos
-- Sintaxis: CREATE DATABASE dbname;

CREATE DATABASE 4geeks_ft_xvi;

-- Ver listado de Base de Datos
-- Sintaxis SHOW DATABASES;

SHOW DATABASES;

-- Seleccionar una base de datos
-- Sintaxis: USE dbname;

USE 4geeks_ft_xvi;


-- Ver listado de tablas;
-- Sintaxis: SHOW TABLES;

SHOW TABLES;

--- Crear una TABLE
-- Sintaxis: CREATE TABLE table_name (fields, ...)

CREATE TABLE users (
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    name VARCHAR(50) NULL,
    lastname VARCHAR(50) NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (username),
    UNIQUE KEY (email)
);

DROP TABLE contacts;
CREATE TABLE contacts (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    email VARCHAR(100) NULL,
    users_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);


-- INSERT, UPDATE, DELETE, SELECT => (CRUD) => CREATE, READ, UPDATE, DELETE


-- Insert permite ingresar valores en una determinada tabla
-- Sintaxis: INSERT INTO <table_name> (fields, ...) VALUES (value, ...);

INSERT INTO users (username, password, email, name, lastname) VALUES ('lrodriguez', '123456', 'lrodriguez@gmail.com', 'Luis', 'Rodriguez');
INSERT INTO users (username, password, email, name, lastname) VALUES ('johndoe', '1234AbC', 'john.doe@gmail.com', 'John', 'Doe');
INSERT INTO users (username, password, email) VALUES ('jane.doe', '123xYz321', 'jane.doe@gmail.com');

INSERT INTO contacts (name, phone, users_id) VALUES ('John Doe', '5555-55-55', 5);



-- Select permite acceder a los datos registrados en la table
-- Sintaxis: SELECT fields, ... FROM <table_name>  (*) que permite acceder a todos los campos de la tabla 
-- Clausula WHERE 
-- Sintaxis: SELECT * FROM <table_name> WHERE <condition>
/* 
    =
    <>
    >=
    <=
    >
    <
    like
    in
    not in


    and or not
 */

SELECT * FROM users;
SELECT id, name, phone, email, users_id FROM contacts;

SELECT * FROM users WHERE name <> 'john' or lastname <> 'Doe'; 

SELECT * FROM users WHERE id in (1, 2);
SELECT * FORM users WHERE email like '%@gmail.com';

SELECT * FROM users WHERE id BETWEEN 1, 5;


-- UPDATE permite actualizar un campo o varios del registro en una tabla
-- Sintaxis: UPDATE <table_name> SET field=value, .... WHERE <condition>;

UPDATE users SET name='Jane', lastname='Doe' WHERE id = 3;
UPDATE users SET name=null, lastname=null;

-- INICIAR UNA TRANSACCION

BEGIN;

SAVEPOINT point1;
UPDATE users SET name=null, lastname=null;

SAVEPOINT point2;
UPDATE users SET name='Luis', lastname='Rodriguez' WHERE id=1;


SAVEPOINT point3;
UPDATE users SET name='John', lastname='Doe' WHERE id=2;
UPDATE users SET name='Jane', lastname='Doe' WHERE id=3;

SELECT * FROM users;

-- FINALIZAR UNA TRANSACCION
-- Sintaxis: Guardar: COMMIT; Deshacer: ROLLBACK;
COMMIT;
ROLLBACK;

-- DELETE permite eliminar registros de la tabla
-- Sintaxis: DELETE FROM <table_name> WHERE <condition>

DELETE FROM contacts WHERE users_id=1;
DELETE FROM users;


CREATE TABLE followers (
    users_id INTEGER NOT NULL,
    follower_id INTEGER NOT NULL,
    PRIMARY KEY (users_id, follower_id),
    FOREIGN KEY (users_id) REFERENCES users (id),
    FOREIGN KEY (follower_id) REFERENCES users (id)
);

1, 2
2, 1
2, 3
3, 1