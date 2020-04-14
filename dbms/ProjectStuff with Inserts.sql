CREATE TABLE customer (
	customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    address VARCHAR(100),
    city VARCHAR(40),
    state CHAR(2),
    postal_code INT,
    PRIMARY KEY(customer_id)
    );
    
    INSERT INTO customer (first_name,last_name,address, city,state, postal_code) VALUES ('John','Smith', '1234 Temp Lane','Orlando','FL',32816);
    INSERT INTO customer (first_name,last_name,address, city,state, postal_code) VALUES ('Jane','Doe', '5678 Orarily Drive','Orlando','FL',32816);
    INSERT INTO customer (first_name,last_name,address, city,state, postal_code) VALUES ('Philip','Fry','1729 Future Street', 'New New York','NY',10010);
    INSERT INTO customer (first_name,last_name,address, city,state, postal_code) VALUES ('Joe','Exotic','25803 N County Road 3250','Wynnewood','OK',73098);
    INSERT INTO customer (first_name,last_name,address, city,state, postal_code) VALUES ('Kobe','Bryant','5555 Toosoon Court','Somewhere','KB',12345);

CREATE TABLE item (
	itemID INT NOT NULL AUTO_INCREMENT,
    itemName VARCHAR(100),
    itemPrice DECIMAL(6,2),
    PRIMARY KEY(itemID)
	);
    
    INSERT INTO item (itemName, itemPrice) VALUES ('milk',3.00);
    INSERT INTO item (itemName, itemPrice) VALUES ('egg',3.38);
    INSERT INTO item (itemName, itemPrice) VALUES ('power',69.42);
    INSERT INTO item (itemName, itemPrice) VALUES ('games',59.99);
    INSERT INTO item (itemName, itemPrice) VALUES ('cups',1.35);
    INSERT INTO item (itemName, itemPrice) VALUES ('bowl',2.50);
    INSERT INTO item (itemName, itemPrice) VALUES ('magic',75.00);
    INSERT INTO item (itemName, itemPrice) VALUES ('soap',35.00);
    INSERT INTO item (itemName, itemPrice) VALUES ('lotion',3.00);
    INSERT INTO item (itemName, itemPrice) VALUES ('tissues',2.00);
    INSERT INTO item (itemName, itemPrice) VALUES ('gamergirl bathwater',99.99);
    INSERT INTO item (itemName, itemPrice) VALUES ('lunch',5.00);
    INSERT INTO item (itemName, itemPrice) VALUES ('poison',40.00);

CREATE TABLE discount_codes (
	code VARCHAR(20),
    item_id INT,
    customer_id INT,
    expiration DATE,
    PRIMARY KEY(code),
    FOREIGN KEY(item_id)
    REFERENCES item(itemID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
	);
    
    -- User makes the code, picks item from drop down list, and the customer id(php) and expiration are added automatically(php).
	INSERT INTO discount_codes (code, item_id, customer_id,expiration) VALUES ('unlimited',3,4,'2020-05-14');
    INSERT INTO discount_codes (code, item_id, customer_id,expiration) VALUES ('potter',7,3,'2020-05-14');
    INSERT INTO discount_codes (code, item_id, customer_id,expiration) VALUES ('lul',11,2,'2020-05-14');

CREATE TABLE orders (
	orderID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customerID INT NOT NULL,
    item INT NOT NULL,
    code VARCHAR(20) NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customer(customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (item) REFERENCES item (itemID)  ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (code) REFERENCES discount_codes(code)  ON DELETE CASCADE ON UPDATE CASCADE
	);

INSERT INTO orders (customerID, item, code, quantity) VALUES (1,9,NULL,5);
INSERT INTO orders (customerID, item, code, quantity) VALUES (1,7,'potter',3);
INSERT INTO orders (customerID, item, code, quantity) VALUES (2,11,'lul',1);
INSERT INTO orders (customerID, item, code, quantity) VALUES (2,2,NULL,3);
INSERT INTO orders (customerID, item, code, quantity) VALUES (3,8,NULL,6);
INSERT INTO orders (customerID, item, code, quantity) VALUES (3,3,'unlimited',1);
INSERT INTO orders (customerID, item, code, quantity) VALUES (4,2,NULL,1);
INSERT INTO orders (customerID, item, code, quantity) VALUES (4,3,'unlimited',1);
INSERT INTO orders (customerID, item, code, quantity) VALUES (5,7,'potter',2);
INSERT INTO orders (customerID, item, code, quantity) VALUES (5,3,'unlimited',4);