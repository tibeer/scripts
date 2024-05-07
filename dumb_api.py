#!/usr/bin/python3
#
# Run this program by issuing: uvicorn dumb_api:app
#
##########################################
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel


class Item(BaseModel):
    name: str


app = FastAPI()


@app.post('/')
async def root(item: Item):
    if len(item.name) < 4:
        raise HTTPException(status_code=400, detail="Not a valid name")
    return item

