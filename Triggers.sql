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
    begin
        OPEN c_mov_tipo;
        SELECT count(id_mov) 
            INTO v_contador
            FROM movimiento 
            WHERE id_tipo = :NEW.id_tipo;
        FOR v_contando IN 1..v_contador LOOP
            FETCH c_mov_tipo INTO v_mov;
            INSERT INTO movimientos_poke 
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
    Begin
        OPEN c_sea_poke;
        SELECT count(id_pokemon) INTO v_contador
        FROM tipo_poke
        WHERE id_tipo = :NEW.id_tipo;
        FOR v_contando IN 1..v_contador LOOP
            FETCH c_sea_poke INTO v_id_pokemon;
            INSERT INTO movimientos_poke 
            values (:NEW.id_mov, v_id_pokemon);
        END LOOP;
        CLOSE c_sea_poke;
    END;
/


		
	
