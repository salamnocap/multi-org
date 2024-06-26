from fastapi import FastAPI, Depends, Request, HTTPException
from db import set_session, get_db_session, SessionLocal
from models import Item
from sqlalchemy import select


async def get_organization(request: Request):
    organization = request.headers.get("X-Org")
    if not organization:
        raise HTTPException(status_code=400, detail="Organization header missed")
    return organization


app = FastAPI()


@app.middleware("http")
async def adding_db_session_ls(request: Request, call_next):
    organization = await get_organization(request)
    token = set_session(organization)
    response = await call_next(request)
    SessionLocal.reset(token)
    return response


@app.get("/items/", dependencies=[Depends(get_db_session)])
async def get_items(session=Depends(get_db_session)):
    items = await session.scalars(select(Item))
    return items.all()
