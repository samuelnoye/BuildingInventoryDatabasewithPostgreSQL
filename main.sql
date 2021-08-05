--place UNIQUE and NOT NULL constraints on code
SELECT * FROM parts LIMIT 10;


--place UNIQUE constraints on code
ALTER TABLE parts
ADD UNIQUE(code);

----place  NOT NULL constraints on code
ALTER TABLE parts
ALTER COLUMN code SET NOT NULL;


--updating these values before adding a constraint
UPDATE parts
SET description = 'Need Description'
WHERE description IS NULL
OR description = ' ';

--create new table
CREATE TABLE part_descriptions (
    id int PRIMARY KEY, 
    description text
);

--insert new row
INSERT INTO part_descriptions VALUES (1, '5V resistor'), (2, '3V resistor');

--update the values in the original table using an UPDATE statement while joining the original table with the table with descriptions.
UPDATE parts
SET description = part_descriptions.description
from part_descriptions
where part_descriptions.id = parts.id
and parts.description IS NULL

--constraint on parts that ensures that all values in description
ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

--insert row into parts
INSERT INTO parts (id,description, code,manufacturer_id) VALUES (10,' 3-color LED', 'V1-124', 9);

--need to alter the columns and set each not null
ALTER TABLE reorder_options
ALTER COLUMN ____ SET NOT NULL;

--ensure that both of these fields are positive
ALTER TABLE reorder_options
ADD CHECK (price_usd > 0 AND quantity > 0);

--CHECK constraint to enforce the constraints upper and lower limits.
ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25.00);

-- mark code primary key
ALTER TABLE parts
ADD PRIMARY KEY (code);

--foreign key constraint that links reorder_options and parts
ALTER TABLE reorder_options
ADD FOREIGN KEY (id) REFERENCES parts (id);

--constraint that ensures that each value in qty is greater than 0.
ALTER TABLE locations 
ADD CHECK (qty > 0); 

--part_id and location should be unique
ALTER TABLE locations
ADD UNIQUE (part_id, location);

--a FOREIGN KEY constraint that establishes parts as a child table and manufacturers as a parent
ALTER TABLE parts
ADD FOREIGN KEY (id) REFERENCES manufacturers (id);

-- insert a row into
INSERT INTO manufacturers 
VALUES (11, 'Pip-NNC Industrial');

--Update the old manufacturers’ parts in 'parts' to reference the new company you’ve just added to 'manufacturers'.
UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN ('Pip Industrial','NNC Manufacturing');
