-----------------------------------------------------------------------
--Procedimiento 3
-----------------------------------------------------------------------
CREATE OR CREATE PROCEDURE Into_Poke_Mov(
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
	v_next in pokedex.id_pokemon%type;
BEGIN
	v_next := id_pokemon.nextval;
	INSERT INTO pokedex 
        VALUES (v_next, p_nombre, p_altura, p_peso);
	--funcion1
	INSERT INTO estadistica 
        VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def-esp,
	p_vida, p_vel, res_funcion1);
	INSERT INTO tipo_poke 
        VALUES (v_next, p_tipo);
    INSERT INTO evolucion_poke
        VALUES (v_next.nextval, p_idpokeant, p_idforma);
EXCEPTION
	--invocar error
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE(‘Valores duplicados’);
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(‘Error desconocido’);
END;


-----------------------------------------------------------------------
--Procedimiento 4
-----------------------------------------------------------------------
CREATE OR CREATE PROCEDURE Into_Poke_Mov(
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
	v_next in pokedex.id_pokemon%type;
BEGIN
	v_next := id_pokemon.nextval;
	INSERT INTO pokedex 
        VALUES (v_next, p_nombre, p_altura, p_peso);
	--funcion1
	INSERT INTO estadistica 
        VALUES (v_next, p_ataque, p_defensa, p_ata_esp, p_def-esp,
	p_vida, p_vel, res_funcion1);
	INSERT INTO tipo_poke 
        VALUES (v_next, p_tipo);
    INSERT INTO tipo_poke 
        VALUES (v_next, p_tipo2);
    INSERT INTO evolucion_poke
        VALUES (v_next.nextval, p_idpokeant, p_idforma);
EXCEPTION
	--invocar error
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE(‘Valores duplicados’);
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(‘Error desconocido’);
END;

-----------------------------------------------------------------------
--Procedimiento 5
-----------------------------------------------------------------------
CREATE OR REPLACE SEQUENCE id_nuevoMov
	start with 1 
	increment by 1;

CREATE OR CREATE PROCEDURE Into_Poke_Mov(
	p_nombre in movimientos.nombre_mov%type,
    p_poder in movimientos.poder%type,
    p_ppt in movimientos.power_point%type,
    p_presicion in movimientos.presicion%type,
) IS
BEGIN
    INSERT INTO movimientos
        VALUES (id_nuevoMov.nextval, p_nombre, p_poder, p_ppt, p_presicion);
EXCEPTION
	--invocar error
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE(‘Valores duplicados’);
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(‘Error desconocido’);
END;

-----------------------------------------------------------------------
--Procedimiento 6
-----------------------------------------------------------------------
CREATE OR REPLACE SEQUENCE id_nuevoPoke
	start with 1 
	increment by 1;

CREATE OR CREATE PROCEDURE Into_Poke_Tipo(
	p_nombre in tipo.nombre_tipo%type
) 
BEGIN
    INSERT INTO tipo_poke
        VALUES (id_nuevoPoke.nextval, p_nombre);
EXCEPTION
	--invocar error
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE(‘Valores duplicados’);
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(‘Error desconocido’);
END;

-----------------------------------------------------------------------
--Procedimiento 7
-----------------------------------------------------------------------
CREATE OR REPLACE SEQUENCE id_Evolucion
	start with 1 
	increment by 1;

CREATE OR CREATE PROCEDURE Into_Evoluacion(
	p_descripcion in forma_evolucion.nombre%type
) 
BEGIN
    INSERT INTO evolucion_poke
        VALUES (id_Evolucion.nextval, p_descripcion);
EXCEPTION
	--invocar error
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE(‘Valores duplicados’);
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(‘Error desconocido’);
END;