-----------------------------------------------------------------------
--Tablas
-----------------------------------------------------------------------
CREATE TABLE pokedex (
    id_pokemon number(5) NOT NULL PRIMARY KEY,
    nombre varchar2(20) NOT NULL,
    altura number(5, 2) Not NULL,
    peso number(5, 2) Not NULL
    );

CREATE TABLE estadistica (
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

CREATE TABLE movimiento (
    id_mov number(5) PRIMARY KEY NOT NULL,
    nombre_mov varchar2(25) NOT NULL,
    poder number(3),
    powerpoints number(3),
    precision number(3),
    id_tipo number(2),
    CONSTRAINT FK2_id_tipo FOREIGN KEY (id_tipo)
    REFERENCES tipo(id_tipo)
    );

CREATE TABLE movimiento_poke (
    id_pokemon number(5) NOT NULL,
    id_mov number(5) NOT NULL,
    CONSTRAINT FK_id_mov FOREIGN KEY (id_mov)
    REFERENCES movimiento(id_mov),
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

-----------------------------------------------------------------------
--Funciones
-----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION best_stat(
    p_ataque in estadistica.ataque%type,
    p_defensa in estadistica.defensa%type,
    p_ataque_esp in estadistica.ataque_esp%type,
    p_defensa_esp in estadistica.defensa_esp%type,
    p_vida in estadistica.vida%type,
    p_velocidad in estadistica.velocidad%type
    )
    RETURN varchar2 IS
    v_beststat estadistica.beststat%type;
    BEGIN    
        v_beststat := GREATEST(p_ataque, p_defensa, p_ataque_esp, p_defensa_esp, p_vida, p_velocidad);
        IF v_beststat = p_ataque THEN
            v_beststat := 'Ataque';
        ELSIF v_beststat = p_defensa THEN
            v_beststat := 'Defensa';
        ELSIF v_beststat  = p_ataque_esp THEN
            v_beststat := 'Ataque Especial';
        ELSIF v_beststat  = p_defensa_esp THEN
            v_beststat := 'Defensa Especial';
        ELSIF v_beststat  = p_vida THEN
            v_beststat := 'Vida';
        ELSE
            v_beststat := 'Velocidad';
        END IF;
        RETURN v_beststat;
    END best_stat;
/

CREATE OR REPLACE FUNCTION sumatoria_mov(
    p_ataque in estadistica.ataque%type,
    p_defensa in estadistica.defensa%type,
    p_ataque_esp in estadistica.ataque_esp%type,
    p_defensa_esp in estadistica.defensa_esp%type,
    p_vida in estadistica.vida%type,
    p_velocidad in estadistica.velocidad%type
    )
    RETURN number IS
    v_sumatoria_stats number;
    e_invalid_stats EXCEPTION;
    BEGIN
        v_sumatoria_stats := p_ataque + p_defensa + p_ataque_esp + p_defensa_esp + p_vida + p_velocidad;
        IF v_sumatoria_stats > 680 THEN
            RAISE e_invalid_stats;
        ELSE
            RETURN v_sumatoria_stats;
        END IF;
    EXCEPTION
        WHEN e_invalid_stats THEN
          DBMS_OUTPUT.PUT_LINE ('La suma de las estadistica no debe ser mayor a 680');
    END sumatoria_mov;
/

-----------------------------------------------------------------------
--Procedimiento 1
-----------------------------------------------------------------------
CREATE SEQUENCE id_pokemon
	START WITH 1 
	INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE Intro_Poke_Tipo1_SE(
	p_nombre in pokedex.nombre%type,
	p_peso in pokedex.peso%type,
	p_altura in pokedex.altura%type,
	p_tipo in tipo.nombre_tipo%type,
	p_ataque in estadistica.ataque%type,
	p_defensa in estadistica.defensa%type,
	p_ata_esp in estadistica.ataque_esp%type,
	p_def_esp in estadistica.defensa_esp%type,
	p_vida in estadistica.vida%type,
	p_vel in estadistica.velocidad%type) IS
        v_next pokedex.id_pokemon%type;
        v_best estadistica.beststat%type;
        v_sum number(6);
    BEGIN
		v_sum := sumatoria_mov(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        v_next := id_pokemon.nextval;
        INSERT INTO pokedex 
            VALUES (v_next, p_nombre, p_peso, p_altura);
        v_best := best_stat(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        INSERT INTO estadistica 
            VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def_esp,
        p_vida, p_vel, v_best);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('El Pokémon no se ingreso a la base de datos');
    END;
/

-----------------------------------------------------------------------
--Procedimiento 2
-----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE Intro_Poke_tipo2_SE(
	p_nombre in pokedex.nombre%type,
	p_peso in pokedex.peso%type,
	p_altura in pokedex.altura%type,
	p_tipo in tipo.id_tipo%type,
	p_tipo2 in tipo.id_tipo%type,
	p_ataque in estadistica.ataque%type,
	p_defensa in estadistica.defensa%type,
	p_ata_esp in estadistica.ataque_esp%type,
	p_def_esp in estadistica.defensa_esp%type,
	p_vida in estadistica.vida%type,
	p_vel in estadistica.velocidad%type) IS
	v_next pokedex.id_pokemon%type;
    v_best estadistica.beststat%type;
    v_sum number(6);
    BEGIN
		v_sum := sumatoria_mov(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        v_next := id_pokemon.nextval;
        INSERT INTO pokedex 
            VALUES (v_next, p_nombre, p_peso, p_altura);
        v_best := best_stat(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        INSERT INTO estadistica 
            VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def_esp,
        p_vida, p_vel, v_best);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo2);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('El Pokémon no se ingreso a la base de datos');
    END;
/

-----------------------------------------------------------------------
--Procedimiento 3
-----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE Into_Poke_Evo1(
	p_nombre in pokedex.nombre%type,
	p_peso in pokedex.peso%type,
	p_altura in pokedex.altura%type,
	p_tipo in tipo.nombre_tipo%type,
	p_ataque in estadistica.ataque%type,
	p_defensa in estadistica.defensa%type,
	p_ata_esp in estadistica.ataque_esp%type,
	p_def_esp in estadistica.defensa_esp%type,
	p_vida in estadistica.vida%type,
	p_vel in estadistica.velocidad%type,
    p_idpokeant in evolucion_poke.id_pokemonant%type,
    p_idforma in evolucion_poke.id_formaevo%type) IS
	v_next pokedex.id_pokemon%type;
    v_best estadistica.beststat%type;
    v_sum number(6);    
    BEGIN
		v_sum := sumatoria_mov(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        v_next := id_pokemon.nextval;
        INSERT INTO pokedex 
            VALUES (v_next, p_nombre, p_peso, p_altura);
		v_best := best_stat(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        INSERT INTO estadistica 
            VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def_esp,
        p_vida, p_vel, v_best);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo);
        INSERT INTO evolucion_poke
            VALUES (v_next, p_idpokeant, p_idforma);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('El Pokémon no se ingreso a la base de datos');
    END;
/

-----------------------------------------------------------------------
--Procedimiento 4
-----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE Into_Poke_Evo2(
	p_nombre in pokedex.nombre%type,
	p_peso in pokedex.peso%type,
	p_altura in pokedex.altura%type,
	p_tipo in tipo.nombre_tipo%type,
    p_tipo2 in tipo.nombre_tipo%type,
	p_ataque in estadistica.ataque%type,
	p_defensa in estadistica.defensa%type,
	p_ata_esp in estadistica.ataque_esp%type,
	p_def_esp in estadistica.defensa_esp%type,
	p_vida in estadistica.vida%type,
	p_vel in estadistica.velocidad%type,
    p_idpokeant in evolucion_poke.id_pokemonant%type,
    p_idforma in evolucion_poke.id_formaevo%type) IS
	v_next pokedex.id_pokemon%type;
    v_best estadistica.beststat%type;
    v_sum number(6);    
    BEGIN
		v_sum := sumatoria_mov(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        v_next := id_pokemon.nextval;
        INSERT INTO pokedex 
            VALUES (v_next, p_nombre, p_peso, p_altura);
        v_best := best_stat(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        INSERT INTO estadistica 
            VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def_esp,
        p_vida, p_vel, v_best);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo2);
        INSERT INTO evolucion_poke
            VALUES (v_next, p_idpokeant, p_idforma);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('El Pokémon no se ingreso a la base de datos');
    END;
/

-----------------------------------------------------------------------
--Procedimiento 5
-----------------------------------------------------------------------
CREATE SEQUENCE id_nuevoMov
	START WITH 1 
	INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE Into_Poke_Mov(
	p_nombre in movimiento.nombre_mov%type,
    p_idtipo in movimiento.id_tipo%type,
    p_poder in movimiento.poder%type,
    p_ppt in movimiento.powerpoints%type,
    p_presicion in movimiento.precision%type
    ) IS
    BEGIN
        INSERT INTO movimiento (id_mov, nombre_mov, id_tipo, poder, powerpoints, precision)
            VALUES (id_nuevoMov.nextval, p_nombre, p_idtipo, p_poder, p_ppt, p_presicion);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;
/

-----------------------------------------------------------------------
--Procedimiento 6
-----------------------------------------------------------------------
CREATE SEQUENCE id_nuevoPoke
	START WITH 1 
	INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE Into_Tipo(
	p_nombre in tipo.nombre_tipo%type
    ) IS
    BEGIN
        INSERT INTO tipo
            VALUES (id_nuevoPoke.nextval, p_nombre);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;
/

-----------------------------------------------------------------------
--Procedimiento 7
-----------------------------------------------------------------------
CREATE SEQUENCE id_Evolucion
	START WITH 1 
	INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE Into_Forma_Evo(
	p_descripcion in forma_evolucion.descripcion%type
    ) IS
    BEGIN
        INSERT INTO FORMA_EVOLUCION
            VALUES (id_Evolucion.nextval, p_descripcion);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;
/

-----------------------------------------------------------------------
--Trigger
-----------------------------------------------------------------------
CREATE OR REPLACE TRIGGER nuevo_pok 
    AFTER INSERT ON tipo_poke FOR EACH ROW
    DECLARE
        v_mov movimiento.id_mov%type;
        v_contador number(5);
        v_contando number(5) := 1;
        CURSOR c_mov_tipo is
            SELECT id_mov 
                FROM movimiento
                WHERE id_tipo = :NEW.id_tipo;
    BEGIN
        OPEN c_mov_tipo;
        SELECT count(id_mov) 
            INTO v_contador
            FROM movimiento 
            WHERE id_tipo = :NEW.id_tipo;
        FOR v_contando IN 1..v_contador LOOP
            FETCH c_mov_tipo INTO v_mov;
            INSERT INTO movimiento_poke 
            values (:NEW.id_pokemon, v_mov);
        END LOOP;
        CLOSE c_mov_tipo;
    END;
/

CREATE OR REPLACE TRIGGER nuevo_mov
AFTER INSERT ON movimiento FOR EACH ROW
    DECLARE
    v_id_pokemon tipo_poke.id_pokemon%type;
    v_contador number(5);
    v_contando number(5) := 1;
    CURSOR c_sea_poke is
        SELECT id_pokemon FROM tipo_poke
        WHERE id_tipo = :NEW.id_tipo;
    BEGIN
        OPEN c_sea_poke;
        SELECT count(id_pokemon) INTO v_contador
        FROM tipo_poke
        WHERE id_tipo = :NEW.id_tipo;
        FOR v_contando IN 1..v_contador LOOP
            FETCH c_sea_poke INTO v_id_pokemon;
            INSERT INTO movimiento_poke 
            values (:NEW.id_mov, v_id_pokemon);
        END LOOP;
        CLOSE c_sea_poke;
    END;
/

-----------------------------------------------------------------------
--INGRESAR TIPO DE POKEMONES
-----------------------------------------------------------------------
SET SERVEROUTPUT ON
BEGIN 
    Into_Tipo ('Siniestro');
    Into_Tipo ('Fuego');
    Into_Tipo ('Lucha');
    Into_Tipo ('Acero');
    Into_Tipo ('Hada');
    Into_Tipo ('Acero');
END;
/

-----------------------------------------------------------------------
--INGRESAR MOVIMIENTO
-----------------------------------------------------------------------
BEGIN 
    Into_Poke_Mov ('Ladron', 1, 60, 15, 100);
    Into_Poke_Mov ('Lanzallamas', 2, 80, 5, 95);
    Into_Poke_Mov ('Patada baja', 3, 0, 15, 100);
    Into_Poke_Mov ('Golpe meteoro', 4, 90, 10, 100);
    Into_Poke_Mov ('Defensa métalica', 4, 0, 20, 100);
    Into_Poke_Mov ('Dulce beso', 5, 0, 10, 75);
    Into_Poke_Mov ('Explosión mística', 5, 100, 5, 100);
END;
/

-----------------------------------------------------------------------
--INGRESAR FORMA EVOLUCIÓN
-----------------------------------------------------------------------
BEGIN 
    Into_Forma_Evo('Ir a un lugar específico');
    Into_Forma_Evo('Dar vueltas');
END;
/

-----------------------------------------------------------------------
--INGRESAR POKEMONES
-----------------------------------------------------------------------
BEGIN 
    Intro_Poke_tipo1_SE ('Zorua', '50', '1.00', 1, 60, 90, 75, 40, 100, 95);
    Intro_Poke_tipo1_SE ('Alcrimie', '63', '0.95', 5, 70, 85, 66, 47, 60, 80);
END;
/

BEGIN 
    Intro_Poke_tipo2_SE ('Infernape', '178', '1.80', 2, 3, 75, 67, 45, 78, 88, 100);
    Intro_Poke_tipo2_SE ('Lucario', '157', '1.55', 3, 4, 88, 100, 78, 73, 80, 187);
    Intro_Poke_tipo2_SE ('Mawlie', '55', '0.65', 4, 5, 90, 95, 85, 75, 80, 100);
END;
/

BEGIN
    Into_Poke_Evo1 ('Zoroark', '150', '1.95', 1, 68, 94, 85, 42, 100, 150, 1, 1);
END;
/

-----------------------------------------------------------------------
--INGRESAR POKEMONES CON ERROR 
-----------------------------------------------------------------------
BEGIN
    Intro_Poke_tipo1_SE ('Pancham', '20', '0.60', 3, 70, 85, 66, 47, 60, 680);
END;
/

BEGIN
    Into_Poke_Evo1 ('Alcrimie Gigamax', '200', '30', 1, 68, 94, 85, 42, 100, 650, 1, 1);
END;
/

---------------------------------------------------------------------------------
--Vistas
---------------------------------------------------------------------------------
CREATE OR REPLACE VIEW poke_movimiento AS    
    SELECT p.nombre, m.nombre_mov 
    FROM movimiento m, pokedex p, movimiento_poke mp
    WHERE (p.id_pokemon = mp.id_pokemon) AND (mp.id_mov = m.id_mov);

CREATE OR REPLACE VIEW pokemon_siniestro AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadistica e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 1)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW pokemon_fuego AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadistica e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 2)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW pokemon_lucha AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadistica e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 3)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW pokemon_acero AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadistica e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 4)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW pokemon_hada AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadistica e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 5)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW poke_tipo AS
    SELECT p.id_pokemon, p.nombre, t.nombre_tipo
    FROM pokedex p, tipo t, tipo_poke tp
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo);

