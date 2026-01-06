ENTITY: customers

customer_id (PK): Unique identifier for each customer

first_name: Customer’s first name

last_name: Customer’s last name

email: Customer’s email address

phone: Contact number

address: Residential or billing address

city: City of residence

created_at: Date when the customer was registered

ENTITY: orders


Attributes:

order_id (PK): Unique order identifier

customer_id (FK): References customers.customer_id

order_date: Date of order placement

order_status: Status of the order (Placed/Shipped/Delivered)

total_amount: Total monetary value of the order

Relation- 
Each order belongs to ONE customer 

One order contains MANY order_items

ENTITY: products


Attributes:

product_id (PK): Unique product identifier

product_name: Name of the product

unit_price: Price per unit

category: Product category

Relation-

One product can appear in MANY order_items

Normalization-

This database schema complies with Third Normal Form (3NF) as it is structured to maintain data accuracy, reduce unnecessary duplication, and logically organize information across tables. Initially, the design fulfills the requirements of First Normal Form (1NF) because each attribute stores indivisible (atomic) values and there are no repeating fields or multivalued attributes. Additionally, every table is uniquely identified by a primary key, ensuring clear record identification.
The design also satisfies Second Normal Form (2NF) since all non-key attributes depend entirely on their respective primary keys. There are no partial dependencies. For instance, in the order_items table, attributes such as quantity and line_total are determined solely by order_item_id and not by a subset of the key, such as order_id or product_id.
The schema achieves Third Normal Form (3NF) by eliminating transitive dependencies. Customer-specific details like name, email, and address are stored exclusively in the customers table and are not duplicated in the orders table. Likewise, product-related attributes such as unit price and category are maintained only in the products table and depend directly on product_id. This clear separation of data ensures consistency and avoids redundancy.
Functional Dependencies in the design are as follows:

customer_id determines first_name, last_name, email, phone, address, and city
order_id determines order_date, order_status, total_amount, and customer_id
product_id determines product_name, unit_price, and category
order_item_id determines order_id, product_id, quantity, and line_total

By organizing data in this manner, the database prevents update anomalies, as modifications need to be made only once. Insert anomalies are avoided because customer and product records can be created without placing an order.


Data Representation-

Customers
customer_id	first_name	last_name	email	city
C001	Amit	Sharma	amit@gmail.com	Delhi
C002	Neha	Verma	neha@gmail.com	Pune
orders
order_id	customer_id	order_date	order_status	total_amount
O101	C001	2025-01-10	Delivered	4500
O102	C002	2025-01-12	Placed	3200
products
product_id	product_name	unit_price	category
P01	Laptop Mouse	500	Electronics
P02	Keyboard	1200	Electronics
order_items
order_item_id	order_id	product_id	quantity	line_total
OI1	O101	P01	2	1000
OI2	O101	P02	3	3600
