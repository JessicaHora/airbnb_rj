from sqlalchemy import create_engine, text
import pandas as pd
import os


uri = "postgresql://postgres:l12345@192.168.18.87/home?client_encoding=utf8"

engine = create_engine(uri)

with engine.connect() as connection:
    connection.execute(text("CREATE SCHEMA if not exists airbnb;"))
    connection.commit()


files = os.listdir("data")

for file in files:
    pd.read_csv(f"data/{file}").to_sql(
        "bronze_" + file.split(".")[0],
        engine,
        schema="airbnb",
        if_exists="replace",
        index=False,
    )
