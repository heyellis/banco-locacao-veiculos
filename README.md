# Banco de dados para controle de locação de veículos

Projeto de extensão da disciplina de Banco de Dados, no Centro Universitário Alves Faria (Unialfa).

## Sobre o projeto

A empresa trabalha com contratos de locação de veículos para órgãos públicos. Cada contrato define uma quantidade de veículos e um valor mensal por veículo. Quando um veículo vai para a manutenção e **não há veículo reserva**, a empresa perde dinheiro pelos dias parados.

Este banco de dados organiza contratos, veículos (prefixo e placa), manutenções, substituições por reserva e faturamento, e calcula a perda automaticamente:

```
Perda = valor mensal do veículo ÷ 30 × dias de manutenção sem reserva
```

## Integrantes

- Ellisama Barbosa Sousa Silva
- Isabella Alvarenga da Silva
- Allyson Figueredo Sousa
- Anderson Antunes Sintra

## Arquivos

| Arquivo | O que tem |
|---|---|
| `banco.sql` | Criação do banco, das tabelas e dados de exemplo |
| `consultas.sql` | Consulta da perda e comandos de inserir, alterar e eliminar |
| `modelo.md` | Diagrama do modelo do banco |

## Como rodar

1. Instale o XAMPP e inicie o **MySQL**.
2. Abra o HeidiSQL (host `127.0.0.1`, usuário `root`, porta `3306`).
3. Execute o `banco.sql` e depois o `consultas.sql`.

## Tecnologias

MySQL (local, via XAMPP) e HeidiSQL.

> Os dados deste repositório são fictícios, usados apenas para demonstração.
