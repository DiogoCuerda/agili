CREATE DATABASE agili;
USE agili;
CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Nome  VARCHAR(45) NOT NULL,
	Senha VARCHAR(45) NOT NULL,
	Permissao CHAR(1) CHECK (Permissao IN ('A', 'C', 'F', 'R')) NOT NULL,
    Ativo BIT NOT NULL
);

CREATE TABLE Item (
    IdItem INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    IdFornecedor INT NOT NULL,
    Descricao VARCHAR(45) NOT NULL,
    Preco NUMERIC(15,2) NOT NULL,
	Ativo BIT,
    CONSTRAINT FK_IdFornecedor FOREIGN KEY (IdFornecedor) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE Pedido (
    IdPedido INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    IdFornecedor INT NOT NULL,
    IdColaborador INT NOT NULL,
    Data DATE NOT NULL,
    CONSTRAINT FK_idFornecedorPedido FOREIGN KEY (idFornecedor) REFERENCES Usuario(idUsuario),
    CONSTRAINT FK_idColaborador FOREIGN KEY (idColaborador) REFERENCES Usuario(idUsuario)
);

CREATE TABLE PedidoItem (
    IdPedido INT NOT NULL,
    IdItem INT NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Quantidade INT NOT NULL,
    PRIMARY KEY (IdPedido, IdItem),
    CONSTRAINT FK_IdPedido FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido),
    CONSTRAINT FK_IdItem FOREIGN KEY (IdItem) REFERENCES Item(IdItem)
);
