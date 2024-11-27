# Use Maven with OpenJDK for building the project
FROM maven:3.8.4-openjdk-11-slim as build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files into the container
COPY . /app

# Build the project (which will download Selenium dependencies)
RUN mvn clean install

# Run the tests (after the Maven build completes)
CMD ["mvn", "test"]
