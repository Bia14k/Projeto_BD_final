Create table Clientes (
	id_cliente varchar(5),
	Nome varchar(15),
	Sobrenome varchar(15),
	CPF	varchar(20)  primary key, 
	Telefone varchar(20),
	Email varchar(50),
	CEP	varchar(15),
	Endereco varchar(100));
	
drop table Clientes;
	
select * from Clientes;
	
insert into Clientes (id_cliente,Nome, Sobrenome, CPF,Telefone,Email, CEP, Endereco)
Values 
	('001', 'Kamilly', 'Morais','592.049.243-06','(85) 98250-9172','kamilly_morais@gmail.com','60332-610','Rua Edu da Gaita, 169, Barra do Ceará, Fortaleza, CE'),
	('002', 'Joaquim ', 'Freitas','368.692.543-54','(88) 99722-6153','joaquimdfreitas@gmail.com','63101-390','Rua Manuel Monteiro, 333, Pinto Madeira, Crato, CE'),
	('003', 'Mateus', 'Caetano','099.217.293-49','(85) 99393-2344','mateus_caue_caetano@gmail.com','60866-474','Rua Ulisses Tercelão, 179, Jangurussu, Fortaleza, CE'),
	('004', 'Marlene', 'Peixoto','437.879.103-01','(85) 99409-8975','marlene_s_peixoto@gmail.com','61932-692','Rua Jardim Paraíso I, 695, Pajuçara, Maracanaú, CE'),
	('005', 'Ariane', 'Fernandes','658.412.673-02','(85) 99130-4606','fernandes_ariane@gmail.com','60015-170','Rua Alerta, 888, Farias Brito, Fortaleza, CE');
	
	

	