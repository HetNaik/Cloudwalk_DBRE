-- Partition the Orders Table by the order_date column without downtime using the following steps:
CREATE TABLE orders_new (
  id SERIAL PRIMARY KEY,
  product_name TEXT NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL
) PARTITION BY RANGE (order_date);

CREATE TABLE orders_jan2025 PARTITION OF orders_new FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

-- Redirect Inserts to Partitioned Table: 
-- Rename the existing table and replace it with a partitioned table:
ALTER TABLE orders RENAME TO orders_old;
ALTER TABLE orders_new RENAME TO orders;


-- Migrate Existing Data:
INSERT INTO orders SELECT * FROM orders_old;

-- Test Inserts: 
-- Use the Python script to continuously insert rows and verify that they are directed to the appropriate partitions.