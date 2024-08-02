# Connecting Databases

## Get SQL Clinet

You can [download](https://dbeaver.io/download/) free SQL Client DBeaver

After you install Dbeaver you can create a SQL Lite Sample Database. Click "Help" and choose  "Create Sample Database" and it will add sample database.

The database has the following tables:

```
Album
Artist
Customer
Employee
foo
Genre
Invoice
InvoiceLine
MediaType
Playlist
PlaylistTrack
sqlite_schema
Track
```

And they could be great for SQL practice.

## Connect Local Postgres
1. [Download](https://postgresapp.com/downloads.html) Postgress App for your OS
2. Start PostgesApp and initialize it.
3. Our host is `localhost`, our port is `5432`, database is `postgres`, our user `postgres`, our password is `postgres` (default) but you can change if you want. Open Dbeaver and click add new connection, choose Posgtres and try to connect.
4. Create new schema `create schema test;`
5. Create new table in this schema:

```sql
CREATE TABLE test.newtable (
	"name" varchar NULL,
	last_name varchar NULL
);
```

6. Insert one raw in this table:

```sql
INSERT INTO test.newtable
("name", last_name)
VALUES('your name', 'your last name');
```

7. Select from this table:

```sql
SELECT * FROM test.newtable;
```

## Connect Postgres in Docker

1. Check the `dockerfile`. It will use latest Postgres Image and copy DDLs from `00_create_schema.sql`, COPY commands from `01_import_csv.sql` and CSV from foler `csv` to the docker image.
2. Run command `docker build -t postgres_image .` to create the image with posgtres
3. Start the container with Postgres and assign the new port `5433` because we already using `5432` for localhost Postgres:

```bash
docker run -d -p 5433:5432 --name postgres_container postgres_image
```
