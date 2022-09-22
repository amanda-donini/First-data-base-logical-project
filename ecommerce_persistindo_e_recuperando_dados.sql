-- insercao de dados e queries
use ecommerce;

show tables;
desc productSupplier;
select * from product;
-- idClient, Fname, Minit, Lname, CPF, Addess
insert into Clients (Fname, Minit, Lname, CPF, Address)
	values ('Maria', 'M', 'Silva', 123456789, 'rua silva de prata 29, Carangola - Cidade das flores'),
			('Matheus', 'O', 'Pimentel', 987654321, 'rua alameda 289, Centro - Cidade das flores'),
            ('Amanda', 'B', 'Donini', 487654321, 'rua nereu ramos 289, Centro - Florianopolis'),
            ('Akaua', 'S', 'Costa', 587654321, 'rua professor anibal 289, Centro - Florianopolis');

-- idProduct, Pname, classification_kids, category, avaliacao, size
insert into product (Pname, classification_kids, category, avaliacao, size)
	values ('Fone', false, 'Eletronico', '4', null),
			('Barbie', true, 'Brinquedos', '3', null),
            ('Body', true, 'Vestimenta', '5', null),
            ('Microfone', false, 'Eletronico', '4', null),
            ('Sofa', false, 'Moveis', '3', '3x57x80');
            
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
	values (1, default, 'compra via aplicativo', null, 1),
			(2, default, 'compra via aplicativo', 50, 0),
            (3, 'Confirmado', null , null, 1),
            (4, default, 'compra via web site', 150, 0);
            
-- idPOproduct', 'idPOrder', 'poQuantity', 'poStatus'
select * from orders;
insert into productOrder (idPOproduct, idPOrder, poQuantity, poStatus)
	values (1,5,2, null),
			(2,6,1, null),
            (3,7,1, null);
            
-- storageLocation, quantity
insert into productStorage (storageLocation, quantity)
	values ('Rio de Janeiro', 1000),
			('Rio de Janeiro', 500),
            ('Sao Paulo', 10),
            ('Sao Paulo', 100),
            ('Sao Paulo', 10),
            ('Brasilia', 60);
            
-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location)
	values (1,2,'RJ'),
			(2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact)
	values ('Almeida e filhos', 123456789123456, '21985474'),
			('Eletronicos Silva', 223456789123456, '21985574'),
            ('Eletronicos Valma', 323456789123456, '21985674');

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) 
	values (1,1,500),
			(1,2,400),
            (2,4,663),
            (3,3,5),
            (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact)
	values ('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
			('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219946285),
            ('Kids World', null, 123456789456322, null, 'Rio de Janeiro', 219946284);
            
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity)
	values (1, 4, 80),
			(2, 5, 10);
            
select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname,Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname, ' ', Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
	values (2, default, 'compra via aplicativo', null, 1);
    
select count(*) from clients c, orders o 
	where c.idClient = idOrderClient;

select * from productOrder;

-- recuperacao de pedido com produto associado
select * from clients c 
						inner join orders o ON c.idClient = o.idOrderClient
						inner join productOrder p on p.idPOrder = o.idOrder;
                        
-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
						inner join orders o ON c.idClient = o.idOrderClient
		group by idClient;