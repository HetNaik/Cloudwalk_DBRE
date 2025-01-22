# DBRE

## Setup Instructions

1. Ensure you have Docker and Docker Compose installed.
2. Run the following command to start the containers:
   ```bash
   docker-compose up -d
3. Access the pg_master container and run the schema setup:
   ```bash
   docker exec -it pg_master psql -U masteruser -d testDB -f /scripts/schema.sql
4. Run the Python script to insert data:
   ```bash
   python scripts/insert_data.py
5. Follow instructions in file from the scripts folder for logical replication and partitioning tasks.