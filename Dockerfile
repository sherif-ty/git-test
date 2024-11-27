# Use OpenJDK with Alpine as the base image
FROM openjdk:11

# Set working directory
WORKDIR /app

# Download Selenium Java JARs
RUN wget https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-java/4.13.0/selenium-java-4.13.0.jar
RUN  wget https://repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-api/4.13.0/selenium-api-4.13.0.jar

# Copy test file
COPY TestSelenium.java .

# Compile Java test file
RUN javac -cp ".:selenium-java-4.13.0.jar:selenium-api-4.13.0.jar" TestSelenium.java

# Command to run the test
CMD ["java", "-cp", ".:selenium-java-4.13.0.jar:selenium-api-4.13.0.jar", "TestSelenium"]
