-----------------------------------------------------------------------
--Vistas
-----------------------------------------------------------------------
CREATE OR REPLACE VIEW POKE_MOVIMIENTO AS    
    SELECT p.nombre, m.nombre_mov 
    FROM movimientos m, pokedex p, movimientos_poke mp
    WHERE (p.id_pokemon = mp.id_pokemon) AND (mp.id_mov = m.id_mov);

CREATE OR REPLACE VIEW pokemon_siniestro AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadisticas e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 1)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW pokemon_fuego AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadisticas e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 2)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW pokemon_lucha AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadisticas e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 3)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW pokemon_acero AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadisticas e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 4)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW pokemon_hada AS
	SELECT p.id_pokemon, p.nombre, t.nombre_tipo, e.ataque, e.defensa, e.ataque_esp, e.defensa_esp, e.vida, e.velocidad
	FROM pokedex p, tipo t, tipo_poke tp, estadisticas e
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo) AND (t.id_tipo = 5)
            AND (p.id_pokemon = e.id_pokemon);

CREATE OR REPLACE VIEW POKE_TIPOS AS
    SELECT p.id_pokemon, p.nombre, t.nombre_tipo
    FROM pokedex p, tipo t, tipo_poke tp
    WHERE (p.id_pokemon = tp.id_pokemon) AND (tp.id_tipo = t.id_tipo);

