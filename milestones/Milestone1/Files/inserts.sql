-- script name : inserts.sql
-- Author: Vinh Ngo
-- Purpose: insert sample data to test the integerity of this database sytem

-- database used to insert data into
USE `ManufacturingDB`;

-- supplier
INSERT INTO supplier (name, certification) values ('Supplier A', 'certification A'), 
('Supplier B', 'certification B'),
('Supplier C', 'certification C');

-- supplier contact
INSERT INTO supplier_contact (supplier, email) values (1, 'A@mail.com'),
(2, 'B@mail.com'),
(3, 'C@mail.com');


-- contracts
INSERT INTO contract (start_date, end_date, name) values (NOW(), NOW(), 'contract between A and manufacturer'),
(NOW(), NOW(), 'contract between B and manufacturer'),
(NOW(),NOW(), 'contract between C and manufacturer');

-- Agreements

INSERT INTO agreement (contract, supplier) values (1,1) ,(2,2), (3,3);

-- raw material

INSERT INTO raw_material (name, specification) values ('material A', 'metal'),
('material B', 'solid'),
('material c', 'plastic');

-- supply

INSERT INTO supply (supplier, raw_material) values (1,1), (2,2) ,(3,3);

-- product
INSERT INTO product (name, description) values ('product A', 'valuable'),
('product B', 'grade A'),
('product C', 'grade B');

-- components

INSERT INTO components(raw_material, product) values (1,1) , (2,2) , (3,3);

-- quality standards

INSERT INTO quality_standards (description, criteria) values ('used to make something A', 1),
('used to make something B', 2),
('used to make something C', 3);

-- quality 

INSERT INTO quality (quality_standard, product) values (1,1) , (2,2) , (3,3);

-- manufacturer

INSERT INTO manufacturer (name, production_capability) values ('manufacturer A', 100),
('manufacturer B', 1000),
('manufacturer C', 2000);

-- productions

INSERT INTO productions(manufacturer, product) values (1,1), (2,2), (3,3);

-- pricing rules

INSERT INTO pricing_rules (pricing_tier, description) values (1 , 'high tier'),
(2, 'mid tier'),
(3, 'low tier');

-- pricings

INSERT INTO pricings (pricing_rule, product) values (1,1) , (1,2), (2,3);

-- customers
INSERT INTO customer (name, DOB) values ('customer A', CURDATE()),
('customer B', CURDATE()),
('customer C', CURDATE());

-- customer contact

INSERT INTO customer_contact (customer, email, address) values (1, "customerA@mail.com", "SF"),
(2, "B@cmail.com", "SJ"),
(3, "C@cmail.com", "SD");

-- purchase historyy

INSERT INTO purchase_history (purchase_date, order_detail) values (CURDATE(), 'fragile'),
(CURDATE(), 'high priority'),
(CURDATE(), 'somethjing');

-- returns

INSERT INTO returns (customer, purchase_history) values (1,1), (2,2) , (3,3);

-- payment

INSERT INTO payment (payment_date, payment_status, amount) values (curdate(), 'paid', 100),
(curdate(), 'pending', 100),
(curdate(), 'not paid', 200);

-- crypto

INSERT INTO crypto (payment, amount) values (1, 100), (2, 100), (3, 200);

-- credit card

INSERT INTO credit_card (credit_card_number, payment) values (123, 1), (321, 2) , (413, 3);

-- Check

INSERT INTO check_payment (payment , issuing_bank) values (1, 'BOA') , (2, 'capitol'), (3, 'cargo');

-- payment methods

INSERT INTO payment_method (payment, customer) values (1,1), (2,2), (3,3);

-- shipment

INSERT INTO shipment (tracking_number, delivery_status) values (384689, 'in transit'),
(98823, 'processing'),
(27239, 'delivered');

-- order

INSERT INTO Orders (customer, order_status, shipment) values (1, 'processing', 1),
(2, 'processing', 2),
(3, 'finished', 3);

-- order product

INSERT INTO ordered_products (orders, product) values (1,1) , (2,1), (3,3);

-- transportation

INSERT INTO transportation (carrier_info, fee) values ('usps', 10),
('ups' , 20),
('fedex', 30);

-- Ground

INSERT INTO ground (delivery_time, transportation) values ("1 day", 1), ("2 days", 1), ("3 days", 2);

-- Cargo

INSERT INTO cargo (delivery_time, transportation) values ("1 day", 1), ("2 days", 1), ("3 days", 2);

-- Air

INSERT INTO air (delivery_time, transportation) values ("1 day", 1), ("2 days", 1), ("3 days", 2);



-- transportation modes

INSERT INTO transportation_modes (shipment, transportation) values (1,1), (2,2), (3,3);

-- warehouse

INSERT INTO warehouse (location, capacity) values ("San Jose, CA, US", 100),
("San Francisco, CA, US", 200),
("San Diego, CA, US", 300);

-- inventoyr

INSERT INTO inventory (warehouse, product) values (1,1) , (2,2) ,(1,3);

-- product standards

INSERT INTO production_standards (description, certification) values ("high standards", "A"),
("standard standard", "B"),
("low standard", "C");

-- production procedures

INSERT INTO production_procedures (description, instructions) values ("handle with care", "instructions A"),
("handle wihtout care", "instructions B"),
("not handle with no care", "instructions C");

-- factory

INSERT INTO factory (name, location) values
("A", "San Jose, CA, US"),
("B", "San Francisco, CA, US"),
("C", "San Diego, CA, US"); 


-- product category

INSERT INTO product_category (factory, product_standard, product) values (1,1,1), (2,1,2), (3,3,2);

-- product types

INSERT INTO product_types (product_standards, product_category) values (1,1) , (2,2) , (3,3);

-- Standard selection

INSERT INTO standard_selection (product_procedures, product_standard) values (1,1), (2,1) , (3,3);