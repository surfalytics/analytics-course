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
