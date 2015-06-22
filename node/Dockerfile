# Set the base image to Ubuntu
FROM    node:latest

# File Author / Maintainer
MAINTAINER Tobias Abarbanell

# Install nodemon
RUN npm install -g nodemon

# Define working directory
VOLUME /src
WORKDIR /src


# Run app using "npm start" - which may use nodemon
ENTRYPOINT ["npm"]
CMD ["start"]
