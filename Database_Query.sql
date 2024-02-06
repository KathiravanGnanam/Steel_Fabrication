# DB Name OrderManagement



CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    mail VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role INTEGER NOT NULL
);

CREATE TABLE order_table (
    o_id SERIAL PRIMARY KEY,
    p_id INT NOT NULL,
    p_qty INTEGER NOT NULL,
    staff_id INT NOT NULL ,
    o_date DATE NOT NULL DEFAULT CURRENT_DATE,
    o_delivery DATE,
    status VARCHAR(50) NOT NULL DEFAULT 'placed',
	constraint fk FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE customer (
    c_id SERIAL PRIMARY KEY,
    c_name VARCHAR(50) NOT NULL,
    c_area VARCHAR(50),
    c_street VARCHAR(100),
    c_city VARCHAR(50) NOT NULL,
    c_pin INTEGER NOT NULL,
    c_phone VARCHAR(20) NOT NULL,
    c_birth DATE,
    c_mail VARCHAR(100) UNIQUE NOT NULL,
    oid INTEGER NOT NULL,
    wallet_balance DECIMAL(10,2) DEFAULT 0,
	constraint fk FOREIGN KEY(oid) REFERENCES order_table(o_id)
);


CREATE TABLE customized_product (
    p_id SERIAL PRIMARY KEY,
    budget DECIMAL(10,2) NOT NULL,
    thumbnail VARCHAR(255),
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    c_id INTEGER NOT NULL,
	constraint fk FOREIGN KEY(c_id) REFERENCES customer(c_id)
);




CREATE TABLE product (
    p_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    thumbnail VARCHAR(255),
    cat_id INTEGER NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    details TEXT,
    qty INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE category (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE review (
  r_id SERIAL PRIMARY KEY,
  p_id INTEGER NOT NULL ,
  c_id INTEGER NOT NULL ,
  r_desc TEXT NOT NULL,
  r_stars INTEGER NOT NULL CHECK (r_stars >= 1 AND r_stars <= 5),
	constraint fk FOREIGN KEY(p_id) REFERENCES product(p_id),FOREIGN KEY(c_id) REFERENCES customer(c_id)
);
