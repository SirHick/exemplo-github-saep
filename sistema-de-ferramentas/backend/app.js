const express = require('express');
const cors = require('cors');
const connection = require('./db');

const server = express();
server.use(cors());
server.use(express.json());

/**
 * ROTA: GET /produtos
 * OBJETIVO: Listar todos os produtos cadastrados no banco de dados.
 * ATENDE: RF04 (listagem de Produtos).
 */

server.get('/produtos', (req, res) => {
    const sql = 'SELECT * FROM PRODUTO';

    connection.query(sql, (erro, resultados) => {
        if (erro) {
            return res.status(500).json({ erro: erro.message});
        }
        return res.json(resultados);
    });
});

/**
 * ROTA: GET /produtos/ordenados
 * OBJETIVO: Listar os produtos em ordem alfabética de nome (A a Z).
 * ATENDE: Requisito 7.1.1 do SAEP (Ordenação Alfabética para a seleção no cadastro...)
 */

server.get('/produtos/ordenados', (req, res) => {
    const sql = 'SELECT * FROM PRODUTO ORDER BY nome ASC';

    connection.query(sql, (erro, resultados) => {
        if(erro){
            return res.status(500).json({erro: erro.message});
        }
        return res.json(resultados);
    });
});

const port = 3025;

server.listen(port, () => {
    console.log(`Servidor rodando na porta: ${port}`);
});