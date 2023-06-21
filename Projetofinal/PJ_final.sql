Create table Clientes (
	id_cliente serial primary key,
	Nome varchar(15) NOT NULL,
	Sobrenome varchar(15) NOT NULL,
	CPF	varchar(20) unique, 
	Telefone varchar(20) NOT NULL,
	Email varchar(50) NOT NULL,
	CEP	varchar(15)NOT NULL,
	Endereco varchar(100) NOT NULL,
	unique (CPF, id_cliente));

	
insert into Clientes (id_cliente,Nome, Sobrenome, CPF,Telefone,Email, CEP, Endereco)
Values 
	('001', 'Kamilly', 'Morais','592.049.243-06','(85) 98250-9172','kamilly_morais@gmail.com','60332-610','Rua Edu da Gaita, 169, Barra do Ceará, Fortaleza, CE'),
	('002', 'Joaquim ', 'Freitas','368.692.543-54','(88) 99722-6153','joaquimdfreitas@gmail.com','63101-390','Rua Manuel Monteiro, 333, Pinto Madeira, Crato, CE'),
	('003', 'Mateus', 'Caetano','099.217.293-49','(85) 99393-2344','mateus_caue_caetano@gmail.com','60866-474','Rua Ulisses Tercelão, 179, Jangurussu, Fortaleza, CE'),
	('004', 'Marlene', 'Peixoto','437.879.103-01','(85) 99409-8975','marlene_s_peixoto@gmail.com','61932-692','Rua Jardim Paraíso I, 695, Pajuçara, Maracanaú, CE'),
	('005', 'Ariane', 'Fernandes','658.412.673-02','(85) 99130-4606','fernandes_ariane@gmail.com','60015-170','Rua Alerta, 888, Farias Brito, Fortaleza, CE');

Create table Produtos (
	id_bordado serial primary key,
	Categoria varchar(50) NOT NULL,
	nome_risco varchar(50) NOT NULL,
	tecido	varchar(50) NOT NULL, 
	qnt_estoque int,
	tipo_bordado varchar(50) NOT NULL,
	metragem varchar(15) NOT NULL,
	preco int,
	unique (id_bordado));

	
insert into Produtos (id_bordado,Categoria,nome_risco,
	tecido, qnt_estoque,tipo_bordado,metragem,preco)
Values
	('001','manual','Ponto Cruz','Etamine',1,'toalha de mesa','1,5 m',60),
	('002','manual','Ponto Cruz','Algodão cru',1,'toalha de mesa','1,5 m',62),
	('003','manual','Ponto Cruz','Linho',1,'toalha de mesa','1,5 m',65),
	('004','manual','Ponto Cruz','Etamine',1,'toalha de mesa','2',70),
	('005','manual','Ponto Cruz','Algodão cru',1,'toalha de mesa','2',72),
	('076','semi manual','Cheio normal','Linho',1,'guardanapos','0,20',94),
	('077','semi manual','Cheio normal','Linho',1,'guardanapos','0,30',97);


Create table Vendas (
	code_venda serial primary key,
	id_cliente serial,
	id_bordado serial,
	data_venda	varchar(50), 
	preco_uni int,
	tecido varchar(50) NOT NULL,
	preco_total int,
	unique (code_venda),
	FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente),
    FOREIGN KEY (id_bordado) REFERENCES Produtos (id_bordado));
	
INSERT INTO Vendas (id_cliente, id_bordado, data_venda, preco_uni, tecido, preco_total)
VALUES 
	('001', '001', '2023-06-21', 60, 'Etamine', 60),
	('002', '002', '2023-06-21', 62, 'Algodão cru', 62),
	('003', '003', '2023-06-21', 65, 'Linho', 65),
	('004', '004', '2023-06-21', 70, 'Etamine', 70),
	('005', '005', '2023-06-21', 72, 'Algodão cru', 72);
