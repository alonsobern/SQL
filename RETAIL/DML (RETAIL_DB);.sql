INSERT INTO country VALUES (0,'Ireland');
INSERT INTO country VALUES (0,'Ecuador');
INSERT INTO country VALUES (0,'Spain');
INSERT INTO country VALUES (0,'Argentina');
INSERT INTO country VALUES (0,'Italy');

INSERT INTO city VALUES (0,1,'Dublin');
INSERT INTO city VALUES (0,2,'Quito');
INSERT INTO city VALUES (0,3,'Madrid');
INSERT INTO city VALUES (0,4,'Buenos Aires');
INSERT INTO city VALUES (0,5,'Rome');

INSERT INTO product_category VALUES (0,'Cables');
INSERT INTO product_category VALUES (0,'Adapters');
INSERT INTO product_category VALUES (0,'Mobiles');
INSERT INTO product_category VALUES (0,'Cases');
INSERT INTO product_category VALUES (0,'Speakers');

INSERT INTO product VALUES (0,1,'USB to Type C 2M','1.25','14');
INSERT INTO product VALUES (0,1,'Type C to Type C 3M','1.35','18');
INSERT INTO product VALUES (0,1,'HDMI to VGA 1M','2.28','22');
INSERT INTO product VALUES (0,2,'Travel Adapter UK','1.08','10');
INSERT INTO product VALUES (0,2,'Travel Adapter EU','1.08','10');
INSERT INTO product VALUES (0,3,'Samsung S24 Ultra 256GB','680','1008');
INSERT INTO product VALUES (0,3,'Iphone 16 128GB','870','1250');
INSERT INTO product VALUES (0,3,'Redmi A3 64GB','245','358');
INSERT INTO product VALUES (0,4,'Clear for Iphone 16','1.12','10');
INSERT INTO product VALUES (0,4,'Clear for Samsung S24 Ultra','1.12','10');
INSERT INTO product VALUES (0,4,'Ring for Redmi A3','1.15','10');
INSERT INTO product VALUES (0,4,'Book for Iphone 16','1.28','10');
INSERT INTO product VALUES (0,5,'JBL GO 4','18','56');
INSERT INTO product VALUES (0,5,'JBL GO 2','11','20');
INSERT INTO product VALUES (0,5,'HOCO XPERT 3','3.5','15');

INSERT INTO supplier_category VALUES (0,'Mobiles');
INSERT INTO supplier_category VALUES (0,'General');
INSERT INTO supplier_category VALUES (0,'Accesories');
INSERT INTO supplier_category VALUES (0,'Cases');
INSERT INTO supplier_category VALUES (0,'Technology');

INSERT INTO supplier VALUES (0,1,1,'Supplier A');
INSERT INTO supplier VALUES (0,1,1,'Supplier B');
INSERT INTO supplier VALUES (0,1,1,'Supplier C');
INSERT INTO supplier VALUES (0,3,3,'Supplier D');
INSERT INTO supplier VALUES (0,4,4,'Supplier E');
INSERT INTO supplier VALUES (0,5,5,'Supplier F');
INSERT INTO supplier VALUES (0,2,2,'Supplier G');

INSERT INTO stock VALUES (0,1,1,10);
INSERT INTO stock VALUES (0,2,2,25);
INSERT INTO stock VALUES (0,3,3,5);
INSERT INTO stock VALUES (0,4,4,36);
INSERT INTO stock VALUES (0,5,5,158);
INSERT INTO stock VALUES (0,6,1,5);
INSERT INTO stock VALUES (0,7,2,9);
INSERT INTO stock VALUES (0,8,3,98);
INSERT INTO stock VALUES (0,9,4,102);
INSERT INTO stock VALUES (0,10,5,6);
INSERT INTO stock VALUES (0,11,1,2);
INSERT INTO stock VALUES (0,12,2,9);
INSERT INTO stock VALUES (0,13,3,15);
INSERT INTO stock VALUES (0,14,4,78);
INSERT INTO stock VALUES (0,15,5,9);
INSERT INTO stock VALUES (0,1,1,99);
INSERT INTO stock VALUES (0,2,2,63);
INSERT INTO stock VALUES (0,3,3,89);
INSERT INTO stock VALUES (0,4,4,21);
INSERT INTO stock VALUES (0,5,5,23);

INSERT INTO customer_category VALUES (0,'Residential');
INSERT INTO customer_category VALUES (0,'Enterprise');
INSERT INTO customer_category VALUES (0,'VIP');

INSERT INTO customer VALUES (0,1,1,'Manuel','Bernabe','0831652742','','manuel@gmail.com');
INSERT INTO customer VALUES (0,2,2,'Alonso','Baldano','0831689642','01256789496','alonso@gmail.com');
INSERT INTO customer VALUES (0,3,3,'James','Jam','0896952742','01547896532','james@gmail.com');
INSERT INTO customer VALUES (0,1,4,'Maria','Hnjos','0831678542','','maria@gmail.com');
INSERT INTO customer VALUES (0,2,5,'Auxiliadora','Casquete','0879952742','','aux@gmail.com');
INSERT INTO customer VALUES (0,3,1,'Suzy','Blunden','0831652254','0125678943','suzy@gmail.com');
INSERT INTO customer VALUES (0,1,2,'Alanis','Costa','0831689635','','alanis@gmail.com');
INSERT INTO customer VALUES (0,2,3,'Mike','Hammer','0831782742','014795345896','mike@gmail.com');
INSERT INTO customer VALUES (0,3,4,'Max','Roses','0833698742','','max@gmail.com');

INSERT INTO invoice (customer_id) VALUES (1);
INSERT INTO invoice (customer_id) VALUES (2);
INSERT INTO invoice (customer_id) VALUES (3);
INSERT INTO invoice (customer_id) VALUES (1);
INSERT INTO invoice (customer_id) VALUES (4);
INSERT INTO invoice (customer_id) VALUES (5);
INSERT INTO invoice (customer_id) VALUES (8);

INSERT INTO invoice_detail VALUES (0,1,1,2,0.23);
INSERT INTO invoice_detail VALUES (0,1,2,6,0.23);
INSERT INTO invoice_detail VALUES (0,1,3,9,0.23);
INSERT INTO invoice_detail VALUES (0,1,4,5,0.23);
INSERT INTO invoice_detail VALUES (0,2,5,3,0.23);
INSERT INTO invoice_detail VALUES (0,2,6,1,0.13);
INSERT INTO invoice_detail VALUES (0,3,7,4,0.13);
INSERT INTO invoice_detail VALUES (0,3,8,4,0.23);
INSERT INTO invoice_detail VALUES (0,3,9,5,0.13);
INSERT INTO invoice_detail VALUES (0,4,10,4,0.13);
INSERT INTO invoice_detail VALUES (0,5,11,5,0.23);
INSERT INTO invoice_detail VALUES (0,5,12,9,0.23);
INSERT INTO invoice_detail VALUES (0,5,13,3,0.13);
INSERT INTO invoice_detail VALUES (0,6,14,2,0.13);
INSERT INTO invoice_detail VALUES (0,6,15,1,0.23);
INSERT INTO invoice_detail VALUES (0,7,14,4,0.23);
INSERT INTO invoice_detail VALUES (0,7,13,8,0.23);
INSERT INTO invoice_detail VALUES (0,7,12,3,0.23);

UPDATE stock SET quantity=56 WHERE stock_id = 7;
UPDATE stock SET quantity=45 WHERE stock_id = 1;
UPDATE stock SET quantity=20 WHERE stock_id = 3;
UPDATE stock SET quantity=78 WHERE stock_id = 10;

UPDATE customer SET customer_mobile_number='0845784512' WHERE customer_id=8;
UPDATE customer SET customer_landline_number='0112367896' WHERE customer_id=8;
UPDATE customer SET customer_last_name='Hinojosa' WHERE customer_id=4;
UPDATE customer SET customer_email='james@outlook.com' WHERE customer_id=3;
UPDATE customer SET customer_last_name='Bern' WHERE customer_id=1;