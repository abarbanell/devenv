# Set the base image to Ubuntu
FROM    dockerfile/nodejs

# File Author / Maintainer
MAINTAINER Tobias Abarbanell

# Install nodemon
RUN npm install -g nodemon

# Define working directory
WORKDIR /src
ADD . /src

# Expose port
EXPOSE  3000:3000

# Run app using nodemon
CMD ["nodemon", "/src/bin/www"]
