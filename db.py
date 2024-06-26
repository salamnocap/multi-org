from sqlalchemy.ext.declarative import declarative_base
from contextvars import ContextVar
from fastapi import HTTPException
from sqlalchemy.ext.asyncio import (
    create_async_engine, async_sessionmaker,
    AsyncSession
)

SessionLocal = ContextVar('SessionLocal')

Base = declarative_base()


DATABASES = {
    "organization1": "org1",
    "organization2": "org2"
}

DB_USER = "postgres"
DB_PASS = "1234"
DB_HOST = "localhost"
DB_PORT = "5432"


def get_engine(database_url):
    return create_async_engine(database_url)


def get_session(organization):
    if organization not in DATABASES:
        raise HTTPException(status_code=400, detail="Invalid organization")
    engine = get_engine(f"postgresql+asyncpg://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DATABASES[organization]}")
    return async_sessionmaker(
        bind=engine,
        class_=AsyncSession,
        expire_on_commit=False,
        autoflush=False
    )


def set_session(organization):
    session = get_session(organization)
    token = SessionLocal.set(session)
    return token


async def get_db_session():
    session_factory = SessionLocal.get()
    async with session_factory() as session:
        try:
            yield session
        finally:
            await session.close()
