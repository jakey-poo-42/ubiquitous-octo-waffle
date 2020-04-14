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

CREATE TABLE item (
	itemID INT NOT NULL AUTO_INCREMENT,
    itemName VARCHAR(100),
    itemPrice DECIMAL(6,2),
    PRIMARY KEY(itemID)
	);

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
