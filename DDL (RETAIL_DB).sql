CREATE TABLE product_category(
	product_category_id mediumint auto_increment not null primary key,
    category_name varchar(100) not null);

CREATE TABLE product(
	product_id mediumint auto_increment not null primary key,
    product_category_id mediumint not null,
    product_name varchar(100) not null,
    product_unit_cost float default(0),
    product_price float default(0));

CREATE TABLE country(
	country_id mediumint auto_increment not null primary key,
    country_name varchar(100) not null);

CREATE TABLE city(
	city_id mediumint auto_increment not null primary key,
    country_id mediumint not null,
    city_name varchar(100) not null);

CREATE TABLE supplier_category(
	supplier_category_id mediumint auto_increment not null primary key,
    category_name varchar(100) not null);

CREATE TABLE supplier(
	supplier_id mediumint auto_increment not null primary key,
    supplier_category_id mediumint not null,
    city_id mediumint not null,
    supplier_name varchar(100) not null);

CREATE TABLE stock(
	stock_id mediumint auto_increment not null primary key,
    product_id mediumint not null,
    supplier_id mediumint not null,
    quantity mediumint default(0));

CREATE TABLE customer_category(
	customer_category_id mediumint auto_increment not null primary key,
    category_name varchar(100) not null);

CREATE TABLE customer(
	customer_id mediumint auto_increment not null primary key,
    customer_category_id mediumint not null,
    city_id mediumint not null,
    customer_first_name varchar(100) not null,
    customer_last_name varchar(100) not null,
    customer_mobile_number varchar(13),
    customer_landline_number varchar(13),
    customer_email varchar(150));

CREATE TABLE invoice(
	invoice_id mediumint auto_increment not null primary key,
    customer_id mediumint not null,
    date_invoice timestamp default current_timestamp);

CREATE TABLE invoice_detail(
	invoice_detail_id mediumint auto_increment not null primary key,
    invoice_id mediumint not null,
    product_id mediumint not null,
    quantity mediumint default(0),
    tax float default(0.23));

ALTER TABLE product ADD CONSTRAINT fk_product_category_id
FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id) ON DELETE CASCADE;

ALTER TABLE city ADD CONSTRAINT fk_city_country_id
FOREIGN KEY (country_id) REFERENCES country(country_id) ON DELETE CASCADE;

ALTER TABLE supplier ADD CONSTRAINT fk_supplier_city_id
FOREIGN KEY (city_id) REFERENCES city(city_id) ON DELETE CASCADE;

ALTER TABLE supplier ADD CONSTRAINT fk_supplier_category_id
FOREIGN KEY (supplier_category_id) REFERENCES supplier_category(supplier_category_id) ON DELETE CASCADE;

ALTER TABLE stock ADD CONSTRAINT fk_stock_product_id
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE;

ALTER TABLE stock ADD CONSTRAINT fk_stock_supplier_id
FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id) ON DELETE CASCADE;

ALTER TABLE customer ADD CONSTRAINT fk_customer_category_id
FOREIGN KEY (customer_category_id) REFERENCES customer_category(customer_category_id) ON DELETE CASCADE;

ALTER TABLE customer ADD CONSTRAINT fk_customer_city_id
FOREIGN KEY (city_id) REFERENCES city(city_id) ON DELETE CASCADE;

ALTER TABLE invoice ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE;

ALTER TABLE invoice_detail ADD CONSTRAINT fk_invoice_id
FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id) ON DELETE CASCADE;

ALTER TABLE invoice_detail ADD CONSTRAINT fk_invoice_detail_product_id
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE;