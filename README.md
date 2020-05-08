# Ruby on Rails Project with Docker

## Requirements

- [Docker v19+](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [docker-compose v1.23+](https://docs.docker.com/compose/install/)
- [docker-compose via pip](https://pypi.org/project/docker-compose/)
- make

## Set up development environment

Open your terminal and in the root path, we are going to build the images

    shell
        make build
    
We check the images
    
    shell
        docker image ls    
    
        ruby-alpine       develop      4e1ee3e66194       312MB
        ruby-alpine       latest       98a627db2cab       312MB


Then we need to install the gems, therefore we need to go into the container

Now we can start a shell in the backend container by doing `make backend`:
    
    shell
        make backend
        docker-compose run --rm --service-ports --use-aliases backend --shell
        Starting docker-ops-ruby-rails_database_1 ... done
        ===> Environment: development
        ===> Current dir: /app
        ===> Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux-musl]
        ===> Node version: v12.15.0
        ===> Yarn version: 1.19.2
        ===> Running: gosu app bash
        app@app:/app$ 
        
> The first time you run, install all the requirements and create an .initialized file.

Then we need to install the gems in order to use them. Inside the container, just type `make`

    shell
        make
        
> NOTE: The first time running the make, will take several minutes depending on your
> internet connection.

When everything went okay, we can run the server. Inside the container just type `make run_server`

    shell
        make run_server
        
Go to http://0.0.0.0:8000/