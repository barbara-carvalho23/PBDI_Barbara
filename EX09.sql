CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;


# QUESTÃO 1.1 
DO $$
DECLARE
    n INT :=  valor_aleatorio_entre(1,100);
BEGIN
    RAISE NOTICE 'Valor gerado: %', n;
    IF n % 3 = 0 THEN
        RAISE NOTICE '% é multiplo de 3', n;
    ELSE 
        RAISE NOTICE '% não é multiplo de 3', n;
    END IF;
END;
$$
# QUESTÃO 1.1 CASE 
DO $$
DECLARE
    n INT :=  valor_aleatorio_entre(1,100);
BEGIN 
     RAISE NOTICE 'Valor gerado: %', n;
     CASE
        WHEN  n % 3 = 0  THEN
        RAISE NOTICE '% é multiplo de 3',n;
    ELSE 
        RAISE NOTICE '% não é multiplo de 3',n;
    END CASE;
END;
$$
# QUESTÃO 1.2
DO $$
DECLARE
    n INT :=  valor_aleatorio_entre(1,100);
BEGIN
    RAISE NOTICE 'Valor gerado: %', n;
    IF n % 3 = 0 or n % 5 = 0 THEN
        RAISE NOTICE '% é multiplo de 3 e/ou 5',n;
    ELSE 
        RAISE NOTICE '% não é multiplo de 3 e/ou 5',n;
    END IF;
END;
$$

# QUESTÃO 1.1 CASE 
DO $$
DECLARE
    n INT :=  valor_aleatorio_entre(1,100);
BEGIN 
     RAISE NOTICE 'Valor gerado: %', n;
     CASE
        WHEN  n % 3 = 0 or n % 5 = 0 THEN
        RAISE NOTICE '% é multiplo de 3 e/ou 5',n;
    ELSE 
        RAISE NOTICE '% não é multiplo de 3 e/ou 5',n;
    END CASE;
END;
$$