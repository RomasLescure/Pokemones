create or replace sequence id_pokemon
	start with 1 
	increment by 1;

Create or replace procedure Intro_Poke_tipo1_SE(
	p_nombre in pokedex.nombre%type,
	p_peso in pokedex.peso%type,
	p_altura in pokedex.altura%type,
	p_tipo in tipo.nombre_tipo%type,
	p_ataque in estadistica.ataque%type,
	p_defensa in estadistica.defensa%type,
	p_ata_esp in estadistica.ata_esp%type,
	p_def_esp in estadistica.def_esp%type,
	p_vida in estadistica.vida%type,
	p_vel in estadistica.vel%type) is
	v_next in pokedex.id_pokemon%type;
begin
	v_next = id_pokemon.nextval;
	insert into pokedex values (v_next, p_nombre, p_peso, p_altura);
	funcion1
	insert into estadistica values (v_next, p_ataque, p_defensa, p_ata_esp, p_def-esp,
	p_vida, p_vel, res_funcion1);
	insert into tipo_poke values (v_next, p_tipo);
Exception
	invocar error
	WHEN dup_val_on_index THEN
		DBMS_OUTPUT.PUT_LINE(‘Valores duplicados’);
	WHEN others THEN
		DBMS_OUTPUT.PUT_LINE(‘Error desconocido’);

End;
