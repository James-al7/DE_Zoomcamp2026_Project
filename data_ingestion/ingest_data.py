import pandas as pd
from sqlalchemy import create_engine

engine = create_engine("postgresql://postgres:postgres@localhost:5432/instacart")

files = {
    "orders": "data_ingestion/rawfiles/orders.csv",
    "products": "data_ingestion/rawfiles/products.csv",
    "aisles": "data_ingestion/rawfiles/aisles.csv",
    "departments": "data_ingestion/rawfiles/departments.csv",
    "order_products_prior": "data_ingestion/rawfiles/order_products__prior.csv",
    "order_products_train": "data_ingestion/rawfiles/order_products__train.csv",
}

for table, path in files.items():
    df = pd.read_csv(path)
    df.to_sql(f"raw_{table}", engine, schema="raw", if_exists="replace", index=False)
    print(f"Loaded {table}")