DROP DATABASE IF EXISTS musify;
CREATE DATABASE musify;
USE musify;

CREATE TABLE disquera (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE genero (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE album (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    numero_canciones INT
);

CREATE TABLE artista (
    id INT PRIMARY KEY,
    nombre_artistico VARCHAR(100),
    nacionalidad VARCHAR(100),
    id_disquera INT,
    FOREIGN KEY (id_disquera) REFERENCES disquera(id)
);

CREATE TABLE cancion (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    duracion TIME,
    id_genero INT,
    id_album INT,
    FOREIGN KEY (id_genero) REFERENCES genero(id),
    FOREIGN KEY (id_album) REFERENCES album(id)
);

CREATE TABLE usuario (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    contraseña VARCHAR(100),
    email VARCHAR(100),
    tipo ENUM('Premium', 'Gratuito') NOT NULL
);

CREATE TABLE playlist (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE valoracion (
    id INT PRIMARY KEY,
    reaccion VARCHAR(50),
    texto VARCHAR(255),
    id_cancion INT,
    FOREIGN KEY (id_cancion) REFERENCES cancion(id)
);

CREATE TABLE artista_tiene_cancion (
    id_artista INT,
    id_cancion INT,
    PRIMARY KEY (id_artista, id_cancion),
    FOREIGN KEY (id_artista) REFERENCES artista(id),
    FOREIGN KEY (id_cancion) REFERENCES cancion(id)
);

CREATE TABLE usuario_sigue_artista (
    id_usuario INT,
    id_artista INT,
    PRIMARY KEY (id_usuario, id_artista),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_artista) REFERENCES artista(id)
);

CREATE TABLE playlist_contiene_cancion (
    id_playlist INT,
    id_cancion INT,
    PRIMARY KEY (id_playlist, id_cancion),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id),
    FOREIGN KEY (id_cancion) REFERENCES cancion(id)
);

CREATE TABLE usuario_gratuito (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE usuario_premium (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);
