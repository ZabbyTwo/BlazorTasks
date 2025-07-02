-- Drop and recreate the database
DROP DATABASE IF EXISTS BlazorTasksDB;
CREATE DATABASE BlazorTasksDB;
USE BlazorTasksDB;

-- USERS TABLE
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    birthday DATE DEFAULT NULL,
    registered_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME DEFAULT NULL
);

-- GAMES LOOKUP TABLE
CREATE TABLE games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE higherlower_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    guess_count INT NOT NULL DEFAULT 0,
    won BOOLEAN NOT NULL,
    started_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    finished_at DATETIME DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (game_id) REFERENCES games(id)
);

-- INSERT ONLY HigherLower GAME
INSERT INTO games (name) VALUES ('HigherLower');

-- INSERT ADMIN USER
INSERT INTO users (name, password, birthday, registered_at, last_login)
VALUES (
    'admin',
    SHA2('admin', 256),
    NULL,
    NOW(),
    NULL
);

-- Optional: Verify everything is working
SELECT * FROM games;
SELECT * FROM users;
SELECT * FROM higherlower_sessions where won=1;

