


CREATE DATABASE Star_Schema;
USE Star_Schema;

-- Criar banco
CREATE DATABASE IF NOT EXISTS star_schema_vendas;
USE star_schema_vendas;

---------------------------------------------------------
-- DIMENSÃO PRODUTO
---------------------------------------------------------
CREATE TABLE dim_produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL
);

INSERT INTO dim_produto (nome_produto) VALUES
('Produto A'),
('Produto B'),
('Produto C'),
('Produto D'),
('Produto E');

---------------------------------------------------------
-- DIMENSÃO TIPO DE DESCONTO
---------------------------------------------------------
CREATE TABLE dim_desconto (
    id_desconto INT AUTO_INCREMENT PRIMARY KEY,
    tipo_desconto ENUM('baixo', 'medio', 'alto') NOT NULL
);

INSERT INTO dim_desconto (tipo_desconto) VALUES
('baixo'), ('medio'), ('alto');

---------------------------------------------------------
-- DIMENSÃO DATA
---------------------------------------------------------
CREATE TABLE dim_data (
    id_data INT AUTO_INCREMENT PRIMARY KEY,
    data_completa DATE NOT NULL,
    dia INT NOT NULL,
    mes INT NOT NULL,
    ano INT NOT NULL,
    nome_mes VARCHAR(20) NOT NULL
);

-- Exemplo de datas (adicione mais se quiser)
INSERT INTO dim_data (data_completa, dia, mes, ano, nome_mes) VALUES
('2024-01-10', 10, 1, 2024, 'Janeiro'),
('2024-02-15', 15, 2, 2024, 'Fevereiro'),
('2024-03-20', 20, 3, 2024, 'Março'),
('2024-04-05', 5, 4, 2024, 'Abril'),
('2024-05-12', 12, 5, 2024, 'Maio');

---------------------------------------------------------
-- TABELA FATO
---------------------------------------------------------
CREATE TABLE fato_vendas (
    id_fato INT AUTO_INCREMENT PRIMARY KEY,

    -- FKs
    id_produto INT NOT NULL,
    id_desconto INT NOT NULL,
    id_data INT NOT NULL,

    -- Métricas
    unidades_vendidas INT NOT NULL,
    produtos_manufaturados INT NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    vendas_totais DECIMAL(10,2) NOT NULL,
    gross_sales DECIMAL(10,2) NOT NULL,
    valor_total_descontos DECIMAL(10,2) NOT NULL,
    sales DECIMAL(10,2) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    lucro DECIMAL(10,2) NOT NULL,
    meta DECIMAL(10,2) NOT NULL,

    -- Relacionamentos
    FOREIGN KEY (id_produto) REFERENCES dim_produto(id_produto),
    FOREIGN KEY (id_desconto) REFERENCES dim_desconto(id_desconto),
    FOREIGN KEY (id_data) REFERENCES dim_data(id_data)
);

---------------------------------------------------------
-- INSERIR DADOS DE EXEMPLO NA FATO
---------------------------------------------------------
INSERT INTO fato_vendas (
    id_produto, id_desconto, id_data,
    unidades_vendidas, produtos_manufaturados, preco_venda,
    vendas_totais, gross_sales, valor_total_descontos,
    sales, cogs, lucro, meta
)
VALUES
(1, 1, 1, 100, 120, 50.00, 5000.00, 5200.00, 200.00, 4800.00, 3000.00, 1800.00, 4800.00 * 1.20),
(2, 2, 2, 80, 100, 70.00, 5600.00, 6000.00, 400.00, 5200.00, 3500.00, 1700.00, 5200.00 * 1.20),
(3, 3, 3, 60, 80, 90.00, 5400.00, 5800.00, 300.00, 5100.00, 3300.00, 1800.00, 5100.00 * 1.20),
(4, 1, 4, 40, 60, 40.00, 1600.00, 1700.00, 100.00, 1500.00, 900.00, 600.00, 1500.00 * 1.20),
(5, 2, 5, 30, 50, 30.00, 900.00, 950.00, 50.00, 850.00, 500.00, 350.00, 850.00 * 1.20);
DROP TABLE IF EXISTS fato_vendas;

SHOW TABLES;

SELECT * FROM (dim_data);

SELECT * FROM (dim_desconto);

SHOW DATABASES;

use star_schema;

CREATE USER 'powerbiuser'@'localhost' IDENTIFIED BY 'Victor1010@124';
GRANT ALL PRIVILEGES ON *.* TO 'powerbiuser'@'localhost';
FLUSH PRIVILEGES;
DROP USER IF EXISTS 'powerbiuser'@'localhost';

CREATE USER 'powerbiuser'@'localhost' IDENTIFIED BY 'Victor1010@124';

GRANT ALL PRIVILEGES ON *.* TO 'powerbiuser'@'localhost';
FLUSH PRIVILEGES;

