DROP DATABASE toycircles_db;

CREATE DATABASE toycircles_db;

USE toycircles_db;

CREATE TABLE subscriber  (
    id INT AUTO_INCREMENT, 
    name VARCHAR(255),
    email VARCHAR(255),
    password_hash VARCHAR(255),
    address VARCHAR(255),
    num_children INT,
    ages VARCHAR(255),
    last_log_in timestamp,
    sign_up_date timestamp,

    PRIMARY KEY(id)
);

CREATE TABLE interests (
    id INT AUTO_INCREMENT,
    name VARCHAR(255),

    PRIMARY KEY (id)
);

CREATE TABLE subscriber_interests (
    id INT AUTO_INCREMENT,
    interest_id INT ,
    subscriber_id INT,
    FOREIGN KEY (interest_id) REFERENCES interests(id),
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id),
    PRIMARY KEY (id)
);

CREATE TABLE toy_inventory (
    id INT AUTO_INCREMENT,
    image1_url VARCHAR(255),
    image2_url VARCHAR(255),
    name_of_toy VARCHAR(255),
    interest_id INT,
    sku VARCHAR(255),
    stock_amount INT,
    toy_description TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (interest_id) REFERENCES interests(id)
);

CREATE TABLE monthly_curations (
    id  INT AUTO_INCREMENT,
    subscriber_id INT,
    toy_inventory_id INT,
    delivery_date datetime,
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id),
    FOREIGN KEY (toy_inventory_id) REFERENCES toy_inventory(id),
    PRIMARY KEY (id)

);

