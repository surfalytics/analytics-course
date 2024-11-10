# MongoDB 101

The are two most commond databses:

- Relational DB - data stored in different tabels with fixed schema, data has relationship, to query we need join and query data
- Document DB - data storing in document, each document is independent and they may have different schema.

MongoDB is a document database with the scalability and flexibility that you want with the querying and indexing that you need.

It is using in full stack web applications.

## Full Stack Frameworks types
There are many popular full-stack frameworks, combine tools to handle both front-end and back-end development seamlessly.

Here are some of the widely-used ones:

1. MEAN Stack
- MongoDB (Database)
- Express.js (Backend framework)
- Angular (Frontend framework)
- Node.js (Runtime environment)
- Use Case: Single-page applications (SPAs), real-time applications.

2. MERN Stack
- MongoDB (Database)
- Express.js (Backend framework)
- React (Frontend library)
- Node.js (Runtime environment)
- Use Case: Dynamic web applications with complex UIs, highly interactive SPAs.

3. MEVN Stack
- MongoDB (Database)
- Express.js (Backend framework)
- Vue.js (Frontend framework)
- Node.js (Runtime environment)
- Use Case: Progressive web applications, dashboards, and applications requiring high interactivity.

4. LAMP Stack
- Linux (Operating system)
- Apache (Web server)
- MySQL (Database)
- PHP (Backend language)
- Use Case: Traditional websites, especially CMS platforms like WordPress.

5. JAM Stack
- JavaScript (Frontend)
- APIs (Backend as a service)
- Markup (Static content)
- Use Case: Static websites, fast-loading web applications with pre-built content.

6. Django + React
- Django (Backend framework for Python)
- React (Frontend library)
- Use Case: Web apps needing complex backend logic with a dynamic, responsive frontend.

7. Ruby on Rails + React or Vue
- Ruby on Rails (Backend framework)
- React or Vue (Frontend library/framework)
- Use Case: Quick-to-build apps with robust backends, APIs, and complex frontends.

8. Spring Boot + Angular or React
- Spring Boot (Java-based backend framework)
- Angular or React (Frontend library/framework)
- Use Case: Large-scale enterprise applications with high-security requirements.

9. Serverless Stack
- Frontend Framework (e.g., React, Vue, or Angular)
- Serverless Backend (e.g., AWS Lambda, Google Cloud Functions)
- Database (e.g., DynamoDB, Firebase)
- Use Case: Applications needing scalability, minimal maintenance, and event-driven workflows.

These stacks cover a range of use cases, from traditional server-hosted applications to modern serverless or static-based solutions, helping developers create applications that are scalable, performant, and tailored to specific project needs.

## MongoDB elements

MongoDB is structured to store data in a flexible, document-oriented format. Here’s a breakdown of its core components:

1. Database
- The top-level container in MongoDB, where related collections are grouped together.
- Each database has its own set of collections, permissions, and settings.
- MongoDB allows multiple databases within an instance, helping organize different applications or environments.

2. Collection
- A group of documents within a database, somewhat similar to a table in a relational database.
- Collections don’t enforce a fixed schema, allowing each document to have a unique structure.
- Collections can hold different types of data and are optimized for easy scaling and fast read/write operations.

3. Document
- The basic unit of data in MongoDB, represented in a JSON-like format called BSON (Binary JSON).
- Documents consist of key-value pairs and can store nested data structures (arrays, other documents).
- Each document must have a unique identifier (_id field), which is auto-generated if not explicitly provided.

4. Field
- A key-value pair within a document, similar to a column in a relational database.
- Fields can store data of various types, like strings, numbers, arrays, objects, and even binary data.

5. BSON (Binary JSON)
- MongoDB uses BSON format to store data, which supports a broader range of data types (like dates and binary data) compared to JSON.
- BSON is optimized for fast read/write operations and allows documents to be stored efficiently.

6. Index
- Indexes are special data structures that improve query performance, allowing MongoDB to search and sort data faster.
- MongoDB supports various types of indexes, including single-field, compound, multikey (for arrays), text, and geospatial indexes.

7. Replica Set
- A group of MongoDB servers that maintain the same data set to provide redundancy and increase data availability.
- A replica set has a primary node that receives all writes, while secondary nodes replicate data and serve read requests (in certain configurations).

8. Sharding
- MongoDB’s horizontal scaling mechanism, allowing data to be distributed across multiple servers (shards).
- Each shard holds a subset of data, enabling the database to handle large datasets and high query loads efficiently.

## JSON, JSON Object, BSON

**JSON (JavaScript Object Notation)** - A lightweight data-interchange format, easy for humans to read and write and easy for machines to parse and generate. JSON uses key-value pairs and supports basic data types (strings, numbers, arrays, booleans, objects, and null). JSON is widely used for web APIs and data storage in NoSQL databases like MongoDB.

```json
{
   "name": "Alice",
   "age": 30,
   "isStudent": false,
   "skills": ["Python", "JavaScript", "Data Analysis"],
   "address": {
      "city": "New York",
      "zip": "10001"
   }
}
```

**JSON Object** -  is the main building block of JSON data. It represents an unordered set of key-value pairs enclosed in curly braces {}. JSON objects can nest other JSON objects and arrays, forming a tree-like structure. JSON objects represent entities with attributes, commonly used in APIs to represent a resource like a user, product, or post.

```json
{
   "city": "New York",
   "zip": "10001"
}
```

**JavaScript Object** is a complex data structure in JavaScript that allows you to store collections of data as key-value pairs. Objects are one of the core building blocks of JavaScript, enabling more complex and flexible data structures beyond primitive data types (like strings, numbers, and booleans).

```json
{
  name: "Alice",
  age: 25,
  city: "New York"
};
```

**BSON (Binary JSON)** - is a binary representation of JSON-like documents, designed to be efficient in terms of storage and speed. It’s used internally by MongoDB for data storage and transfer. BSON includes metadata and supports more data types, such as `Date`, `int32`, `int64`, binary data, and `ObjectId` (a unique identifier in MongoDB).

```json
{
   "_id": ObjectId("507f1f77bcf86cd799439011"),
   "name": "Alice",
   "age": 30,
   "joinedAt": new Date("2022-01-01T00:00:00Z")
}
```

might appear in hexadecimal when viewed in its raw binary form, something like:

```json
16 00 00 00 07 5F 69 64 00 4C 5A 54 51 68 58 42 ...
```

**Extended JSON** is a JSON format created by MongoDB to represent data types that are native to BSON (Binary JSON) but not supported by standard JSON, such as dates, binary data, and ObjectIds. This format allows MongoDB’s BSON data to be converted to JSON in a way that retains type information, making it easier to work with complex data structures outside of MongoDB.

## Install Mongo DB

We can install MongoDB with multiple options:
- [Install mongodb community edition](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/#std-label-install-mdb-community-macos)

```bash
brew tap mongodb/brew

brew install mongodb-community@8.0

brew services start mongodb-community@8.0
```

- [Install mongodb Atlas CLI](https://www.mongodb.com/docs/atlas/cli/current/install-atlas-cli/)

```bash
# Install the Atlas CLI and mongosh
brew install mongodb-atlas

# Verify successful Atlas CLI installation.
atlas
```
- Run local Docker compose

```bash
# Make sure you are in right directory
cd 02_getting_started_with_databases/06_nosql_databases/mongodb

# Launch docker compose
docker-compose up -d

# Verify logs
docker logs mongodb

# Launch Mongo Shell
docker exec -it mongodb-client mongo --host mongodb -u root -p example --authenticationDatabase admin
```

## Let's check Docker Compose

The `docker-compose.yml` file contains three services:

1.	`mongodb` Service: This is the actual MongoDB database. It runs the MongoDB server, which stores your data and handles database operations such as queries, inserts, updates, etc. It is configured to run on port 27017 (the default MongoDB port), so you can interact with it via the Mongo shell or programmatically.
2.	`mongo-express` Service: This is a lightweight web-based admin interface for MongoDB, called Mongo Express. It allows you to manage and visualize your MongoDB data in a user-friendly UI. You can interact with your databases, collections, and documents using a web browser without needing to know Mongo shell commands. This service runs on port 8081 and connects to the MongoDB service to display the database contents.
3. `mongodb-client` service in the `docker-compose.yml` file is an additional container designed to provide access to the MongoDB shell (mongo client), which is missing in the original MongoDB container.

`command: [“sleep”, “infinity”]:` This command keeps the container running without actually executing anything. It simply puts the container into a sleep state, ensuring the MongoDB client container doesn’t stop after it starts. You can then execute commands (like the mongo shell) interactively by attaching to this container later using docker exec.

Next we can add sample data

```bash
# Create new database
use mydb;
```

```bash
# Insert Many documents
db.mycollection.insertMany([
  { name: "Alice", age: 25, city: "New York" },
  { name: "Bob", age: 30, city: "San Francisco" },
  { name: "Charlie", age: 35, city: "Chicago" }
]);
```

Query collection:
```bash
db.mycollection.find();
```

Search document:
```bash
db.mycollection.find({ city: "New York" });
```

## We can use GUI Client

- [MongoDB Compass](https://www.mongodb.com/try/download/atlascli)
- [Robo 3T](https://robomongo.org/)

## Let's use Atlas CLI

Authetificate:

```bash
atlas auth login
```

Get list of clusters:

```bash
atlas clusters list
```

Install Mongo Shell:

```bash
brew install mongosh
```

Connect cluster:

```bash
mongosh "mongodb+srv://cluster0.mfllx.mongodb.net/" --apiVersion 1 --username <USER>
```

## Run commands

```bash
# check version
db.version()

# help
db.help()

# list of databses
show dbs

# use sample_mflix
use sample_mflix

# show collections
show collections
```

### Query Collections

```bash
# check 5 documents from theater
db.theaters.find().limit(5).pretty()

# query all
db.theaters.find()

# find single
db.theaters.findOne({ theaterId: 1000 })

# using operators
# $or: Find theaters in either ‘Bloomington’ or ‘California’.
db.theaters.find({
  $or: [{ "location.address.city": "Bloomington" }, { "location.address.city": "California" }]
})

# $and: Find theaters in ‘California’ with a specific zipcode.
db.theaters.find({
  $and: [{ "location.address.state": "CA" }, { "location.address.zipcode": "95688" }]
})

# $in: Find theaters in ‘CA’ or ‘AZ’.
db.theaters.find({ "location.address.state": { $in: ["CA", "AZ"] } })
```

### Insert Documents

```bash
# insert single
db.theaters.insertOne({
  theaterId: 1010,
  location: {
    address: {
      street1: '123 Main St',
      city: 'Sample City',
      state: 'SC',
      zipcode: '12345'
    },
    geo: { type: 'Point', coordinates: [-80.12345, 35.67890] }
  }
})

# insert multiple

```bash
db.theaters.insertMany([
  {
    theaterId: 1011,
    location: {
      address: { street1: '456 Broadway', city: 'New York', state: 'NY', zipcode: '10001' },
      geo: { type: 'Point', coordinates: [-73.935242, 40.73061] }
    }
  },
  {
    theaterId: 1012,
    location: {
      address: { street1: '789 Sunset Blvd', city: 'Los Angeles', state: 'CA', zipcode: '90028' },
      geo: { type: 'Point', coordinates: [-118.3295, 34.0978] }
    }
  }
])
```

### Sort, Limit, Skip

```bash
# Sort by theaterId in ascending order:
db.theaters.find().sort({ theaterId: 1 })

# Limit the number of results to 3:
db.theaters.find().limit(3)

# Skip the first 2 results:
db.theaters.find().skip(2)
```

### Update documents

```bash
# Update One Document
db.theaters.updateOne(
  { theaterId: 1000 },
  { $set: { "location.address.city": "New Bloomington" } }
)

# Update Multiple Documents:
db.theaters.updateMany(
  { "location.address.state": "CA" },
  { $set: { "location.address.state": "California" } }
)
```

## Delete Documents

```bash
#Delete One Document:
db.theaters.deleteOne({ theaterId: 1000 })

#Delete Multiple Documents:
db.theaters.deleteMany({ "location.address.state": "California" })
```

### Aggregation

Aggregations in MongoDB allow you to perform complex queries, transformations, and calculations on your data.

```bash
#Find theaters in the state of ‘CA’:
db.theaters.aggregate([
  { $match: { "location.address.state": "CA" } }
])

# Count the number of theaters per state:
db.theaters.aggregate([
  { $group: { _id: "$location.address.state", totalTheaters: { $sum: 1 } } }
])

# Project specific fields and create a custom field
db.theaters.aggregate([
  {
    $project: {
      _id: 0,
      theaterId: 1,
      city: "$location.address.city",
      fullAddress: {
        $concat: [
          "$location.address.street1",
          ", ",
          "$location.address.city",
          ", ",
          "$location.address.state",
          " ",
          "$location.address.zipcode"
        ]
      }
    }
  }
])

# Find theaters within a specific location using
db.theaters.aggregate([
  {
    $geoNear: {
      near: { type: "Point", coordinates: [-73.935242, 40.73061] },
      distanceField: "distance",
      maxDistance: 5000,
      spherical: true
    }
  }
])
```
## MongoDB indexes

Indexes in MongoDB are data structures that improve the speed of query operations on a collection by reducing the amount of data that MongoDB has to scan. Without indexes, MongoDB performs a collection scan, checking each document in a collection to see if it matches the query conditions. With indexes, MongoDB can quickly find documents that match the query criteria.

Types of Indexes and Examples:
- Single Field Index: Indexes on a single field improve the performance of queries that filter or sort by that field.

```bash
# Create an index on theaterId in the theaters collection.
db.theaters.createIndex({ theaterId: 1 })
```

- Compound Index: Indexes on multiple fields improve the performance of queries that filter or sort by those fields in combination.

```bash
# Create an index on state and city fields.
db.theaters.createIndex({ "location.address.state": 1, "location.address.city": 1 })
```

- Text Index: Useful for full-text search within string fields.
- Geospatial Index: Used for spatial queries to efficiently find documents near a specific geographical location.
- Unique Index: Ensures that all values in the indexed field are unique.
-	Wildcard Index: Useful when you need to index all fields or a subset of fields with a specific naming pattern.

Viewing Indexes:

```bash
db.theaters.getIndexes()
```

Dropping Indexes:

```bash
db.theaters.dropIndex({ theaterId: 1 })
```

## MongoDB export

We can also extract from Mongodb using `mongoexport`

```bash
mongoexport --uri="mongodb+srv://<username>:<password>@<cluster-address>/<database>" --collection=theaters --out=theaters.json --jsonArray
```

## MongoDB ETL

### Low Code Applications
- [Fivetran](https://fivetran.com/docs/connectors/databases/mongodb)
- [Matillion ETL]()

### Open Source:
- [Airbite](https://docs.airbyte.com/integrations/sources/mongodb-v2)
- [Meltano](https://hub.meltano.com/extractors/tap-mongodb/)


### Python Example

```python
import pymongo
import pyodbc

# MongoDB connection details
mongo_uri = "mongodb://localhost:27017/"
mongo_db = "mydatabase"
mongo_collection = "mycollection"

# SQL Server connection details
server = "localhost"
database = "mydatabase"
username = "myusername"
password = "mypassword"

# Connect to MongoDB
client = pymongo.MongoClient(mongo_uri)
db = client[mongo_db]
collection = db[mongo_collection]

# Connect to SQL Server
conn = pyodbc.connect("DRIVER={ODBC Driver 17 for SQL Server};"
                      f"SERVER={server};DATABASE={database};"
                      f"UID={username};PWD={password}")
cursor = conn.cursor()

# Extract data from MongoDB
data = []
for document in collection.find():
    data.append(document)

# Transform data if necessary
# ...

# Load data into SQL Server
for document in data:
    cursor.execute("INSERT INTO mytable (col1, col2, col3) VALUES (?, ?, ?)",
                   document["field1"], document["field2"], document["field3"])
conn.commit()

# Close connections
cursor.close()
conn.close()
client.close()
```

### Airflow Example

```
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import pymongo
import pyodbc

default_args = {
    'owner': 'myusername',
    'depends_on_past': False,
    'start_date': datetime(2023, 8, 7),
    'email': ['myemail@example.com'],
    'email_on_failure': True,
    'email_on_retry': False,
    'retries': 0
}

dag = DAG('mongo_to_sql', default_args=default_args, schedule_interval=None)

def extract_data():
    # MongoDB connection details
    mongo_uri = "mongodb://localhost:27017/"
    mongo_db = "mydatabase"
    mongo_collection = "mycollection"

    # Connect to MongoDB
    client = pymongo.MongoClient(mongo_uri)
    db = client[mongo_db]
    collection = db[mongo_collection]

    # Extract data from MongoDB
    data = []
    for document in collection.find():
        data.append(document)

    # Close MongoDB connection
    client.close()

    # Return extracted data
    return data

def transform_data(data):
    # Transform data if necessary
    # ...

    # Return transformed data
    return data

def load_data(data):
    # SQL Server connection details
    server = "localhost"
    database = "mydatabase"
    username = "myusername"
    password = "mypassword"

    # Connect to SQL Server
    conn = pyodbc.connect("DRIVER={ODBC Driver 17 for SQL Server};"
                          f"SERVER={server};DATABASE={database};"
                          f"UID={username};PWD={password}")
    cursor = conn.cursor()

    # Load data into SQL Server using SCD type 2
    for document in data:
        cursor.execute("SELECT id, start_date, end_date FROM mytable WHERE id = ?", document["_id"])
        row = cursor.fetchone()
        if row:
            # Update existing row
            id, start_date, end_date = row
            cursor.execute("UPDATE mytable SET end_date = ? WHERE id = ? AND end_date = CAST('9999-12-31' AS Date)",
                           datetime.now(), id)
            cursor.execute("INSERT INTO mytable (id, field1, field2, start_date, end_date) VALUES (?, ?, ?, ?, ?)",
                           id, document["field1"], document["field2"], start_date, datetime.max)
        else:
            # Insert new row
            cursor.execute("INSERT INTO mytable (id, field1, field2, start_date, end_date) VALUES (?, ?, ?, ?, ?)",
                           document["_id"], document["field1"], document["field2"], datetime.now(), datetime.max)
    conn.commit()

    # Close SQL Server connection
    cursor.close()
    conn.close()

# Define tasks
extract_task = PythonOperator(task_id='extract_data', python_callable=extract_data, dag=dag)
transform_task = PythonOperator(task_id='transform_data', python_callable=transform_data, dag=dag)
load_task = PythonOperator(task_id='load_data', python_callable=load_data, dag=dag)

# Define task dependencies
extract_task >> transform_task >> load_task
```
