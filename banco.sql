CREATE DATABASE IF NOT EXISTS locacao_veiculos;
USE locacao_veiculos;

CREATE TABLE contratante (
    id_contratante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18)
);

CREATE TABLE contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL UNIQUE,
    id_contratante INT NOT NULL,
    qtd_veiculos INT NOT NULL,
    valor_mensal_veiculo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_contratante) REFERENCES contratante(id_contratante)
);

CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT NOT NULL,
    prefixo VARCHAR(10) NOT NULL,
    placa VARCHAR(8) NOT NULL UNIQUE,
    renavam VARCHAR(15),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    tipo ENUM('TITULAR','RESERVA') NOT NULL DEFAULT 'TITULAR',
    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato)
);

CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    dias_parado INT NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE substituicao (
    id_substituicao INT AUTO_INCREMENT PRIMARY KEY,
    id_manutencao INT NOT NULL,
    id_veiculo_reserva INT NOT NULL,
    FOREIGN KEY (id_manutencao) REFERENCES manutencao(id_manutencao),
    FOREIGN KEY (id_veiculo_reserva) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE faturamento (
    id_faturamento INT AUTO_INCREMENT PRIMARY KEY,
    id_contrato INT NOT NULL,
    mes_referencia DATE NOT NULL,
    valor_previsto DECIMAL(12,2) NOT NULL,
    valor_faturado DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato)
);

-- DADOS DE EXEMPLO (fictícios)
INSERT INTO contratante (nome, cnpj)
VALUES ('SEMAD - Prefeitura Municipal de Goiânia', NULL);

INSERT INTO contrato (numero, id_contratante, qtd_veiculos, valor_mensal_veiculo)
VALUES ('006-2026', 1, 100, 11513.00);

INSERT INTO veiculo (id_contrato, prefixo, placa, tipo) VALUES
(1, '1001', 'ABC1D23', 'TITULAR'),
(1, '1002', 'ABC1D24', 'TITULAR'),
(1, '1003', 'ABC1D25', 'TITULAR'),
(1, '9001', 'XYZ9K88', 'RESERVA');

INSERT INTO manutencao (id_veiculo, data_inicio, data_fim, dias_parado) VALUES
(2, '2026-10-01', '2026-10-05', 5),
(3, '2026-10-01', '2026-10-05', 5);

-- só o veículo 1002 foi substituído pelo reserva
INSERT INTO substituicao (id_manutencao, id_veiculo_reserva) VALUES (1, 4);

INSERT INTO faturamento (id_contrato, mes_referencia, valor_previsto, valor_faturado)
VALUES (1, '2026-10-01', 1151300.00, 1149381.15);
