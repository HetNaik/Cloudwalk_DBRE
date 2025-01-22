-- Create a publication in pg_master:
CREATE PUBLICATION orders_pub FOR TABLE orders;

-- Create a subscription in pg_replica:
CREATE SUBSCRIPTION orders_sub CONNECTION 'host=pg_master port=5432 user=masteruser password=masterpassword dbname=testDB' PUBLICATION orders_pub;

-- Validate Replication: 
-- Insert rows into pg_master using the other script and verify that the changes are reflected in pg_replica by querying the orders table.