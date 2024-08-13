# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies required by h5py and other scientific packages, including bash, curl, and git
RUN apt-get update && apt-get install -y \
    build-essential \
    libhdf5-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    gcc \
    python3-dev \
    pkg-config \
    libblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    gfortran \
    git \
    curl \
    nano \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 5005 for Rasa API
EXPOSE 5005

# Ensures that Python output is sent straight to the terminal without being buffered, which is useful for debugging.
ENV PYTHONUNBUFFERED=1

# Run the Rasa server
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--debug"]
