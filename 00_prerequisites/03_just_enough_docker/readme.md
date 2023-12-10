# Just Enough Docker

##

Creating a simple Python program that hosts a web server on `http://localhost:80` and managing it with a virtual environment involves several steps. Here's a guide to help you set it up:

1. **Create a Virtual Environment:**
   - First, create a new directory for your project.
   - Open a terminal and navigate to this directory.
   - Run `python3 -m venv venv` to create a new virtual environment named `venv`.
   - Activate the virtual environment:
     - On Windows, use `venv\Scripts\activate`.
     - On Unix or MacOS, use `source venv/bin/activate`.

2. **Install Dependencies:**
   - You'll need a web framework. A common choice is Flask.
   - Install Flask by running `pip install flask`.
   - After installing Flask, freeze the installed packages into `requirements.txt` by running `pip freeze > requirements.txt`.

3. **Create the `app.py` File:**
   - In your project directory, create a file named `app.py`.
   - Add the following code to `app.py`:
     ```python
     from flask import Flask
     app = Flask(__name__)

     @app.route('/')
     def hello_world():
         return 'Hello, World!'

     if __name__ == '__main__':
         app.run(host='0.0.0.0', port=80)
     ```
   - This code creates a basic Flask app that responds with "Hello, World!" when accessed.

4. **Run the Application:**
   - In your terminal, ensure you are in the project directory and your virtual environment is activated.
   - Run the app by executing `python app.py`.
   - Your application should now be running on `http://localhost:80`.
   - Open a web browser and navigate to `http://localhost:80` to see the message.

5. **Deactivating the Virtual Environment:**
   - When you’re done, you can deactivate the virtual environment by running `deactivate` in your terminal.

Docker

docker run -p 80:80 --name web-app-container web-app

docker ps

docker rm web-app-container

docker run -p 80:80 --rm --name web-app-container web-app

docker run -p 80:80 --rm -d --name web-app-container web-app

docker ps

docker exec -it 82a63468910a bash

Docker Compose

docker-compose build

docker-compose build --no-cache

docker-compose up
