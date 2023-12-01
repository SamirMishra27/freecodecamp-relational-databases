-- Fix table commands

DELETE FROM elements WHERE atomic_number = 1000;
DELETE FROM properties WHERE atomic_number = 1000;

ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;

ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;

ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;

ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;

ALTER TABLE elements
    ADD UNIQUE (symbol),
    ALTER COLUMN symbol SET NOT NULL;

ALTER TABLE elements
    ADD UNIQUE (name),
    ALTER COLUMN name SET NOT NULL;

ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);

CREATE TABLE types(
    type_id INT PRIMARY KEY,
    type VARCHAR(255) NOT NULL
);


ALTER TABLE properties ADD COLUMN type_id INT REFERENCES types(type_id);

INSERT INTO types (type_id, type) VALUES
    (1, 'nonmetal'),
    (2, 'metal'),
    (3, 'metalloid');

UPDATE properties SET type_id = 1 WHERE type = 'nonmetal';
UPDATE properties SET type_id = 2 WHERE type = 'metal';
UPDATE properties SET type_id = 3 WHERE type = 'metalloid';

ALTER TABLE properties DROP COLUMN type;

ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;

UPDATE elements SET symbol = 'He' WHERE atomic_number = 2;
UPDATE elements SET symbol = 'Li' WHERE atomic_number = 3;
-- UPDATE elements SET symbol = 'MT' WHERE atomic_number = 1000;
-- This has been deleted ^^^^^^^^^^

-- ALTER TABLE properties ALTER COLUMN atomic_mass TYPE NUMERIC(9,4);
-- This is wrong ^^^^^^
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE REAL;

INSERT INTO elements (atomic_number, symbol, name) VALUES (9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');

INSERT INTO properties (
    atomic_number,
    type_id,
    atomic_mass,
    melting_point_celsius,
    boiling_point_celsius
) VALUES (9, 1, 18.998, -220, -188.1),
    (10, 1, 20.18, -248.6, -246.1);

-- Query that will be used in bash to get element by name id or symbol
Select e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius From elements as e Inner Join properties as p using(atomic_number) Inner Join types as t using (type_id) Where e.atomic_number = 1;
--  Or e.symbol = 1 Or e.name = 1