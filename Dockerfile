# Use Maven with OpenJDK for building the project
FROM maven:3.8.4-openjdk-11-slim as build

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project into the container
COPY . /app

# Run Maven to build the project (downloads dependencies, compiles, and runs tests)
RUN mvn clean install

# Run the tests (after the Maven build completes)
CMD ["mvn", "test"]
