-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS escomdb;
USE escomdb;

-- Tabla Usuarios
CREATE TABLE Usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  identifier VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  tipoUsuario ENUM('alumno', 'profesor') NOT NULL
);

-- Tabla Alumno
CREATE TABLE Alumno (
  id INT AUTO_INCREMENT PRIMARY KEY,
  boleta INT NOT NULL UNIQUE,
  nombre VARCHAR(255) NOT NULL,
  curp VARCHAR(255) NOT NULL,
  carrera VARCHAR(255) NOT NULL,
  telefono VARCHAR(20),
  correo VARCHAR(255) UNIQUE,
  usuarioId INT,
  FOREIGN KEY (usuarioId) REFERENCES Usuario(id) ON DELETE SET NULL
);

-- Tabla Profesor
CREATE TABLE Profesor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  curp VARCHAR(255) NOT NULL UNIQUE,
  nombre VARCHAR(255) NOT NULL,
  cargo VARCHAR(255),
  departamento VARCHAR(255),
  telefono VARCHAR(20),
  correo VARCHAR(255) UNIQUE,
  usuarioId INT,
  FOREIGN KEY (usuarioId) REFERENCES Usuario(id) ON DELETE SET NULL
);

-- Tabla Grupo
CREATE TABLE Grupo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  grupo VARCHAR(255) NOT NULL,
  carrera VARCHAR(255) NOT NULL,
  dia VARCHAR(255) NOT NULL,
  horaInicio TIME NOT NULL,
  horaTermino TIME NOT NULL
);

-- Tabla Horario
CREATE TABLE Horario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  boleta INT NOT NULL,
  curpProfesor VARCHAR(255) NOT NULL,
  idGrupo INT NOT NULL,
  FOREIGN KEY (idGrupo) REFERENCES Grupo(id) ON DELETE CASCADE,
  FOREIGN KEY (boleta) REFERENCES Alumno(boleta) ON DELETE CASCADE,
  FOREIGN KEY (curpProfesor) REFERENCES Profesor(curp) ON DELETE CASCADE
);