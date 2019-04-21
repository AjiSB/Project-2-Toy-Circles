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
    name_of_interests VARCHAR(255),
);

CREATE TABLE subscriber_interests (
    id INT AUTO_INCREMENT,
    interest id INT ,
    subscriber id INT,
    FOREIGN KEY (interest_id) REFERENCES interests(id),
    FOREIGN KEY (subcriber_id) REFERENCES subcriber(id),
    PRIMARY KEY (id)
);

CREATE TABLE toy_inventory (
    id INT AUTO_INCREMENT,
    image_url VARCHAR(255),
    name_of_toy VARCHAR(255),
    category VARCHAR(255),
    sku INT,
    stock_amount VARCHAR(255),
    toy_description VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE monthly_curations (
    id  INT AUTO_INCREMENT,
    subcriber id INT,
    toy_inventory id INT,
    delivery_date datetime,
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id),
    FOREIGN KEY (toy_inventory_id) REFERENCES toy_inventory(id),
    PRIMARY KEY (id)

)

