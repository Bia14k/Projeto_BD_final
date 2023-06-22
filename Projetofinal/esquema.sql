--Database: teste

DROP DATABASE IF EXISTS teste;

CREATE DATABASE teste
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252';

CREATE OR REPLACE FUNCTION validar_cpf()
    RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.CPF IS NULL OR NEW.CPF = '' THEN
        RAISE EXCEPTION 'O CPF não pode ser nulo ou vazio';
    END IF;
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_validar_cpf
    BEFORE INSERT OR UPDATE ON Clientes
    FOR EACH ROW
    EXECUTE FUNCTION validar_cpf();
	
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
	  ('001','manual','Ponto cruz','Etamine','1','toalha de mesa','1.5m', 'R$ 60'),
	  ('002','manual','Ponto cruz','Algodão cru','1','toalha de mesa','1.5m','R$ 62'),
	  ('003','manual','Ponto cruz','Linho','1','toalha de mesa','1.5m','R$ 65'),
	  ('004','manual','Ponto cruz','Etamine','1','toalha de mesa','2m','R$ 70'),
	  ('005','manual','Ponto cruz','Algodão cru','1','toalha de mesa','2m','R$ 72'),
	  ('006','manual','Ponto Cruz','Linho','1','toalha de mesa','2m','R$ 75'),
      ('007','manual','Ponto Cruz','Etamine','1','toalha de mesa','2.5m','R$ 78'),
      ('008','manual','Ponto Cruz','Algodão cru','1','toalha de mesa','2.5m','R$ 81'),
      ('009','manual','Ponto Cruz','Linho','1','toalha de mesa','2.5m','R$ 85'),
	  ('010','manual','Ponto Cruz','Etamine','1','toalha de mesa','3m','R$ 88'),
      ('011','manual','Ponto Cruz','Algodão cru','1','toalha de mesa','3m','R$ 91'),
	  ('012','manual','Ponto Cruz','Linho','1','toalha de mesa','3m','R$ 94'),
	  ('013','semi manual','Rechilieu','Percal','1','toalha de mesa','1.5m','R$ 97'),
	  ('014','semi manual','Rechilieu','Percal','1','toalha de mesa','2m','R$ 100'),
	  ('015','semi manual','Rechilieu','Percal','1','toalha de mesa','2.5m','R$ 103'),
	  ('016','semi manual','Rechilieu','Percal','1','toalha de mesa','3m','R$ 65'),
	  ('017','semi manual','Rechilieu','Linho','1','toalha de mesa','1.5m','R$ 70'),
	  ('018','semi manual','Rechilieu','Linho','1','toalha de mesa','2m','R$ 72'),
	  ('019','semi manual','Rechilieu','Linho','1','toalha de mesa','2.5m','R$ 75'),
	  ('020','semi manual','Rechilieu','Linho','1',  'toalha de mesa','3m','R$ 79'),
	  ('021','semi manual','Cheio normal','Percal','1','toalha de mesa','1.5m','R$ 82'),
	  ('022','semi manual','Cheio normal','Percal','1','toalha de mesa', '2m','R$ 85'),
	  ('023','semi manual','Cheio normal','Percal','1','toalha de mesa','2.5m','R$ 89'),
	  ('025','semi manual','Cheio normal','Linho','1','toalha de mesa','1.5m','R$ 95'),
      ('026','semi manual','Cheio normal','Linho','1','toalha de mesa','2m','R$ 88'),
      ('027','semi manual','Cheio normal','Linho','1','toalha de mesa','2.5m','R$ 91'),
      ('028','semi manual','Cheio normal','Linho','1','toalha de mesa','3m','R$ 94'),
      ('029','manual','Ponto Cruz','Etamine','1','caminho de mesa','1m','R$ 97'),
      ('030','manual','Ponto Cruz','Algodão cru','1','caminho de mesa','1m','R$ 100'),
      ('031','manual','Ponto Cruz','Linho','1','caminho de mesa','1m','R$ 103'),
      ('032','manual','Ponto Cruz','Etamine','1','caminho de mesa','1.5m','R$ 65'),
      ('033','manual','Ponto Cruz','Algodão cru','1','caminho de mesa','1.5m','R$ 70'),
      ('034','manual','Ponto Cruz','Linho','1','caminho de mesa','1.5m', 'R$ 72'),
      ('035','manual','Ponto Cruz','Etamine','1','caminho de mesa','2m','R$ 75'),
      ('036','manual','Ponto Cruz','Algodão cru','1','caminho de mesa','2m','R$ 79'),
      ('037','manual','Ponto Cruz','Linho','1','caminho de mesa','2m','R$ 82'),
      ('038','manual','Ponto Cruz','Etamine','1','caminho de mesa','2.5m','R$ 85'),
      ('040','manual','Ponto Cruz','Linho','1','caminho de mesa','2.5m','R$ 92'),
      ('041','semi manual','Rechilieu','Percal','1','caminho de mesa','1m','R$ 95'),
      ('042','semi manual','Rechilieu','Percal','1','caminho de mesa','1.5m','R$ 88'),
      ('043','semi manual','Rechilieu','Percal','1','caminho de mesa','2m','R$ 91'),
      ('044','semi manual','Rechilieu','Percal','1','caminho de mesa','2.5m','R$ 94'),
      ('045','semi manual','Rechilieu','Linho','1','caminho de mesa','1m','R$ 97'),
      ('046','semi manual','Rechilieu','Linho','1','caminho de mesa','1.5m','R$ 100'),
      ('047','semi manual','Rechilieu','Linho','1','caminho de mesa','2m','R$ 103'),
      ('048','semi manual','Rechilieu','Linho','1','caminho de mesa','2.5m','R$ 65'),
      ('049','semi manual','Cheio normal','Percal','1','caminho de mesa','1m','R$ 70'),
      ('050','semi manual','Cheio normal','Percal','1','caminho de mesa','1.5m','R$ 72'),
      ('051','semi manual','Cheio normal','Percal','1','caminho de mesa','2m','R$ 75'),
      ('052','semi manual','Cheio normal','Percal','1','caminho de mesa','2.5m','R$ 79'),
      ('053','semi manual','Cheio normal','Linho','1','caminho de mesa','1m','R$ 82'),
      ('054','semi manual','Cheio normal','Linho','1','caminho de mesa','1.5m','R$ 85'),
      ('055','semi manual','Cheio normal','Linho','1','caminho de mesa','2m','R$ 89'),
      ('056','semi manual','Cheio normal','Linho','1','caminho de mesa','2.5m','R$ 92'),
      ('057','manual','Ponto Cruz','Etamine','1','guardanapos','0.10m','R$ 95'),
      ('058','manual','Ponto Cruz','Algodão cru','1','guardanapos','0.10m','R$ 88'),
      ('059','manual','Ponto Cruz','Linho','1','guardanapos','0.10m','R$ 91'),
      ('060','manual','Ponto Cruz','Etamine','1','guardanapos','0.20m','R$ 94'),
      ('061','manual','Ponto Cruz','Algodão cru','1','guardanapos','0.20m','R$ 97'),
      ('062','manual','Ponto Cruz','Linho','1','guardanapos','0.20m','R$ 100'),
      ('063','manual','Ponto Cruz','Etamine','1','guardanapos','0.30m','R$ 103'),
      ('064','manual','Ponto Cruz','Algodão cru','1','guardanapos','0.30m','R$ 65'),
      ('065','manual','Ponto Cruz','Linho','1','guardanapos','0.30m','R$ 70'),
      ('066','semi manual','Rechilieu','Percal','1','guardanapos','0.10m','R$ 72'),
      ('067','semi manual','Rechilieu','Percal','1','guardanapos','0.20m','R$ 75'),
      ('068','semi manual','Rechilieu','Percal','1','guardanapos','0.30m','R$ 79'),
      ('069','semi manual','Rechilieu','Linho','1','guardanapos','0.10m','R$ 82'),
      ('070','semi manual','Rechilieu','Linho','1','guardanapos','0.20m','R$ 85'),
      ('071','semi manual','Rechilieu','Linho','1','guardanapos','0.30m','R$ 89'),
      ('072','semi manual','Cheio normal','Percal','1','guardanapos','0.10m','R$ 92'),
      ('073','semi manual','Cheio normal','Percal','1','guardanapos','0.20m','R$ 95'),
      ('074','semi manual','Cheio normal','Percal','1','guardanapos','0.30m','R$ 88'),
      ('075','semi manual','Cheio normal','Linho','1','guardanapos','0.10m','R$ 910'),          
      ('076','semi manual','Cheio normal','Linho', '1','guardanapos','0.20m','R$ 94'),
      ('077','semi manual','Cheio normal','Linho', '1','guardanapos','0.30m','R$ 97');


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