# Assuming that this library is pre-installed in the environment, else can be added via requirements file
import psycopg2

conn = psycopg2.connect(
    dbname="testDB",
    user="masteruser",
    password="masterpassword",
    host="localhost",
    port=5432
)

cur = conn.cursor()

cur.execute("INSERT INTO orders (product_name, quantity, order_date) VALUES ('Product A', 10, '2025-01-01');")
cur.execute("INSERT INTO orders (product_name, quantity, order_date) VALUES ('Product B', 20, '2025-01-02');")
conn.commit()

cur.close()
conn.close()
