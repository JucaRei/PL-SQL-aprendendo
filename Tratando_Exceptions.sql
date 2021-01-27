create procedure incluir_cliente
    (p_id in cliente.id%type,
     p_razao_social IN cliente.razao_social%type,
     p_CNPJ cliente.CNPJ%type, -- parametro default é de entrada
     p_segmercado_id IN cliente.segmercado_id%type,
     p_faturamento_previsto IN cliente.faturamento_previsto%type)
is
    v_categoria cliente.categoria%type;
    v_CNPJ cliente.CNPJ%type := p_CNPJ ;
    e_null exception;
    pragma exception_init ( e_null, -1400 );    --associar o cod de erro
begin
    v_categoria := categoria_cliente (p_faturamento_previsto);

    FORMAT_CPNJ(v_CNPJ);
    insert into CLIENTE
        values (p_id, upper(p_razao_social),v_CNPJ, p_segmercado_id,
                sysdate, p_faturamento_previsto, v_categoria);
    COMMIT;

EXCEPTION
    WHEN dup_val_on_index then
        raise_application_error(-20010, 'Cliente já cadastrado');
    WHEN e_null then
        raise_application_error(-20015, 'A coluna ID tem que ter preenchimento obrigatório');
    WHEN others then
        raise_application_error(-20020, sqlerrm() );
end;


begin
    incluir_cliente(4, 'SUPERMERCADO XYZ', '52615', NULL, 9000);
    COMMIT;
end;

begin
    incluir_cliente(6, 'Industria RTY', '12378', 10, 110000);
    COMMIT;
end;

ccccc