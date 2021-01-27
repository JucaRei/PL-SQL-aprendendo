CREATE OR REPLACE PROCEDURE FORMAT_CPNJ
    (p_cnpj IN OUT cliente.CNPJ%TYPE)
IS
BEGIN
    p_cnpj := substr(p_cnpj,1,2) || '/' || substr(p_cnpj,3);
end;

--     SQLDEVELOPER
VARIABLE g_cnpj varchar2(100)
EXECUTE :g_cnpj := '12345'
PRINT g_cnpj

DECLARE
    g_cnpj varchar2(100);
BEGIN
    FORMAT_CPNJ(:g_cnpj);
    g_cnpj := '12345';
    DBMS_OUTPUT.put_line(g_cnpj);
end;

