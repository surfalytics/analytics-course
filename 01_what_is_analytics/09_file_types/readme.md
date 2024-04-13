# File types

## Documentation files

Markdown - popular for documentations in Repositories. All repo must have `README.MD`. This document is an example of Markdown.

## Simple Strcutured files

### CSV

CSV files are plain text files where each value is separated by a comma.

```
ID,Name,Age
1,John Doe,30
2,Jane Smith,25
3,Bob Johnson,28
4,Alice Williams,22
5,Charlie Brown,33
```

### TSV

TSV files are similar to CSV files, but they use a tab character as the delimiter instead of a comma.

```
ID	Name	Age
1	John Doe	30
2	Jane Smith	25
3	Bob Johnson	28
4	Alice Williams	22
5	Charlie Brown	33
```

### TXT

TXT files are plain text without any inherent structure for data separation.

```
ID Name           Age
1  John Doe       30
2  Jane Smith     25
3  Bob Johnson    28
4  Alice Williams 22
5  Charlie Brown  33
```


## Simple Semi Structured files


### JSON

JSON files represent data as a structured format using nested "objects" and "arrays".

```
[
    {
      "ID": 1,
      "Name": "John Doe",
      "Age": 30,
      "Contact": {
        "Email": "john.doe@example.com",
        "Phone": "123-456-7890"
      }
    }
]
```

### XML

XML files represent data as structured documents with custom tags.

```
<People>
  <Person ID="1">
    <Name>John Doe</Name>
    <Age>30</Age>
    <Contact>
      <Email>john.doe@example.com</Email>
      <Phone>123-456-7890</Phone>
    </Contact>
  </Person>
</People>
```

## Analytical Structured Files

### PARQUET

Parquet is a columnar storage file format optimized for use with big data processing frameworks. It supports complex nested data structures and is efficient for both storage and performance, especially for analytics workloads. In Parquet, each column is stored separately, and the file format is optimized to compress well, reducing storage space and IO overhead.

If we were to store our example data in Parquet format, each field (ID, Name, Age, and the nested Contact information) would be stored in separate column chunks. The Contact column would itself be a structured column that could contain sub-columns for Email and Phone.

### AVRO

Avro is a binary serialization format that is compact, fast, and suitable for both serializing data to disk and for communication between services. Avro data is described with a schema, which can be evolved over time in a backward-compatible manner. This schema describes the fields in the data, their types, and how they are encoded.

For our dataset, the Avro schema would define fields for ID, Name, Age, and a nested record for Contact, which would itself define fields for Email and Phone. When serialized, each record would be stored in a compact binary form, with the schema optionally stored alongside the data or managed separately for schema evolution purposes.

### ORC

ORC is a type of columnar storage format that is highly optimized for heavy read access. It is designed to offer efficient compression and encoding schemes to improve performance when querying large datasets, making it ideal for data warehousing scenarios.

Similar to Parquet, if our example data were stored in an ORC file, it would be organized by column rather than by row. The file would contain a column for ID, another for Name, another for Age, and a complex column for Contact information. The Contact column would be further divided into columns for Email and Phone. ORC files also include lightweight indexes as part of the file format, which can significantly speed up data retrieval operations.

### Compare Analytics file formats

Table summarizing the characteristics of Parquet, Avro, and ORC file formats. This comparison includes aspects like read performance, write performance, query performance, compression, and notable features that make each format suitable for various data processing needs.

| Feature                | Parquet                            | Avro                               | ORC                                  |
|------------------------|------------------------------------|------------------------------------|--------------------------------------|
| **Read Performance**   | Excellent, due to columnar storage | Good, especially for large datasets | Excellent, optimized for read efficiency with lightweight indexes |
| **Write Performance**  | Good, optimized for batch writes   | Excellent, with a compact, fast serialization format | Good, with efficient strategies for writing data in batches    |
| **Query Performance**  | Excellent, supports efficient data retrieval and analytics | Good, schema allows for fast deserialization | Excellent, includes indexing, bloom filters, and predicate pushdown |
| **Compression**        | Excellent, supports Snappy, GZIP, LZO, etc. Column-wise compression reduces storage significantly | Good, supports Snappy, Deflate, etc. Compact binary format minimizes space | Excellent, uses Zlib, Snappy, etc. Offers stripe-level compression |
| **Schema Evolution**   | Supports schema evolution with backward compatibility | Excellent support, allows for backward and forward compatibility | Supports schema evolution, but with some limitations compared to Avro |
| **Complexity & Types** | Supports complex nested data structures and a wide range of data types | Supports complex data types and allows for specifying schemas | Supports complex data structures, including deeply nested types |
| **Ecosystem Integration** | Widely supported in big data processing frameworks (e.g., Apache Spark, Hadoop) | Widely used in data serialization/deserialization for Hadoop and Kafka | Optimized for use in the Hive query engine and well supported in Hadoop ecosystem |
| **Use Cases**          | Ideal for analytics and data warehousing scenarios with heavy read operations | Suitable for event serialization and inter-process communication | Optimized for improving performance of heavy read workloads, especially in Hive queries |

## Lakehouse Analytical Structured Files

Lakehouse architectures integrate the flexibility and scalability of data lakes with the management features and data integrity of traditional data warehouses. This approach allows organizations to manage, govern, and analyze large amounts of diverse data effectively. Delta Lake, Apache Hudi, and Apache Iceberg are prominent technologies enabling the lakehouse paradigm by providing mechanisms for transactional data management on top of data lakes. Here’s a summary of each:

### Delta Lake

Delta Lake is an open-source storage layer that brings ACID transactions to Apache Spark and big data workloads. It provides scalable metadata handling and allows for schema enforcement and evolution, ensuring data integrity and consistency. Delta Lake supports time travel (querying data snapshots from the past), upserts, and deletes. This makes it ideal for building complex ETL pipelines and for scenarios where data needs to be audited or rolled back.

### Apache Hudi

Apache Hudi (Hadoop Upserts Deletes and Incrementals) is an open-source data management framework used to simplify incremental data processing and data pipeline development. By efficiently managing storage and indexing of large datasets, Hudi enables record-level insert, update, and delete operations on distributed data stores. It supports snapshot and read-optimized querying, making it suitable for use cases that require frequent updates to stored data.

### Apache Iceberg

Apache Iceberg is an open-source table format designed for large, slow-moving tabular data. Iceberg provides a foundation for managing petabyte-scale datasets with features like schema evolution, hidden partitioning for performance, and ACID transactions. It's well-suited for batch and streaming workloads, offering straightforward integration with popular query engines like Spark, Trino, and Flink. Iceberg focuses on reliability, scalability, and performance, particularly in environments requiring complex data processing and analysis.

### Compare Lakehouse file formats

| Feature                | Delta Lake                         | Apache Hudi                        | Apache Iceberg                      |
|------------------------|------------------------------------|------------------------------------|-------------------------------------|
| **Transaction Support**| ACID transactions for data integrity and consistency | ACID transactions for record-level changes | ACID transactions for large-scale datasets |
| **Schema Management**  | Supports schema enforcement and evolution | Manages complex schema evolution and validation | Flexible schema evolution without downtime |
| **Query Performance**  | Optimized for both read and write operations with data versioning | Provides snapshot and read-optimized queries | Efficient query planning with hidden partitioning |
| **Data Mutations**     | Supports upserts, deletes, and merges | Designed for upserts, deletes, and incremental processing | Supports atomic operations but focuses more on immutability |
| **Scalability**        | Highly scalable, designed for big data workloads | Efficient at managing large datasets with indexing and compaction | Optimized for very large datasets with scalability in mind |
| **Integration**        | Deep integration with Apache Spark | Broad compatibility with Hadoop ecosystem | Supports multiple query engines (Spark, Trino, Flink) |
| **Use Cases**          | Ideal for complex ETL pipelines and scenarios requiring data versioning | Suited for real-time data ingestion and updates | Best for large-scale data warehousing and analytical queries |


## Logs files

### Access Logs

Access logs record all requests made to a web server. These logs contain information about each request, such as the client's IP address, request date and time, request line (method, URI, protocol), status code returned by the server, and bytes transferred.

```
192.168.1.1 - - [06/Apr/2024:14:00:00 -0400] "GET /index.html HTTP/1.1" 200 612 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
```

### Product Logs (custom logs)

Product logs are custom logs generated by applications to track specific events, transactions, or activities within the application. These logs can be structured in any format that the developers find useful and might include information such as event name, timestamp, user ID, and event-specific

```
{"timestamp":"2024-04-06T14:00:00Z","level":"INFO","event":"ProductView","userID":"123456","productID":"XYZ789","sessionID":"ABCDEF123456789"}
```

### STDOUT

STDOUT logs capture output from applications and scripts that is intended for the terminal or another standard output destination. This can include results from script executions, print statements from a program, or any other output intentionally directed to STDOUT.

```
Starting application version 1.2.3...
Application configuration loaded successfully.
User login successful. UserID: 123456
```

### STDERR

STDERR logs capture error messages and diagnostics output by applications and scripts. Unlike STDOUT, STDERR is used specifically for error messages and warnings, making it easier to separate normal operational messages from errors.

```
WARNING: An unexpected error occurred while processing request.
ERROR: Database connection failed. Unable to connect to database at 192.168.1.100:3306.
CRITICAL: Application terminated unexpectedly due to unhandled exception.
```

### DHCP log
```
Apr  6 20:14:02 dns-106 dhcpd[3077772]: DHCPINFORM from 172.17.162.55 via ens19
Apr  6 20:14:02 dns-106 dhcpd[3077772]: DHCPACK to 172.17.162.55 (00:17:42:b6:b4:b7) via ens19
Apr  6 20:14:02 dns-107 dhcpd[4061794]: DHCPINFORM from 172.17.162.55 via ens19
Apr  6 20:14:02 dns-107 dhcpd[4061794]: DHCPACK to 172.17.162.55 (00:17:42:b6:b4:b7) via ens19
Apr  6 20:14:02 dns-106 dhcpd[3077772]: DHCPDISCOVER from 98:da:c4:6a:4a:5d via 172.17.76.1: network abc: no free leases
Apr  6 20:14:02 dns-107 dhcpd[4061794]: DHCPDISCOVER from 98:da:c4:6a:4a:5d via 172.17.76.1: network abc: no free leases
```

## Configuration files

### YAML

YAML, which stands for YAML Ain't Markup Language, is a human-readable data serialization standard that can be used for all programming languages. It is commonly used for configuration files and data exchange between languages with different data structures. YAML is designed to be easy to read and write, prioritizing human readability. It uses indentation to represent the structure of the data, similar to how spaces and tabs are used in programming languages like Python.

YAML supports scalar types (like strings, integers, and floats), arrays (also known as sequences), and associative arrays (known as mappings or dictionaries in other languages). Comments can be included using the `#` symbol. One of the key features of YAML is its ability to represent complex data structures with both sequences (lists) and mappings (key-value pairs), including nested structures.

YAML is popular for configurations of data infrustructure or dbt models.

#### Scalars
```yaml
# A string
name: John Doe

# An integer
age: 30

# A float
height: 5.75
```

#### Arrays (Sequences)
Arrays in YAML are defined with a hyphen and a space (`- `) followed by an item value. Items in an array are usually placed on separate lines for readability.

```yaml
# An array of integers
numbers:
  - 1
  - 2
  - 3
  - 4
  - 5

# An array of strings
fruits:
  - Apple
  - Banana
  - Cherry
```

#### Associative Arrays (Mappings)
Mappings are key-value pairs separated by a colon and a space. Keys are unique within a mapping structure.

```yaml
# A simple mapping of key-value pairs
person:
  name: John Doe
  age: 30
  city: New York
```

#### Nested Structures
YAML supports nested sequences and mappings for representing more complex data structures.

```yaml
# A nested structure
employees:
  - name: John Doe
    age: 30
    roles:
      - Developer
      - Analyst
  - name: Jane Smith
    age: 28
    roles:
      - Manager
      - Designer
```

### dot files

Dot files, often seen with a prefix of a period (.) such as `.env` or `.gitignore`, are hidden files in Unix-based systems that typically contain configuration settings, environment variables, or information that controls the behavior of software applications. These files are called "dot files" because they start with a dot, which traditionally hides them from normal directory listings in Unix-like operating systems. Dot files are widely used for configuring software tools, managing application settings, and storing sensitive information in a structured yet simple format.

#### Common Dot Files

- **.env**: Stores environment variables key-value pairs, which are used to configure application runtime environments. It's widely used in development projects to separate configuration and secret data from the application code.

- **.gitignore**: Used by Git version control system to list files or file patterns to ignore in the project's repository. It helps in avoiding the tracking of temporary or non-essential files in Git.

- **.bashrc**, **.zshrc**: Configuration files for Bash and Zsh shells, respectively. They contain shell commands that are executed whenever a new terminal session starts, allowing users to customize their shell environment.

- **.htaccess**: Configuration file for use on web servers running the Apache Web Server software. It allows for decentralized management of web server configuration like URL redirection, access control, and so on.

#### Example: .env File

A `.env` file is a simple text file containing environment variables in `KEY=value` format. These variables can be loaded into the application at runtime, allowing for easy configuration changes without modifying the application code.

```plaintext
# Sample .env file
DB_HOST=localhost
DB_USER=root
DB_PASS=s1mpl3
```

#### Use Cases for Dot Files

- **Configuration Management**: Dot files are used to store configuration settings that customize the behavior of applications or development environments. For example, `.vimrc` for Vim editor settings, `.bash_profile` for Bash shell customization.

- **Secrets Management**: Sensitive information like API keys, database credentials, or secret tokens can be stored in `.env` files, keeping them separate from source code in application development.

- **Development Tools Setup**: Many development tools rely on dot files for setup and configuration. For example, `.eslintrc` for ESLint rules, `.prettierrc` for Prettier code formatting options.

- **Version Control Systems**: Dot files like `.gitignore` play a crucial role in version control systems by excluding files and directories from being tracked by Git, ensuring that only relevant changes are committed.

### pipenv and Pipfile

`Pipenv` is a Python dependency management tool that aims to bring the best of all packaging worlds to the Python world. It automatically creates and manages a virtual environment for your projects, as well as adds/removes packages from your `Pipfile` as you install/uninstall packages. It also generates the `Pipfile.lock`, which is used to produce deterministic builds and create a snapshot of your working environment for other developers to replicate.


The `Pipfile` is used by Pipenv to track which dependencies your project needs in case you need to recreate the environment (e.g., on another machine). It replaces the older `requirements.txt` file used by `pip` and provides a more structured approach to dependency management. The `Pipfile` is intended to be human-readable and often includes version numbers for each package to manage dependencies more explicitly.

A `Pipfile` contains two main sections:

- `[packages]`: Lists the packages required for your project to run. You can specify versions using `*`, `>`, `>=`, `<`, `<=`, or exact versions.
- `[dev-packages]`: Lists the packages required only for development (testing, documentation generation, etc.), not for running the project itself.

#### Pipfile.lock

The `Pipfile.lock` is generated automatically by Pipenv. It contains not just the exact version of each dependency (to ensure deterministic builds) but also the dependencies of those dependencies (and so on), all pinned to specific versions. This file should be committed to version control to ensure that everyone working on the project has the same environment.

#### Example Pipfile

```
[source]
url = "https://pypi.org/simple"
verify_ssl = true
name = "pypi"

[packages]
requests = "*"
django = ">=2.1,<3.0"

[dev-packages]
pytest = "*"
```

This `Pipfile` example includes two main dependencies (`requests` and `django`) and one development dependency (`pytest`). The `requests` package is allowed to update to any versions in the future (denoted by `*`), while `django` is restricted to versions greater or equal to 2.1 but less than 3.0.

#### Use Case

Pipenv is particularly useful for developers who work on multiple Python projects and need to manage dependencies and Python versions separately for each. It simplifies the process of setting up a new project, managing packages, and ensuring that the development environment is the same for all contributors to the project.

### requirements.txt

The `requirements.txt` file is a fundamental component in Python projects, used to manage package dependencies. It lists the names of Python packages that are required to run the project, often specifying exact versions to ensure consistency and compatibility across different environments. This approach aids in creating reproducible environments, which is crucial for avoiding the "it works on my machine" problem.

#### Format and Content

The `requirements.txt` file is simple and plain text. Each line in the file specifies a package and optionally the version requirement. Here are a few examples of how dependencies can be specified:

- `requests` – This will install the latest version of the `requests` package.
- `requests==2.25.1` – This specifies the exact version (2.25.1) of the `requests` package.
- `requests>=2.20.0` – This indicates that the project requires at least version 2.20.0 of the `requests` package.
- `requests[security]` – This installs the `requests` package with the `security` extras.

#### Generating requirements.txt

A common way to generate a `requirements.txt` file for an existing project is to use `pip freeze`, which outputs a list of all installed packages in the current environment along with their versions. You can redirect this output to `requirements.txt` using the following command:

```bash
pip freeze > requirements.txt
```

#### Using requirements.txt

To install the dependencies listed in a `requirements.txt` file, you would use the `pip install` command followed by the `-r` option and the path to the file:

```bash
pip install -r requirements.txt
```

#### Use Case

The `requirements.txt` file is especially useful for developers when sharing projects or collaborating with others. It ensures that anyone who sets up the project in a new environment will install the same versions of the dependencies, making the development, testing, and deployment processes more predictable and consistent.

While `requirements.txt` is effective for managing dependencies, it does not inherently manage environments. For more comprehensive management of packages and virtual environments, tools like `pipenv` or `Poetry` can be used, which provide additional features such as dependency resolution, environment separation, and package version locking.

### Poetry and toml

Poetry is a modern tool for Python package and dependency management. It aims to simplify the packaging, managing, and publishing of Python projects. Unlike older tools such as `pip` and `virtualenv`, which are used separately for managing dependencies and virtual environments, Poetry provides an all-in-one solution for these tasks, streamlining the development workflow. Some of the key features of Poetry include:

- **Dependency Management**: Poetry uses the `pyproject.toml` file to declare project dependencies and manage them in a more intuitive way. It solves dependency versions for you and ensures that you don’t get into "dependency hell".
- **Package Management**: Poetry can easily package and build your project for distribution, ensuring that your packages are properly versioned and that their dependencies are correctly defined.
- **Virtual Environment Management**: When you work on a project, Poetry automatically creates and manages a virtual environment, isolating project dependencies from the rest of your system.
- **Dependency Resolution**: Poetry comes with an advanced dependency resolver that ensures consistency and conflict resolution, providing a reproducible environment.
- **Publishing**: With built-in support for package publishing, Poetry can publish your project to PyPI with a simple command, making it easy to share your package with the world.

TOML, which stands for Tom's Obvious, Minimal Language, is a data serialization language intended for configuration files. TOML is designed to be easy to read and write due to its clear semantics. It is used by several modern development tools, including Rust's package manager, Cargo, and Python's packaging and dependency management tool, Poetry.

A `TOML` file expresses configurations through key-value pairs, arrays, tables, and inline tables. It aims to be more human-readable and writable than JSON and avoids the verbosity of YAML while aiming for consistency and simplicity.

Here's a basic example of a `TOML` file, which might be used as a configuration file:

```toml
# This is a TOML document.

title = "TOML Example"

[database]
server = "192.168.1.1"
ports = [ 8001, 8001, 8002 ]
connection_max = 5000
enabled = true

[owner]
name = "Tom Preston-Werner"
dob = 1979-05-27T07:32:00Z # First-class dates
```

In the context of Poetry, the `pyproject.toml` file is used to configure the project and its dependencies. Here's a simplified example of what a `pyproject.toml` file might look like for a Python project using Poetry:

```toml
[tool.poetry]
name = "my-awesome-project"
version = "0.1.0"
description = "A brief description of the project"
authors = ["Your Name <you@example.com>"]

[tool.poetry.dependencies]
python = "^3.8"
requests = "^2.25"

[tool.poetry.dev-dependencies]
pytest = "^6.2"
```

In this example, the `pyproject.toml` file declares the project details, its dependencies (`requests`), and development dependencies (`pytest`), using Poetry's specification.

### .pre-commit file

`pre-commit` is a framework for managing and maintaining multi-language pre-commit hooks. Pre-commit hooks are scripts that run automatically before each commit is finalized in a version control system, such as Git. These hooks can be used to perform various checks on the code being committed, such as formatting validation, linting, and running tests. The goal is to catch and fix common issues early in the development process, ensuring that only high-quality code gets committed to the repository.

The `pre-commit` framework allows you to configure these hooks using a simple configuration file `.pre-commit-config.yaml`. It supports a wide range of programming languages and integrates with existing tools in the development ecosystem. By using `pre-commit`, teams can enforce coding standards and reduce errors, improving the overall quality of the codebase.

### Pre-commit Configuration Example

To use `pre-commit`, you need to define your hooks in a `.pre-commit-config.yaml` file in the root of your repository. Here's an example configuration:

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v3.4.0 # Use the git tag for the version you need
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files

  - repo: https://github.com/psf/black
    rev: 21.5b2 # The version of Black you want to use
    hooks:
      - id: black
        language_version: python3

  - repo: https://github.com/prettier/prettier
    rev: "2.3.0" # The version of Prettier you want to use
    hooks:
      - id: prettier
        exclude: '^docs/'
```

This configuration does the following:

1. **General Hooks from `pre-commit-hooks` repo**: Uses common hooks available in the `pre-commit` community repository, such as removing trailing whitespace, ensuring a newline at the end of files, checking YAML files for syntax errors, and preventing large files from being committed.

2. **Python Formatting with Black**: Integrates `Black`, a Python code formatter, to automatically format Python files upon commit.

3. **Code Formatting with Prettier**: Uses `Prettier`, a popular code formatter, to format files according to its rules. This example excludes files in the `docs` directory.

### Using Pre-commit

After defining your `.pre-commit-config.yaml`, you can set up `pre-commit` in your project by running:

```bash
pre-commit install
```

This command installs the pre-commit hook into your Git hooks directory, enabling it to run automatically before each commit.

To manually run all pre-commit hooks on all files in the repository, use:

```bash
pre-commit run --all-files
```

To update the hooks to their latest versions specified in `.pre-commit-config.yaml`, you can use:

```bash
pre-commit autoupdate
```

`pre-commit` is a powerful tool for automating the enforcement of code quality and formatting standards, making it easier to maintain a clean and consistent codebase across development teams.

### DOCKER

### Dockerfile Overview

A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Using `docker build` users can create an automated build that executes several command-line instructions in succession. This Dockerfile belongs to Docker's automated build process technology.

Key aspects of a Dockerfile include:

- **Base Image Specification**: Every Dockerfile starts with specifying a base image using the `FROM` instruction. This image forms the base environment for your container.
- **Running Commands**: The `RUN` instruction allows you to install software, modify files, and perform other configuration tasks within the container environment.
- **Copying Files**: The `COPY` and `ADD` instructions are used to copy files from the host machine into the container file system.
- **Port Exposure**: The `EXPOSE` instruction indicates the ports on which a container listens for connections.
- **Execution Command**: The `CMD` instruction provides defaults for an executing container. These defaults can include an executable or can omit the executable, in which case you must specify an `ENTRYPOINT` command as well.

### Example Dockerfile

A Dockerfile is a text document that contains a series of instructions and commands used for creating a Docker image. These instructions can include actions like setting the base image to use, copying files from the host machine into the image, running commands to install software or configure settings, and specifying what command to run when a container starts from the image. Dockerfiles automate the process of Docker image creation, making it reproducible and efficient.

The Docker image created from a Dockerfile acts as a blueprint for Docker containers. It encapsulates the application, its dependencies, environment variables, and configuration files into a portable container that can run consistently across different environments, from a developer's laptop to a production server.

Key elements of a Dockerfile include:

- **FROM**: Specifies the base image from which you are building.
- **RUN**: Executes commands in a new layer on top of the current image and commits the results.
- **COPY** and **ADD**: Copy files from the host machine into the Docker image.
- **CMD**: Provides the default command to run when a container starts from the image.
- **ENTRYPOINT**: Configures a container that will run as an executable.
- **EXPOSE**: Informs Docker that the container listens on specific network ports at runtime.
- **ENV**: Sets environment variables.
- **WORKDIR**: Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow it.


```Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
```

Dockerfile is popular among data use cases to host data infrustructure elements or open source such as Airflow, dbt, metabase and so on.



Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services, networks, and volumes. Then, with a single command, you create and start all the services from your configuration. This simplifies the process of managing application stacks by allowing you to declare configurations in a file rather than passing many arguments to `docker run` commands.

Compose works in all environments: production, staging, development, testing, as well as CI workflows. Although Compose is primarily aimed at development and testing environments, its simplicity and convenience make it a viable option for smaller production deployments as well.

#### Key Features

- **Service Configuration**: Define your application services, networks, and volumes in a single file.
- **Environment Standardization**: Ensure consistency across different environments and team members by defining your Docker environment in code.
- **Simplified Networking**: Automatically sets up a single network for your application’s containers to communicate with each other.
- **Volumes and Persistent Data**: Manage data persistence and storage using volumes.

#### Docker Compose Example

Suppose you have a simple web application consisting of a web server and a database. You can define this setup in a file named `docker-compose.yml`:

```yaml
version: '3'
services:
  web:
    image: "nginx:alpine"
    ports:
      - "80:80"
    volumes:
      - ./html:/usr/share/nginx/html
  db:
    image: "postgres:alpine"
    environment:
      POSTGRES_DB: exampledb
      POSTGRES_USER: exampleuser
      POSTGRES_PASSWORD: examplepass
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```

#### Using Docker Compose

To start your application, run:

```bash
docker-compose up
```

This command reads your `docker-compose.yml` file, starts the services you've defined, and creates the volumes and networks as necessary. To stop and remove the containers, networks, and volumes defined by the compose file, use:

```bash
docker-compose down
```

## Make File


A `Makefile` is a special format file that is used with the make utility to automate the building and managing of projects. It is particularly common in software development, where it can significantly streamline the compilation process for programs written in languages like C and C++. However, it's also useful in other scenarios where tasks need to be automated in a dependable and efficient manner.

### Components of a Makefile

- Targets: These specify the desired outputs or results (e.g., executable files).
- Prerequisites: These are the files that the targets depend on (e.g., source files).
- Recipes: These are the commands that make will execute to build the targets from the prerequisites.

### How it works:
When make is run, it looks for a file named Makefile in the current directory.
It reads the Makefile to determine which pieces of a large program need to be recompiled, and issues the commands to recompile them.

### Example

```bash
# Define the name of your Docker image
IMAGE_NAME=myapp

# Define the tag for your Docker image
IMAGE_TAG=latest

# 'build' target to build the Docker image
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

# 'run' target to run the Docker container
run:
	docker run -d --name $(IMAGE_NAME) $(IMAGE_NAME):$(IMAGE_TAG)

# 'stop' target to stop and remove the Docker container
stop:
	docker stop $(IMAGE_NAME)
	docker rm $(IMAGE_NAME)

# 'push' target to push the Docker image to a registry
push:
	docker push $(IMAGE_NAME):$(IMAGE_TAG)

# 'clean' target to remove the Docker image
clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)
```

## Popular data programms

### Python File Example

Let's create a simple Python script (`example.py`) that calculates the factorial of a number using recursion and prints the result.

```python
# example.py
def factorial(n):
    """Return the factorial of a number n."""
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

number = 5
print(f"The factorial of {number} is {factorial(number)}")
```

This script defines a function `factorial` that computes the factorial of a given number and then prints the factorial of `5`.

### Shell Script Example

Next, a Shell script (`example.sh`) that checks if a file exists in the current directory and prints a message based on the result.

```bash
#!/bin/bash
# example.sh

FILENAME="example.txt"

if [ -f "$FILENAME" ]; then
    echo "$FILENAME exists."
else
    echo "$FILENAME does not exist."
fi
```

Make sure to give execution permissions to this script using the command `chmod +x example.sh` before running it with `./example.sh`.

### SQL File Example

Finally, an SQL file (`example.sql`) that creates a table called `users`, inserts a few rows, and selects all rows from the table.

```sql
-- example.sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO users (id, name, email) VALUES (1, 'John Doe', 'john.doe@example.com');
INSERT INTO users (id, name, email) VALUES (2, 'Jane Doe', 'jane.doe@example.com');

SELECT * FROM users;
```

This SQL script can be run against a compatible database system (like PostgreSQL, MySQL, SQLite, etc.) to create a `users` table, insert data into it, and then retrieve and display all the data from the table.
