DIMENSION TABLE: dim_product

Purpose:
Stores descriptive information about products to enable product-wise and category-wise sales analysis.

Attributes:

product_key (PK): Surrogate key for the product

product_id: Business/natural product identifier

product_name: Name of the product

category: Product category (Electronics, Clothing, etc.)

sub_category: Further classification of the product

brand: Brand or manufacturer name

standard_price: Listed price of the product

product_status: Active / Discontinued

DIMENSION TABLE: dim_customer

Purpose:
Contains customer-related descriptive data for customer behavior and segmentation analysis.

Attributes:

customer_key (PK): Surrogate key for the customer

customer_id: Business/natural customer identifier

customer_name: Full name of the customer

gender: Gender of the customer

age_group: Customer age range

city: City of residence

state: State or region

country: Country of residence

customer_type: Retail, Wholesale,

Section 2: Design Decisions

The transaction line-item level was chosen as the granularity because it captures sales data at the most detailed level possible. Each row represents a single product sold in an order, which allows precise analysis of quantities, pricing, discounts, and revenue. Starting with the lowest level of detail ensures that higher-level summaries, such as daily sales, monthly revenue, or category-wise performance, can be derived accurately through aggregation.

Surrogate keys were preferred over natural keys to ensure consistency and performance. Natural keys like product codes or customer IDs may change over time or vary across source systems.

Section 3: Sample Data Flow

In the source transactional system, a sales order is recorded when a customer makes a purchase. For example, Order #101 is placed by customer John Doe, who buys 2 units of a Laptop at a price of ₹50,000 per unit on 15 January 2024. This data is initially stored in normalized operational tables such as orders, order items, customers, and products.

During the ETL (Extract, Transform, Load) process, this transaction is transformed to match the star schema structure. The order date is mapped to a surrogate date_key (20240115) in the date dimension. The product “Laptop” is mapped to product_key 5 in the product dimension, and the customer “John Doe” is mapped to customer_key 12 in the customer dimension.
