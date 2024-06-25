-- SECTION ONE

-- Run to initialize the new database
CREATE DATABASE crowdfunding_db;

--------------------------------
-- SECTION TWO

-- Open a new Query Tool in the new database, 
-- Then run the following to create the new tables
DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS subcategory;

CREATE TABLE subcategory (
    subcategory_id VARCHAR(8) PRIMARY KEY,
    subcategory VARCHAR(20) NOT NULL
);

CREATE TABLE category (
    category_id VARCHAR(4) PRIMARY KEY,
    category VARCHAR(15) NOT NULL
);

CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR NOT NULL
);

CREATE TABLE campaign (
    cf_id INT PRIMARY KEY,
    contact_id INT NOT NULL,
    company_name VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    goal DECIMAL NOT NULL,
    pledged DECIMAL NOT NULL,
    outcome VARCHAR(10) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    launch_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(4) NOT NULL,
    subcategory_id VARCHAR(8) NOT NULL,

    FOREIGN KEY (contact_id) REFERENCES contacts (contact_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id)
);

-------------------------
--SECTION THREE

-- Refresh the database,
-- Import each table in the order they were created,
-- Then run each statement below to verify
SELECT * FROM subcategory;
SELECT * FROM category;
SELECT * FROM contacts;
SELECT * FROM campaign;

SELECT 	a.pledged,
		a.currency,
		a.outcome,
		a.company_name,
		o.first_name,
		o.last_name,
		c.category,
		s.subcategory
FROM subcategory s
JOIN campaign a
ON s.subcategory_id=a.subcategory_id
JOIN category c
ON c.category_id=a.category_id
JOIN contacts o
ON o.contact_id=a.contact_id
ORDER BY a.pledged DESC;