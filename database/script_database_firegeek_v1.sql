CREATE DATABASE `firegeek`;
USE `firegeek`;

CREATE TABLE `firegeek`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nickname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `dtCadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dtNascimento` DATE NULL,
  `sexo` CHAR(1) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC) VISIBLE);



CREATE TABLE `firegeek`.`artista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `inscritos` INT NOT NULL,
  `link` VARCHAR(100) NOT NULL,
  `fkUsuario` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_artistas_usuario_idx` (`fkUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_artistas_usuario`
    FOREIGN KEY (`fkUsuario`)
    REFERENCES `firegeek`.`usuario` (`id`));



CREATE TABLE `firegeek`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tema` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `tipo_UNIQUE` (`tema` ASC) VISIBLE);



CREATE TABLE `firegeek`.`topico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `subTitulo` VARCHAR(100) NULL,
  `fkCategoria` INT NOT NULL,
  `fkUsuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_topico_usuario1_idx` (`fkUsuario` ASC) VISIBLE,
  INDEX `fk_topico_categoria1_idx` (`fkCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_topico_usuario1`
    FOREIGN KEY (`fkUsuario`)
    REFERENCES `firegeek`.`usuario` (`id`),
  CONSTRAINT `fk_topico_categoria1`
    FOREIGN KEY (`fkCategoria`)
    REFERENCES `firegeek`.`categoria` (`id`));



CREATE TABLE `firegeek`.`mensagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `descricao` VARCHAR(500) NOT NULL,
  `fkTopico` INT NOT NULL,
  `fkUsuario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mensagem_topico1_idx` (`fkTopico` ASC) VISIBLE,
  INDEX `fk_mensagem_usuario1_idx` (`fkUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_mensagem_topico1`
    FOREIGN KEY (`fkTopico`)
    REFERENCES `firegeek`.`topico` (`id`),
  CONSTRAINT `fk_mensagem_usuario1`
    FOREIGN KEY (`fkUsuario`)
    REFERENCES `firegeek`.`usuario` (`id`));
