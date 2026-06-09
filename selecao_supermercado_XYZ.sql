-- Active: 1780941416778@@mysql-1c959a5e-estudante-af5b.h.aivencloud.com@18971@Supermercado_XYZ
SELECT * FROM Produtos;

SELECT nome, preco FROM Produtos;

SELECT nome, quantidade_estoque
FROM Produtos
WHERE quantidade_estoque < 50;

SELECT nome, pontos_fidelidade
FROM Clientes
WHERE pontos_fidelidade > 100;


SELECT nome, cargo, salario
FROM Funcionarios
ORDER BY salario DESC;


SELECT *
FROM Produtos
WHERE id_categoria = 5;


SELECT *
FROM Vendas
WHERE total > 100;


SELECT *
FROM Produtos
WHERE nome LIKE '%LG%';

SELECT *
FROM Clientes
ORDER BY nome;


SELECT nome, preco
FROM Produtos
WHERE preco BETWEEN 5 AND 100;


SELECT Produtos.nome, Categorias.nome
FROM Produtos
JOIN Categorias
ON Produtos.id_categoria = Categorias.id_categoria;


SELECT Produtos.nome, Fornecedores.nome
FROM Produtos
JOIN Fornecedores
ON Produtos.id_fornecedor = Fornecedores.id_fornecedor;


SELECT Vendas.id_venda, Clientes.nome
FROM Vendas
JOIN Clientes
ON Vendas.id_cliente = Clientes.id_cliente;


SELECT Vendas.id_venda, Funcionarios.nome
FROM Vendas
JOIN Funcionarios
ON Vendas.id_funcionario = Funcionarios.id_funcionario;


SELECT Produtos.nome, Filiais.nome
FROM Produtos
JOIN Filiais
ON Produtos.id_filial = Filiais.id_filial;


SELECT ItensVenda.quantidade, Produtos.nome
FROM ItensVenda
JOIN Produtos
ON ItensVenda.id_produto = Produtos.id_produto;


SELECT Compras.id_compra, Fornecedores.nome
FROM Compras
JOIN Fornecedores
ON Compras.id_fornecedor = Fornecedores.id_fornecedor;


SELECT Funcionarios.nome, Filiais.nome
FROM Funcionarios
JOIN Filiais
ON Funcionarios.id_filial = Filiais.id_filial;


SELECT Clientes.nome, Vendas.total
FROM Clientes
JOIN Vendas
ON Clientes.id_cliente = Vendas.id_cliente;


SELECT Vendas.id_venda, Produtos.nome
FROM ItensVenda
JOIN Produtos
ON ItensVenda.id_produto = Produtos.id_produto
JOIN Vendas
ON ItensVenda.id_venda = Vendas.id_venda;



SELECT id_categoria, COUNT(*)
FROM Produtos
GROUP BY id_categoria;


SELECT id_cliente, SUM(total)
FROM Vendas
GROUP BY id_cliente;


SELECT cargo, AVG(salario)
FROM Funcionarios
GROUP BY cargo;


SELECT id_filial, COUNT(*)
FROM Funcionarios
GROUP BY id_filial;


SELECT id_filial, SUM(total)
FROM Vendas
GROUP BY id_filial;


SELECT id_fornecedor, COUNT(*)
FROM Produtos
GROUP BY id_fornecedor;


SELECT id_fornecedor, SUM(total)
FROM Compras
GROUP BY id_fornecedor;


SELECT id_categoria, AVG(preco)
FROM Produtos
GROUP BY id_categoria;


SELECT nome, SUM(pontos_fidelidade)
FROM Clientes
GROUP BY nome;


SELECT id_produto, SUM(quantidade)
FROM ItensVenda
GROUP BY id_produto;


Consulta 1 — Quantidade total de produtos
SELECT COUNT(*) FROM Produtos;


SELECT SUM(quantidade_estoque)
FROM Produtos;


SELECT AVG(preco)
FROM Produtos;


SELECT MAX(preco)
FROM Produtos;


SELECT MIN(preco)
FROM Produtos;


SELECT COUNT(*)
FROM Vendas;


SELECT SUM(total)
FROM Vendas;


SELECT AVG(salario)
FROM Funcionarios;


SELECT MAX(salario)
FROM Funcionarios;


SELECT MIN(salario)
FROM Funcionarios;


SELECT *
FROM Produtos
WHERE preco = (
   SELECT MAX(preco)
   FROM Produtos
);


SELECT *
FROM Produtos
WHERE preco = (
   SELECT MIN(preco)
   FROM Produtos
);


SELECT *
FROM Clientes
WHERE pontos_fidelidade > (
   SELECT AVG(pontos_fidelidade)
   FROM Clientes
);


SELECT *
FROM Funcionarios
WHERE salario = (
   SELECT MAX(salario)
   FROM Funcionarios
);


SELECT *
FROM Produtos
WHERE quantidade_estoque < (
   SELECT AVG(quantidade_estoque)
   FROM Produtos
);


SELECT nome
FROM Clientes
WHERE id_cliente IN (
   SELECT id_cliente
   FROM Vendas
);


SELECT nome
FROM Produtos
WHERE id_produto IN (
   SELECT id_produto
   FROM ItensVenda
);


SELECT nome
FROM Produtos
WHERE id_produto NOT IN (
   SELECT id_produto
   FROM ItensVenda
);


SELECT *
FROM Filiais
WHERE id_filial = (
   SELECT id_filial
   FROM Vendas
   GROUP BY id_filial
   ORDER BY SUM(total) DESC
   LIMIT 1
);


SELECT nome, preco
FROM Produtos
WHERE preco > (
   SELECT AVG(preco)
   FROM Produtos
);
