# Set the base image to Ubuntu
FROM    node:latest

# File Author / Maintainer
MAINTAINER Tobias Abarbanell

# Install nodemon
RUN npm install -g nodemon

# Define working directory
WORKDIR /src
ADD . /src

# Run app using nodemon
CMD ["nodemon", "/src/bin/www"]
