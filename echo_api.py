#!/usr/bin/python3
#
# Run this program by issuing: uvicorn dumb_api:app
#
##########################################
from fastapi import FastAPI, Request

app = FastAPI()


@app.post("/{full_path:path}")
async def root(request: Request, full_path: str):
    return await request.json()
