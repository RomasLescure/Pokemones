-----------------------------------------------------------------------------------------
--INGRESAR TIPO DE POKEMONES
-----------------------------------------------------------------------------------------
BEGIN 
    Into_Poke_Tipo ('Siniestro');
    Into_Poke_Tipo ('Fuego');
    Into_Poke_Tipo ('Lucha');
    Into_Poke_Tipo ('Acero');
    Into_Poke_Tipo ('Hada');
    Into_Poke_Tipo ('Acero');
END;
/

-----------------------------------------------------------------------------------------
--INGRESAR MOVIMIENTO
-----------------------------------------------------------------------------------------
BEGIN 
    Into_Poke_Tipo ('Ladron', 1, );
    Into_Poke_Tipo ('Fuego');
    Into_Poke_Tipo ('Lucha');
    Into_Poke_Tipo ('Acero');
    Into_Poke_Tipo ('Hada');
    Into_Poke_Tipo ('Acero');
END;
/


-----------------------------------------------------------------------------------------
--INGRESAR POKEMONES
-----------------------------------------------------------------------------------------
BEGIN 
    Intro_Poke_tipo1_SE ('Zorua', '50', '1.00', 1, 60, 90, 75, 40, 100, 95);
END;
/

BEGIN 
    Intro_Poke_tipo2_SE ('Infernape', '178', '1.80', 2, 3, 75, 67, 45, 78, 88, 100);
    Intro_Poke_tipo2_SE ('Lucario', '157', '1.55', 3, 4, 88, 100, 78, 73, 80, 187);
    Intro_Poke_tipo2_SE ('Mawlie', '55', '0.65', 4, 5, 90, 95, 85, 75, 80, 100);
END;
/

BEGIN
    Into_Poke_Evo ('Zoroark', '150', '1.95', 1, 68, 94, 85, 42, 100, 150, 1, 1);
    Into_Poke_Evo ('Alcrimie', '63', '0.95', 5, 70, 85, 66, 47, 60, 80, 2, 2);
END;
/
