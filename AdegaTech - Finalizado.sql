use master

	go

		IF EXISTS (SELECT name FROM master.dbo.sysdatabases 
			WHERE name = 'adegatech')
		DROP DATABASE adegatech





CREATE DATABASE adegatech
	go
		use adegatech
	go
	

	
	

/*TABELAS DO BANCO DE DADOS ADEGATECH */

CREATE TABLE Permissoes(
		id_perm int identity(1,1) primary key not null,
		nivel varchar(20) not null,
)

CREATE TABLE Login_funcionario(
		id_loginFunc int identity(1,1) primary key not null,
		id_perm int foreign key references Permissoes(id_perm) not null,
		senha varchar(30)not null,
		usuario varchar(50)not null,
		
)

CREATE TABLE Cliente(
		id_cliente int identity(1,1) primary key not null,
		nome_c varchar(70) not null,
		rg varchar(25) not null,
		cpf varchar(14) not null,
		data_nascimento date not null,
		sexo varchar(9) not null,
		endereco varchar(70) not null,
		cep varchar(9) not null,
		bairro varchar(70) not null,
		cidade varchar(50) not null,
		uf varchar(2)not null,
		telefone varchar(15),
		celular varchar(15) not null,
		complemento varchar(100),
		email varchar(50) not null,
		ativo varchar(1)not null,
		senha varchar(20) not null
	
)

CREATE TABLE Funcionario(
		id_funcionario int identity(1,1) primary key not null,
		nome_f varchar(70) not null,
		cargo varchar(30) not null,
		rg varchar(12) not null,
		cpf varchar(14) not null,
		Data_nascimento varchar(10) not null,
		sexo varchar(50) not null,
		Data_admissao Date not null,
		endereco varchar(70) not null,
		complemento varchar(20),
		cep varchar(9) not null,
		bairro varchar(70) not null,
		cidade varchar(30) not null,
		uf varchar(2) not null,
		telefone varchar(15) not null,
		celular varchar(15) not null,
		email varchar(50) not null,
		ativo varchar(1)not null ,
		id_loginFunc int foreign key references Login_funcionario(id_loginFunc)
)



CREATE TABLE Fornecedor(
		id_fornecedor int identity(1,1) primary key not null,
		empresa varchar(70) not null,
		cnpj varchar(18) not null,
		endereco varchar(70) not null,
		cep varchar(9) not null,
		bairro varchar(70) not null,
		cidade varchar(30) not null,
		uf varchar(2) not null, 
		telefone varchar(15) not null,
		celular varchar(15) not null,
		email varchar(50) not null,
		ativo varchar(1)not null


)


CREATE TABLE Produto(
		id_produto int identity(1,1) primary key not null,
		nome varchar(70) not null,
		tipo varchar(50) not null,
		pais varchar(50) not null,
		preco varchar(20) not null,
		ativo varchar(1)not null,
		imagem varchar(max)
)

CREATE TABLE Promocao(
		id_promocao int identity(1,1) primary key not null,
		percentual int not null,
		nome varchar(50),
		dt_inicio date not null,
		dt_fim date not null
)
Create table prod_promo(
	id_promocao int foreign key references Promocao(id_promocao)not null,
	id_produto int foreign key references Produto(id_produto)not null,
)

CREATE TABLE Venda(
		id_venda int identity(1,1) primary key not null,
		id_cliente int foreign key references Cliente(id_cliente),
		id_funcionario int foreign key references Funcionario(id_funcionario)not null,
		Data_venda Date not null,
		valor_total varchar(20) not null,
		formapag varchar (15) not null
)


CREATE  TABLE  Detalhe_Venda(
		id_det_venda int primary key identity(1,1) not null,
		id_venda int foreign key references Venda(id_venda)not null,
		id_produto int foreign key references Produto(id_produto)not null,
		qtd_produto int not null

)



CREATE TABLE mensagem(
		id_mensagem int not null primary key identity(1,1),
		email varchar(30) not null,
		assunto varchar(30),
		data date,
		mensagem varchar(300) not null,
		lido varchar(1)
)



CREATE TABLE Compra(
		id_compra int primary key identity(1,1) not null,
		id_fornecedor int foreign key references Fornecedor(id_fornecedor)not null,
		id_funcionario int foreign key references Funcionario(id_funcionario)not null,
		data_compra date not null
	) 



CREATE TABLE Detalhe_Compra(
		id_det_compra int primary key identity(1,1) not null,
		id_compra int foreign key references Compra(id_compra)not null,
		id_produto int foreign key references Produto(id_produto)not null,
		qtd_produto int not null
	) 
	

CREATE TABLE Loja(
		id_loja int primary key identity(1,1) not null,
		endereco varchar(50) not null,
		cep varchar(9) not null,
		uf varchar(2)not null,
		bairro varchar(50) not null,
		cidade varchar(50) not null,
		telefone varchar(13)not null
)

CREATE TABLE Estoque(
		id_produto int foreign key references Produto(id_produto)not null,
		qtd_produto int not null
)
	


/*SELECT DO BANCO DE DADOS ADEGATECH */

insert into Permissoes values ('Administrador'),
							  ('Funcionário')




insert into Login_funcionario(id_perm, usuario,senha) values (1,'Mikael','adm'),
															 (1,'henrique','adm'),
															 (1,'Bolinha','adm'),
															 (2,'Jonas','func'),
															 (2,'Marcio','func'),
															 (2,'Tony','func')
										

insert into Cliente(nome_c, rg, cpf, data_nascimento, sexo, endereco, cep, bairro, cidade, uf, telefone, celular, complemento, ativo, senha, email)
 values
  ('Oswaldo', '35.678.139-6', '455.860.478-53', '06-04-1998', 'M', 'Rua Irmãos Pila, 73', '02309-000', 'Vila Mariana', 'São Paulo', 'SP', '(11)3455-4177', '(11)98167-3894', 'Apto 2', 'S', '123', 'oswaldo@hotmail.com'),
  ('Maria', '12.345.678-9', '748.987.123-46',  '05-05-1997', 'F', 'Av das Americas, 220', '16734-897', 'Tucuruvi', 'São Paulo', 'SP', '(11)5638-7867', '(11)98167-3846', 'Casa', 'S', '123', 'maria@hotmail.com'),
  ('Gustavo', '98.367.489-7', '564.891.347-89',  '03-04-1980', 'M', 'Rua Perigosa, 608', '04012-090', 'Madalena', 'Rio de Janeiro', 'RJ', '(12)1563-8437', '(11)81735-6489', '', 'N', '123', 'gustavo@hotmail.com'),
  ('Luccas', '98.765.432-1', '882.671.349-05',  '21-11-1999', 'M', 'Rua Pequena, 45', '16734-085', 'Vila Mazzei', 'Minas Gerais', 'MG', '(19)1563-1764', '(11)53817-3905', '', 'N', '123', 'luccas@hotmail.com'),
  ('Gabriel', '76.583.782-0', '127.849.135-90',  '15-06-2000', 'M', 'Av Paulista, 111', '16739-167', 'Paraiso', 'São Paulo', 'SP', '(11)3507-1745', '(11)16739-4781', '', 'S', '123', 'gabriel@hotmail.com'),
  ('Luana', '37.164.802-6', '136.178.149-13',  '05-07-1995', 'F', 'Rua Estadual, 370', '17837-167', 'Londrina', 'São Paulo', 'SP', '(11)3286-1674', '(11)17649-1356', 'Bloco 1 Apto 40', 'N', '123', 'luana@hotmail.com'),
  ('Danton', '54.773.901-7', '850.981.375-43',  '20-02-1978', 'M', 'Rua Doutor Amâncio de Carvalho, 412', '56713-895', 'Vila Guilherme', 'São Paulo', 'SP', '(11)2614-4987', '(11)97167-4893', '', 'S', '123', 'danton@hotmail.com'),
  ('Mel', '14.847.174-5', '749.164.917-31',  '12-06-1990', 'F', 'Rua de Prata, 1100', '46719-716', 'Ilhas Malvina', 'São Paulo', 'SP', '(11)3718-1748', '(11)91748-1748', 'Bloco 3 Apto 106', 'N', '123', 'mel@hotmail.com')
  



insert into Fornecedor(empresa, cnpj, endereco, cep, bairro, cidade, uf, telefone, celular, email, ativo)
 values
  ('vinicola sul', '16.738.925/0001-56', 'Rua Vergueiro, 178', '11730000', 'Paraiso', 'São Paulo', 'MG', '(11)3455-2343', '(11)98356-1564', 'vinicola_sul@asf.com', 'S'),
  ('Center wine', '17.849.378/0001-34', 'Av Um, 1674', '64789367', 'Centro', 'São Paulo', 'SP', '(11)6748-1347', '(11)98167-7648', 'Center_wine@asf.com', 'S'),
  ('wine express', '17.847.398/0001-34', 'Rua do Amanhã, 845', '16738345', 'Vila Albertina', 'São Paulo', 'SP', '(11)3455-8940', '(11)97156-5321', 'wine_express@asf.com', 'S'),
  ('vinhos brasil', '17.849.367/0001-16', 'Rua Velha, 76', '87134675', 'Espaço das Américas', 'São Paulo', 'SP', '(11)2671-6758', '(11)91674-6154', 'vinhos_brasil@asf.com', 'S'),
  ('portus', '18.478.163/0001-16', 'Rua Amandoatei, 749', '16738375', 'Londrina', 'São Paulo', 'AC', '(11)9584-1748', '(11)91674-4321', 'portus@asf.com', 'N'),
  ('los vinos', '18.746.738/0001-47', 'Av Nova, 123', '89164897', 'Cachoeira', 'São Paulo', 'SP', '(11)6748-1673', '(11)98153-6453', 'los_vinos@asf.com', 'N'),
  ('quali vinhos', '98.178.390/0001-75', 'Rua Perigosa, 957', '16736895', 'Vila Mazzei', 'São Paulo', 'PA', '(11)2674-2674', '(11)97156-5174', 'quali_vinhos@asf.com', 'S')	




  insert into Funcionario(id_loginFunc, nome_f, cargo, rg, cpf, Data_nascimento, sexo, Data_admissao, endereco, complemento, cep, bairro, cidade, uf, telefone, celular, ativo, email)
   values
    (1,'Mikael', 'Dono', '37.164.802-6', '167.389.167-48', '01-01-2001', 'M', '01-04-2016', 'Rua Amélia, 476', 'Casa', '91784-936', 'Vila Mariana', 'São Paulo', 'SP', '(11)2765-1645', '(11)98467-5134', 'S', 'mikael@hotmail.com'),
	(2,'Henrique', 'Vendedor', '61.783.892-6', '167.389.046-75', '01-03-1999', 'M', '01-04-2016', 'Av Peralta, 164', '', '27189-476', 'Tucuruvi', 'São Paulo', 'SP', '(11)2617-2617', '(11)97153-4134', 'S', 'henrique@hotmail.com'),
	(3,'Bolinha', 'Gerente', '26.174.893-0', '178.498.367-90', '20-04-1978', 'M', '20-03-2016', 'Av Um, 968', '', '17837-594', 'Jardim São Paulo', 'São Paulo', 'SP', '(11)2617-2745', '(11)91675-6754', 'N', 'bolinha@hotmail.com'),
	(4,'Jonas', 'Programador', '16.738.287-0', '167.389.567-39', '20-08-1980', 'M', '12-03-2016', 'Rua Guru, 64', '', '11874-902', 'Armenia', 'São Paulo', 'SP', '(11)2716-9478', '(11)91775-6758', 'N', 'jonas@hotmail.com'),
	(5,'Marcio', 'Vendedor', '17.489.367-5', '198.467.389-67', '27-05-1994', 'M', '16-05-2016', 'Av Paulista, 1200', 'Apto 45', '76184-937', 'Vila Mazzei', 'São Paulo', 'SP', '(11)2716-1234', '(11)98174-8576', 'S', 'marcio@hotmail.com'),
	(6,'Tony', 'Atendente', '27.184.675-9', '187.367.490-74', '14-11-1979', 'M', '27-05-2016', 'Rua Cera, 45', '', '98174-850', 'Praia Grande', 'São Paulo', 'SP', '(11)2836-1234', '(11)971674-7654', 'N', 'tony@hotmail.com')

	


	
    select * from mensagem
	
	select * from Cliente    
	

	
	delete mensagem
	
	delete Cliente
	
	select * from Produto
	
delete from   Produto


Select * From Produto
inner join Promocao
on Produto.id_produto=Promocao.id_promocao






insert into Produto(tipo,nome,pais,preco,imagem,ativo)
values('Vinho Variados','Alamos malbec','Argentina',50.20,'img/tinto1.jpg','s'),
      ('Vinho Variados','Alamos catena zapata','Mendoza Itália',95.02,'img/rose1.jpg','s'),
	  ('Vinho Variados','Lagrima do porto','Portugal',85.00,'img/fortificado2.jpg','s'),
	  ('Vinho Variados','Garibaldi','França',90.50,'img/espumante2.jpg','s'),
	  ('Vinho Variados','Fonseca do porto','Portugal',50.50,'img/porto2.jpg','s'),
	  ('Vinho Variados','Churchill´s','Portugal',200.41,'img/porto3.jpg','s')



insert into Produto(tipo,nome,pais,preco,imagem,ativo)
values('Vinho Tinto','Alamos malbec','Argentina',50.00,'img/tinto1.jpg','s'),
      ('Vinho Tinto','Casa silva','Chile',115.50,'img/tinto2.jpg','s'),
	  ('Vinho Tinto','Errazuriz estate','Chile',79.00,'img/tinto3.jpg','s'),
	  ('Vinho Tinto','Andeluna altitud','Argentina',105.00,'img/tinto4.jpg','s'),
	  ('Vinho Tinto','Notio red','Grécia',145.45,'img/tinto5.jpg','s'),
	  ('Vinho Tinto','Charme douro','Portugal',300.00,'img/tinto6.jpg','s')
	  
	 
         
	      
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Rose','Alamos catena zapata','Mendoza Itália',90.00,'img/rose1.jpg','s'),
      ('Vinho Rose','De martino','Itália',60.75,'img/rose2.jpg','s'),
	  ('Vinho Rose','Antinori','Itália',160.80,'img/rose3.jpg','s'),
	  ('Vinho Rose','Prodorey barrel','Espanha',81.00,'img/rose4.jpg','s'),
	  ('Vinho Rose','Chateu miraval','Barcelona',205.50,'img/rose5.jpg','s'),
	  ('Vinho Rose','Rose planeta','Sicilia',35.40,'img/rose6.jpg','s')
	 
	  

insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Fortificado','florio','Portugual',74.55,'img/fortificado1.jpg','s'),
      ('Vinho Fortificado','Lagrima do porto','Portugal',85.00,'img/fortificado2.jpg','s'),
	  ('Vinho Fortificado','Vino viejo','Portugual',50.44,'img/fortificado3.jpg','s'),
	  ('Vinho Fortificado','Moscatel setubal','Argentina',78.40,'img/fortificado4.jpg','s'),
	  ('Vinho Fortificado','Éden','França',175.41,'img/fortificado5.jpg','s'),
	  ('Vinho Fortificado','Warre´s','Bolivia',35.00,'img/fortificado6.jpg','s')
	
             
     
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Espumante','Garibaldi mosacate','França',25.10,'img/espumante1.jpg','s'),
      ('Vinho Espumante','Garibaldi','França',90.50,'img/espumante2.jpg','s'),
	  ('Vinho Espumante','Casa valduga','Itália',120.02,'img/espumante3.jpg','s'),
	  ('Vinho Espumante','Salto moscatel','Uruguai',100.30,'img/espumante4.jpg','s'),
	  ('Vinho Espumante','Prosecco salton','Itália',55.00,'img/espumante5.jpg','s'),
	  ('Vinho Espumante','Terra nova','Portugal',120.10,'img/espumante6.jpg','s')
	  
         
		  
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Porto','Graham´s','Portugal',150.00,'img/porto1.jpg','s'),
      ('Vinho Porto','Fonseca do porto','Portugal',50.50,'img/porto2.jpg','s'),
	  ('Vinho Porto','Churchill´s','Portugal',200.41,'img/porto3.jpg','s'),
	  ('Vinho Porto','Graham´s','Portugal',40.00,'img/porto4.jpg','s'),
	  ('Vinho Porto','Graham´s six','Portugal',65.50,'img/porto5.jpg','s'),
	  ('Vinho Porto','Quinta sta ufemea','Portugal',135.71,'img/porto6.jpg','s')


              

insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Branco','Carmen classic','Itália',150.00,'img/branco1.jpg','s'),
      ('Vinho Branco','Procupine ridge','Italia',75.50,'img/branco2.jpg','s'),
	  ('Vinho Branco','Kaiken ultra','Itália',250.00,'img/branco3.jpg','s'),
	  ('Vinho Branco','Bill sauvignon nave','Chile',135.00,'img/branco4.jpg','s'),
	  ('Vinho Branco','Robert mondavi','Estado unidos',125.25,'img/branco5.jpg','s'),
	  ('Vinho Branco','Travento','Espanha',95.12,'img/branco6.jpg','s')


            

     
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Argentino','Alfredo Roca Cabernet Sauvignon','Argentina',150.00,'img/argentino1.jpg','s'),
      ('Vinho Argentino','Alfredo Roca Pinot Noir ','Argentina',90.50,'img/argentino2.jpg','s'),
	  ('Vinho Argentino','Alta Vista Premium Malbec','Argentina',40.080,'img/argentino3.jpg','s'),
	  ('Vinho Argentino','Alto Pampas Del Sur Malbec','Argentina',150.20,'img/argentino4.jpg','s'),
	  ('Vinho Argentino','Altas Cumbres Cabernet Sauvignon ','Argentina',120.00,'img/argentino5.jpg','s'),
	  ('Vinho Argentino','Angaro Chardonnay ','Argentina',180.02,'img/argentino6.jpg','s')
	
	   

insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Chile','Merlot Trentino','Chile',150.00,'img/chile1.jpg','s'),
	  ('Vinho Chile','Maule Merlot','Chile',40.00,'img/chile2.jpg','s'),
	  ('Vinho Chile','PienoSud Rosato Puglia','Chile',150.00,'img/chile3.jpg','s'),
	  ('Vinho Chile','Rubinello Toscano Rosso','Chile',150.00,'img/chile4.jpg','s'),
	  ('Vinho Chile','Bordeaux Château Tour','Chile',150.00,'img/chile5.jpg','s'),
	  ('Vinho Chile','Castellani Nero d´Avola','Chile',150.00,'img/chile6.jpg','s')
	 

	       
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Frances','Crozes Hermitage Rhône','Frances',200.00,'img/frances1.jpg','s'),
      ('Vinho Frances','Charles Ranville Ranville','Frances',94.50,'img/frances2.jpg','s'),
	  ('Vinho Frances','Vollereaux Rosé Saignée','Frances',40.00,'img/frances3.jpg','s'),
	  ('Vinho Frances','Domaine La Bonneliére','Frances',10.50,'img/frances4.jpg','s'),
	  ('Vinho Frances','Opéra do Cháteau','Frances',15.00,'img/frances5.jpg','s'),
	  ('Vinho Frances','Château Bidonnet Laffitte','Frances',78.00,'img/frances6.jpg','s')
	 
     

insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Alemão','Der knippie','Alemanha',150.00,'img/alemao1.png','s'),
      ('Vinho Alemão','Durbacher Schlossber','Alemanha',90.50,'img/alemao2.png','s'),
	  ('Vinho Alemão','Erbacher Michelmark','Alemanha',40.00,'img/alemao3.png','s'),
	  ('Vinho Alemão','Hattenheimer Wisselbrunnen','Alemanha',150.08,'img/alemao4.png','s'),
	  ('Vinho Alemão','Lemberger Herzog','Alemanha',450.00,'img/alemao5.png','s'),
	  ('Vinho Alemão','Monchberg Merlot','Alemanha',190.35,'img/alemao6.png','s')
	

     
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Brasileiro','Vallontano Rosé Brut','Brasil',150.00,'img/brasil1.png','s'),
      ('Vinho Brasileiro','Vallontano Extra Brut Luis','Brasil',90.50,'img/brasil2.jpg','s'),
	  ('Vinho Brasileiro','Vallontano Tempranillo Rosé','Brasil',40.00,'img/brasil3.jpg','s'),
	  ('Vinho Brasileiro','Vallontano Brut – meia gfa','Brasil',54.84,'img/brasil4.jpg','s'),
	  ('Vinho Brasileiro','Vallontano Extra Brut Lh','Brasil',70.00,'img/brasil5.jpg','s'),
	  ('Vinho Brasileiro','Vallontano Cabernet Sauvignon','Brasil',95.40,'img/brasil6.png','s')
	 


insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Italiano','Monna Nera ','Italia',200.00,'img/italia1.png','s'),
      ('Vinho Italiano','o	Cirò Rosso Librandi','Italia',90.50,'img/italia2.png','s'),
	  ('Vinho Italiano','Cantaloro Igt Toscana','Italia',40.00,'img/italia3.png','s'),
	  ('Vinho Italiano','Sangiovese Cancelli','Italia',91.50,'img/italia4.png','s'),
	  ('Vinho Italiano','Montepulciano d´Abruzzo','Italia',15.00,'img/italia5.png','s'),
	  ('Vinho Italiano','Magari Igt Toscana','Italia',330.50,'img/italia6.png','s')
	 
	  
     
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Espanhol','Rosé Viña Vilano','Espanha',142.54,'img/espanha1.jpg','s'),
      ('Vinho Espanhol','Sarada Selección','Espanha',82.50,'img/espanha2.jpg','s'),
	  ('Vinho Espanhol','Tarima Orgânico','Espanha',40.48,'img/espanha3.jpg','s'),
	  ('Vinho Espanhol','Xabec Montsant','Espanha',181.10,'img/espanha4.jpg','s'),
	  ('Vinho Espanhol','Liberalia Monte Hiniesta','Espanha',71.04,'img/espanha5.jpg','s'),
	  ('Vinho Espanhol','Van Zellers Vz Douro','Espanha',190.40,'img/espanha6.jpg','s')
	 

     
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Portugal','Van Zellers Vz Douro','Portugal',25.84,'img/portugal1.png','s'),
      ('Vinho Portugal','Monte da Raposinha','Portugal',90.41,'img/portugal2.jpg','s'),
	  ('Vinho Portugal','Van Zellers Alentejo','Portugal',42.08,'img/portugal3.jpg','s'),
	  ('Vinho Portugal','Monte da Raposinha-(Nós)','Portugal',67.50,'img/portugal4.jpg','s'),
	  ('Vinho Portugal','Monte Raposinha Athayde','Portugal',150.80,'img/portugal5.jpg','s'),
	  ('Vinho Portugal','Falcoaria','Portugal',450.85,'img/portugal6.jpg','s')


	 	  
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Americano','Zinfandel Parducci','Estado Unido',60.00,'img/americano1.png','s'),
      ('Vinho Americano','Cloudline Pinot Noir','Estado Unido',90.50,'img/americano2.jpg','s'),
	  ('Vinho Americano','CrossBran Cabernet','Estado Unido',40.80,'img/americano3.jpg','s'),
	  ('Vinho Americano','Dry Creek Valley Cortina','Estado Unido',378.65,'img/americano4.jpg','s'),
	  ('Vinho Americano','Merlot Seven Hills','Estado Unido',132.23,'img/americano5.jpg','s'),
	  ('Vinho Americano','Recess Red','Estado Unido',164.20,'img/americano6.jpg','s')
	 

 	  
insert into Produto(tipo,nome,pais, preco,imagem,ativo)
values('Vinho Promocionais','Zinfandel Parducci','Estado Unido',60.00,'img/promocao1.jpg','s'),
      ('Vinho Promocionais','Cloudline Pinot Noir','Estado Unido',90.50,'img/promocao2.jpg','s'),
	  ('Vinho Promocionais','CrossBran Cabernet','Estado Unido',40.80,'img/promocao3.jpg','s'),
	  ('Vinho Promocionais','Dry Creek Valley Cortina','Estado Unido',378.65,'img/promocao4.jpg','s'),
	  ('Vinho Promocionais','Merlot Seven Hills','Estado Unido',132.23,'img/promocao5.jpg','s'),
	  ('Vinho Promocionais','Recess Red','Estado Unido',164.20,'img/promocao6.jpg','s')
	 


	

insert into Estoque(id_produto, qtd_produto) values (1, 100),
													(2, 100),
													(3, 100),
													(4, 100),
													(5, 100),
													(6, 100),
													(7, 100),
													(8, 100),
													(9, 100),
													(10, 100),
													(11, 100),
													(12, 100),
													(13, 100),
													(14, 100),
													(15, 100),
													(16, 100),
													(17, 100),
													(18, 100),
													(19, 100),
													(20, 100),
													(21, 100),
													(22, 100),
													(23, 100),
													(24, 100),
													(25, 100),
													(26, 100),
													(27, 100),
													(28, 100),
													(29, 100),
													(30, 100),
													(31, 100),
													(32, 100),
													(33, 100),
													(34, 100),
													(35, 100),
													(36, 100),
													(37, 100),
													(38, 100),
													(39, 100),
													(40, 100),
													(41, 100),
													(42, 100),
													(43, 100),
													(44, 100),
													(45, 100),
													(46, 100),
													(47, 100),
													(48, 100),
													(49, 100),
													(50, 100),
													(51, 100),
													(52, 100),
													(53, 100),
													(54, 100),
													(55, 100),
													(56, 100),
													(57, 100),
													(58, 100),
													(59, 100),
													(60, 100),
													(61, 100),
													(62, 100),
													(63, 100),
													(64, 100),
													(65, 100),
													(66, 100),
													(67, 100),
													(68, 100),
													(69, 100),
													(70, 100),
													(71, 100),
													(72, 100),
													(73, 100),
													(74, 100),
													(75, 100),
													(76, 100),
													(77, 100),
													(78, 100),
													(79, 100),
													(80, 100),
													(81, 100),
													(82, 100),
													(83, 100),
													(84, 100),
													(85, 100),
													(86, 100),
													(87, 100),
													(88, 100),
													(89, 100),
													(90, 100),
													(91, 100),
													(92, 100),
													(93, 100),
													(94, 100),
													(95, 100),
													(96, 100),
													(97, 100),
													(98, 100),
													(99, 100),
													(100, 100),
													(101, 100),
													(102, 100)
													


insert into Loja(endereco,cep,uf,bairro,cidade,telefone) values ('Av Paulista','11730-000','SP','Centro','São Paulo','(11)2267-1714'),
																 ('Rua Caraguá','27894-987','SP','Tucuruvi','São Paulo','(11)2261-3088'),
																 ('Rua Peralta','75189-003','SP','Vila Mazzei','São Paulo','(11)2297-7856')


insert into Compra(id_fornecedor,id_funcionario,data_compra) values (1,6,'02-02-2016')
											
insert into Detalhe_Compra(id_compra,id_produto,qtd_produto) values (1,1,100),
																	(1,2,100),
																	(1,3,100),
																	(1,4,100),
																	(1,5,100),
																	(1,6,100),
																	(1,7,100),
																	(1,8,100),
																	(1,9,100),
																	(1,10,100),
																	(1,11,100),
																	(1,12,100),
																	(1,13,100),
																	(1,14,100)
																	
insert into Compra(id_fornecedor,id_funcionario,data_compra) values (2,5,'19-02-2016')

insert into Detalhe_Compra(id_compra,id_produto,qtd_produto) values (2,15,100),
																	(2,16,100),
																	(2,17,100),
																	(2,18,100),
																	(2,19,100),
																	(2,20,100),
																	(2,21,100),
																	(2,22,100),
																	(2,23,100),
																	(2,24,100),
																	(2,25,100),
																	(2,26,100),
																	(2,27,100),
																	(2,28,100)

insert into Compra(id_fornecedor,id_funcionario,data_compra) values (3,4,'15-03-2016')

insert into Detalhe_Compra(id_compra,id_produto,qtd_produto) values (3,29,100),
																	(3,30,100),
																	(3,31,100),
																	(3,32,100),
																	(3,33,100),
																	(3,34,100),
																	(3,35,100),
																	(3,36,100),
																	(3,37,100),
																	(3,38,100),
																	(3,39,100),
																	(3,40,100),
																	(3,41,100),
																	(3,42,100)

insert into Compra(id_fornecedor,id_funcionario,data_compra) values (4,3,'03-04-2016')

insert into Detalhe_Compra(id_compra,id_produto,qtd_produto) values (4,43,100),
																	(4,44,100),
																	(4,45,100),
																	(4,46,100),
																	(4,47,100),
																	(4,48,100),
																	(4,49,100),
																	(4,50,100),
																	(4,51,100),
																	(4,52,100),
																	(4,53,100),
																	(4,54,100),
																	(4,55,100),
																	(4,56,100)

insert into Compra(id_fornecedor,id_funcionario,data_compra) values (5,2,'19-04-2016')

insert into Detalhe_Compra(id_compra,id_produto,qtd_produto) values (5,57,100),
																	(5,58,100),
																	(5,59,100),
																	(5,60,100),
																	(5,61,100),
																	(5,62,100),
																	(5,63,100),
																	(5,64,100),
																	(5,65,100),
																	(5,66,100),
																	(5,67,100),
																	(5,68,100),
																	(5,69,100),
																	(5,70,100)

insert into Compra(id_fornecedor,id_funcionario,data_compra) values (6,1,'19-04-2016')

insert into Detalhe_Compra(id_compra,id_produto,qtd_produto) values (6,71,100),
																	(6,72,100),
																	(6,73,100),
																	(6,74,100),
																	(6,75,100),
																	(6,76,100),
																	(6,77,100),
																	(6,78,100),
																	(6,79,100),
																	(6,80,100),
																	(6,81,100),
																	(6,82,100),
																	(6,83,100),
																	(6,84,100)

insert into Compra(id_fornecedor,id_funcionario,data_compra) values (7,2,'13-05-2016')

insert into Detalhe_Compra(id_compra,id_produto,qtd_produto) values (7,85,100),
																	(7,86,100),
																	(7,87,100),
																	(7,88,100),
																	(7,89,100),
																	(7,90,100),
																	(7,91,100),
																	(7,92,100),
																	(7,93,100),
																	(7,94,100),
																	(7,95,100),
																	(7,96,100),
																	(7,97,100),
																	(7,98,100)

insert into Compra(id_fornecedor,id_funcionario,data_compra) values (5,4,'28-05-2016')

insert into Detalhe_Compra(id_compra,id_produto,qtd_produto) values (8,99,100),
																	(8,100,100),
																	(8,101,100),
																	(8,102,100)
																	







insert into Venda (id_cliente,Data_Venda,formapag,id_funcionario,valor_total) values  (1,'10-02-2015','Crédito',1,'85.00'),
												 									  (2,'11-02-2015','Crédito',2,'85.50'),
												   									  (3,'20-03-2015','Dinheiro',3,'90.30'),
																					  (4,'15-09-2015','Débito',2,'50.50'),
																					  (5,'27-04-2015','Dinheiro',5,'85.00'),
																					  (6,'08-01-2015','Crédito',6,'95.02'),
																					  (7,'14-08-2015','Débito',6,'50.20'),
																					  (1,'03-07-2015','Dinheiro',2,'200.41'),
																					  (2,'12-11-2015','Dinheiro',4,'50.50')

insert into Detalhe_Venda(id_venda, id_produto, qtd_produto) values (1, 3, 5),
																	(2, 3, 2),
																	(3, 4, 3),
																	(4, 5, 1),
																	(5, 3, 2),
																	(6, 2, 1),
																	(7, 1, 4),
																	(8, 6, 4),
																	(9, 5, 1)

update Estoque set qtd_produto=(select qtd_produto from Estoque where id_produto=1)-(select sum(qtd_produto) from Detalhe_Venda where id_produto=1) from estoque where id_produto=1

update Estoque set qtd_produto=(select qtd_produto from Estoque where id_produto=2)-(select sum(qtd_produto) from Detalhe_Venda where id_produto=2) from estoque where id_produto=2

update Estoque set qtd_produto=(select qtd_produto from Estoque where id_produto=3)-(select sum(qtd_produto) from Detalhe_Venda where id_produto=3) from estoque where id_produto=3

update Estoque set qtd_produto=(select qtd_produto from Estoque where id_produto=4)-(select sum(qtd_produto) from Detalhe_Venda where id_produto=4) from estoque where id_produto=4

update Estoque set qtd_produto=(select qtd_produto from Estoque where id_produto=5)-(select sum(qtd_produto) from Detalhe_Venda where id_produto=5) from estoque where id_produto=5

update Estoque set qtd_produto=(select qtd_produto from Estoque where id_produto=6)-(select sum(qtd_produto) from Detalhe_Venda where id_produto=6) from estoque where id_produto=6



select * from estoque 

--Finalizado , não mexer 
