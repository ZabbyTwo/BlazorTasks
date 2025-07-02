DROP DATABASE IF EXISTS BlazorTasksDB;

CREATE DATABASE BlazorTasksDB;

USE BlazorTasksDB;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    birthday DATE DEFAULT NULL,
    registered_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME DEFAULT NULL
);

INSERT INTO users (name, password, birthday, registered_at, last_login)
VALUES (
    'admin',
    SHA2('admin', 256),
    NULL,
    NOW(),
    NULL
);
