-- Creating the database
CREATE DATABASE salon;

-- Creating the tables
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    phone VARCHAR(30) UNIQUE NOT NULL,
    name VARCHAR(255)
);

CREATE TABLE appointments(
    appointment_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    service_id INT REFERENCES services(service_id),
    time VARCHAR(255)
);

CREATE TABLE services(
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Insert some services data
INSERT INTO services (name) VALUES
    ('cut'),
    ('full-cut'),
    ('shave'),
    ('clean-shave'),
    ('shampoo'),
    ('massage'),
    ('manicure'),
    ('pedicure');