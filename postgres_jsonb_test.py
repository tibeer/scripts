#!/usr/bin/python3
#
# Test JsonB datatype with python. Test locally by running a postgres container:
# podman run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres postgres:latest
#
##########################################
from sqlalchemy import create_engine, Table, Column, Integer, MetaData
from sqlalchemy.dialects.postgresql import JSONB

engine = create_engine('postgresql://postgres:postgres@localhost:5432/test')
metadata = MetaData()

# reflect the database schema to the metadata
metadata.reflect(bind=engine)

users = Table(
    'users',
    metadata,
    Column('id', Integer, primary_key=True),
    Column('data', JSONB),
    extend_existing=True
)

metadata.create_all(engine)

# get the table object
table_name = 'users'
table = metadata.tables[table_name]

# print the table schema
print(table.__repr__())

