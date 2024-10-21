create database car_motors;
use car_motors ;
CREATE TABLE users (
    user_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(65) NOT NULL, 
    last_name VARCHAR(65) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email_user VARCHAR(255) UNIQUE NOT NULL,
    location VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
); 

CREATE TABLE brands (
    brand_id INT NOT NULL AUTO_INCREMENT,
    brand_name VARCHAR(100) NOT NULL,
    country VARCHAR(100),
    founded_year INT,
    website VARCHAR(255),
    PRIMARY KEY (brand_id)
);

CREATE TABLE ad (
    ad_id INT NOT NULL AUTO_INCREMENT, 
    post_date DATETIME NOT NULL,
    description_of_model TEXT NOT NULL,
    id_user INT NOT NULL,
    car_name VARCHAR(255), 
    brand_id INT NOT NULL,
    mobile VARCHAR(255) NOT NULL,
    selection_type ENUM('sedan', 'sport car', 'crossover', 'jeep', 'hatchback', 'coupe', 'suv'), 
    CC INT NOT NULL,
    horse_power INT NOT NULL, 
    type_of_transmission ENUM('Manual', 'Automatic') NOT NULL,
    km FLOAT NOT NULL,
    car_photo BLOB,
    price DECIMAL(10, 2),
    PRIMARY KEY (ad_id),
    CONSTRAINT fk_user_id 
        FOREIGN KEY (id_user) REFERENCES users(user_id) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    CONSTRAINT fk_brand_id 
        FOREIGN KEY (brand_id) REFERENCES brands(brand_id) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

CREATE TABLE comment_user (
    comment_id INT NOT NULL AUTO_INCREMENT,
    comment_text TEXT NOT NULL, 
    user_id INT NOT NULL,
    ad_id INT NOT NULL,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) 
    ON UPDATE CASCADE 
    ON DELETE CASCADE,
    FOREIGN KEY (ad_id) REFERENCES ad(ad_id) 
    ON UPDATE CASCADE 
    ON DELETE CASCADE
);
