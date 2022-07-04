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
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
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
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
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
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
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
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
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