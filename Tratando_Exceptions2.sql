create PROCEDURE ATUALIZAR_CLI_SEG_MERCADO
    (p_id cliente.id%type,
     p_segmercado_id IN cliente.segmercado_id%type)
IS
    e_cliente_id_inexistente exception ;
BEGIN
    UPDATE CLIENTE
        SET SEGMERCADO_ID = p_segmercado_id
        WHERE id = p_id;
    IF SQL%NOTFOUND then
        RAISE e_cliente_id_inexistente;
    END IF;
    COMMIT;

EXCEPTION
    WHEN e_cliente_id_inexistente then
        raise_application_error(-20100, 'Cliente inexistente');
end;
    
begin
    ATUALIZAR_CLI_SEG_MERCADO(10,1);
end;
