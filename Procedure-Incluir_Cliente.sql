create or replace procedure incluir_cliente
    (p_id in cliente.id%type,
     p_razao_social IN cliente.razao_social%type,
     p_CNPJ cliente.CNPJ%type, -- parametro default é de entrada
     p_segmercado_id IN cliente.segmercado_id%type,
     p_faturamento_previsto IN cliente.faturamento_previsto%type)
is
    v_categoria cliente.categoria%type;
    v_CNPJ cliente.CNPJ%type := p_CNPJ ; -- recebe o conteudo do parametro
begin
    v_categoria := categoria_cliente (p_faturamento_previsto);

    FORMAT_CPNJ(v_CNPJ);
    insert into CLIENTE
        values (p_id, upper(p_razao_social),v_CNPJ, p_segmercado_id,
                sysdate, p_faturamento_previsto, v_categoria);
    COMMIT;
end;

begin
    incluir_cliente(1, 'SUPERMERCADO XYZ', '12345', NULL, 150000);
    COMMIT;
end;

begin
    incluir_cliente(3, 'SUPERMERCADO XING LING', '612813', NULL, 90000);
    COMMIT;
end;

begin
    incluir_cliente(4, 'SUPERMERCADO XYZ', '52615', NULL, 9000);
    COMMIT;
end;

begin
    incluir_cliente(5, 'Industria RTY', '12378', NULL, 110000);
    COMMIT;
end;


select * from cliente;