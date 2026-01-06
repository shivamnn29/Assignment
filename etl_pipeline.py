# Assignment
1.1  
import pandas as pd
customers = pd.read_csv ("customers_raw.csv")
products = pd.read_csv("products_raw.csv")

Transform-

customers.drop_duplicates(inplace=True)
products.drop_duplicates(inplace=True)
sales.drop_duplicates(inplace=True)

customers = customers[customers["email"].notna()]
products = products[products["price"].notna()]
products["stock_quantity"] = products["stock_quantity"].fillna(0)
sales = sales[sales["customer_id"].notna() & sales["product_id"].notna()]

products["category"] = products["category"].str.strip().str.capitalize()

from sqlalchemy import create_engine

engine = create_engine(
    "mysql+pymysql://username:password@localhost/fleximart"
)

customers.to_sql("customers", engine, if_exists="append", index=False)
products.to_sql("products", engine, if_exists="append", index=False)

print("ETL Pipeline executed successfully")


