CREATE OR REPLACE PROCEDURE ATUALIZAR_CLI_SEG_MERCADO
    (p_id cliente.id%type,
     p_segmercado_id IN cliente.segmercado_id%type)
IS
BEGIN
    UPDATE CLIENTE
        SET SEGMERCADO_ID = p_segmercado_id
        WHERE id = p_id;
    COMMIT;
end;