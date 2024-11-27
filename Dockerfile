# Use a Java-based image
FROM maven:3.8.4-openjdk-11-slim

# Set working directory to /app
WORKDIR /app

# Copy the pom.xml to the container
COPY pom.xml /app/pom.xml

# Copy the test directory containing the test files
COPY test /app/test

# Run mvn clean install to install dependencies
RUN mvn clean install

# Run tests
CMD ["mvn", "test"]
