CREATE DATABASE Empresa
go

USE Empresa
go

CREATE TABLE Fornecedores(
	CodFor		INT IDENTITY NOT NULL,
	Empresa		VARCHAR(40),
	Contato		VARCHAR(30),
	Cargo		VARCHAR(30),
	Endereco	VARCHAR(60),
	Cidade		VARCHAR(15),
	CEP		VARCHAR(10),
	Pais		VARCHAR(15),
	PRIMARY KEY (CodFor)
)

CREATE TABLE Categorias(
	CodCategoria	INT IDENTITY NOT NULL,
	Descr			VARCHAR(15),
	PRIMARY KEY (CodCategoria)
)

CREATE TABLE Clientes(
	CodCli		CHAR(5) NOT NULL,
	Nome		VARCHAR(40) NOT NULL,
	Contato		VARCHAR(30) NOT NULL,
	Cargo		VARCHAR(30) NOT NULL,
	Endereco	VARCHAR(60) NOT NULL,
	Cidade		VARCHAR(15) NOT NULL,
	Regiao		VARCHAR(15) NOT NULL,
	CEP		VARCHAR(10) NOT NULL,
	Pais		VARCHAR(15) NOT NULL,
	Telefone	VARCHAR(24) NOT NULL,
	Fax		VARCHAR(24) NOT NULL,
	PRIMARY KEY(CodCli)
)

CREATE TABLE Funcionarios(
	CodFun		INT IDENTITY NOT NULL,
	Sobrenome	VARCHAR(20),
	Nome		VARCHAR(10),
	Cargo		VARCHAR(30),
	DataNasc	DATE,
	Endereco	VARCHAR(60),
	Cidade		VARCHAR(15),
	CEP		VARCHAR(10),
	Pais		VARCHAR(15),
	Fone		VARCHAR(24),
	Salario		MONEY DEFAULT 0.0,
	PRIMARY KEY (CodFun)
)

CREATE TABLE Produtos(
	CodProd		INT IDENTITY NOT NULL,
	Descr		VARCHAR(40),
	CodFor		INT ,
	CodCategoria	INT ,
	Preco		MONEY DEFAULT 0.0,
	Unidades	SMALLINT DEFAULT 0 ,
	Descontinuado	BIT ,
	PRIMARY KEY (CodProd),
	FOREIGN KEY (CodCategoria) REFERENCES Categorias(CodCategoria) ON DELETE CASCADE,
	FOREIGN KEY (CodFor) REFERENCES Fornecedores(CodFor) ON DELETE CASCADE
)

CREATE TABLE Pedidos(
	NumPed		INT NOT NULL,
	CodCli		CHAR(5),
	CodFun		INT DEFAULT 0 ,
	DataPed		DATE,
	DataEntrega	DATE,
	Frete		MONEY DEFAULT 0.0,
	PRIMARY KEY (NumPed),
	FOREIGN KEY (CodCli) REFERENCES Clientes(CodCli) ON DELETE CASCADE,
	FOREIGN KEY (CodFun) REFERENCES Funcionarios(CodFun) ON DELETE CASCADE
)

CREATE TABLE DetalhesPed(
	NumPed		INT ,
	CodProd		INT  ,
	Preco		MONEY,
	Qtde		SMALLINT ,
	Desconto	FLOAT
	PRIMARY KEY (NumPed, CodProd),
	FOREIGN KEY (NumPed) REFERENCES Pedidos(NumPed) ON DELETE CASCADE,
	FOREIGN KEY (CodProd) REFERENCES Produtos(CodProd) ON DELETE CASCADE
)

SET DATEFORMAT YMD

---------------------
-- Dados Fornecedores
---------------------
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Exotic Liquids','Charlotte Cooper','Gerente de Encomendas','49 Gilbert St.','London','EC1 4SD','Reino Unido');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('New Orleans Cajun Delights','Shelley Burke','Administrador de Pedidos','P.O. Box 78934','New Orleans','70117','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Grandma Kelly s Homestead','Regina Murphy','Representante de Vendas','707 Oxford Rd.','Ann Arbor','48104','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Tokyo Traders','Yoshi Nagase','Gerente de Marketing','9-8 SekimaiMusashino-shi','Tokyo','100','Japão');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Cooperativa de Quesos  Las Cabras ','Antonio del Valle Saavedra ','Administrador de Exportação','Calle del Rosal 4','Oviedo','33007','Espanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Mayumi s','Mayumi Ohno','Representante de Marketing','92 Setsuko Chuo-ku','Osaka','545','Japão');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Pavlova, Ltd.','Ian Devling','Gerente de Marketing','74 Rose St.Moonie Ponds','Melbourne','3058','Austrália');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Specialty Biscuits, Ltd.','Peter Wilson','Representante de Vendas','29 King s Way','Manchester','M14 GSD','Reino Unido');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('PB Knäckebröd AB','Lars Peterson','Agente de Vendas','Kaloadagatan 13','Göteborg','S-345 67','Suécia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Refrescos Americanas LTDA','Carlos Diaz','Gerente de Marketing','Av. das Americanas 12.890','São Paulo','5442','Brasil');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Heli Süßwaren GmbH & Co. KG','Petra Winkler','Gerente de Vendas','Tiergartenstraße 5','Berlin','10785','Alemanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Plutzer Lebensmittelgroßmärkte AG','Martin Bein','Ger. Marketing Internacional','Bogenallee 51','Frankfurt','60439','Alemanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Coord. Mercados Estrangeiros','Frahmredder 112a','Cuxhaven','27478','Alemanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Formaggi Fortini s.r.l.','Elio Rossi','Representante de Vendas','Viale Dante, 75','Ravenna','48100','Itália');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Norske Meierier','Beate Vileid','Gerente de Marketing','Hatlevegen 5','Sandvika','1320','Noruega');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Bigfoot Breweries','Cheryl Saylor','Rep. Financeiro Local','3400 - 8th AvenueSuite 210','Bend','97101','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Svensk Sjöföda AB','Michael Björn','Representante de Vendas','Brovallavägen 231','Stockholm','S-123 45','Suécia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Aux joyeux ecclésiastiques','Guylène Nodier','Gerente de Vendas','203, Rue des Francs-Bourgeois','Paris','75004','França');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('New England Seafood Cannery','Robb Merchant','Agente Financeiro de Atacado','Order Processing Dept.2100 Paul Revere Blvd.','Boston','02134','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Leka Trading','Chandra Leka','Proprietário','471 Serangoon Loop, Suite #402','Singapore','0512','Cingapura');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Lyngbysild','Niels Petersen','Gerente de Vendas','LyngbysildFiskebakken 10','Lyngby','2800','Dinamarca');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Zaanse Snoepfabriek','Dirk Luchte','Gerente Financeiro','VerkoopRijnweg 22','Zaandam','9999 ZZ','Paises Baixos');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Karkki Oy','Anne Heikkonen','Gerente do Produto','Valtakatu 12','Lappeenranta','53120','Finlândia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('G day, Mate','Wendy Mackenzie','Representante de Vendas','170 Prince Edward ParadeHunter s Hill','Sydney','2042','Austrália');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Ma Maison','Jean-Guy Lauzon','Gerente de Marketing','2960 Rue St. Laurent','Montréal','H1J 1C3','Canadá');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Pasta Buttini s.r.l.','Giovanni Giudici','Administrador de Pedidos','Via dei Gelsomini, 153','Salerno','84100','Itália');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Escargots Nouveaux','Marie Delamare','Gerente de Vendas','22, rue H. Voiron','Montceau','71300','França');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Gai pâturage','Eliane Noz','Representante de Vendas','Bat. B3, rue des Alpes','Annecy','74000','França');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Forêts d érables','Chantal Goulet','Gerente Financeiro','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canadá');

-------------------
-- Dados Categorias
-------------------
INSERT INTO Categorias(Descr) VALUES ('Bebidas');
INSERT INTO Categorias(Descr) VALUES ('Condimentos');
INSERT INTO Categorias(Descr) VALUES ('Confeitos');
INSERT INTO Categorias(Descr) VALUES ('Laticínios');
INSERT INTO Categorias(Descr) VALUES ('Grãos/Cereais');
INSERT INTO Categorias(Descr) VALUES ('Carnes/Aves');
INSERT INTO Categorias(Descr) VALUES ('Hortigranjeiros');
INSERT INTO Categorias(Descr) VALUES ('Frutos do Mar');

-----------------
-- Dados Clientes
-----------------
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ALFKI','Alfreds Futterkiste','Maria Anders','Representante de Vendas','Obere Str. 57','Berlin','','12209','Alemanha','030-0074321','030-0076545');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ANATR','Ana Trujillo Emparedados y helados','Ana Trujillo','Proprietário','Avda. de la Constitución 2222','México D.F.','','05021','México','(5) 555-4729','(5) 555-3745');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ANTON','Antonio Moreno Taquería','Antonio Moreno','Proprietário','Mataderos  2312','México D.F.','','05023','México','(5) 555-3932','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('AROUT','Around the Horn','Thomas Hardy','Representante de Vendas','120 Hanover Sq.','London','','WA1 1DP','Reino Unido','(171) 555-7788','(171) 555-6750');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BERGS','Berglunds snabbköp','Christina Berglund','Administrador de Pedidos','Berguvsvägen  8','Luleå','','S-958 22','Suécia','0921-12 34 65','0921-12 34 67');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BLAUS','Blauer See Delikatessen','Hanna Moos','Representante de Vendas','Forsterstr. 57','Mannheim','','68306','Alemanha','0621-08460','0621-08924');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BLONP','Blondel père et fils','Frédérique Citeaux','Gerente de Marketing','24, place Kléber','Strasbourg','','67000','França','88.60.15.31','88.60.15.32');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BOLID','Bólido Comidas preparadas','Martín Sommer','Proprietário','C/ Araquil, 67','Madrid','','28023','Espanha','(91) 555 22 82','(91) 555 91 99');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BONAP','Bon app ','Laurence Lebihan','Proprietário','12, rue des Bouchers','Marseille','','13008','França','91.24.45.40','91.24.45.41');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BOTTM','Bottom-Dollar Markets','Elizabeth Lincoln','Gerente Financeiro','23 Tsawassen Blvd.','Tsawassen','BC','T2F 8M4','Canadá','(604) 555-4729','(604) 555-3745');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('BSBEV','B s Beverages','Victoria Ashworth','Representante de Vendas','Fauntleroy Circus','London','','EC2 5NT','Reino Unido','(171) 555-1212','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('CACTU','Cactus Comidas para llevar','Patricio Simpson','Agente de Vendas','Cerrito 333','Buenos Aires','','1010','Argentina','(1) 135-5555','(1) 135-4892');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('CENTC','Centro comercial Moctezuma','Francisco Chang','Gerente de Marketing','Sierras de Granada 9993','México D.F.','','05022','México','(5) 555-3392','(5) 555-7293');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('CHOPS','Chop-suey Chinese','Yang Wang','Proprietário','Hauptstr. 29','Bern','','3012','Suíça','0452-076545','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('COMMI','Comércio Mineiro','Pedro Afonso','Assessor de Vendas','Av. dos Lusíadas, 23','São Paulo','SP','05432-043','Brasil','(11) 555-7647','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('CONSH','Consolidated Holdings','Elizabeth Brown','Representante de Vendas','Berkeley Gardens 12  Brewery ','London','','WX1 6LT','Reino Unido','(171) 555-2282','(171) 555-9199');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('DRACD','Drachenblut Delikatessen','Sven Ottlieb','Administrador de Pedidos','Walserweg 21','Aachen','','52066','Alemanha','0241-039123','0241-059428');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('DUMON','Du monde entier','Janine Labrune','Proprietário','67, rue des Cinquante Otages','Nantes','','44000','França','40.67.88.88','40.67.89.89');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('EASTC','Eastern Connection','Ann Devon','Agente de Vendas','35 King George','London','','WX3 6FW','Reino Unido','(171) 555-0297','(171) 555-3373');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ERNSH','Ernst Handel','Roland Mendel','Gerente de Vendas','Kirchgasse 6','Graz','','8010','Áustria','7675-3425','7675-3426');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FAMIA','Familia Arquibaldo','Aria Cruz','Assistente de Marketing','Rua Orós, 92','São Paulo','SP','05442-030','Brasil','(11) 555-9857','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FISSA','FISSA Fabrica Inter. Salchichas S.A.','Diego Roel','Gerente Financeiro','C/ Moralzarzal, 86','Madrid','','28034','Espanha','(91) 555 94 44','(91) 555 55 93');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FOLIG','Folies gourmandes','Martine Rancé','Assistente do Agente de Vendas','184, chaussée de Tournai','Lille','','59000','França','20.16.10.16','20.16.10.17');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FOLKO','Folk och fä HB','Maria Larsson','Proprietário','Åkergatan 24','Bräcke','','S-844 67','Suécia','0695-34 67 21','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FRANK','Frankenversand','Peter Franken','Gerente de Marketing','Berliner Platz 43','München','','80805','Alemanha','089-0877310','089-0877451');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FRANR','France restauration','Carine Schmitt','Gerente de Marketing','54, rue Royale','Nantes','','44000','França','40.32.21.21','40.32.21.20');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FRANS','Franchi S.p.A.','Paolo Accorti','Representante de Vendas','Via Monte Bianco 34','Torino','','10100','Itália','011-4988260','011-4988261');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FURIB','Furia Bacalhau e Frutos do Mar','Lino Rodriguez ','Gerente de Vendas','Jardim das rosas n. 32','Lisboa','','1675','Portugal','(1) 354-2534','(1) 354-2535');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GALED','Galería del gastrónomo','Eduardo Saavedra','Gerente de Marketing','Rambla de Cataluña, 23','Barcelona','','08022','Espanha','(93) 203 4560','(93) 203 4561');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GODOS','Godos Cocina Típica','José Pedro Freyre','Gerente de Vendas','C/ Romero, 33','Sevilla','','41101','Espanha','(95) 555 82 82','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GOURL','Gourmet Lanchonetes','André Fonseca','Assessor de Vendas','Av. Brasil, 442','Campinas','SP','04876-786','Brasil','(11) 555-9482','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GREAL','Great Lakes Food Market','Howard Snyder','Gerente de Marketing','2732 Baker Blvd.','Eugene','OR','97403','EUA','(503) 555-7555','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GROSR','GROSELLA-Restaurante','Manuel Pereira','Proprietário','5ª Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela','(2) 283-2951','(2) 283-3397');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HANAR','Hanari Carnes','Mario Pontes','Gerente Financeiro','Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brasil','(21) 555-0091','(21) 555-8765');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HILAA','HILARIÓN-Abastos','Carlos Hernández','Representante de Vendas','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','Táchira','5022','Venezuela','(5) 555-1340','(5) 555-1948');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HUNGC','Hungry Coyote Import Store','Yoshi Latimer','Representante de Vendas','City Center Plaza 516 Main St.','Elgin','OR','97827','EUA','(503) 555-6874','(503) 555-2376');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HUNGO','Hungry Owl All-Night Grocers','Patricia McKenna','Assessor de Vendas','8 Johnstown Road','Cork','Co. Cork','','Irlanda','2967 542','2967 3333');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ISLAT','Island Trading','Helen Bennett','Gerente de Marketing','Garden House Crowther Way','Cowes','Isle of Wigth','PO31 7PJ','Reino Unido','(198) 555-8888','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('KOENE','Königlich Essen','Philip Cramer','Assessor de Vendas','Maubelstr. 90','Brandenburg','','14776','Alemanha','0555-09876','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LACOR','La corne d abondance','Daniel Tonini','Representante de Vendas','67, avenue de l Europe','Versailles','','78000','França','30.59.84.10','30.59.85.11');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LAMAI','La maison d Asie','Annette Roulet','Gerente de Vendas','1 rue Alsace-Lorraine','Toulouse','','31000','França','61.77.61.10','61.77.61.11');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LAUGB','Laughing Bacchus Wine Cellars','Yoshi Tannamuri','Assistente de Marketing','1900 Oak St.','Vancouver','BC','V3F 2K1','Canadá','(604) 555-3392','(604) 555-7293');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LAZYK','Lazy K Kountry Store','John Steel','Gerente de Marketing','12 Orchestra Terrace','Walla Walla','WA','99362','EUA','(509) 555-7969','(509) 555-6221');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LEHMS','Lehmanns Marktstand','Renate Messner','Representante de Vendas','Magazinweg 7','Frankfurt a.M. ','','60528','Alemanha','069-0245984','069-0245874');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LETSS','Let s Stop N Shop','Jaime Yorres','Proprietário','87 Polk St. Suite 5','San Francisco','CA','94117','EUA','(415) 555-5938','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LILAS','LILA-Supermercado','Carlos González','Gerente Financeiro','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela','(9) 331-6954','(9) 331-7256');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LINOD','LINO-Delicateses','Felipe Izquierdo','Proprietário','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela','(8) 34-56-12','(8) 34-93-93');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LONEP','Lonesome Pine Restaurant','Fran Wilson','Gerente de Vendas','89 Chiaroscuro Rd.','Portland','OR','97219','EUA','(503) 555-9573','(503) 555-9646');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MAGAA','Magazzini Alimentari Riuniti','Giovanni Rovelli','Gerente de Marketing','Via Ludovico il Moro 22','Bergamo','','24100','Itália','035-640230','035-640231');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MAISD','Maison Dewey','Catherine Dewey','Agente de Vendas','Rue Joseph-Bens 532','Bruxelles','','B-1180','Bélgica','(02) 201 24 67','(02) 201 24 68');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MEREP','Mère Paillarde','Jean Fresnière','Assistente de Marketing','43 rue St. Laurent','Montréal','Québec','H1J 1C3','Canadá','(514) 555-8054','(514) 555-8055');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MORGK','Morgenstern Gesundkost','Alexander Feuer','Assistente de Marketing','Heerstr. 22','Leipzig','','04179','Alemanha','0342-023176','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('NORTS','North/South','Simon Crowther','Assessor de Vendas','South House 300 Queensbridge','London','','SW7 1RZ','Reino Unido','(171) 555-7733','(171) 555-2530');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('OCEAN','Océano Atlántico Ltda.','Yvonne Moncada','Agente de Vendas','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires','','1010','Argentina','(1) 135-5333','(1) 135-5535');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('OLDWO','Old World Delicatessen','Rene Phillips','Representante de Vendas','2743 Bering St.','Anchorage','AK','99508','EUA','(907) 555-7584','(907) 555-2880');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('OTTIK','Ottilies Käseladen','Henriette Pfalzheim','Proprietário','Mehrheimerstr. 369','Köln','','50739','Alemanha','0221-0644327','0221-0765721');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PARIS','Paris spécialités','Marie Bertrand','Proprietário','265, boulevard Charonne','Paris','','75012','França','(1) 42.34.22.66','(1) 42.34.22.77');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PERIC','Pericles Comidas clásicas','Guillermo Fernández','Representante de Vendas','Calle Dr. Jorge Cash 321','México D.F.','','05033','México','(5) 552-3745','(5) 545-3745');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PICCO','Piccolo und mehr','Georg Pipps','Gerente de Vendas','Geislweg 14','Salzburg','','5020','Áustria','6562-9722','6562-9723');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PRINI','Princesa Isabel Vinhos','Isabel de Castro','Representante de Vendas','Estrada da saúde n. 58','Lisboa','','1756','Portugal','(1) 356-5634','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('QUEDE','Que Delícia','Bernardo Batista','Gerente Financeiro','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brasil','(21) 555-4252','(21) 555-4545');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('QUEEN','Queen Cozinha','Lúcia Carvalho','Assistente de Marketing','Alameda dos Canàrios, 891','São Paulo','SP','05487-020','Brasil','(11) 555-1189','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('QUICK','QUICK-Stop','Horst Kloss','Gerente Financeiro','Taucherstraße 10','Cunewalde','','01307','Alemanha','0372-035188','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RANCH','Rancho grande','Sergio Gutiérrez','Representante de Vendas','Av. del Libertador 900','Buenos Aires','','1010','Argentina','(1) 123-5555','(1) 123-5556');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RATTC','Rattlesnake Canyon Grocery','Paula Wilson','Assistente do Repr. de Vendas','2817 Milton Dr.','Albuquerque','NM','87110','EUA','(505) 555-5939','(505) 555-3620');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('REGGC','Reggiani Caseifici','Maurizio Moroni','Assessor de Vendas','Strada Provinciale 124','Reggio Emilia','','42100','Itália','0522-556721','0522-556722');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RICAR','Ricardo Adocicados','Janete Limeira','Assistente do Agente de Vendas','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brasil','(21) 555-3412','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RICSU','Richter Supermarkt','Michael Holz','Gerente de Vendas','Grenzacherweg 237','Genève','','1203','Suíça','0897-034214','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ROMEY','Romero y tomillo','Alejandra Camino','Gerente Financeiro','Gran Vía, 1','Madrid','','28001','Espanha','(91) 745 6200','(91) 745 6210');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SANTG','Santé Gourmet','Jonas Bergulfsen','Proprietário','Erling Skakkes gate 78','Stavern','','4110','Noruega','07-98 92 35','07-98 92 47');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SAVEA','Save-a-lot Markets','Jose Pavarotti','Representante de Vendas','187 Suffolk Ln.','Boise','ID','83720','EUA','(208) 555-8097','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SEVES','Seven Seas Imports','Hari Kumar','Gerente de Vendas','90 Wadhurst Rd.','London','','OX15 4NB','Reino Unido','(171) 555-1717','(171) 555-5646');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SIMOB','Simons bistro','Jytte Petersen','Proprietário','Vinbæltet 34','København','','1734','Dinamarca','31 12 34 56','31 13 35 57');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SPECD','Spécialités du monde','Dominique Perrier','Gerente de Marketing','25, rue Lauriston','Paris','','75016','França','(1) 47.55.60.10','(1) 47.55.60.20');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SPLIR','Split Rail Beer & Ale','Art Braunschweiger','Gerente de Vendas','P.O. Box 555','Lander','WY','82520','EUA','(307) 555-4680','(307) 555-6525');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SUPRD','Suprêmes délices','Pascale Cartrain','Gerente Financeiro','Boulevard Tirou, 255','Charleroi','','B-6000','Bélgica','(071) 23 67 22 20','(071) 23 67 22 21');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('THEBI','The Big Cheese','Liz Nixon','Gerente de Marketing','89 Jefferson Way Suite 2','Portland','OR','97201','EUA','(503) 555-3612','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('THECR','The Cracker Box','Liu Wong','Assistente de Marketing','55 Grizzly Peak Rd.','Butte','MT','59801','EUA','(406) 555-5834','(406) 555-8083');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TOMSP','Toms Spezialitäten','Karin Josephs','Gerente de Marketing','Luisenstr. 48','Münster','','44087','Alemanha','0251-031259','0251-035695');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TORTU','Tortuga Restaurante','Miguel Angel Paolino','Proprietário','Avda. Azteca 123','México D.F.','','05033','México','(5) 555-2933','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TRADH','Tradição Hipermercados','Anabela Domingues','Representante de Vendas','Av. Inês de Castro, 414','São Paulo','SP','05634-030','Brasil','(11) 555-2167','(11) 555-2168');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TRAIH','Trail s Head Gourmet Provisioners','Helvetius Nagy','Assessor de Vendas','722 DaVinci Blvd.','Kirkland','WA','98034','EUA','(206) 555-8257','(206) 555-2174');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('VAFFE','Vaffeljernet','Palle Ibsen','Gerente de Vendas','Smagsløget 45','Århus','','8200','Dinamarca','86 21 32 43','86 22 33 44');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('VICTE','Victuailles en stock','Mary Saveley','Agente de Vendas','2, rue du Commerce','Lyon','','69004','França','78.32.54.86','78.32.54.87');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('VINET','Vins et alcools Chevalier','Paul Henriot','Gerente Financeiro','59 rue de l Abbaye','Reims','','51100','França','26.47.15.10','26.47.15.11');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WANDK','Die Wandernde Kuh','Rita Müller','Representante de Vendas','Adenauerallee 900','Stuttgart','','70563','Alemanha','0711-020361','0711-035428');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WARTH','Wartian Herkku','Pirkko Koskitalo','Gerente Financeiro','Torikatu 38','Oulu','','90110','Finlândia','981-443655','981-443655');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WELLI','Wellington Importadora','Paula Parente','Gerente de Vendas','Rua do Mercado, 12','Resende','SP','08737-363','Brasil','(14) 555-8122','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WHITC','White Clover Markets','Karl Jablonski','Proprietário','305 - 14th Ave. S. Suite 3B','Seattle','WA','98128','EUA','(206) 555-4112','(206) 555-4115');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WILMK','Wilman Kala','Matti Karttunen','Proprietário/Assist. Marketing','Keskuskatu 45','Helsinki','','21240','Finlândia','90-224 8858','90-224 8858');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WOLZA','Wolski  Zajazd','Zbyszek Piestrzeniewicz','Proprietário','ul. Filtrowa 68','Warszawa','','01-012','Polônia','(26) 642-7012','(26) 642-7012');

---------------------
-- Dados Funcionarios
---------------------
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Davolio','Nancy','Representante de Vendas','1968-12-08','507 - 20th Ave. E.Apt. 2A','Seattle','98122','EUA','(206) 555-9857',5000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Fuller','Andrew','Vice-Presidente de Vendas','1952-02-19','908 W. Capital Way','Tacoma','98401','EUA','(206) 555-9482',10000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Leverling','Janet','Representante de Vendas','1963-08-30','722 Moss Bay Blvd.','Kirkland','98033','EUA','(206) 555-3412',12000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Peacock','Margaret','Representante de Vendas','1958-09-19','4110 Old Redmond Rd.','Redmond','98052','EUA','(206) 555-8122',4500);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Buchanan','Steven','Gerente de Vendas','1955-03-04','14 Garrett Hill','London','SW1 8JR','Reino Unido','(71) 555-4848',11000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Suyama','Michael','Representante de Vendas','1963-07-02','Coventry House Miner Rd.','London','EC2 7JR','Reino Unido','(71) 555-7773',8000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('King','Robert','Representante de Vendas','1960-05-29','Edgeham Hollow Winchester Way','London','RG1 9SP','Reino Unido','(71) 555-5598',11500);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Callahan','Laura','Coordenador de Vendas Internas','1958-01-09','4726 - 11th Ave. N.E.','Seattle','98105','EUA','(206) 555-1189',9500);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Dodsworth','Anne','Representante de Vendas','1969-07-02','7 Houndstooth Rd.','London','WG2 7LT','Reino Unido','(71) 555-4444',4000);

-----------------
-- Dados Produtos
-----------------
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chai',1,1,18,39,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chang',1,1,19,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Aniseed Syrup',1,2,10,13,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chef Anton´s Cajun Seasoning',2,2,22,53,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chef Anton´s Gumbo Mix',2,2,21.35,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Grandma´s Boysenberry Spread',3,2,25,120,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Uncle Bob´s Organic Dried Pears',3,7,30,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Northwoods Cranberry Sauce',3,2,40,6,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Mishi Kobe Niku',4,6,97,29,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Ikura',4,8,31,31,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Queso Cabrales',5,4,21,22,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Queso Manchego La Pastora',5,4,38,86,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Konbu',6,8,6,24,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tofu',6,7,23.25,35,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Genen Shouyu',6,2,15.5,39,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Pavlova',7,3,17.45,29,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Alice Mutton',7,6,39,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Carnarvon Tigers',7,8,62.5,42,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Teatime Chocolate Biscuits',8,3,9.2,25,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sir Rodney´s Marmalade',8,3,81,40,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sir Rodney´s Scones',8,3,10,3,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gustaf´s Knäckebröd',9,5,21,104,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tunnbröd',9,5,9,61,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Guaraná Fantástica',10,1,4.5,20,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('NuNuCa Nuß-Nougat-Creme',11,3,14,76,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gumbär Gummibärchen',11,3,31.23,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Schoggi Schokolade',11,3,43.9,49,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Rössle Sauerkraut',12,7,45.6,26,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Thüringer Rostbratwurst',12,6,123.79,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Nord-Ost Matjeshering',13,8,25.89,10,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gorgonzola Telino',14,4,12.5,0,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Mascarpone Fabioli',14,4,32,9,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Geitost',15,4,2.5,112,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sasquatch Ale',16,1,14,111,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Steeleye Stout',16,1,18,20,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Inlagd Sill',17,8,19,112,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gravad lax',17,8,26,11,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Côte de Blaye',18,1,263.5,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chartreuse verte',18,1,18,69,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Boston Crab Meat',19,8,18.4,123,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Jack´s New England Clam Chowder',19,8,9.65,85,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Singaporean Hokkien Fried Mee',20,5,14,26,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Ipoh Coffee',20,1,46,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gula Malacca',20,2,19.45,27,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Røgede sild',21,8,9.5,5,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Spegesild',21,8,12,95,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Zaanse koeken',22,3,9.5,36,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chocolade',22,3,12.75,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Maxilaku',23,3,20,10,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Valkoinen suklaa',23,3,16.25,65,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Manjimup Dried Apples',24,7,53,20,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Filo Mix',24,5,7,38,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Perth Pasties',24,6,32.8,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tourtière',25,6,7.45,21,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Pâté chinois',25,6,24,115,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gnocchi di nonna Alice',26,5,38,21,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Ravioli Angelo',26,5,19.5,36,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Escargots de Bourgogne',27,8,13.25,62,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Raclette Courdavault',28,4,55,79,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Camembert Pierrot',28,4,34,19,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sirop d´érable',29,2,28.5,113,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tarte au sucre',29,3,49.3,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Vegie-spread',7,2,43.9,24,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Wimmers gute Semmelknödel',12,5,33.25,22,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Louisiana Fiery Hot Pepper Sauce',2,2,21.05,76,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Louisiana Hot Spiced Okra',2,2,17,4,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Laughing Lumberjack Lager',16,1,14,52,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Scottish Longbreads',8,3,12.5,6,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gudbrandsdalsost',15,4,36,26,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Outback Lager',7,1,15,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Fløtemysost',15,4,21.5,26,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Mozzarella di Giovanni',14,4,34.8,14,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Röd Kaviar',17,8,15,101,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Longlife Tofu',4,7,10,4,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Rhönbräu Klosterbier',12,1,7.75,125,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Lakkalikööri',23,1,18,57,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Original Frankfurter grüne Soße',12,2,13,32,0);

----------------
-- Dados Pedidos
----------------
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10248,'VINET',5,'1996/07/04','1996/08/01', 32.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10249,'TOMSP',6,'1996/07/05','1996/08/16', 11.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10250,'HANAR',4,'1996/07/08','1996/08/05', 65.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10251,'VICTE',3,'1996/07/08','1996/08/05', 41.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10252,'SUPRD',4,'1996/07/09','1996/08/06', 51.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10253,'HANAR',3,'1996/07/10','1996/07/24', 58.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10254,'CHOPS',5,'1996/07/11','1996/08/08', 22.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10255,'RICSU',9,'1996/07/12','1996/08/09', 148.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10256,'WELLI',3,'1996/07/15','1996/08/12', 13.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10257,'HILAA',4,'1996/07/16','1996/08/13', 81.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10258,'ERNSH',1,'1996/07/17','1996/08/14', 140.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10259,'CENTC',4,'1996/07/18','1996/08/15', 3.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10260,'OTTIK',4,'1996/07/19','1996/08/16', 55.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10261,'QUEDE',4,'1996/07/19','1996/08/16', 3.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10262,'RATTC',8,'1996/07/22','1996/08/19', 48.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10263,'ERNSH',9,'1996/07/23','1996/08/20', 146.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10264,'FOLKO',6,'1996/07/24','1996/08/21', 3.67)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10265,'BLONP',2,'1996/07/25','1996/08/22', 55.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10266,'WARTH',3,'1996/07/26','1996/09/06', 25.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10267,'FRANK',4,'1996/07/29','1996/08/26', 208.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10268,'GROSR',8,'1996/07/30','1996/08/27', 66.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10269,'WHITC',5,'1996/07/31','1996/08/14', 4.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10270,'WARTH',1,'1996/08/01','1996/08/29', 136.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10271,'SPLIR',6,'1996/08/01','1996/08/29', 4.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10272,'RATTC',6,'1996/08/02','1996/08/30', 98.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10273,'QUICK',3,'1996/08/05','1996/09/02', 76.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10274,'VINET',6,'1996/08/06','1996/09/03', 6.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10275,'MAGAA',1,'1996/08/07','1996/09/04', 26.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10276,'TORTU',8,'1996/08/08','1996/08/22', 13.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10277,'MORGK',2,'1996/08/09','1996/09/06', 125.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10278,'BERGS',8,'1996/08/12','1996/09/09', 92.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10279,'LEHMS',8,'1996/08/13','1996/09/10', 25.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10280,'BERGS',2,'1996/08/14','1996/09/11', 8.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10281,'ROMEY',4,'1996/08/14','1996/08/28', 2.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10282,'ROMEY',4,'1996/08/15','1996/09/12', 12.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10283,'LILAS',3,'1996/08/16','1996/09/13', 84.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10284,'LEHMS',4,'1996/08/19','1996/09/16', 76.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10285,'QUICK',1,'1996/08/20','1996/09/17', 76.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10286,'QUICK',8,'1996/08/21','1996/09/18', 229.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10287,'RICAR',8,'1996/08/22','1996/09/19', 12.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10288,'REGGC',4,'1996/08/23','1996/09/20', 7.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10289,'BSBEV',7,'1996/08/26','1996/09/23', 22.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10290,'COMMI',8,'1996/08/27','1996/09/24', 79.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10291,'QUEDE',6,'1996/08/27','1996/09/24', 6.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10292,'TRADH',1,'1996/08/28','1996/09/25', 1.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10293,'TORTU',1,'1996/08/29','1996/09/26', 21.18)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10294,'RATTC',4,'1996/08/30','1996/09/27', 147.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10295,'VINET',2,'1996/09/02','1996/09/30', 1.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10296,'LILAS',6,'1996/09/03','1996/10/01', 0.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10297,'BLONP',5,'1996/09/04','1996/10/16', 5.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10298,'HUNGO',6,'1996/09/05','1996/10/03', 168.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10299,'RICAR',4,'1996/09/06','1996/10/04', 29.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10300,'MAGAA',2,'1996/09/09','1996/10/07', 17.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10301,'WANDK',8,'1996/09/09','1996/10/07', 45.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10302,'SUPRD',4,'1996/09/10','1996/10/08', 6.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10303,'GODOS',7,'1996/09/11','1996/10/09', 107.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10304,'TORTU',1,'1996/09/12','1996/10/10', 63.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10305,'OLDWO',8,'1996/09/13','1996/10/11', 257.62)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10306,'ROMEY',1,'1996/09/16','1996/10/14', 7.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10307,'LONEP',2,'1996/09/17','1996/10/15', 0.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10308,'ANATR',7,'1996/09/18','1996/10/16', 1.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10309,'HUNGO',3,'1996/09/19','1996/10/17', 47.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10310,'THEBI',8,'1996/09/20','1996/10/18', 17.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10311,'DUMON',1,'1996/09/20','1996/10/04', 24.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10312,'WANDK',2,'1996/09/23','1996/10/21', 40.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10313,'QUICK',2,'1996/09/24','1996/10/22', 1.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10314,'RATTC',1,'1996/09/25','1996/10/23', 74.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10315,'ISLAT',4,'1996/09/26','1996/10/24', 41.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10316,'RATTC',1,'1996/09/27','1996/10/25', 150.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10317,'LONEP',6,'1996/09/30','1996/10/28', 12.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10318,'ISLAT',8,'1996/10/01','1996/10/29', 4.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10319,'TORTU',7,'1996/10/02','1996/10/30', 64.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10320,'WARTH',5,'1996/10/03','1996/10/17', 34.57)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10321,'ISLAT',3,'1996/10/03','1996/10/31', 3.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10322,'PERIC',7,'1996/10/04','1996/11/01', 0.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10323,'KOENE',4,'1996/10/07','1996/11/04', 4.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10324,'SAVEA',9,'1996/10/08','1996/11/05', 214.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10325,'KOENE',1,'1996/10/09','1996/10/23', 64.86)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10326,'BOLID',4,'1996/10/10','1996/11/07', 77.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10327,'FOLKO',2,'1996/10/11','1996/11/08', 63.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10328,'FURIB',4,'1996/10/14','1996/11/11', 87.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10329,'SPLIR',4,'1996/10/15','1996/11/26', 191.67)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10330,'LILAS',3,'1996/10/16','1996/11/13', 12.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10331,'BONAP',9,'1996/10/16','1996/11/27', 10.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10332,'MEREP',3,'1996/10/17','1996/11/28', 52.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10333,'WARTH',5,'1996/10/18','1996/11/15', 0.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10334,'VICTE',8,'1996/10/21','1996/11/18', 8.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10335,'HUNGO',7,'1996/10/22','1996/11/19', 42.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10336,'PRINI',7,'1996/10/23','1996/11/20', 15.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10337,'FRANK',4,'1996/10/24','1996/11/21', 108.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10338,'OLDWO',4,'1996/10/25','1996/11/22', 84.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10339,'MEREP',2,'1996/10/28','1996/11/25', 15.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10340,'BONAP',1,'1996/10/29','1996/11/26', 166.31)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10341,'SIMOB',7,'1996/10/29','1996/11/26', 26.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10342,'FRANK',4,'1996/10/30','1996/11/13', 54.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10343,'LEHMS',4,'1996/10/31','1996/11/28', 110.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10344,'WHITC',4,'1996/11/01','1996/11/29', 23.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10345,'QUICK',2,'1996/11/04','1996/12/02', 249.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10346,'RATTC',3,'1996/11/05','1996/12/17', 142.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10347,'FAMIA',4,'1996/11/06','1996/12/04', 3.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10348,'WANDK',4,'1996/11/07','1996/12/05', 0.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10349,'SPLIR',7,'1996/11/08','1996/12/06', 8.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10350,'LAMAI',6,'1996/11/11','1996/12/09', 64.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10351,'ERNSH',1,'1996/11/11','1996/12/09', 162.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10352,'FURIB',3,'1996/11/12','1996/11/26', 1.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10353,'PICCO',7,'1996/11/13','1996/12/11', 360.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10354,'PERIC',8,'1996/11/14','1996/12/12', 53.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10355,'AROUT',6,'1996/11/15','1996/12/13', 41.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10356,'WANDK',6,'1996/11/18','1996/12/16', 36.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10357,'LILAS',1,'1996/11/19','1996/12/17', 34.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10358,'LAMAI',5,'1996/11/20','1996/12/18', 19.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10359,'SEVES',5,'1996/11/21','1996/12/19', 288.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10360,'BLONP',4,'1996/11/22','1996/12/20', 131.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10361,'QUICK',1,'1996/11/22','1996/12/20', 183.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10362,'BONAP',3,'1996/11/25','1996/12/23', 96.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10363,'DRACD',4,'1996/11/26','1996/12/24', 30.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10364,'EASTC',1,'1996/11/26','1997/01/07', 71.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10365,'ANTON',3,'1996/11/27','1996/12/25', 22.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10366,'GALED',8,'1996/11/28','1997/01/09', 10.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10367,'VAFFE',7,'1996/11/28','1996/12/26', 13.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10368,'ERNSH',2,'1996/11/29','1996/12/27', 101.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10369,'SPLIR',8,'1996/12/02','1996/12/30', 195.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10370,'CHOPS',6,'1996/12/03','1996/12/31', 1.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10371,'LAMAI',1,'1996/12/03','1996/12/31', 0.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10372,'QUEEN',5,'1996/12/04','1997/01/01', 890.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10373,'HUNGO',4,'1996/12/05','1997/01/02', 124.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10374,'WOLZA',1,'1996/12/05','1997/01/02', 3.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10375,'HUNGC',3,'1996/12/06','1997/01/03', 20.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10376,'MEREP',1,'1996/12/09','1997/01/06', 20.39)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10377,'SEVES',1,'1996/12/09','1997/01/06', 22.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10378,'FOLKO',5,'1996/12/10','1997/01/07', 5.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10379,'QUEDE',2,'1996/12/11','1997/01/08', 45.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10380,'HUNGO',8,'1996/12/12','1997/01/09', 35.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10381,'LILAS',3,'1996/12/12','1997/01/09', 7.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10382,'ERNSH',4,'1996/12/13','1997/01/10', 94.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10383,'AROUT',8,'1996/12/16','1997/01/13', 34.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10384,'BERGS',3,'1996/12/16','1997/01/13', 168.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10385,'SPLIR',1,'1996/12/17','1997/01/14', 30.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10386,'FAMIA',9,'1996/12/18','1997/01/01', 13.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10387,'SANTG',1,'1996/12/18','1997/01/15', 93.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10388,'SEVES',2,'1996/12/19','1997/01/16', 34.86)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10389,'BOTTM',4,'1996/12/20','1997/01/17', 47.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10390,'ERNSH',6,'1996/12/23','1997/01/20', 126.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10391,'DRACD',3,'1996/12/23','1997/01/20', 5.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10392,'PICCO',2,'1996/12/24','1997/01/21', 122.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10393,'SAVEA',1,'1996/12/25','1997/01/22', 126.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10394,'HUNGC',1,'1996/12/25','1997/01/22', 30.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10395,'HILAA',6,'1996/12/26','1997/01/23', 184.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10396,'FRANK',1,'1996/12/27','1997/01/10', 135.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10397,'PRINI',5,'1996/12/27','1997/01/24', 60.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10398,'SAVEA',2,'1996/12/30','1997/01/27', 89.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10399,'VAFFE',8,'1996/12/31','1997/01/14', 27.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10400,'EASTC',1,'1997/01/01','1997/01/29', 83.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10401,'RATTC',1,'1997/01/01','1997/01/29', 12.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10402,'ERNSH',8,'1997/01/02','1997/02/13', 67.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10403,'ERNSH',4,'1997/01/03','1997/01/31', 73.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10404,'MAGAA',2,'1997/01/03','1997/01/31', 155.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10405,'LINOD',1,'1997/01/06','1997/02/03', 34.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10406,'QUEEN',7,'1997/01/07','1997/02/18', 108.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10407,'OTTIK',2,'1997/01/07','1997/02/04', 91.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10408,'FOLIG',8,'1997/01/08','1997/02/05', 11.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10409,'OCEAN',3,'1997/01/09','1997/02/06', 29.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10410,'BOTTM',3,'1997/01/10','1997/02/07', 2.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10411,'BOTTM',9,'1997/01/10','1997/02/07', 23.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10412,'WARTH',8,'1997/01/13','1997/02/10', 3.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10413,'LAMAI',3,'1997/01/14','1997/02/11', 95.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10414,'FAMIA',2,'1997/01/14','1997/02/11', 21.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10415,'HUNGC',3,'1997/01/15','1997/02/12', 0.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10416,'WARTH',8,'1997/01/16','1997/02/13', 22.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10417,'SIMOB',4,'1997/01/16','1997/02/13', 70.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10418,'QUICK',4,'1997/01/17','1997/02/14', 17.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10419,'RICSU',4,'1997/01/20','1997/02/17', 137.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10420,'WELLI',3,'1997/01/21','1997/02/18', 44.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10421,'QUEDE',8,'1997/01/21','1997/03/04', 99.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10422,'FRANS',2,'1997/01/22','1997/02/19', 3.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10423,'GOURL',6,'1997/01/23','1997/02/06', 24.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10424,'MEREP',7,'1997/01/23','1997/02/20', 370.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10425,'LAMAI',6,'1997/01/24','1997/02/21', 7.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10426,'GALED',4,'1997/01/27','1997/02/24', 18.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10427,'PICCO',4,'1997/01/27','1997/02/24', 31.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10428,'REGGC',7,'1997/01/28','1997/02/25', 11.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10429,'HUNGO',3,'1997/01/29','1997/03/12', 56.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10430,'ERNSH',4,'1997/01/30','1997/02/13', 458.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10431,'BOTTM',4,'1997/01/30','1997/02/13', 44.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10432,'SPLIR',3,'1997/01/31','1997/02/14', 4.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10433,'PRINI',3,'1997/02/03','1997/03/03', 73.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10434,'FOLKO',3,'1997/02/03','1997/03/03', 17.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10435,'CONSH',8,'1997/02/04','1997/03/18', 9.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10436,'BLONP',3,'1997/02/05','1997/03/05', 156.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10437,'WARTH',8,'1997/02/05','1997/03/05', 19.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10438,'TOMSP',3,'1997/02/06','1997/03/06', 8.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10439,'MEREP',6,'1997/02/07','1997/03/07', 4.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10440,'SAVEA',4,'1997/02/10','1997/03/10', 86.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10441,'OLDWO',3,'1997/02/10','1997/03/24', 73.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10442,'ERNSH',3,'1997/02/11','1997/03/11', 47.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10443,'REGGC',8,'1997/02/12','1997/03/12', 13.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10444,'BERGS',3,'1997/02/12','1997/03/12', 3.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10445,'BERGS',3,'1997/02/13','1997/03/13', 9.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10446,'TOMSP',6,'1997/02/14','1997/03/14', 14.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10447,'RICAR',4,'1997/02/14','1997/03/14', 68.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10448,'RANCH',4,'1997/02/17','1997/03/17', 38.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10449,'BLONP',3,'1997/02/18','1997/03/18', 53.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10450,'VICTE',8,'1997/02/19','1997/03/19', 7.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10451,'QUICK',4,'1997/02/19','1997/03/05', 189.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10452,'SAVEA',8,'1997/02/20','1997/03/20', 140.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10453,'AROUT',1,'1997/02/21','1997/03/21', 25.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10454,'LAMAI',4,'1997/02/21','1997/03/21', 2.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10455,'WARTH',8,'1997/02/24','1997/04/07', 180.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10456,'KOENE',8,'1997/02/25','1997/04/08', 8.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10457,'KOENE',2,'1997/02/25','1997/03/25', 11.57)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10458,'SUPRD',7,'1997/02/26','1997/03/26', 147.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10459,'VICTE',4,'1997/02/27','1997/03/27', 25.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10460,'FOLKO',8,'1997/02/28','1997/03/28', 16.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10461,'LILAS',1,'1997/02/28','1997/03/28', 148.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10462,'CONSH',2,'1997/03/03','1997/03/31', 6.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10463,'SUPRD',5,'1997/03/04','1997/04/01', 14.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10464,'FURIB',4,'1997/03/04','1997/04/01', 89.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10465,'VAFFE',1,'1997/03/05','1997/04/02', 145.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10466,'COMMI',4,'1997/03/06','1997/04/03', 11.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10467,'MAGAA',8,'1997/03/06','1997/04/03', 4.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10468,'KOENE',3,'1997/03/07','1997/04/04', 44.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10469,'WHITC',1,'1997/03/10','1997/04/07', 60.18)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10470,'BONAP',4,'1997/03/11','1997/04/08', 64.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10471,'BSBEV',2,'1997/03/11','1997/04/08', 45.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10472,'SEVES',8,'1997/03/12','1997/04/09', 4.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10473,'ISLAT',1,'1997/03/13','1997/03/27', 16.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10474,'PERIC',5,'1997/03/13','1997/04/10', 83.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10475,'SUPRD',9,'1997/03/14','1997/04/11', 68.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10476,'HILAA',8,'1997/03/17','1997/04/14', 4.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10477,'PRINI',5,'1997/03/17','1997/04/14', 13.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10478,'VICTE',2,'1997/03/18','1997/04/01', 4.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10479,'RATTC',3,'1997/03/19','1997/04/16', 708.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10480,'FOLIG',6,'1997/03/20','1997/04/17', 1.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10481,'RICAR',8,'1997/03/20','1997/04/17', 64.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10482,'LAZYK',1,'1997/03/21','1997/04/18', 7.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10483,'WHITC',7,'1997/03/24','1997/04/21', 15.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10484,'BSBEV',3,'1997/03/24','1997/04/21', 6.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10485,'LINOD',4,'1997/03/25','1997/04/08', 64.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10486,'HILAA',1,'1997/03/26','1997/04/23', 30.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10487,'QUEEN',2,'1997/03/26','1997/04/23', 71.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10488,'FRANK',8,'1997/03/27','1997/04/24', 4.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10489,'PICCO',6,'1997/03/28','1997/04/25', 5.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10490,'HILAA',7,'1997/03/31','1997/04/28', 210.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10491,'FURIB',8,'1997/03/31','1997/04/28', 16.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10492,'BOTTM',3,'1997/04/01','1997/04/29', 62.89)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10493,'LAMAI',4,'1997/04/02','1997/04/30', 10.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10494,'COMMI',4,'1997/04/02','1997/04/30', 65.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10495,'LAUGB',3,'1997/04/03','1997/05/01', 4.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10496,'TRADH',7,'1997/04/04','1997/05/02', 46.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10497,'LEHMS',7,'1997/04/04','1997/05/02', 36.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10498,'HILAA',8,'1997/04/07','1997/05/05', 29.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10499,'LILAS',4,'1997/04/08','1997/05/06', 102.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10500,'LAMAI',6,'1997/04/09','1997/05/07', 42.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10501,'BLAUS',9,'1997/04/09','1997/05/07', 8.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10502,'PERIC',2,'1997/04/10','1997/05/08', 69.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10503,'HUNGO',6,'1997/04/11','1997/05/09', 16.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10504,'WHITC',4,'1997/04/11','1997/05/09', 59.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10505,'MEREP',3,'1997/04/14','1997/05/12', 7.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10506,'KOENE',9,'1997/04/15','1997/05/13', 21.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10507,'ANTON',7,'1997/04/15','1997/05/13', 47.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10508,'OTTIK',1,'1997/04/16','1997/05/14', 4.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10509,'BLAUS',4,'1997/04/17','1997/05/15', 0.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10510,'SAVEA',6,'1997/04/18','1997/05/16', 367.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10511,'BONAP',4,'1997/04/18','1997/05/16', 350.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10512,'FAMIA',7,'1997/04/21','1997/05/19', 3.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10513,'WANDK',7,'1997/04/22','1997/06/03', 105.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10514,'ERNSH',3,'1997/04/22','1997/05/20', 789.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10515,'QUICK',2,'1997/04/23','1997/05/07', 204.47)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10516,'HUNGO',2,'1997/04/24','1997/05/22', 62.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10517,'NORTS',3,'1997/04/24','1997/05/22', 32.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10518,'TORTU',4,'1997/04/25','1997/05/09', 218.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10519,'CHOPS',6,'1997/04/28','1997/05/26', 91.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10520,'SANTG',7,'1997/04/29','1997/05/27', 13.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10521,'CACTU',8,'1997/04/29','1997/05/27', 17.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10522,'LEHMS',4,'1997/04/30','1997/05/28', 45.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10523,'SEVES',7,'1997/05/01','1997/05/29', 77.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10524,'BERGS',1,'1997/05/01','1997/05/29', 244.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10525,'BONAP',1,'1997/05/02','1997/05/30', 11.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10526,'WARTH',4,'1997/05/05','1997/06/02', 58.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10527,'QUICK',7,'1997/05/05','1997/06/02', 41.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10528,'GREAL',6,'1997/05/06','1997/05/20', 3.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10529,'MAISD',5,'1997/05/07','1997/06/04', 66.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10530,'PICCO',3,'1997/05/08','1997/06/05', 339.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10531,'OCEAN',7,'1997/05/08','1997/06/05', 8.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10532,'EASTC',7,'1997/05/09','1997/06/06', 74.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10533,'FOLKO',8,'1997/05/12','1997/06/09', 188.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10534,'LEHMS',8,'1997/05/12','1997/06/09', 27.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10535,'ANTON',4,'1997/05/13','1997/06/10', 15.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10536,'LEHMS',3,'1997/05/14','1997/06/11', 58.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10537,'RICSU',1,'1997/05/14','1997/05/28', 78.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10538,'BSBEV',9,'1997/05/15','1997/06/12', 4.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10539,'BSBEV',6,'1997/05/16','1997/06/13', 12.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10540,'QUICK',3,'1997/05/19','1997/06/16', 1007.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10541,'HANAR',2,'1997/05/19','1997/06/16', 68.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10542,'KOENE',1,'1997/05/20','1997/06/17', 10.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10543,'LILAS',8,'1997/05/21','1997/06/18', 48.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10544,'LONEP',4,'1997/05/21','1997/06/18', 24.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10545,'LAZYK',8,'1997/05/22','1997/06/19', 11.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10546,'VICTE',1,'1997/05/23','1997/06/20', 194.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10547,'SEVES',3,'1997/05/23','1997/06/20', 178.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10548,'TOMSP',3,'1997/05/26','1997/06/23', 1.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10549,'QUICK',5,'1997/05/27','1997/06/10', 171.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10550,'GODOS',7,'1997/05/28','1997/06/25', 4.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10551,'FURIB',4,'1997/05/28','1997/07/09', 72.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10552,'HILAA',2,'1997/05/29','1997/06/26', 83.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10553,'WARTH',2,'1997/05/30','1997/06/27', 149.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10554,'OTTIK',4,'1997/05/30','1997/06/27', 120.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10555,'SAVEA',6,'1997/06/02','1997/06/30', 252.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10556,'SIMOB',2,'1997/06/03','1997/07/15', 9.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10557,'LEHMS',9,'1997/06/03','1997/06/17', 96.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10558,'AROUT',1,'1997/06/04','1997/07/02', 72.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10559,'BLONP',6,'1997/06/05','1997/07/03', 8.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10560,'FRANK',8,'1997/06/06','1997/07/04', 36.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10561,'FOLKO',2,'1997/06/06','1997/07/04', 242.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10562,'REGGC',1,'1997/06/09','1997/07/07', 22.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10563,'RICAR',2,'1997/06/10','1997/07/22', 60.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10564,'RATTC',4,'1997/06/10','1997/07/08', 13.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10565,'MEREP',8,'1997/06/11','1997/07/09', 7.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10566,'BLONP',9,'1997/06/12','1997/07/10', 88.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10567,'HUNGO',1,'1997/06/12','1997/07/10', 33.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10568,'GALED',3,'1997/06/13','1997/07/11', 6.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10569,'RATTC',5,'1997/06/16','1997/07/14', 58.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10570,'MEREP',3,'1997/06/17','1997/07/15', 188.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10571,'ERNSH',8,'1997/06/17','1997/07/29', 26.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10572,'BERGS',3,'1997/06/18','1997/07/16', 116.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10573,'ANTON',7,'1997/06/19','1997/07/17', 84.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10574,'TRAIH',4,'1997/06/19','1997/07/17', 37.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10575,'MORGK',5,'1997/06/20','1997/07/04', 127.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10576,'TORTU',3,'1997/06/23','1997/07/07', 18.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10577,'TRAIH',9,'1997/06/23','1997/08/04', 25.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10578,'BSBEV',4,'1997/06/24','1997/07/22', 29.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10579,'LETSS',1,'1997/06/25','1997/07/23', 13.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10580,'OTTIK',4,'1997/06/26','1997/07/24', 75.89)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10581,'FAMIA',3,'1997/06/26','1997/07/24', 3.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10582,'BLAUS',3,'1997/06/27','1997/07/25', 27.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10583,'WARTH',2,'1997/06/30','1997/07/28', 7.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10584,'BLONP',4,'1997/06/30','1997/07/28', 59.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10585,'WELLI',7,'1997/07/01','1997/07/29', 13.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10586,'REGGC',9,'1997/07/02','1997/07/30', 0.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10587,'QUEDE',1,'1997/07/02','1997/07/30', 62.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10588,'QUICK',2,'1997/07/03','1997/07/31', 194.67)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10589,'GREAL',8,'1997/07/04','1997/08/01', 4.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10590,'MEREP',4,'1997/07/07','1997/08/04', 44.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10591,'VAFFE',1,'1997/07/07','1997/07/21', 55.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10592,'LEHMS',3,'1997/07/08','1997/08/05', 32.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10593,'LEHMS',7,'1997/07/09','1997/08/06', 174.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10594,'OLDWO',3,'1997/07/09','1997/08/06', 5.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10595,'ERNSH',2,'1997/07/10','1997/08/07', 96.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10596,'WHITC',8,'1997/07/11','1997/08/08', 16.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10597,'PICCO',7,'1997/07/11','1997/08/08', 35.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10598,'RATTC',1,'1997/07/14','1997/08/11', 44.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10599,'BSBEV',6,'1997/07/15','1997/08/26', 29.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10600,'HUNGC',4,'1997/07/16','1997/08/13', 45.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10601,'HILAA',7,'1997/07/16','1997/08/27', 58.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10602,'VAFFE',8,'1997/07/17','1997/08/14', 2.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10603,'SAVEA',8,'1997/07/18','1997/08/15', 48.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10604,'FURIB',1,'1997/07/18','1997/08/15', 7.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10605,'MEREP',1,'1997/07/21','1997/08/18', 379.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10606,'TRADH',4,'1997/07/22','1997/08/19', 79.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10607,'SAVEA',5,'1997/07/22','1997/08/19', 200.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10608,'TOMSP',4,'1997/07/23','1997/08/20', 27.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10609,'DUMON',7,'1997/07/24','1997/08/21', 1.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10610,'LAMAI',8,'1997/07/25','1997/08/22', 26.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10611,'WOLZA',6,'1997/07/25','1997/08/22', 80.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10612,'SAVEA',1,'1997/07/28','1997/08/25', 544.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10613,'HILAA',4,'1997/07/29','1997/08/26', 8.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10614,'BLAUS',8,'1997/07/29','1997/08/26', 1.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10615,'WILMK',2,'1997/07/30','1997/08/27', 0.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10616,'GREAL',1,'1997/07/31','1997/08/28', 116.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10617,'GREAL',4,'1997/07/31','1997/08/28', 18.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10618,'MEREP',1,'1997/08/01','1997/09/12', 154.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10619,'MEREP',3,'1997/08/04','1997/09/01', 91.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10620,'LAUGB',2,'1997/08/05','1997/09/02', 0.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10621,'ISLAT',4,'1997/08/05','1997/09/02', 23.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10622,'RICAR',4,'1997/08/06','1997/09/03', 50.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10623,'FRANK',8,'1997/08/07','1997/09/04', 97.18)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10624,'THECR',4,'1997/08/07','1997/09/04', 94.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10625,'ANATR',3,'1997/08/08','1997/09/05', 43.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10626,'BERGS',1,'1997/08/11','1997/09/08', 138.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10627,'SAVEA',8,'1997/08/11','1997/09/22', 107.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10628,'BLONP',4,'1997/08/12','1997/09/09', 30.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10629,'GODOS',4,'1997/08/12','1997/09/09', 85.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10630,'KOENE',1,'1997/08/13','1997/09/10', 32.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10631,'LAMAI',8,'1997/08/14','1997/09/11', 0.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10632,'WANDK',8,'1997/08/14','1997/09/11', 41.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10633,'ERNSH',7,'1997/08/15','1997/09/12', 477.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10634,'FOLIG',4,'1997/08/15','1997/09/12', 487.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10635,'MAGAA',8,'1997/08/18','1997/09/15', 47.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10636,'WARTH',4,'1997/08/19','1997/09/16', 1.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10637,'QUEEN',6,'1997/08/19','1997/09/16', 201.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10638,'LINOD',3,'1997/08/20','1997/09/17', 158.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10639,'SANTG',7,'1997/08/20','1997/09/17', 38.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10640,'WANDK',4,'1997/08/21','1997/09/18', 23.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10641,'HILAA',4,'1997/08/22','1997/09/19', 179.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10642,'SIMOB',7,'1997/08/22','1997/09/19', 41.89)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10643,'ALFKI',6,'1997/08/25','1997/09/22', 29.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10644,'WELLI',3,'1997/08/25','1997/09/22', 0.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10645,'HANAR',4,'1997/08/26','1997/09/23', 12.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10646,'HUNGO',9,'1997/08/27','1997/10/08', 142.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10647,'QUEDE',4,'1997/08/27','1997/09/10', 45.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10648,'RICAR',5,'1997/08/28','1997/10/09', 14.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10649,'MAISD',5,'1997/08/28','1997/09/25', 6.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10650,'FAMIA',5,'1997/08/29','1997/09/26', 176.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10651,'WANDK',8,'1997/09/01','1997/09/29', 20.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10652,'GOURL',4,'1997/09/01','1997/09/29', 7.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10653,'FRANK',1,'1997/09/02','1997/09/30', 93.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10654,'BERGS',5,'1997/09/02','1997/09/30', 55.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10655,'REGGC',1,'1997/09/03','1997/10/01', 4.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10656,'GREAL',6,'1997/09/04','1997/10/02', 57.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10657,'SAVEA',2,'1997/09/04','1997/10/02', 352.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10658,'QUICK',4,'1997/09/05','1997/10/03', 364.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10659,'QUEEN',7,'1997/09/05','1997/10/03', 105.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10660,'HUNGC',8,'1997/09/08','1997/10/06', 111.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10661,'HUNGO',7,'1997/09/09','1997/10/07', 17.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10662,'LONEP',3,'1997/09/09','1997/10/07', 1.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10663,'BONAP',2,'1997/09/10','1997/09/24', 113.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10664,'FURIB',1,'1997/09/10','1997/10/08', 1.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10665,'LONEP',1,'1997/09/11','1997/10/09', 26.31)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10666,'RICSU',7,'1997/09/12','1997/10/10', 232.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10667,'ERNSH',7,'1997/09/12','1997/10/10', 78.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10668,'WANDK',1,'1997/09/15','1997/10/13', 47.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10669,'SIMOB',2,'1997/09/15','1997/10/13', 24.39)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10670,'FRANK',4,'1997/09/16','1997/10/14', 203.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10671,'FRANR',1,'1997/09/17','1997/10/15', 30.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10672,'BERGS',9,'1997/09/17','1997/10/01', 95.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10673,'WILMK',2,'1997/09/18','1997/10/16', 22.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10674,'ISLAT',4,'1997/09/18','1997/10/16', 0.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10675,'FRANK',5,'1997/09/19','1997/10/17', 31.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10676,'TORTU',2,'1997/09/22','1997/10/20', 2.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10677,'ANTON',1,'1997/09/22','1997/10/20', 4.03)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10678,'SAVEA',7,'1997/09/23','1997/10/21', 388.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10679,'BLONP',8,'1997/09/23','1997/10/21', 27.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10680,'OLDWO',1,'1997/09/24','1997/10/22', 26.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10681,'GREAL',3,'1997/09/25','1997/10/23', 76.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10682,'ANTON',3,'1997/09/25','1997/10/23', 36.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10683,'DUMON',2,'1997/09/26','1997/10/24', 4.40)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10684,'OTTIK',3,'1997/09/26','1997/10/24', 145.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10685,'GOURL',4,'1997/09/29','1997/10/13', 33.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10686,'PICCO',2,'1997/09/30','1997/10/28', 96.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10687,'HUNGO',9,'1997/09/30','1997/10/28', 296.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10688,'VAFFE',4,'1997/10/01','1997/10/15', 299.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10689,'BERGS',1,'1997/10/01','1997/10/29', 13.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10690,'HANAR',1,'1997/10/02','1997/10/30', 15.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10691,'QUICK',2,'1997/10/03','1997/11/14', 810.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10692,'ALFKI',4,'1997/10/03','1997/10/31', 61.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10693,'WHITC',3,'1997/10/06','1997/10/20', 139.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10694,'QUICK',8,'1997/10/06','1997/11/03', 398.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10695,'WILMK',7,'1997/10/07','1997/11/18', 16.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10696,'WHITC',8,'1997/10/08','1997/11/19', 102.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10697,'LINOD',3,'1997/10/08','1997/11/05', 45.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10698,'ERNSH',4,'1997/10/09','1997/11/06', 272.47)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10699,'MORGK',3,'1997/10/09','1997/11/06', 0.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10700,'SAVEA',3,'1997/10/10','1997/11/07', 65.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10701,'HUNGO',6,'1997/10/13','1997/10/27', 220.31)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10702,'ALFKI',4,'1997/10/13','1997/11/24', 23.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10703,'FOLKO',6,'1997/10/14','1997/11/11', 152.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10704,'QUEEN',6,'1997/10/14','1997/11/11', 4.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10705,'HILAA',9,'1997/10/15','1997/11/12', 3.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10706,'OLDWO',8,'1997/10/16','1997/11/13', 135.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10707,'AROUT',4,'1997/10/16','1997/10/30', 21.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10708,'THEBI',6,'1997/10/17','1997/11/28', 2.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10709,'GOURL',1,'1997/10/17','1997/11/14', 210.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10710,'FRANS',1,'1997/10/20','1997/11/17', 4.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10711,'SAVEA',5,'1997/10/21','1997/12/02', 52.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10712,'HUNGO',3,'1997/10/21','1997/11/18', 89.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10713,'SAVEA',1,'1997/10/22','1997/11/19', 167.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10714,'SAVEA',5,'1997/10/22','1997/11/19', 24.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10715,'BONAP',3,'1997/10/23','1997/11/06', 63.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10716,'RANCH',4,'1997/10/24','1997/11/21', 22.57)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10717,'FRANK',1,'1997/10/24','1997/11/21', 59.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10718,'KOENE',1,'1997/10/27','1997/11/24', 170.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10719,'LETSS',8,'1997/10/27','1997/11/24', 51.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10720,'QUEDE',8,'1997/10/28','1997/11/11', 9.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10721,'QUICK',5,'1997/10/29','1997/11/26', 48.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10722,'SAVEA',8,'1997/10/29','1997/12/10', 74.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10723,'WHITC',3,'1997/10/30','1997/11/27', 21.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10724,'MEREP',8,'1997/10/30','1997/12/11', 57.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10725,'FAMIA',4,'1997/10/31','1997/11/28', 10.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10726,'EASTC',4,'1997/11/03','1997/11/17', 16.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10727,'REGGC',2,'1997/11/03','1997/12/01', 89.90)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10728,'QUEEN',4,'1997/11/04','1997/12/02', 58.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10729,'LINOD',8,'1997/11/04','1997/12/16', 141.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10730,'BONAP',5,'1997/11/05','1997/12/03', 20.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10731,'CHOPS',7,'1997/11/06','1997/12/04', 96.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10732,'BONAP',3,'1997/11/06','1997/12/04', 16.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10733,'BERGS',1,'1997/11/07','1997/12/05', 110.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10734,'GOURL',2,'1997/11/07','1997/12/05', 1.63)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10735,'LETSS',6,'1997/11/10','1997/12/08', 45.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10736,'HUNGO',9,'1997/11/11','1997/12/09', 44.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10737,'VINET',2,'1997/11/11','1997/12/09', 7.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10738,'SPECD',2,'1997/11/12','1997/12/10', 2.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10739,'VINET',3,'1997/11/12','1997/12/10', 11.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10740,'WHITC',4,'1997/11/13','1997/12/11', 81.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10741,'AROUT',4,'1997/11/14','1997/11/28', 10.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10742,'BOTTM',3,'1997/11/14','1997/12/12', 243.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10743,'AROUT',1,'1997/11/17','1997/12/15', 23.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10744,'VAFFE',6,'1997/11/17','1997/12/15', 69.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10745,'QUICK',9,'1997/11/18','1997/12/16', 3.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10746,'CHOPS',1,'1997/11/19','1997/12/17', 31.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10747,'PICCO',6,'1997/11/19','1997/12/17', 117.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10748,'SAVEA',3,'1997/11/20','1997/12/18', 232.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10749,'ISLAT',4,'1997/11/20','1997/12/18', 61.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10750,'WARTH',9,'1997/11/21','1997/12/19', 79.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10751,'RICSU',3,'1997/11/24','1997/12/22', 130.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10752,'NORTS',2,'1997/11/24','1997/12/22', 1.39)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10753,'FRANS',3,'1997/11/25','1997/12/23', 7.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10754,'MAGAA',6,'1997/11/25','1997/12/23', 2.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10755,'BONAP',4,'1997/11/26','1997/12/24', 16.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10756,'SPLIR',8,'1997/11/27','1997/12/25', 73.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10757,'SAVEA',6,'1997/11/27','1997/12/25', 8.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10758,'RICSU',3,'1997/11/28','1997/12/26', 138.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10759,'ANATR',3,'1997/11/28','1997/12/26', 11.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10760,'MAISD',4,'1997/12/01','1997/12/29', 155.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10761,'RATTC',5,'1997/12/02','1997/12/30', 18.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10762,'FOLKO',3,'1997/12/02','1997/12/30', 328.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10763,'FOLIG',3,'1997/12/03','1997/12/31', 37.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10764,'ERNSH',6,'1997/12/03','1997/12/31', 145.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10765,'QUICK',3,'1997/12/04','1998/01/01', 42.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10766,'OTTIK',4,'1997/12/05','1998/01/02', 157.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10767,'SUPRD',4,'1997/12/05','1998/01/02', 1.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10768,'AROUT',3,'1997/12/08','1998/01/05', 146.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10769,'VAFFE',3,'1997/12/08','1998/01/05', 65.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10770,'HANAR',8,'1997/12/09','1998/01/06', 5.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10771,'ERNSH',9,'1997/12/10','1998/01/07', 11.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10772,'LEHMS',3,'1997/12/10','1998/01/07', 91.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10773,'ERNSH',1,'1997/12/11','1998/01/08', 96.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10774,'FOLKO',4,'1997/12/11','1997/12/25', 48.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10775,'THECR',7,'1997/12/12','1998/01/09', 20.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10776,'ERNSH',1,'1997/12/15','1998/01/12', 351.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10777,'GOURL',7,'1997/12/15','1997/12/29', 3.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10778,'BERGS',3,'1997/12/16','1998/01/13', 6.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10779,'MORGK',3,'1997/12/16','1998/01/13', 58.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10780,'LILAS',2,'1997/12/16','1997/12/30', 42.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10781,'WARTH',2,'1997/12/17','1998/01/14', 73.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10782,'CACTU',9,'1997/12/17','1998/01/14', 1.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10783,'HANAR',4,'1997/12/18','1998/01/15', 124.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10784,'MAGAA',4,'1997/12/18','1998/01/15', 70.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10785,'GROSR',1,'1997/12/18','1998/01/15', 1.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10786,'QUEEN',8,'1997/12/19','1998/01/16', 110.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10787,'LAMAI',2,'1997/12/19','1998/01/02', 249.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10788,'QUICK',1,'1997/12/22','1998/01/19', 42.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10789,'FOLIG',1,'1997/12/22','1998/01/19', 100.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10790,'GOURL',6,'1997/12/22','1998/01/19', 28.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10791,'FRANK',6,'1997/12/23','1998/01/20', 16.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10792,'WOLZA',1,'1997/12/23','1998/01/20', 23.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10793,'AROUT',3,'1997/12/24','1998/01/21', 4.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10794,'QUEDE',6,'1997/12/24','1998/01/21', 21.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10795,'ERNSH',8,'1997/12/24','1998/01/21', 126.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10796,'HILAA',3,'1997/12/25','1998/01/22', 26.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10797,'DRACD',7,'1997/12/25','1998/01/22', 33.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10798,'ISLAT',2,'1997/12/26','1998/01/23', 2.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10799,'KOENE',9,'1997/12/26','1998/02/06', 30.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10800,'SEVES',1,'1997/12/26','1998/01/23', 137.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10801,'BOLID',4,'1997/12/29','1998/01/26', 97.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10802,'SIMOB',4,'1997/12/29','1998/01/26', 257.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10803,'WELLI',4,'1997/12/30','1998/01/27', 55.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10804,'SEVES',6,'1997/12/30','1998/01/27', 27.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10805,'THEBI',2,'1997/12/30','1998/01/27', 237.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10806,'VICTE',3,'1997/12/31','1998/01/28', 22.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10807,'FRANS',4,'1997/12/31','1998/01/28', 1.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10808,'OLDWO',2,'1998/01/01','1998/01/29', 45.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10809,'WELLI',7,'1998/01/01','1998/01/29', 4.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10810,'LAUGB',2,'1998/01/01','1998/01/29', 4.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10811,'LINOD',8,'1998/01/02','1998/01/30', 31.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10812,'REGGC',5,'1998/01/02','1998/01/30', 59.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10813,'RICAR',1,'1998/01/05','1998/02/02', 47.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10814,'VICTE',3,'1998/01/05','1998/02/02', 130.94)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10815,'SAVEA',2,'1998/01/05','1998/02/02', 14.62)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10816,'GREAL',4,'1998/01/06','1998/02/03', 719.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10817,'KOENE',3,'1998/01/06','1998/01/20', 306.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10818,'MAGAA',7,'1998/01/07','1998/02/04', 65.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10819,'CACTU',2,'1998/01/07','1998/02/04', 19.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10820,'RATTC',3,'1998/01/07','1998/02/04', 37.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10821,'SPLIR',1,'1998/01/08','1998/02/05', 36.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10822,'TRAIH',6,'1998/01/08','1998/02/05', 7.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10823,'LILAS',5,'1998/01/09','1998/02/06', 163.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10824,'FOLKO',8,'1998/01/09','1998/02/06', 1.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10825,'DRACD',1,'1998/01/09','1998/02/06', 79.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10826,'BLONP',6,'1998/01/12','1998/02/09', 7.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10827,'BONAP',1,'1998/01/12','1998/01/26', 63.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10828,'RANCH',9,'1998/01/13','1998/01/27', 90.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10829,'ISLAT',9,'1998/01/13','1998/02/10', 154.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10830,'TRADH',4,'1998/01/13','1998/02/24', 81.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10831,'SANTG',3,'1998/01/14','1998/02/11', 72.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10832,'LAMAI',2,'1998/01/14','1998/02/11', 43.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10833,'OTTIK',6,'1998/01/15','1998/02/12', 71.49)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10834,'TRADH',1,'1998/01/15','1998/02/12', 29.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10835,'ALFKI',1,'1998/01/15','1998/02/12', 69.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10836,'ERNSH',7,'1998/01/16','1998/02/13', 411.88)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10837,'BERGS',9,'1998/01/16','1998/02/13', 13.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10838,'LINOD',3,'1998/01/19','1998/02/16', 59.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10839,'TRADH',3,'1998/01/19','1998/02/16', 35.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10840,'LINOD',4,'1998/01/19','1998/03/02', 2.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10841,'SUPRD',5,'1998/01/20','1998/02/17', 424.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10842,'TORTU',1,'1998/01/20','1998/02/17', 54.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10843,'VICTE',4,'1998/01/21','1998/02/18', 9.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10844,'PICCO',8,'1998/01/21','1998/02/18', 25.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10845,'QUICK',8,'1998/01/21','1998/02/04', 212.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10846,'SUPRD',2,'1998/01/22','1998/03/05', 56.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10847,'SAVEA',4,'1998/01/22','1998/02/05', 487.57)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10848,'CONSH',7,'1998/01/23','1998/02/20', 38.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10849,'KOENE',9,'1998/01/23','1998/02/20', 0.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10850,'VICTE',1,'1998/01/23','1998/03/06', 49.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10851,'RICAR',5,'1998/01/26','1998/02/23', 160.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10852,'RATTC',8,'1998/01/26','1998/02/09', 174.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10853,'BLAUS',9,'1998/01/27','1998/02/24', 53.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10854,'ERNSH',3,'1998/01/27','1998/02/24', 100.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10855,'OLDWO',3,'1998/01/27','1998/02/24', 170.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10856,'ANTON',3,'1998/01/28','1998/02/25', 58.43)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10857,'BERGS',8,'1998/01/28','1998/02/25', 188.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10858,'LACOR',2,'1998/01/29','1998/02/26', 52.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10859,'FRANK',1,'1998/01/29','1998/02/26', 76.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10860,'FRANR',3,'1998/01/29','1998/02/26', 19.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10861,'WHITC',4,'1998/01/30','1998/02/27', 14.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10862,'LEHMS',8,'1998/01/30','1998/03/13', 53.23)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10863,'HILAA',4,'1998/02/02','1998/03/02', 30.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10864,'AROUT',4,'1998/02/02','1998/03/02', 3.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10865,'QUICK',2,'1998/02/02','1998/02/16', 348.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10866,'BERGS',5,'1998/02/03','1998/03/03', 109.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10867,'LONEP',6,'1998/02/03','1998/03/17', 1.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10868,'QUEEN',7,'1998/02/04','1998/03/04', 191.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10869,'SEVES',5,'1998/02/04','1998/03/04', 143.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10870,'WOLZA',5,'1998/02/04','1998/03/04', 12.04)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10871,'BONAP',9,'1998/02/05','1998/03/05', 112.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10872,'GODOS',5,'1998/02/05','1998/03/05', 175.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10873,'WILMK',4,'1998/02/06','1998/03/06', 0.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10874,'GODOS',5,'1998/02/06','1998/03/06', 19.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10875,'BERGS',4,'1998/02/06','1998/03/06', 32.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10876,'BONAP',7,'1998/02/09','1998/03/09', 60.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10877,'RICAR',1,'1998/02/09','1998/03/09', 38.06)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10878,'QUICK',4,'1998/02/10','1998/03/10', 46.69)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10879,'WILMK',3,'1998/02/10','1998/03/10', 8.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10880,'FOLKO',7,'1998/02/10','1998/03/24', 88.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10881,'CACTU',4,'1998/02/11','1998/03/11', 2.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10882,'SAVEA',4,'1998/02/11','1998/03/11', 23.10)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10883,'LONEP',8,'1998/02/12','1998/03/12', 0.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10884,'LETSS',4,'1998/02/12','1998/03/12', 90.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10885,'SUPRD',6,'1998/02/12','1998/03/12', 5.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10886,'HANAR',1,'1998/02/13','1998/03/13', 4.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10887,'GALED',8,'1998/02/13','1998/03/13', 1.25)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10888,'GODOS',1,'1998/02/16','1998/03/16', 51.87)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10889,'RATTC',9,'1998/02/16','1998/03/16', 280.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10890,'DUMON',7,'1998/02/16','1998/03/16', 32.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10891,'LEHMS',7,'1998/02/17','1998/03/17', 20.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10892,'MAISD',4,'1998/02/17','1998/03/17', 120.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10893,'KOENE',9,'1998/02/18','1998/03/18', 77.78)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10894,'SAVEA',1,'1998/02/18','1998/03/18', 116.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10895,'ERNSH',3,'1998/02/18','1998/03/18', 162.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10896,'MAISD',7,'1998/02/19','1998/03/19', 32.45)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10897,'HUNGO',3,'1998/02/19','1998/03/19', 603.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10898,'OCEAN',4,'1998/02/20','1998/03/20', 1.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10899,'LILAS',5,'1998/02/20','1998/03/20', 1.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10900,'WELLI',1,'1998/02/20','1998/03/20', 1.66)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10901,'HILAA',4,'1998/02/23','1998/03/23', 62.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10902,'FOLKO',1,'1998/02/23','1998/03/23', 44.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10903,'HANAR',3,'1998/02/24','1998/03/24', 36.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10904,'WHITC',3,'1998/02/24','1998/03/24', 162.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10905,'WELLI',9,'1998/02/24','1998/03/24', 13.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10906,'WOLZA',4,'1998/02/25','1998/03/11', 26.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10907,'SPECD',6,'1998/02/25','1998/03/25', 9.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10908,'REGGC',4,'1998/02/26','1998/03/26', 32.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10909,'SANTG',1,'1998/02/26','1998/03/26', 53.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10910,'WILMK',1,'1998/02/26','1998/03/26', 38.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10911,'GODOS',3,'1998/02/26','1998/03/26', 38.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10912,'HUNGO',2,'1998/02/26','1998/03/26', 580.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10913,'QUEEN',4,'1998/02/26','1998/03/26', 33.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10914,'QUEEN',6,'1998/02/27','1998/03/27', 21.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10915,'TORTU',2,'1998/02/27','1998/03/27', 3.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10916,'RANCH',1,'1998/02/27','1998/03/27', 63.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10917,'ROMEY',4,'1998/03/02','1998/03/30', 8.29)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10918,'BOTTM',3,'1998/03/02','1998/03/30', 48.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10919,'LINOD',2,'1998/03/02','1998/03/30', 19.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10920,'AROUT',4,'1998/03/03','1998/03/31', 29.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10921,'VAFFE',1,'1998/03/03','1998/04/14', 176.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10922,'HANAR',5,'1998/03/03','1998/03/31', 62.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10923,'LAMAI',7,'1998/03/03','1998/04/14', 68.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10924,'BERGS',3,'1998/03/04','1998/04/01', 151.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10925,'HANAR',3,'1998/03/04','1998/04/01', 2.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10926,'ANATR',4,'1998/03/04','1998/04/01', 39.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10927,'LACOR',4,'1998/03/05','1998/04/02', 19.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10928,'GALED',1,'1998/03/05','1998/04/02', 1.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10929,'FRANK',6,'1998/03/05','1998/04/02', 33.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10930,'SUPRD',4,'1998/03/06','1998/04/17', 15.55)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10931,'RICSU',4,'1998/03/06','1998/03/20', 13.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10932,'BONAP',8,'1998/03/06','1998/04/03', 134.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10933,'ISLAT',6,'1998/03/06','1998/04/03', 54.15)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10934,'LEHMS',3,'1998/03/09','1998/04/06', 32.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10935,'WELLI',4,'1998/03/09','1998/04/06', 47.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10936,'GREAL',3,'1998/03/09','1998/04/06', 33.68)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10937,'CACTU',7,'1998/03/10','1998/03/24', 31.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10938,'QUICK',3,'1998/03/10','1998/04/07', 31.89)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10939,'MAGAA',2,'1998/03/10','1998/04/07', 76.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10940,'BONAP',8,'1998/03/11','1998/04/08', 19.77)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10941,'SAVEA',7,'1998/03/11','1998/04/08', 400.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10942,'REGGC',9,'1998/03/11','1998/04/08', 17.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10943,'BSBEV',4,'1998/03/11','1998/04/08', 2.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10944,'BOTTM',6,'1998/03/12','1998/03/26', 52.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10945,'MORGK',4,'1998/03/12','1998/04/09', 10.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10946,'VAFFE',1,'1998/03/12','1998/04/09', 27.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10947,'BSBEV',3,'1998/03/13','1998/04/10', 3.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10948,'GODOS',3,'1998/03/13','1998/04/10', 23.39)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10949,'BOTTM',2,'1998/03/13','1998/04/10', 74.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10950,'MAGAA',1,'1998/03/16','1998/04/13', 2.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10951,'RICSU',9,'1998/03/16','1998/04/27', 30.85)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10952,'ALFKI',1,'1998/03/16','1998/04/27', 40.42)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10953,'AROUT',9,'1998/03/16','1998/03/30', 23.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10954,'LINOD',5,'1998/03/17','1998/04/28', 27.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10955,'FOLKO',8,'1998/03/17','1998/04/14', 3.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10956,'BLAUS',6,'1998/03/17','1998/04/28', 44.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10957,'HILAA',8,'1998/03/18','1998/04/15', 105.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10958,'OCEAN',7,'1998/03/18','1998/04/15', 49.56)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10959,'GOURL',6,'1998/03/18','1998/04/29', 4.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10960,'HILAA',3,'1998/03/19','1998/04/02', 2.08)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10961,'QUEEN',8,'1998/03/19','1998/04/16', 104.47)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10962,'QUICK',8,'1998/03/19','1998/04/16', 275.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10963,'FURIB',9,'1998/03/19','1998/04/16', 2.70)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10964,'SPECD',3,'1998/03/20','1998/04/17', 87.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10965,'OLDWO',6,'1998/03/20','1998/04/17', 144.38)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10966,'CHOPS',4,'1998/03/20','1998/04/17', 27.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10967,'TOMSP',2,'1998/03/23','1998/04/20', 62.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10968,'ERNSH',1,'1998/03/23','1998/04/20', 74.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10969,'COMMI',1,'1998/03/23','1998/04/20', 0.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10970,'BOLID',9,'1998/03/24','1998/04/07', 16.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10971,'FRANR',2,'1998/03/24','1998/04/21', 121.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10972,'LACOR',4,'1998/03/24','1998/04/21', 0.02)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10973,'LACOR',6,'1998/03/24','1998/04/21', 15.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10974,'SPLIR',3,'1998/03/25','1998/04/08', 12.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10975,'BOTTM',1,'1998/03/25','1998/04/22', 32.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10976,'HILAA',1,'1998/03/25','1998/05/06', 37.97)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10977,'FOLKO',8,'1998/03/26','1998/04/23', 208.50)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10978,'MAISD',9,'1998/03/26','1998/04/23', 32.82)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10979,'ERNSH',8,'1998/03/26','1998/04/23', 353.07)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10980,'FOLKO',4,'1998/03/27','1998/05/08', 1.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10981,'HANAR',1,'1998/03/27','1998/04/24', 193.37)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10982,'BOTTM',2,'1998/03/27','1998/04/24', 14.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10983,'SAVEA',2,'1998/03/27','1998/04/24', 657.54)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10984,'SAVEA',1,'1998/03/30','1998/04/27', 211.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10985,'HUNGO',2,'1998/03/30','1998/04/27', 91.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10986,'OCEAN',8,'1998/03/30','1998/04/27', 217.86)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10987,'EASTC',8,'1998/03/31','1998/04/28', 185.48)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10988,'RATTC',3,'1998/03/31','1998/04/28', 61.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10989,'QUEDE',2,'1998/03/31','1998/04/28', 34.76)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10990,'ERNSH',2,'1998/04/01','1998/05/13', 117.61)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10991,'QUICK',1,'1998/04/01','1998/04/29', 38.51)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10992,'THEBI',1,'1998/04/01','1998/04/29', 4.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10993,'FOLKO',7,'1998/04/01','1998/04/29', 8.81)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10994,'VAFFE',2,'1998/04/02','1998/04/16', 65.53)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10995,'PERIC',1,'1998/04/02','1998/04/30', 46.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10996,'QUICK',4,'1998/04/02','1998/04/30', 1.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10997,'LILAS',8,'1998/04/03','1998/05/15', 73.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10998,'WOLZA',8,'1998/04/03','1998/04/17', 20.31)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10999,'OTTIK',6,'1998/04/03','1998/05/01', 96.35)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11000,'RATTC',2,'1998/04/06','1998/05/04', 55.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11001,'FOLKO',2,'1998/04/06','1998/05/04', 197.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11002,'SAVEA',4,'1998/04/06','1998/05/04', 141.16)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11003,'THECR',3,'1998/04/06','1998/05/04', 14.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11004,'MAISD',3,'1998/04/07','1998/05/05', 44.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11005,'WILMK',2,'1998/04/07','1998/05/05', 0.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11006,'GREAL',3,'1998/04/07','1998/05/05', 25.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11007,'PRINI',8,'1998/04/08','1998/05/06', 202.24)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11008,'ERNSH',7,'1998/04/08','1998/05/06', 79.46)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11009,'GODOS',2,'1998/04/08','1998/05/06', 59.11)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11010,'REGGC',2,'1998/04/09','1998/05/07', 28.71)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11011,'ALFKI',3,'1998/04/09','1998/05/07', 1.21)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11012,'FRANK',1,'1998/04/09','1998/04/23', 242.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11013,'ROMEY',2,'1998/04/09','1998/05/07', 32.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11014,'LINOD',2,'1998/04/10','1998/05/08', 23.60)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11015,'SANTG',2,'1998/04/10','1998/04/24', 4.62)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11016,'AROUT',9,'1998/04/10','1998/05/08', 33.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11017,'ERNSH',9,'1998/04/13','1998/05/11', 754.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11018,'LONEP',4,'1998/04/13','1998/05/11', 11.65)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11019,'RANCH',6,'1998/04/13','1998/05/11', 3.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11020,'OTTIK',2,'1998/04/14','1998/05/12', 43.30)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11021,'QUICK',3,'1998/04/14','1998/05/12', 297.18)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11022,'HANAR',9,'1998/04/14','1998/05/12', 6.27)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11023,'BSBEV',1,'1998/04/14','1998/04/28', 123.83)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11024,'EASTC',4,'1998/04/15','1998/05/13', 74.36)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11025,'WARTH',6,'1998/04/15','1998/05/13', 29.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11026,'FRANS',4,'1998/04/15','1998/05/13', 47.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11027,'BOTTM',1,'1998/04/16','1998/05/14', 52.52)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11028,'KOENE',2,'1998/04/16','1998/05/14', 29.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11029,'CHOPS',4,'1998/04/16','1998/05/14', 47.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11030,'SAVEA',7,'1998/04/17','1998/05/15', 830.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11031,'SAVEA',6,'1998/04/17','1998/05/15', 227.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11032,'WHITC',2,'1998/04/17','1998/05/15', 606.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11033,'RICSU',7,'1998/04/17','1998/05/15', 84.74)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11034,'OLDWO',8,'1998/04/20','1998/06/01', 40.32)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11035,'SUPRD',2,'1998/04/20','1998/05/18', 0.17)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11036,'DRACD',8,'1998/04/20','1998/05/18', 149.47)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11037,'GODOS',7,'1998/04/21','1998/05/19', 3.20)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11038,'SUPRD',1,'1998/04/21','1998/05/19', 29.59)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11039,'LINOD',1,'1998/04/21','1998/05/19', 65.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11040,'GREAL',4,'1998/04/22','1998/05/20', 18.84)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11041,'CHOPS',3,'1998/04/22','1998/05/20', 48.22)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11042,'COMMI',2,'1998/04/22','1998/05/06', 29.99)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11043,'SPECD',5,'1998/04/22','1998/05/20', 8.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11044,'WOLZA',4,'1998/04/23','1998/05/21', 8.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11045,'BOTTM',6,'1998/04/23','1998/05/21', 70.58)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11046,'WANDK',8,'1998/04/23','1998/05/21', 71.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11047,'EASTC',7,'1998/04/24','1998/05/22', 46.62)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11048,'BOTTM',7,'1998/04/24','1998/05/22', 24.12)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11049,'GOURL',3,'1998/04/24','1998/05/22', 8.34)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11050,'FOLKO',8,'1998/04/27','1998/05/25', 59.41)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11051,'LAMAI',7,'1998/04/27','1998/05/25', 2.79)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11052,'HANAR',3,'1998/04/27','1998/05/25', 67.26)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11053,'PICCO',2,'1998/04/27','1998/05/25', 53.05)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11054,'CACTU',8,'1998/04/28','1998/05/26', 0.33)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11055,'HILAA',7,'1998/04/28','1998/05/26', 120.92)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11056,'EASTC',8,'1998/04/28','1998/05/12', 278.96)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11057,'NORTS',3,'1998/04/29','1998/05/27', 4.13)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11058,'BLAUS',9,'1998/04/29','1998/05/27', 31.14)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11059,'RICAR',2,'1998/04/29','1998/06/10', 85.80)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11060,'FRANS',2,'1998/04/30','1998/05/28', 10.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11061,'GREAL',4,'1998/04/30','1998/06/11', 14.01)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11062,'REGGC',4,'1998/04/30','1998/05/28', 29.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11063,'HUNGO',3,'1998/04/30','1998/05/28', 81.73)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11064,'SAVEA',1,'1998/05/01','1998/05/29', 30.09)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11065,'LILAS',8,'1998/05/01','1998/05/29', 12.91)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11066,'WHITC',7,'1998/05/01','1998/05/29', 44.72)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11067,'DRACD',1,'1998/05/04','1998/05/18', 7.98)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11068,'QUEEN',8,'1998/05/04','1998/06/01', 81.75)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11069,'TORTU',1,'1998/05/04','1998/06/01', 15.67)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11070,'LEHMS',2,'1998/05/05','1998/06/02', 136.00)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11071,'LILAS',1,'1998/05/05','1998/06/02', 0.93)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11072,'ERNSH',4,'1998/05/05','1998/06/02', 258.64)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11073,'PERIC',2,'1998/05/05','1998/06/02', 24.95)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11074,'SIMOB',7,'1998/05/06','1998/06/03', 18.44)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11075,'RICSU',8,'1998/05/06','1998/06/03', 6.19)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11076,'BONAP',4,'1998/05/06','1998/06/03', 38.28)
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (11077,'RATTC',1,'1998/05/06','1998/06/03', 8.53)

--------------------
-- Dados DetalhesPed
--------------------
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10248,11,14,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10248,42,9.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10248,72,34.8,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10249,14,18.6,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10249,51,42.4,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10250,41,7.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10250,51,42.4,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10250,65,16.8,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10251,22,16.8,6,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10251,57,15.6,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10251,65,16.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10252,20,64.8,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10252,33,2,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10252,60,27.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10253,31,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10253,39,14.4,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10253,49,16,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10254,24,3.6,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10254,55,19.2,21,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10254,74,8,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10255,2,15.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10255,16,13.9,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10255,36,15.2,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10255,59,44,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10256,53,26.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10256,77,10.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10257,27,35.1,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10257,39,14.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10257,77,10.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10258,2,15.2,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10258,5,17,65,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10258,32,25.6,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10259,21,8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10259,37,20.8,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10260,41,7.7,16,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10260,57,15.6,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10260,62,39.4,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10260,70,12,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10261,21,8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10261,35,14.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10262,5,17,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10262,7,24,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10262,56,30.4,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10263,16,13.9,60,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10263,24,3.6,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10263,30,20.7,60,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10263,74,8,36,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10264,2,15.2,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10264,41,7.7,25,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10265,17,31.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10265,70,12,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10266,12,30.4,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10267,40,14.7,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10267,59,44,70,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10267,76,14.4,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10268,29,99,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10268,72,27.8,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10269,33,2,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10269,72,27.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10270,36,15.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10270,43,36.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10271,33,2,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10272,20,64.8,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10272,31,10,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10272,72,27.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,10,24.8,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,31,10,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,33,2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,40,14.7,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10273,76,14.4,33,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10274,71,17.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10274,72,27.8,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10275,24,3.6,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10275,59,44,6,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10276,10,24.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10276,13,4.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10277,28,36.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10277,62,39.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10278,44,15.5,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10278,59,44,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10278,63,35.1,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10278,73,12,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10279,17,31.2,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10280,24,3.6,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10280,55,19.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10280,75,6.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10281,19,7.3,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10281,24,3.6,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10281,35,14.4,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10282,30,20.7,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10282,57,15.6,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10283,15,12.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10283,19,7.3,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10283,60,27.2,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10283,72,27.8,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10284,27,35.1,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10284,44,15.5,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10284,60,27.2,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10284,67,11.2,5,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10285,1,14.4,45,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10285,40,14.7,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10285,53,26.2,36,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10286,35,14.4,100,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10286,62,39.4,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10287,16,13.9,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10287,34,11.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10287,46,9.6,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10288,54,5.9,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10288,68,10,3,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10289,3,8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10289,64,26.6,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10290,5,17,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10290,29,99,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10290,49,16,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10290,77,10.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10291,13,4.8,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10291,44,15.5,24,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10291,51,42.4,2,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10292,20,64.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10293,18,50,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10293,24,3.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10293,63,35.1,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10293,75,6.2,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,1,14.4,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,17,31.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,43,36.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,60,27.2,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10294,75,6.2,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10295,56,30.4,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10296,11,16.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10296,16,13.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10296,69,28.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10297,39,14.4,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10297,72,27.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10298,2,15.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10298,36,15.2,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10298,59,44,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10298,62,39.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10299,19,7.3,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10299,70,12,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10300,66,13.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10300,68,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10301,40,14.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10301,56,30.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10302,17,31.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10302,28,36.4,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10302,43,36.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10303,40,14.7,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10303,65,16.8,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10303,68,10,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10304,49,16,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10304,59,44,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10304,71,17.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10305,18,50,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10305,29,99,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10305,39,14.4,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10306,30,20.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10306,53,26.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10306,54,5.9,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10307,62,39.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10307,68,10,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10308,69,28.8,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10308,70,12,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,4,17.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,6,20,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,42,11.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,43,36.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10309,71,17.2,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10310,16,13.9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10310,62,39.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10311,42,11.2,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10311,69,28.8,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10312,28,36.4,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10312,43,36.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10312,53,26.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10312,75,6.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10313,36,15.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10314,32,25.6,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10314,58,10.6,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10314,62,39.4,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10315,34,11.2,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10315,70,12,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10316,41,7.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10316,62,39.4,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10317,1,14.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10318,41,7.7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10318,76,14.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10319,17,31.2,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10319,28,36.4,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10319,76,14.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10320,71,17.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10321,35,14.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10322,52,5.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10323,15,12.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10323,25,11.2,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10323,39,14.4,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,16,13.9,21,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,35,14.4,70,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,46,9.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,59,44,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10324,63,35.1,80,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,6,20,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,13,4.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,14,18.6,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,31,10,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10325,72,27.8,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10326,4,17.6,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10326,57,15.6,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10326,75,6.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10327,2,15.2,25,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10327,11,16.8,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10327,30,20.7,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10327,58,10.6,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10328,59,44,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10328,65,16.8,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10328,68,10,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10329,19,7.3,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10329,30,20.7,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10329,38,210.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10329,56,30.4,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10330,26,24.9,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10330,72,27.8,25,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10331,54,5.9,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10332,18,50,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10332,42,11.2,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10332,47,7.6,16,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10333,14,18.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10333,21,8,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10333,71,17.2,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10334,52,5.6,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10334,68,10,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10335,2,15.2,7,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10335,31,10,25,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10335,32,25.6,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10335,51,42.4,48,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10336,4,17.6,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,23,7.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,26,24.9,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,36,15.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,37,20.8,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10337,72,27.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10338,17,31.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10338,30,20.7,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10339,4,17.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10339,17,31.2,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10339,62,39.4,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10340,18,50,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10340,41,7.7,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10340,43,36.8,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10341,33,2,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10341,59,44,9,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10342,2,15.2,24,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10342,31,10,56,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10342,36,15.2,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10342,55,19.2,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10343,64,26.6,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10343,68,10,4,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10343,76,14.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10344,4,17.6,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10344,8,32,70,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10345,8,32,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10345,19,7.3,80,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10345,42,11.2,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10346,17,31.2,36,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10346,56,30.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10347,25,11.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10347,39,14.4,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10347,40,14.7,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10347,75,6.2,6,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10348,1,14.4,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10348,23,7.2,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10349,54,5.9,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10350,50,13,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10350,69,28.8,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10351,38,210.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10351,41,7.7,13,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10351,44,15.5,77,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10351,65,16.8,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10352,24,3.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10352,54,5.9,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10353,11,16.8,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10353,38,210.8,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10354,1,14.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10354,29,99,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10355,24,3.6,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10355,57,15.6,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10356,31,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10356,55,19.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10356,69,28.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10357,10,24.8,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10357,26,24.9,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10357,60,27.2,8,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10358,24,3.6,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10358,34,11.2,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10358,36,15.2,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10359,16,13.9,56,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10359,31,10,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10359,60,27.2,80,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,28,36.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,29,99,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,38,210.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,49,16,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10360,54,5.9,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10361,39,14.4,54,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10361,60,27.2,55,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10362,25,11.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10362,51,42.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10362,54,5.9,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10363,31,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10363,75,6.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10363,76,14.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10364,69,28.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10364,71,17.2,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10365,11,16.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10366,65,16.8,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10366,77,10.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10367,34,11.2,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10367,54,5.9,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10367,65,16.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10367,77,10.4,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10368,21,8,5,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10368,28,36.4,13,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10368,57,15.6,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10368,64,26.6,35,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10369,29,99,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10369,56,30.4,18,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10370,1,14.4,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10370,64,26.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10370,74,8,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10371,36,15.2,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10372,20,64.8,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10372,38,210.8,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10372,60,27.2,70,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10372,72,27.8,42,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10373,58,10.6,80,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10373,71,17.2,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10374,31,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10374,58,10.6,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10375,14,18.6,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10375,54,5.9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10376,31,10,42,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10377,28,36.4,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10377,39,14.4,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10378,71,17.2,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10379,41,7.7,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10379,63,35.1,16,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10379,65,16.8,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10380,30,20.7,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10380,53,26.2,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10380,60,27.2,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10380,70,12,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10381,74,8,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,5,17,32,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,18,50,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,29,99,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,33,2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10382,74,8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10383,13,4.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10383,50,13,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10383,56,30.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10384,20,64.8,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10384,60,27.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10385,7,24,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10385,60,27.2,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10385,68,10,8,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10386,24,3.6,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10386,34,11.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10387,24,3.6,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10387,28,36.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10387,59,44,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10387,71,17.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10388,45,7.6,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10388,52,5.6,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10388,53,26.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10389,10,24.8,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10389,55,19.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10389,62,39.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10389,70,12,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10390,31,10,60,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10390,35,14.4,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10390,46,9.6,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10390,72,27.8,24,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10391,13,4.8,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10392,69,28.8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,2,15.2,25,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,14,18.6,42,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,25,11.2,7,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,26,24.9,70,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10393,31,10,32,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10394,13,4.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10394,62,39.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10395,46,9.6,28,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10395,53,26.2,70,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10395,69,28.8,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10396,23,7.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10396,71,17.2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10396,72,27.8,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10397,21,8,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10397,51,42.4,18,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10398,35,14.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10398,55,19.2,120,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10399,68,10,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10399,71,17.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10399,76,14.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10399,77,10.4,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10400,29,99,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10400,35,14.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10400,49,16,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10401,30,20.7,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10401,56,30.4,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10401,65,16.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10401,71,17.2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10402,23,7.2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10402,63,35.1,65,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10403,16,13.9,21,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10403,48,10.2,70,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10404,26,24.9,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10404,42,11.2,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10404,49,16,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10405,3,8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,1,14.4,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,21,8,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,28,36.4,42,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,36,15.2,5,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10406,40,14.7,2,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10407,11,16.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10407,69,28.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10407,71,17.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10408,37,20.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10408,54,5.9,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10408,62,39.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10409,14,18.6,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10409,21,8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10410,33,2,49,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10410,59,44,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10411,41,7.7,25,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10411,44,15.5,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10411,59,44,9,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10412,14,18.6,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10413,1,14.4,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10413,62,39.4,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10413,76,14.4,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10414,19,7.3,18,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10414,33,2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10415,17,31.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10415,33,2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10416,19,7.3,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10416,53,26.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10416,57,15.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10417,38,210.8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10417,46,9.6,2,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10417,68,10,36,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10417,77,10.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10418,2,15.2,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10418,47,7.6,55,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10418,61,22.8,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10418,74,8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10419,60,27.2,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10419,69,28.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10420,9,77.6,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10420,13,4.8,2,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10420,70,12,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10420,73,12,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10421,19,7.3,4,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10421,26,24.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10421,53,26.2,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10421,77,10.4,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10422,26,24.9,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10423,31,10,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10423,59,44,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10424,35,14.4,60,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10424,38,210.8,49,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10424,68,10,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10425,55,19.2,10,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10425,76,14.4,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10426,56,30.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10426,64,26.6,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10427,14,18.6,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10428,46,9.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10429,50,13,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10429,63,35.1,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10430,17,31.2,45,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10430,21,8,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10430,56,30.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10430,59,44,70,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10431,17,31.2,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10431,40,14.7,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10431,47,7.6,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10432,26,24.9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10432,54,5.9,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10433,56,30.4,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10434,11,16.8,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10434,76,14.4,18,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10435,2,15.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10435,22,16.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10435,72,27.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10436,46,9.6,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10436,56,30.4,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10436,64,26.6,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10436,75,6.2,24,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10437,53,26.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10438,19,7.3,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10438,34,11.2,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10438,57,15.6,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10439,12,30.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10439,16,13.9,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10439,64,26.6,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10439,74,8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10440,2,15.2,45,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10440,16,13.9,49,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10440,29,99,24,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10440,61,22.8,90,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10441,27,35.1,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10442,11,16.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10442,54,5.9,80,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10442,66,13.6,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10443,11,16.8,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10443,28,36.4,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10444,17,31.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10444,26,24.9,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10444,35,14.4,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10444,41,7.7,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10445,39,14.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10445,54,5.9,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10446,19,7.3,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10446,24,3.6,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10446,31,10,3,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10446,52,5.6,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10447,19,7.3,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10447,65,16.8,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10447,71,17.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10448,26,24.9,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10448,40,14.7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10449,10,24.8,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10449,52,5.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10449,62,39.4,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10450,10,24.8,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10450,54,5.9,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10451,55,19.2,120,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10451,64,26.6,35,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10451,65,16.8,28,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10451,77,10.4,55,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10452,28,36.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10452,44,15.5,100,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10453,48,10.2,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10453,70,12,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10454,16,13.9,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10454,33,2,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10454,46,9.6,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10455,39,14.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10455,53,26.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10455,61,22.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10455,71,17.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10456,21,8,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10456,49,16,21,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10457,59,44,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,26,24.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,28,36.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,43,36.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,56,30.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10458,71,17.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10459,7,24,16,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10459,46,9.6,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10459,72,27.8,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10460,68,10,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10460,75,6.2,4,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10461,21,8,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10461,30,20.7,28,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10461,55,19.2,60,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10462,13,4.8,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10462,23,7.2,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10463,19,7.3,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10463,42,11.2,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10464,4,17.6,16,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10464,43,36.8,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10464,56,30.4,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10464,60,27.2,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,24,3.6,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,29,99,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,40,14.7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,45,7.6,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10465,50,13,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10466,11,16.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10466,46,9.6,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10467,24,3.6,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10467,25,11.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10468,30,20.7,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10468,43,36.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10469,2,15.2,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10469,16,13.9,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10469,44,15.5,2,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10470,18,50,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10470,23,7.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10470,64,26.6,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10471,7,24,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10471,56,30.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10472,24,3.6,80,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10472,51,42.4,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10473,33,2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10473,71,17.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10474,14,18.6,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10474,28,36.4,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10474,40,14.7,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10474,75,6.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10475,31,10,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10475,66,13.6,60,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10475,76,14.4,42,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10476,55,19.2,2,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10476,70,12,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10477,1,14.4,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10477,21,8,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10477,39,14.4,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10478,10,24.8,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10479,38,210.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10479,53,26.2,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10479,59,44,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10479,64,26.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10480,47,7.6,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10480,59,44,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10481,49,16,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10481,60,27.2,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10482,40,14.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10483,34,11.2,35,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10483,77,10.4,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10484,21,8,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10484,40,14.7,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10484,51,42.4,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10485,2,15.2,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10485,3,8,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10485,55,19.2,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10485,70,12,60,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10486,11,16.8,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10486,51,42.4,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10486,74,8,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10487,19,7.3,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10487,26,24.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10487,54,5.9,24,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10488,59,44,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10488,73,12,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10489,11,16.8,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10489,16,13.9,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10490,59,44,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10490,68,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10490,75,6.2,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10491,44,15.5,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10491,77,10.4,7,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10492,25,11.2,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10492,42,11.2,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10493,65,16.8,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10493,66,13.6,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10493,69,28.8,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10494,56,30.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10495,23,7.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10495,41,7.7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10495,77,10.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10496,31,10,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10497,56,30.4,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10497,72,27.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10497,77,10.4,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10498,24,4.5,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10498,40,18.4,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10498,42,14,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10499,28,45.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10499,49,20,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10500,15,15.5,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10500,28,45.6,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10501,54,7.45,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10502,45,9.5,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10502,53,32.8,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10502,67,14,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10503,14,23.25,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10503,65,21.05,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10504,2,19,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10504,21,10,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10504,53,32.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10504,61,28.5,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10505,62,49.3,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10506,25,14,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10506,70,15,14,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10507,43,46,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10507,48,12.75,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10508,13,6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10508,39,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10509,28,45.6,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10510,29,123.79,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10510,75,7.75,36,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10511,4,22,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10511,7,30,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10511,8,40,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10512,24,4.5,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10512,46,12,9,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10512,47,9.5,6,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10512,60,34,12,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10513,21,10,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10513,32,32,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10513,61,28.5,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,20,81,39,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,28,45.6,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,56,38,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,65,21.05,39,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10514,75,7.75,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,9,97,16,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,16,17.45,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,27,43.9,120,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,33,2.5,16,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10515,60,34,84,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10516,18,62.5,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10516,41,9.65,80,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10516,42,14,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10517,52,7,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10517,59,55,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10517,70,15,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10518,24,4.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10518,38,263.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10518,44,19.45,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10519,10,31,16,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10519,56,38,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10519,60,34,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10520,24,4.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10520,53,32.8,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10521,35,18,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10521,41,9.65,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10521,68,12.5,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10522,1,18,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10522,8,40,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10522,30,25.89,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10522,40,18.4,25,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10523,17,39,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10523,20,81,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10523,37,26,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10523,41,9.65,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10524,10,31,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10524,30,25.89,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10524,43,46,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10524,54,7.45,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10525,36,19,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10525,40,18.4,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10526,1,18,8,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10526,13,6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10526,56,38,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10527,4,22,50,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10527,36,19,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10528,11,21,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10528,33,2.5,8,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10528,72,34.8,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10529,55,24,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10529,68,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10529,69,36,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10530,17,39,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10530,43,46,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10530,61,28.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10530,76,18,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10531,59,55,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10532,30,25.89,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10532,66,17,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10533,4,22,50,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10533,72,34.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10533,73,15,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10534,30,25.89,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10534,40,18.4,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10534,54,7.45,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10535,11,21,50,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10535,40,18.4,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10535,57,19.5,5,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10535,59,55,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10536,12,38,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10536,31,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10536,33,2.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10536,60,34,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,31,12.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,51,53,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,58,13.25,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,72,34.8,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10537,73,15,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10538,70,15,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10538,72,34.8,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10539,13,6,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10539,21,10,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10539,33,2.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10539,49,20,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10540,3,10,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10540,26,31.23,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10540,38,263.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10540,68,12.5,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10541,24,4.5,35,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10541,38,263.5,4,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10541,65,21.05,36,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10541,71,21.5,9,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10542,11,21,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10542,54,7.45,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10543,12,38,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10543,23,9,70,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10544,28,45.6,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10544,67,14,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10545,11,21,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10546,7,30,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10546,35,18,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10546,62,49.3,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10547,32,32,24,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10547,36,19,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10548,34,14,10,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10548,41,9.65,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10549,31,12.5,55,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10549,45,9.5,100,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10549,51,53,48,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10550,17,39,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10550,19,9.2,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10550,21,10,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10550,61,28.5,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10551,16,17.45,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10551,35,18,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10551,44,19.45,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10552,69,36,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10552,75,7.75,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,11,21,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,16,17.45,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,22,21,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,31,12.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10553,35,18,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10554,16,17.45,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10554,23,9,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10554,62,49.3,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10554,77,13,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,14,23.25,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,19,9.2,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,24,4.5,18,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,51,53,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10555,56,38,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10556,72,34.8,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10557,64,33.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10557,75,7.75,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,47,9.5,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,51,53,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,52,7,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,53,32.8,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10558,73,15,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10559,41,9.65,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10559,55,24,18,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10560,30,25.89,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10560,62,49.3,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10561,44,19.45,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10561,51,53,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10562,33,2.5,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10562,62,49.3,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10563,36,19,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10563,52,7,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10564,17,39,16,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10564,31,12.5,6,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10564,55,24,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10565,24,4.5,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10565,64,33.25,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10566,11,21,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10566,18,62.5,18,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10566,76,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10567,31,12.5,60,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10567,51,53,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10567,59,55,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10568,10,31,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10569,31,12.5,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10569,76,18,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10570,11,21,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10570,56,38,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10571,14,23.25,11,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10571,42,14,28,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10572,16,17.45,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10572,32,32,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10572,40,18.4,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10572,75,7.75,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10573,17,39,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10573,34,14,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10573,53,32.8,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10574,33,2.5,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10574,40,18.4,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10574,62,49.3,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10574,64,33.25,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10575,59,55,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10575,63,43.9,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10575,72,34.8,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10575,76,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10576,1,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10576,31,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10576,44,19.45,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10577,39,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10577,75,7.75,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10577,77,13,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10578,35,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10578,57,19.5,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10579,15,15.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10579,75,7.75,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10580,14,23.25,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10580,41,9.65,9,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10580,65,21.05,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10581,75,7.75,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10582,57,19.5,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10582,76,18,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10583,29,123.79,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10583,60,34,24,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10583,69,36,10,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10584,31,12.5,50,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10585,47,9.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10586,52,7,4,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10587,26,31.23,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10587,35,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10587,77,13,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10588,18,62.5,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10588,42,14,100,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10589,35,18,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10590,1,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10590,77,13,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10591,3,10,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10591,7,30,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10591,54,7.45,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10592,15,15.5,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10592,26,31.23,5,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10593,20,81,21,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10593,69,36,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10593,76,18,4,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10594,52,7,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10594,58,13.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10595,35,18,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10595,61,28.5,120,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10595,69,36,65,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10596,56,38,5,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10596,63,43.9,24,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10596,75,7.75,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10597,24,4.5,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10597,57,19.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10597,65,21.05,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10598,27,43.9,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10598,71,21.5,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10599,62,49.3,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10600,54,7.45,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10600,73,15,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10601,13,6,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10601,59,55,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10602,77,13,5,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10603,22,21,48,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10603,49,20,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10604,48,12.75,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10604,76,18,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10605,16,17.45,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10605,59,55,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10605,60,34,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10605,71,21.5,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10606,4,22,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10606,55,24,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10606,62,49.3,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,7,30,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,17,39,100,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,33,2.5,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,40,18.4,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10607,72,34.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10608,56,38,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10609,1,18,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10609,10,31,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10609,21,10,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10610,36,19,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10611,1,18,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10611,2,19,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10611,60,34,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,10,31,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,36,19,55,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,49,20,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,60,34,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10612,76,18,80,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10613,13,6,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10613,75,7.75,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10614,11,21,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10614,21,10,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10614,39,18,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10615,55,24,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10616,38,263.5,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10616,56,38,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10616,70,15,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10616,71,21.5,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10617,59,55,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10618,6,25,70,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10618,56,38,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10618,68,12.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10619,21,10,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10619,22,21,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10620,24,4.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10620,52,7,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10621,19,9.2,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10621,23,9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10621,70,15,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10621,71,21.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10622,2,19,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10622,68,12.5,18,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,14,23.25,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,19,9.2,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,21,10,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,24,4.5,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10623,35,18,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10624,28,45.6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10624,29,123.79,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10624,44,19.45,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10625,14,23.25,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10625,42,14,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10625,60,34,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10626,53,32.8,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10626,60,34,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10626,71,21.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10627,62,49.3,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10627,73,15,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10628,1,18,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10629,29,123.79,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10629,64,33.25,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10630,55,24,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10630,76,18,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10631,75,7.75,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10632,2,19,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10632,33,2.5,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10633,12,38,36,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10633,13,6,13,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10633,26,31.23,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10633,62,49.3,80,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10634,7,30,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10634,18,62.5,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10634,51,53,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10634,75,7.75,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10635,4,22,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10635,5,21.35,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10635,22,21,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10636,4,22,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10636,58,13.25,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10637,11,21,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10637,50,16.25,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10637,56,38,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10638,45,9.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10638,65,21.05,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10638,72,34.8,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10639,18,62.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10640,69,36,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10640,70,15,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10641,2,19,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10641,40,18.4,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10642,21,10,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10642,61,28.5,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10643,28,45.6,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10643,39,18,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10643,46,12,2,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10644,18,62.5,4,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10644,43,46,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10644,46,12,21,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10645,18,62.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10645,36,19,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10646,1,18,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10646,10,31,18,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10646,71,21.5,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10646,77,13,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10647,19,9.2,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10647,39,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10648,22,21,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10648,24,4.5,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10649,28,45.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10649,72,34.8,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10650,30,25.89,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10650,53,32.8,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10650,54,7.45,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10651,19,9.2,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10651,22,21,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10652,30,25.89,2,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10652,42,14,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10653,16,17.45,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10653,60,34,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10654,4,22,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10654,39,18,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10654,54,7.45,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10655,41,9.65,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10656,14,23.25,3,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10656,44,19.45,28,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10656,47,9.5,6,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,15,15.5,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,41,9.65,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,46,12,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,47,9.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,56,38,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10657,60,34,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10658,21,10,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10658,40,18.4,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10658,60,34,55,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10658,77,13,70,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10659,31,12.5,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10659,40,18.4,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10659,70,15,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10660,20,81,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10661,39,18,3,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10661,58,13.25,49,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10662,68,12.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10663,40,18.4,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10663,42,14,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10663,51,53,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10664,10,31,24,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10664,56,38,12,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10664,65,21.05,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10665,51,53,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10665,59,55,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10665,76,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10666,29,123.79,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10666,65,21.05,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10667,69,36,45,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10667,71,21.5,14,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10668,31,12.5,8,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10668,55,24,4,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10668,64,33.25,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10669,36,19,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,23,9,32,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,46,12,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,67,14,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,73,15,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10670,75,7.75,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10671,16,17.45,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10671,62,49.3,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10671,65,21.05,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10672,38,263.5,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10672,71,21.5,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10673,16,17.45,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10673,42,14,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10673,43,46,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10674,23,9,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10675,14,23.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10675,53,32.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10675,58,13.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10676,10,31,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10676,19,9.2,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10676,44,19.45,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10677,26,31.23,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10677,33,2.5,8,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10678,12,38,100,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10678,33,2.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10678,41,9.65,120,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10678,54,7.45,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10679,59,55,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10680,16,17.45,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10680,31,12.5,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10680,42,14,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10681,19,9.2,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10681,21,10,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10681,64,33.25,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10682,33,2.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10682,66,17,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10682,75,7.75,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10683,52,7,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10684,40,18.4,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10684,47,9.5,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10684,60,34,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10685,10,31,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10685,41,9.65,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10685,47,9.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10686,17,39,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10686,26,31.23,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10687,9,97,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10687,29,123.79,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10687,36,19,6,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10688,10,31,18,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10688,28,45.6,60,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10688,34,14,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10689,1,18,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10690,56,38,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10690,77,13,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,1,18,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,29,123.79,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,43,46,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,44,19.45,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10691,62,49.3,48,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10692,63,43.9,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10693,9,97,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10693,54,7.45,60,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10693,69,36,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10693,73,15,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10694,7,30,90,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10694,59,55,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10694,70,15,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10695,8,40,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10695,12,38,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10695,24,4.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10696,17,39,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10696,46,12,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10697,19,9.2,7,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10697,35,18,9,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10697,58,13.25,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10697,70,15,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,11,21,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,17,39,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,29,123.79,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,65,21.05,65,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10698,70,15,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10699,47,9.5,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10700,1,18,5,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10700,34,14,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10700,68,12.5,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10700,71,21.5,60,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10701,59,55,42,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10701,71,21.5,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10701,76,18,35,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10702,3,10,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10702,76,18,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10703,2,19,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10703,59,55,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10703,73,15,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10704,4,22,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10704,24,4.5,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10704,48,12.75,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10705,31,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10705,32,32,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10706,16,17.45,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10706,43,46,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10706,59,55,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10707,55,24,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10707,57,19.5,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10707,70,15,28,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10708,5,21.35,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10708,36,19,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10709,8,40,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10709,51,53,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10709,60,34,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10710,19,9.2,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10710,47,9.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10711,19,9.2,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10711,41,9.65,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10711,53,32.8,120,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10712,53,32.8,3,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10712,56,38,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10713,10,31,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10713,26,31.23,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10713,45,9.5,110,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10713,46,12,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,2,19,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,17,39,27,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,47,9.5,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,56,38,18,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10714,58,13.25,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10715,10,31,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10715,71,21.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10716,21,10,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10716,51,53,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10716,61,28.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10717,21,10,32,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10717,54,7.45,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10717,69,36,25,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10718,12,38,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10718,16,17.45,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10718,36,19,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10718,62,49.3,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10719,18,62.5,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10719,30,25.89,3,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10719,54,7.45,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10720,35,18,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10720,71,21.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10721,44,19.45,50,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10722,2,19,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10722,31,12.5,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10722,68,12.5,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10722,75,7.75,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10723,26,31.23,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10724,10,31,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10724,61,28.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10725,41,9.65,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10725,52,7,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10725,55,24,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10726,4,22,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10726,11,21,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10727,17,39,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10727,56,38,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10727,59,55,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10728,30,25.89,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10728,40,18.4,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10728,55,24,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10728,60,34,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10729,1,18,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10729,21,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10729,50,16.25,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10730,16,17.45,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10730,31,12.5,3,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10730,65,21.05,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10731,21,10,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10731,51,53,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10732,76,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10733,14,23.25,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10733,28,45.6,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10733,52,7,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10734,6,25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10734,30,25.89,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10734,76,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10735,61,28.5,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10735,77,13,2,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10736,65,21.05,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10736,75,7.75,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10737,13,6,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10737,41,9.65,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10738,16,17.45,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10739,36,19,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10739,52,7,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10740,28,45.6,5,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10740,35,18,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10740,45,9.5,40,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10740,56,38,14,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10741,2,19,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10742,3,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10742,60,34,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10742,72,34.8,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10743,46,12,28,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10744,40,18.4,50,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10745,18,62.5,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10745,44,19.45,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10745,59,55,45,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10745,72,34.8,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10746,13,6,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10746,42,14,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10746,62,49.3,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10746,69,36,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10747,31,12.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10747,41,9.65,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10747,63,43.9,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10747,69,36,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10748,23,9,44,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10748,40,18.4,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10748,56,38,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10749,56,38,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10749,59,55,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10749,76,18,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10750,14,23.25,5,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10750,45,9.5,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10750,59,55,25,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10751,26,31.23,12,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10751,30,25.89,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10751,50,16.25,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10751,73,15,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10752,1,18,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10752,69,36,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10753,45,9.5,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10753,74,10,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10754,40,18.4,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10755,47,9.5,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10755,56,38,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10755,57,19.5,14,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10755,69,36,25,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10756,18,62.5,21,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10756,36,19,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10756,68,12.5,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10756,69,36,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10757,34,14,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10757,59,55,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10757,62,49.3,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10757,64,33.25,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10758,26,31.23,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10758,52,7,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10758,70,15,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10759,32,32,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10760,25,14,12,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10760,27,43.9,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10760,43,46,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10761,25,14,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10761,75,7.75,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10762,39,18,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10762,47,9.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10762,51,53,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10762,56,38,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10763,21,10,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10763,22,21,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10763,24,4.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10764,3,10,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10764,39,18,130,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10765,65,21.05,80,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10766,2,19,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10766,7,30,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10766,68,12.5,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10767,42,14,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10768,22,21,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10768,31,12.5,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10768,60,34,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10768,71,21.5,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10769,41,9.65,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10769,52,7,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10769,61,28.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10769,62,49.3,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10770,11,21,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10771,71,21.5,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10772,29,123.79,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10772,59,55,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10773,17,39,33,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10773,31,12.5,70,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10773,75,7.75,7,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10774,31,12.5,2,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10774,66,17,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10775,10,31,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10775,67,14,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10776,31,12.5,16,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10776,42,14,12,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10776,45,9.5,27,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10776,51,53,120,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10777,42,14,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10778,41,9.65,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10779,16,17.45,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10779,62,49.3,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10780,70,15,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10780,77,13,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10781,54,7.45,3,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10781,56,38,20,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10781,74,10,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10782,31,12.5,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10783,31,12.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10783,38,263.5,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10784,36,19,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10784,39,18,2,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10784,72,34.8,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10785,10,31,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10785,75,7.75,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10786,8,40,30,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10786,30,25.89,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10786,75,7.75,42,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10787,2,19,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10787,29,123.79,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10788,19,9.2,50,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10788,75,7.75,40,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10789,18,62.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10789,35,18,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10789,63,43.9,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10789,68,12.5,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10790,7,30,3,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10790,56,38,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10791,29,123.79,14,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10791,41,9.65,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10792,2,19,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10792,54,7.45,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10792,68,12.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10793,41,9.65,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10793,52,7,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10794,14,23.25,15,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10794,54,7.45,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10795,16,17.45,65,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10795,17,39,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10796,26,31.23,21,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10796,44,19.45,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10796,64,33.25,35,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10796,69,36,24,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10797,11,21,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10798,62,49.3,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10798,72,34.8,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10799,13,6,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10799,24,4.5,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10799,59,55,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10800,11,21,50,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10800,51,53,10,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10800,54,7.45,7,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10801,17,39,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10801,29,123.79,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10802,30,25.89,25,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10802,51,53,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10802,55,24,60,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10802,62,49.3,5,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10803,19,9.2,24,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10803,25,14,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10803,59,55,15,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10804,10,31,36,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10804,28,45.6,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10804,49,20,4,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10805,34,14,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10805,38,263.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10806,2,19,20,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10806,65,21.05,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10806,74,10,15,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10807,40,18.4,1,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10808,56,38,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10808,76,18,50,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10809,52,7,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10810,13,6,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10810,25,14,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10810,70,15,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10811,19,9.2,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10811,23,9,18,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10811,40,18.4,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10812,31,12.5,16,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10812,72,34.8,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10812,77,13,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10813,2,19,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10813,46,12,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10814,41,9.65,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10814,43,46,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10814,48,12.75,8,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10814,61,28.5,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10815,33,2.5,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10816,38,263.5,30,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10816,62,49.3,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10817,26,31.23,40,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10817,38,263.5,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10817,40,18.4,60,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10817,62,49.3,25,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10818,32,32,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10818,41,9.65,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10819,43,46,7,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10819,75,7.75,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10820,56,38,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10821,35,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10821,51,53,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10822,62,49.3,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10822,70,15,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10823,11,21,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10823,57,19.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10823,59,55,40,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10823,77,13,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10824,41,9.65,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10824,70,15,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10825,26,31.23,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10825,53,32.8,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10826,31,12.5,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10826,57,19.5,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10827,10,31,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10827,39,18,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10828,20,81,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10828,38,263.5,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10829,2,19,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10829,8,40,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10829,13,6,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10829,60,34,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10830,6,25,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10830,39,18,28,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10830,60,34,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10830,68,12.5,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10831,19,9.2,2,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10831,35,18,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10831,38,263.5,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10831,43,46,9,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10832,13,6,3,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10832,25,14,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10832,44,19.45,16,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10832,64,33.25,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10833,7,30,20,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10833,31,12.5,9,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10833,53,32.8,9,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10834,29,123.79,8,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10834,30,25.89,20,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10835,59,55,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10835,77,13,2,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,22,21,52,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,35,18,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,57,19.5,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,60,34,60,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10836,64,33.25,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10837,13,6,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10837,40,18.4,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10837,47,9.5,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10837,76,18,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10838,1,18,4,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10838,18,62.5,25,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10838,36,19,50,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10839,58,13.25,30,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10839,72,34.8,15,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10840,25,14,6,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10840,39,18,10,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10841,10,31,16,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10841,56,38,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10841,59,55,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10841,77,13,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10842,11,21,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10842,43,46,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10842,68,12.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10842,70,15,12,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10843,51,53,4,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10844,22,21,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,23,9,70,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,35,18,25,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,42,14,42,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,58,13.25,60,0.100000001490116);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10845,64,33.25,48,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10846,4,22,21,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10846,70,15,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10846,74,10,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,1,18,80,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,19,9.2,12,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,37,26,60,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,45,9.5,36,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,60,34,45,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10847,71,21.5,55,0.200000002980232);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10848,5,21.35,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10848,9,97,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10849,3,10,49,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10849,26,31.23,18,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10850,25,14,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10850,33,2.5,4,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10850,70,15,30,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10851,2,19,5,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10851,25,14,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10851,57,19.5,10,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10851,59,55,42,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10852,2,19,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10852,17,39,6,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10852,62,49.3,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10853,18,62.5,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10854,10,31,100,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10854,13,6,65,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10855,16,17.45,50,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10855,31,12.5,14,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10855,56,38,24,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10855,65,21.05,15,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10856,2,19,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10856,42,14,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10857,3,10,30,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10857,26,31.23,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10857,29,123.79,10,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10858,7,30,5,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10858,27,43.9,10,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10858,70,15,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10859,24,4.5,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10859,54,7.45,35,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10859,64,33.25,30,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10860,51,53,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10860,76,18,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,17,39,42,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,18,62.5,20,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,21,10,40,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,33,2.5,35,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10861,62,49.3,3,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10862,11,21,25,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10862,52,7,8,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10863,1,18,20,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10863,58,13.25,12,0.150000005960464);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10864,35,18,4,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10864,67,14,15,0);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10865,38,263.5,60,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10865,39,18,80,0.0500000007450581);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10866,2,19,21,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10866,24,4.5,6,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10866,30,25.89,40,0.25);
INSERT INTO DetalhesPed(NumPed,CodProd,Preco,Qtde,Desconto) VALUES (10867,53,32.8,3,0);

