ARG dbname=postgres
FROM library/postgres

ARG dbname
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB ${dbname}

EXPOSE 5432
CMD ["postgres"]
