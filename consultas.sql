USE locacao_veiculos;

-- 1) Perda financeira por manutenção (sem reserva = perda proporcional aos dias)
SELECT
    c.numero AS contrato,
    v.prefixo,
    v.placa,
    c.valor_mensal_veiculo AS valor_mensal,
    m.dias_parado,
    CASE WHEN s.id_substituicao IS NULL THEN 'Sem reserva' ELSE 'Com reserva' END AS situacao,
    CASE WHEN s.id_substituicao IS NULL
         THEN ROUND(c.valor_mensal_veiculo / 30, 2) * m.dias_parado
         ELSE 0 END AS perda
FROM manutencao m
JOIN veiculo v ON v.id_veiculo = m.id_veiculo
JOIN contrato c ON c.id_contrato = v.id_contrato
LEFT JOIN substituicao s ON s.id_manutencao = m.id_manutencao;

-- 2) INSERIR um veículo novo
INSERT INTO veiculo (id_contrato, prefixo, placa, marca, modelo, ano, tipo)
VALUES (1, '1004', 'ABC1D26', 'Fiat', 'Strada', 2025, 'TITULAR');
SELECT * FROM veiculo;

-- 3) ALTERAR os dados do veículo 1001
UPDATE veiculo
SET marca = 'Toyota', modelo = 'Hilux', ano = 2026
WHERE prefixo = '1001';
SELECT * FROM veiculo;

-- 4) ELIMINAR o veículo inserido no passo 2
DELETE FROM veiculo
WHERE prefixo = '1004';
SELECT * FROM veiculo;
