DECLARE
    v_id                NUMBER;
    v_segmercado_id     NUMBER;
BEGIN
    v_id := 1;
    v_segmercado_id := 2;
    ATUALIZAR_CLI_SEG_MERCADO(p_id => v_id,p_segmercado_id => v_segmercado_id);
END ;

select * from CLIENTE where id=1;