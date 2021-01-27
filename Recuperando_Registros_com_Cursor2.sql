DECLARE
    v_segmercado_id cliente.SEGMERCADO_ID%type := 2;
    CURSOR cur_cliente2 is -- basicamente um resultSET
        select ID
        from CLIENTE;
begin
    for cli_rec IN cur_cliente2
        loop
            ATUALIZAR_CLI_SEG_MERCADO(cli_rec.ID, v_segmercado_id);
        end loop;

    commit;
end;

select *
from cliente;