# Use the official Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Update and install the prerequisites
RUN apt-get update && apt-get install -y \
    libglib2.0-dev \
    curl \
    && apt-get clean

# Set the working directory inside the container
WORKDIR /app

# Copy the executable from your local directory to the container
COPY ./chip-ota-provider-app /app/
COPY ./run_ota_provider.sh /app/
COPY ./onb_codes.csv /app/
COPY ./ota_provider.py /app/

# Make sure the executable has the correct permissions
RUN chmod +x /app/chip-ota-provider-app

