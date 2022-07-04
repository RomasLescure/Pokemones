-----------------------------------------------------------------------
--Tablas
-----------------------------------------------------------------------
CREATE TABLE pokedex (
    id_pokemon number(5) NOT NULL PRIMARY KEY,
    nombre varchar2(20) NOT NULL,
    altura number(5, 2) Not NULL,
    peso number(5, 2) Not NULL
    );

CREATE TABLE estadisticas (
    id_pokemon number(5) NOT NULL,
    ataque number(10) Not NULL,
    defensa number(10) Not NULL,
    ataque_esp number(10) Not NULL,
    defensa_esp number(10) Not NULL,
    vida number(10) Not NULL,
    velocidad number(10) Not NULL,
    beststat varchar2(20) NULL,
    CONSTRAINT FK_id_pokemon FOREIGN KEY (id_pokemon)
    REFERENCES pokedex(id_pokemon)
    );

CREATE TABLE tipo (
    id_tipo number(2) Primary Key NOT NULL, 
    nombre_tipo varchar2(20) NOT NULL
    );

CREATE TABLE tipo_poke (
    id_pokemon number(5) NOT NULL,
    id_tipo number(10) NOT NULL,
    CONSTRAINT FK2_id_pokemon FOREIGN KEY (id_pokemon)
    REFERENCES pokedex(id_pokemon),
    CONSTRAINT FK_id_tipo FOREIGN KEY (id_tipo)
    REFERENCES tipo(id_tipo)
    );

CREATE TABLE movimientos (
    id_mov number(5) PRIMARY KEY NOT NULL,
    nombre_mov varchar2(25) NOT NULL,
    poder number(3),
    powerpoints number(3),
    precision number(3),
    id_tipo number(2),
    CONSTRAINT FK2_id_tipo FOREIGN KEY (id_tipo)
    REFERENCES tipo(id_tipo)
    );

CREATE TABLE movimientos_poke (
    id_pokemon number(5) NOT NULL,
    id_mov number(5) NOT NULL,
    CONSTRAINT FK_id_mov FOREIGN KEY (id_mov)
    REFERENCES movimientos(id_mov),
    CONSTRAINT fk3_id_pokemon FOREIGN KEY (id_pokemon)
    REFERENCES pokedex(id_pokemon)
    );

CREATE TABLE forma_evolucion (
    id_formaevo number(5) Primary Key NOT NULL,
    descripcion varchar2(100) NOT NULL
    );

CREATE TABLE evolucion_poke (
    id_pokemon number(5) NOT NULL,
    id_pokemonant number(5) NULL,
    id_formaevo number(5) NOT NULL,
    CONSTRAINT FK4_id_pokemon FOREIGN KEY (id_pokemon)
    REFERENCES pokedex(id_pokemon),
    CONSTRAINT FK_id_formaevo FOREIGN KEY (id_formaevo)
    REFERENCES forma_evolucion(id_formaevo)
    );

