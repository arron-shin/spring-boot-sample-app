# Base image
FROM amazoncorretto:17-alpine-jdk

# Working directory
WORKDIR /app

# Copy the jar file to the container
COPY ./build/libs/sample-app-0.0.1-SNAPSHOT.jar sample-app.jar

# Expose the port number
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "sample-app.jar"]
