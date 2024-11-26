# Use an OpenJDK image
FROM openjdk:11-slim

# Set working directory
WORKDIR /app

# Copy test file
COPY TestSelenium.java .

# Compile the Java file
RUN javac TestSelenium.java

# Command to run the test
CMD ["java", "TestSelenium"]

