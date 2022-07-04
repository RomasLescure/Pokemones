-----------------------------------------------------------------------------------------
--INGRESAR TIPO DE POKEMONES
-----------------------------------------------------------------------------------------
BEGIN 
    Into_Tipo ('Siniestro');
    Into_Tipo ('Fuego');
    Into_Tipo ('Lucha');
    Into_Tipo ('Acero');
    Into_Tipo ('Hada');
    Into_Tipo ('Acero');
END;
/

-----------------------------------------------------------------------------------------
--INGRESAR MOVIMIENTO
-----------------------------------------------------------------------------------------
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

-----------------------------------------------------------------------------------------
--INGRESAR FORMA EVOLUCIÓN
-----------------------------------------------------------------------------------------
BEGIN 
    Into_Forma_Evo('Ir a un lugar específico');
    Into_Forma_Evo('Dar vueltas');
END;
/

-----------------------------------------------------------------------------------------
--INGRESAR POKEMONES
-----------------------------------------------------------------------------------------
BEGIN 
    Intro_Poke_tipo1_SE ('Zorua', '50', '1.00', 1, 60, 90, 75, 40, 100, 95);
    Intro_Poke_tipo1_SE ('Alcrimie', '63', '0.95', 5, 70, 85, 66, 47, 60, 80);
    Intro_Poke_tipo1_SE ('Milcery', '63', '0.95', 5, 70, 85, 66, 47, 60, 680);
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