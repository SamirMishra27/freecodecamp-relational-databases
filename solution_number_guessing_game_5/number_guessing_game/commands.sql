CREATE DATABASE number_guess;

CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(22) UNIQUE NOT NULL
);

CREATE TABLE games(
    game_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) NOT NULL,
    secret_number INT NOT NULL,
    guess_attempts INT NOT NULL
);
