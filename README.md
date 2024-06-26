# Livytodo is more than just a to-do list

Livytodo is a project launched to add a different dimension to to-do list applications. Livytodo focuses on creating professional lists rather than personalized lists. You can plan your daily activities and update their realization status. You can record repetitive activities and special days and follow them effortlessly. You can view the activities of your entire team, including yourself, on calendars and charts.

Livytodo is a server-client architecture application that works independently of the operating system. Although it has a database dependency, the distributable version comes with an SQLite database.

Our application, which has its own application framework, reaches the end user via HTML interface on the client side. Our application, whose business layer coding was developed with Python, simplifies the design of database applications with its additional functionalities.

We are starting to develop our most different and professional todo list application ever, wouldn't you like to be involved in the process?

You will be able to access our constantly updated application packages by following our page, we are already waiting for your contributions.

# Installation 

Since Livytodo runs on a server and client infrastructure, configuring it requires differentiation and technical knowledge in the context of the operating system. Since we do not want to burden you with this technical information, we thought it would be appropriate to offer livytodo in a container on Docker.

For those who don't know, Docker is an application that creates a virtual working environment in your operating system, allows the application to run in this environment, and does not impose any additional burden on your operating system for the application to run.

While you can start using the images published on Docker Hub directly, you can easily create your docker image suitable for your system's architecture with our dockerfile files used in docker image production on github.

We assume that docker is installed on your system, if not, you should download the application from the link [download-docker](https://www.docker.com/products/docker-desktop/) and install it on your system.

Steps

- Get Github livybuild folder
- Open your operating system's terminal (ms-dos for windows, terminal or iterm for linux and mac)
- We will create 2 images, one is livyserver and the other is livyclient.
- create the Livyserver image, please run the following commands in terminal one by one
  * docker build . -t livytodo:livyserver -f docker-livytodo-livyserver.Dockerfile
  * docker run -p 25000:25000 --name livytodo.server -td livytodo:livyserver
- Now we create our Livyclient image, the commands we will run are
  * docker build . -t livytodo:livyclient -f docker-livytodo-livyclient.Dockerfile
  * docker run -p 80:80 --name livytodo.client -td livytodo:livyclient

We have completed the installation, now all you have to do is open your browser and type localhost in the address bar.

# Update

Client and server applications have self-updating features. In order for the client application (web server) to be updated, it is sufficient to stop and restart the docker container. The server application has the ability to be updated fully automatically. If the service in the Docker container detects that a new version of the application has been released, it will shut down, receive the update, and then restart.

# Usage

## Tested
- `Macos with ARM processor`
- Please report about the system you are running
- Information mail is livytodo[at]livyazilim.com 

## Starting the Application

It will be enough to open the web browser you are using and type localhost in the address bar.



