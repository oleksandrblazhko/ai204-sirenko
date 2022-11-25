FROM postgres
LABEL description="Docker for PostgreSQL"
LABEL mainteiner="Sirenko Mariia"
LABEL version="1.0"

ENV POSTGRES_USER sirenko
ENV POSTGRES_PASSWORD abc123
ENV POSTGRES_DATABASE sirenkodb

COPY ./scripts/db_script.sql /docker-entrypoint-initdb.d/
