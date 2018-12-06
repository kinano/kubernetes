### This repo has the code used for section 8 in the following Udemy course
https://www.udemy.com/docker-and-kubernetes-the-complete-guide

### Steps

1- Design/build your Docker containers for DEV

2- Write the docker-compose.yml file to manage building the Docker containers/services
   This manages spinning up the Docker containers on DEV environments

3- Write a .travis.yml file to define automated tests and prd deployment options

4- Write a Dockerrun.aws.json file to define your services on EB.
The Dockerrun.aws.json file is used to configure running multiple containers on EB
The difference between the docker-composer.yml file and the Dockerrun.aws.json file is that docker-compose tells you *how* to build each image while the other file contains *what* images to build.
EB delegates running multiple containers to ECS since EB can only run one container at a time. You need to define the containers in Dockerrun.aws.json using task definitions.
The containerDefinitions dictionary containsa 

* *hostname* key. hostname can be used to wire up networking for a multi-container setup.
* *essential* marks one container as an essential piece of infrastructure for an the entire container cluster. If an essential container goes down, all other containers will go down as well.
    One service has to be marked as essential.
*  portMappings map ECS host ports to container ports.
* links allow us to connect one container to another in ECS
* memory (MB). This is a required setting

5- Create an environment on EB

6- We use managed services for databases,.. etc instead of spinning up our own containers.

7- We need to create a security group to allow EB to connect to our managed data services.

8- We need to setup EB environment variables. They get propagated for all our containers.
