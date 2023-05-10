# Base image
FROM amazoncorretto:11-alpine-jdk

# Working directory
WORKDIR /app

# Download OpenTelemetry Collector
RUN wget -q https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.77.0/otelcol-contrib_0.77.0_linux_amd64.tar.gz && \
    tar xzf otelcol-contrib_0.77.0_linux_amd64.tar.gz && \
    rm otelcol-contrib_0.77.0_linux_amd64.tar.gz && \
    chmod +x otelcol-contrib

# Copy the jar file to the container
COPY ./build/libs/sample-app-0.0.1-SNAPSHOT.jar sample-app.jar

# Copy the jar file to the container
COPY ./otel/otelcol-config.yaml otelcol-config.yaml

# Expose the port number
EXPOSE 8080 8889

# Command to run the application
CMD java -jar sample-app.jar & ./otelcol-contrib --config otelcol-config.yaml
