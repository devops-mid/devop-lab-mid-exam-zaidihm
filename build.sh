#!/bin/bash

# Exit immediately if a command fails
set -e

echo "Starting the build process..."

# 1️⃣ Ensure Python & pip are installed
if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Installing..."
    sudo apt install -y python3 python3-pip || sudo yum install -y python3 python3-pip
fi

# 2️⃣ Install dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies..."
    pip3 install --upgrade pip
    pip3 install -r requirements.txt
else
    echo "Error: requirements.txt not found!"
    exit 1
fi

# 3️⃣ Set up database (if using Flask-Migrate)
if [ -d "migrations" ]; then
    echo "Running database migrations..."
    flask db upgrade
fi

# 4️⃣ Print success message
echo "Build process completed successfully!"
