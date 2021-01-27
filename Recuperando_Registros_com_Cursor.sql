DECLARE
    v_id cliente.id%type;
    v_segmercado_id cliente.SEGMERCADO_ID%type := 1;
    CURSOR cur_cliente is  -- basicamente um resultSET
        select ID
            from CLIENTE;
begin
    open cur_cliente;
    loop
        fetch cur_cliente into v_id;
        exit when cur_cliente%NOTFOUND;
        ATUALIZAR_CLI_SEG_MERCADO(v_id, v_segmercado_id);
    end loop;
    close cur_cliente;
    commit;
end;

select * from cliente;