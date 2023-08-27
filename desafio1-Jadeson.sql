# Recuperações simples com SELECT Statement
# Recuperação clientes com SELECT
SELECT * FROM Cliente;

# Recuperação produtos com SELECT
SELECT * FROM Produto;

# Filtros com WHERE Statement
# Recuperação pedidos de um cliente especifico com WHERE
SELECT * FROM Pedido WHERE cliente_id = 123;

# Recuperação produtos com preço acima de um valor específico
SELECT * FROM Produto WHERE preco > 62.00;


# Expressões para gerar atributos derivados
# Recuperar valor total de um pedido
SELECT pedido_id, SUM(quantidade * preco) AS valor_total
FROM ItemPedido
JOIN Produto ON ItemPedido.produto_id = Produto.produto_id
WHERE pedido_id = 456
GROUP BY pedido_id;

# Ordenações dos dados com ORDER BY
# Recuperar os produtos ordenados por preço
SELECT * FROM Produto ORDER BY preco DESC;


# Condições de filtros aos grupos – HAVING Statement
# Recuperar fornecedores que têm produtos com estoque abaixo de 10 unidades
SELECT Fornecedor.nome, COUNT(*) AS produtos_pouco_estoque
FROM Fornecedor
JOIN Estoque ON Fornecedor.fornecedor_id = Estoque.fornecedor_id
WHERE Estoque.quantidade < 15
GROUP BY Fornecedor.nome
HAVING produtos_pouco_estoque > 0;


# Junções entre tabelas para perspectiva mais complexa dos dados
# Recuperar os produtos e seus fornecedores
SELECT Produto.nome AS nome_produto, Fornecedor.nome AS nome_fornecedor
FROM Produto
JOIN Estoque ON Produto.produto_id = Estoque.produto_id
JOIN Fornecedor ON Estoque.fornecedor_id = Fornecedor.fornecedor_id;

# Recuperar os clientes que fizeram mais de 4 pedidos
SELECT Cliente.nome, COUNT(Pedido.pedido_id) AS quantidade_pedidos
FROM Cliente
JOIN Pedido ON Cliente.cliente_id = Pedido.cliente_id
GROUP BY Cliente.nome
HAVING quantidade_pedidos > 4;

