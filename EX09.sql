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

# QUESTÃO 1.2 CASE
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
---- FUNÇÃO SOMA
CREATE OR REPLACE FUNCTION soma ( n INT, n1
INT) RETURNS INT AS
$$
BEGIN
RETURN n + n1;
END;
$$ LANGUAGE plpgsql;
---- FUNÇÃO Subtração
CREATE OR REPLACE FUNCTION sub ( n INT, n1
INT) RETURNS INT AS
$$
BEGIN
RETURN n - n1;
END;
$$ LANGUAGE plpgsql;
---- FUNÇÃO Multiplicação
CREATE OR REPLACE FUNCTION mul ( n INT, n1
INT) RETURNS INT AS
$$
BEGIN
RETURN n * n1;
END;
$$ LANGUAGE plpgsql;
---- FUNÇÃO Divisão
CREATE OR REPLACE FUNCTION divi ( n INT, n1
INT) RETURNS FLOAT AS
$$
BEGIN
RETURN n / n1;
END;
$$ LANGUAGE plpgsql;

# QUESTÃO 1.3
DO $$
DECLARE 
n INT :=  valor_aleatorio_entre(1,100);
n1 INT := valor_aleatorio_entre(1,100);
op INT := valor_aleatorio_entre(1,4);
r NUMERIC (5,2);
BEGIN
 RAISE NOTICE 'Primeiro valor gerado: %', n;
 RAISE NOTICE 'Primeiro valor gerado: %', n1;
 RAISE NOTICE 'Operação escolhida: %', op;

    IF op = 1 THEN
        r := soma(n,n1);
        RAISE NOTICE '% + % = %', n, n1, r;

    ELSIF op = 2 THEN
        r := sub(n,n1);
        RAISE NOTICE '% - % = %', n, n1, r;

    ELSIF op = 3 THEN
        r := mul(n,n1);
        RAISE NOTICE '% * % = %', n, n1, r;

     
        ELSE
        r := divi(n,n1);
        RAISE NOTICE '% * % = %', n, n1, r;
    END IF;
END;
$$

# QUESTÃO 1.3 CASE
DO $$
DECLARE
    op INTEGER := valor_aleatorio_entre(1, 4);
    n1 INTEGER := valor_aleatorio_entre(1, 10);
    n2 INTEGER := valor_aleatorio_entre(1, 10);
    resultado NUMERIC;
BEGIN    

    RAISE NOTICE 'Operação escolhida: %', op;

    CASE op
        WHEN 1 THEN
            resultado := n1 + n2;
            RAISE NOTICE '% + % = %', n1, n2, resultado;

        WHEN 2 THEN
            resultado := n1 - n2;
            RAISE NOTICE '% - % = %', n1, n2, resultado;

        WHEN 3 THEN
            resultado := n1 * n2;
            RAISE NOTICE '% * % = %', n1, n2, resultado;

        WHEN 4 THEN
            CASE
                WHEN n2 <> 0 THEN
                    resultado := n1 / n2;
                    RAISE NOTICE '% / % = %', n1, n2, resultado;
                ELSE
                    RAISE NOTICE 'Divisão por zero!';
            END CASE;
    END CASE;

END;
$$;