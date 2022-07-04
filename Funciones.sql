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
          DBMS_OUTPUT.PUT_LINE ('El Pokémon no se ingreso a la base de datos: estadistica ERRONEAS, POKEMON INEXISTENTE');
    END sumatoria_mov;
/