CREATE OR REPLACE VIEW POKE_MOVIMIENTO AS    
    SELECT p.nombre, m.nombre_mov 
    FROM movimientos m, pokedex p, movimientos_poke mp
    WHERE (p.id_pokemon = mp.id_pokemon) AND (mp.id_mov = m.id_mov);