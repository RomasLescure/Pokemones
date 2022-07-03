-----------------------------------------------------------------------
--Procedimiento 1
-----------------------------------------------------------------------
CREATE OR REPLACE SEQUENCE id_pokemon
	START WITH 1 
	increment by 1;

CREATE OR REPLACE PROCEDURE Intro_Poke_tipo1_SE(
	p_nombre in pokedex.nombre%type,
	p_peso in pokedex.peso%type,
	p_altura in pokedex.altura%type,
	p_tipo in tipo.nombre_tipo%type,
	p_ataque in estadisticas.ataque%type,
	p_defensa in estadisticas.defensa%type,
	p_ata_esp in estadisticas.ata_esp%type,
	p_def_esp in estadisticas.def_esp%type,
	p_vida in estadisticas.vida%type,
	p_vel in estadisticas.vel%type) is
	v_next pokedex.id_pokemon%type;
    v_EV estadisicas.beststat%type;
    BEGIN
        v_next := id_pokemon.nextval;
        INSERT INTO pokedex 
            VALUES (v_next, p_nombre, p_peso, p_altura);
        v_EV := best_stat(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        INSERT INTO estadistica 
            VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def-esp,
        p_vida, p_vel, v_EV);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo);
    EXCEPTION
        --invocar error
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;

-----------------------------------------------------------------------
--Procedimiento 2
-----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE Intro_Poke_tipo1_SE(
	p_nombre in pokedex.nombre%type,
	p_peso in pokedex.peso%type,
	p_altura in pokedex.altura%type,
	p_tipo in tipo.id_tipo%type,
	p_tipo2 in tipo.id_tipo%type,
	p_ataque in estadistica.ataque%type,
	p_defensa in estadistica.defensa%type,
	p_ata_esp in estadistica.ata_esp%type,
	p_def_esp in estadistica.def_esp%type,
	p_vida in estadistica.vida%type,
	p_vel in estadistica.vel%type) is
	v_next in pokedex.id_pokemon%type;
    v_EV estadisicas.beststat%type;
    BEGIN
        v_next := id_pokemon.nextval;
        INSERT INTO pokedex 
            VALUES (v_next, p_nombre, p_peso, p_altura);
        v_EV := best_stat(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        INSERT INTO estadistica 
            VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def-esp,
        p_vida, p_vel, v_EV);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo2);
        
    EXCEPTION
        --invocar error
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;

-----------------------------------------------------------------------
--Procedimiento 3
-----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE Into_Poke_Mov(
	p_nombre in pokedex.nombre%type,
	p_peso in pokedex.peso%type,
	p_altura in pokedex.altura%type,
	p_tipo in tipo.nombre_tipo%type,
	p_ataque in estadistica.ataque%type,
	p_defensa in estadistica.defensa%type,
	p_ata_esp in estadistica.ata_esp%type,
	p_def_esp in estadistica.def_esp%type,
	p_vida in estadistica.vida%type,
	p_vel in estadistica.vel%type,
    p_idpokeant in evolucion_poke.id_pokemonant%type,
    p_idforma in evolucion_poke.id_forma%type) IS
	v_next  pokedex.id_pokemon%type;
    v_EV estadisicas.beststat%type;
    BEGIN
        v_next := id_pokemon.nextval;
        INSERT INTO pokedex 
            VALUES (v_next, p_nombre, p_altura, p_peso);
		v_EV := best_stat(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        INSERT INTO estadistica 
            VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def-esp,
        p_vida, p_vel, v_EV);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo);
        INSERT INTO evolucion_poke
            VALUES (v_next.nextval, p_idpokeant, p_idforma);
    EXCEPTION
        --invocar error
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;


-----------------------------------------------------------------------
--Procedimiento 4
-----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE Into_Poke_Mov(
	p_nombre in pokedex.nombre%type,
	p_peso in pokedex.peso%type,
	p_altura in pokedex.altura%type,
	p_tipo in tipo.nombre_tipo%type,
    p_tipo2 in tipo.nombre_tipo%type,
	p_ataque in estadistica.ataque%type,
	p_defensa in estadistica.defensa%type,
	p_ata_esp in estadistica.ata_esp%type,
	p_def_esp in estadistica.def_esp%type,
	p_vida in estadistica.vida%type,
	p_vel in estadistica.vel%type,
    p_idpokeant in evolucion_poke.id_pokemonant%type,
    p_idforma in evolucion_poke.id_forma%type) IS
	v_next pokedex.id_pokemon%type;
    v_EV estadisicas.beststat%type;
    BEGIN
        v_next := id_pokemon.nextval;
        INSERT INTO pokedex 
            VALUES (v_next, p_nombre, p_altura, p_peso);
        v_EV := best_stat(p_ataque, p_defensa, p_ata_esp, p_def_esp, p_vida, p_vel);
        INSERT INTO estadistica 
            VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def-esp,
        p_vida, p_vel, v_EV);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo);
        INSERT INTO tipo_poke 
            VALUES (v_next, p_tipo2);
        INSERT INTO evolucion_poke
            VALUES (v_next.nextval, p_idpokeant, p_idforma);
    EXCEPTION
        --invocar error
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;

-----------------------------------------------------------------------
--Procedimiento 5
-----------------------------------------------------------------------
CREATE OR REPLACE SEQUENCE id_nuevoMov
	START WITH 1 
	INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE Into_Poke_Mov(
	p_nombre in movimientos.nombre_mov%type,
    p_poder in movimientos.poder%type,
    p_ppt in movimientos.power_point%type,
    p_presicion in movimientos.presicion%type,
) IS
    BEGIN
        INSERT INTO movimientos
            VALUES (id_nuevoMov.nextval, p_nombre, p_poder, p_ppt, p_presicion);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;

-----------------------------------------------------------------------
--Procedimiento 6
-----------------------------------------------------------------------
CREATE OR REPLACE SEQUENCE id_nuevoPoke
	START WITH 1 
	INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE Into_Poke_Tipo(
	p_nombre in tipo.nombre_tipo%type
) IS
    BEGIN
        INSERT INTO tipo_poke
            VALUES (id_nuevoPoke.nextval, p_nombre);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;

-----------------------------------------------------------------------
--Procedimiento 7
-----------------------------------------------------------------------
CREATE OR REPLACE SEQUENCE id_Evolucion
	START WITH 1 
	INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE Into_Evoluacion(
	p_descripcion in forma_evolucion.nombre%type
) IS
    BEGIN
        INSERT INTO evolucion_poke
            VALUES (id_Evolucion.nextval, p_descripcion);
    EXCEPTION
        WHEN dup_val_on_index THEN
            DBMS_OUTPUT.PUT_LINE('Valores duplicados');
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('Error desconocido');
    END;