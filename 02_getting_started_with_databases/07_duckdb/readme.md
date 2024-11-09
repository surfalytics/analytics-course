# Duck DB

DuckDB is an in-process SQL [**OLAP**](https://motherduck.com/learn-more/what-is-OLAP/) database, which means it is a database optimized for analytics and runs within the same process as the application using it. This unique feature allows DuckDB to offer the advantages of a database without the complexities of managing one. But, as with any software concept, the best way to learn is to dive in and get your hands dirty.

Installation: https://duckdb.org/docs/installation/.

On MacOS:

```bash
brew install duckdb
```

Or on Windows:

```bash
winget install DuckDB.cli
```

We can use CLI to query data:

```bash
D CREATE TABLE phones AS SELECT 15 AS version, 'iPhone' AS model;
FROM phones;
```

If we create table and restart duckdb, the data will be gone.

We can use persistence with DuckDB. The file can have any extension, but common choices are `.db`, `.duckdb`, or `.ddb`. If no database exists at the specified path, DuckDB will create one.

We can create a database to persist. Make sure you are in right directory:

```bash
cd 02_getting_started_with_databases/07_duckdb

duckdb data/mydb.db

D SHOW DATABASES;
```

Create table in database:

```bash
D CREATE TABLE mydb.phones AS SELECT 15 AS version, 'iPhone' AS model;
FROM mydb.phones;
```

You can also launch DuckDB with a database in read-only mode to avoid modifying the database:

```bash
duckdb -readonly /data/myawesomedb.db
```

If DuckDB is already running, use the `attach` command to connect to a database at the specified file path.

```bash
ATTACH DATABASE '/data/myawesomedb.db' AS mydb;
```

MotherDuck as could server as a cloud data warehouse, it will automatically manage the DuckDB databases for you.

## Reading and Display Data

We can read directly files.

Let's read the CSV file.

```bash
SELECT * FROM read_csv_auto('data/orders.csv');
```

We can create a table, use a `CREATE TABLE x AS` (CTAS) statement and it will save data in database.

```bash
CREATE TABLE mydb.netflix_top10 AS SELECT * FROM read_csv_auto('data/orders.csv');
```

To write data to a CSV file, use the `COPY` command and specify the delimiter. For Parquet files, simply specify the file format:

```bash
COPY 'data/orders.csv' TO 'data/orders.parquet' WITH (FORMAT 'PARQUET');
```

To read data from a Parquet file, use the `read_parquet` command:

```bash
SELECT * FROM read_parquet('data/orders.parquet');
```

DuckDB supports a wide variety of different file formats, including the native DuckDB database file used above, CSV, [**JSON**](https://motherduck.com/blog/analyze-json-data-using-sql/), Parquet, [**Iceberg**](https://motherduck.com/docs/integrations/file-formats/apache-iceberg/), [**Delta Lake**](https://motherduck.com/docs/integrations/file-formats/delta-lake/) and more.

We can read these files from your local filesystem, a http endpoint or a cloud blob store like AWS S3,Azure Blob Storage or Google Cloud Storage.

## Display modes, output options

DuckDB CLI offers various ways to enhance your experience by customizing the data display and output options.

We can use the `.mode` command to change the appearance of tables returned in the terminal output.

If we are dealing with long nested JSON, we can change the mode to `line` or `JSON` to have a better view of data.

```bash
.mode line
SELECT * FROM 'data/semistructuredfile.json';
```

We can output the result to a Markdown file, by setting the display mode to Markdown with `.mode markdown`.

Combine this with the `.output` or `.once` command to write the result directly to a specific file. The `.output` command writes all the output of the different results you run, while `.once` does it just once.

```bash
.mode markdown
.output myfile.md
```

## Running commands and exiting

DuckDB CLI allows you to run a SQL statement and exit using the `-c` option parameter. For example, if you use a `SELECT` statement to read a Parquet file:

```bash
duckdb -c "SELECT * FROM read_parquet('data/orders.parquet');"
```

This feature is lightweight, fast, and easy. You can even build your own [**bash functions**](https://duckdbsnippets.com/snippets/6/quickly-convert-a-csv-to-parquet-bash-function) using the DuckDB CLI for various operations on CSV/Parquet files, such as converting a CSV to Parquet.

DuckDB also offers flags for configuration that you can fine-tune, such as setting the thread count, memory limits, ordering of null values and more. You can find the full list of flag options and their current values from the `duckdb_settings()` table function.

```bash
FROM duckdb_settings();
```

## Working with extensions

Extensions are like packages that you can install within DuckDB to enjoy specific feature. DuckDB supports a number of core extensions. Not all are included by default, but DuckDB has a mechanism for remote extension installation. To view the available core extensions, execute the following statement:

```bash
FROM duckdb_extensions();
```

To install an extension, such as the popular `httpfs` extension that allows reading/writing remote files over HTTPS and S3, use the `INSTALL` command followed by the extension name. Once installed, DuckDB downloads the extension to the `$HOME/.duckdb/` folder (modifiable by setting the `extension_directory` parameter).

Next, load the extension in the DuckDB process with the `LOAD` command.

```bash
INSTALL httpfs;
LOAD httpfs;
```

DuckDB supports autoloading of the core extensions, so you often do not need to manually load these. As an example. if you read from a CSV file with a `https://` scheme, the `httpfs` extension will be autoloaded.

If you're using a third-party extension or your own extension not bundled by default, set the `allow_unsigned_extensions` flag to `True`, or use the `-unsigned` flag parameter when launching DuckDB.

```bash
duckdb -unsigned
```

Extensions are powerful and versatile. You can create your own using the [**template**](https://github.com/duckdb/extension-template) provided by the DuckDB Labs team to kickstart your extension development journey.

There is now a [**Community Extensions repository**](https://duckdb.org/docs/extensions/community_extensions.html) for you to share any custom extensions with the wider DuckDB community for easy installation.

## DuckDB Analytics Project

This project is provided by DuckDB community. In this simple project, we will answer the most existential question : what were people in the US binge-watching during the COVID lockdown?

As the data is sitting on AWS S3, we’ll start by installing the extension httpfs.

```bash
-- Install extensions
INSTALL httpfs;
LOAD httpfs;
-- Minimum configuration for loading S3 dataset if the bucket is public
SET s3_region='us-east-1';
```

We can now read our dataset :

```bash
D CREATE TABLE netflix AS SELECT * FROM read_parquet('s3://duckdb-md-dataset-121/netflix_daily_top_10.parquet');
FROM netflix;
```

Finally, getting the top watched movies as follow :

```bash
-- Display the most popular TV Shows
SELECT Title, max("Days In Top 10") from netflix
where Type='Movie'
GROUP BY Title
ORDER BY max("Days In Top 10") desc
limit 5;

-- Copy the result to CSV
COPY (
SELECT Title, max("Days In Top 10") from netflix
where Type='TV Show'
GROUP BY Title
ORDER BY max("Days In Top 10") desc
limit 5
) TO 'output.csv' (HEADER, DELIMITER ',');
```

## API use cases

DuckDB can query data from external sources like APIs, including the GitHub API, by combining DuckDB with other tools in a simple data pipeline. However, DuckDB itself doesn’t directly query APIs; instead, you can fetch the data using a language like Python or a command-line tool, save it in a compatible format (like JSON or Parquet), and then load it into DuckDB for querying. Here’s how to do it step-by-step:

You can use Python to request data from the GitHub API, for example:

```python
import requests
import json

# GitHub API endpoint, e.g., to fetch user repos
url = 'https://api.github.com/users/octocat/repos'
response = requests.get(url)

# Check for successful response
if response.status_code == 200:
    data = response.json()
    # Save data as JSON
    with open('github_data.json', 'w') as f:
        json.dump(data, f)
else:
    print("Failed to retrieve data", response.status_code)
```

Once you have the JSON file (github_data.json), you can load it into DuckDB.

```bash
INSTALL httpfs; -- DuckDB extension for reading files from the web or cloud
LOAD httpfs;

-- Load the JSON file
CREATE TABLE github_repos AS
SELECT * FROM read_json_auto('github_data.json');
```

Next, we can query the data.

```bash
-- Example query to list repository names
SELECT name, html_url FROM github_repos;
```

If you want to streamline the process, you can combine Python and DuckDB to automate fetching data from the GitHub API and loading it into DuckDB:

```python
import requests
import duckdb
import json

# Fetch data from GitHub API
url = 'https://api.github.com/users/octocat/repos'
response = requests.get(url)
data = response.json()

# Write to DuckDB
conn = duckdb.connect('github_data.db')
conn.execute("CREATE TABLE github_repos AS SELECT * FROM read_json_auto(?);", (json.dumps(data),))

# Query DuckDB
result = conn.execute("SELECT name, html_url FROM github_repos;").fetchall()
print(result)
```

## DuckDB use cases

DuckDB excels in several important areas:

1. Analytics on Structured Data:
    - Fast analytical queries on large CSV/Parquet files without loading into a database
    - Efficient aggregations, joins, and complex SQL operations
    - Great for data exploration and ad-hoc analysis, especially with Python integration
    - Works well with Pandas dataframes for larger-than-memory operations

2. ETL Processing:
    - Reading/writing multiple data formats (CSV, Parquet, JSON)
    - Performing transformations using SQL
    - Efficient parallel processing of data
    - Low overhead for pipeline development

3. Local Development and Testing:
    - Serverless architecture (no separate database process needed)
    - Perfect for developing and testing data pipelines locally
    - Easy to embed in applications
    - Great for CI/CD environments

4. Specific Technical Advantages:
    - Columnar storage optimized for OLAP workloads
    - Vectorized query execution
    - Efficient compression
    - Parallel query processing
