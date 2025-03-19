#!/bin/bash

# Exit immediately if a command fails
set -e

echo "Running tests..."

# 1️⃣ Ensure pytest is installed
if ! command -v pytest &> /dev/null; then
    echo "pytest is not installed. Installing..."
    pip3 install pytest
fi

# 2️⃣ Run Unit Tests
if [ -d "tests/unit" ]; then
    echo "Running unit tests..."
    pytest tests/unit
else
    echo "No unit tests found!"
fi

# 3️⃣ Run Integration Tests
if [ -d "tests/integration" ]; then
    echo "Running integration tests..."
    pytest tests/integration
else
    echo "No integration tests found!"
fi

echo "All tests executed successfully!"
