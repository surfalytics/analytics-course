# MongoDB 101

```bash
cd 02_getting_started_with_databases/06_nosql_databases/mongodb
```

## 1.Run Docker Compose

The docker-compose.yml file contains two services — mongodb and mongo-express — because:

1.	mongodb Service: This is the actual MongoDB database. It runs the MongoDB server, which stores your data and handles database operations such as queries, inserts, updates, etc. It is configured to run on port 27017 (the default MongoDB port), so you can interact with it via the Mongo shell or programmatically.
2.	mongo-express Service: This is a lightweight web-based admin interface for MongoDB, called Mongo Express. It allows you to manage and visualize your MongoDB data in a user-friendly UI. You can interact with your databases, collections, and documents using a web browser without needing to know Mongo shell commands. This service runs on port 8081 and connects to the MongoDB service to display the database contents.
3. mongodb-client service in the docker-compose.yml file is an additional container designed to provide access to the MongoDB shell (mongo client), which is missing in the original MongoDB container.

`command: [“sleep”, “infinity”]:`This command keeps the container running without actually executing anything. It simply puts the container into a sleep state, ensuring the MongoDB client container doesn’t stop after it starts. You can then execute commands (like the mongo shell) interactively by attaching to this container later using docker exec.



Run compose

```bash
docker-compose up -d
```

Verify the MongoDB Logs

```
docker logs mongodb
```

## 2.Connect to MongoDB container

```bash
docker exec -it mongodb-client mongo --host mongodb -u root -p example --authenticationDatabase admin
```



## 3. Add sample data

```bash
use mydb;
```

```bash
db.mycollection.insertMany([
  { name: "Alice", age: 25, city: "New York" },
  { name: "Bob", age: 30, city: "San Francisco" },
  { name: "Charlie", age: 35, city: "Chicago" }
]);
```

```bash
db.mycollection.find();
```

```bash
[
  { "_id": ObjectId("..."), "name": "Alice", "age": 25, "city": "New York" },
  { "_id": ObjectId("..."), "name": "Bob", "age": 30, "city": "San Francisco" },
  { "_id": ObjectId("..."), "name": "Charlie", "age": 35, "city": "Chicago" }
]
```

```bash
db.mycollection.find({ city: "New York" });
```

## 4. Use GUI Client

Download the client [MongoDB Compass](https://www.mongodb.com/try/download/atlascli)
