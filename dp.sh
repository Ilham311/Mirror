#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install Python and pip if not already installed
echo "Checking for Python and pip installation..."
if ! command -v python3 &> /dev/null
then
    echo "Python3 not found. Installing Python3..."
    sudo apt-get install -y python3
fi

if ! command -v pip3 &> /dev/null
then
    echo "pip3 not found. Installing pip3..."
    sudo apt-get install -y python3-pip
fi

# Clone the repository
echo "Cloning the repository..."
git clone https://github.com/Agusilham1/mirror-leech-telegram-bot.git
cd mirror-leech-telegram-bot

# Install dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip3 install -r requirements.txt
else
    echo "requirements.txt not found. Skipping pip dependencies installation."
fi

# Check if pipenv is installed, if not install it
if ! command -v pipenv &> /dev/null
then
    echo "pipenv not found. Installing pipenv..."
    pip3 install pipenv
fi

# Install dependencies from Pipfile
if [ -f "Pipfile" ]; then
    echo "Installing dependencies from Pipfile..."
    pipenv install
else
    echo "Pipfile not found. Skipping pipenv dependencies installation."
fi

echo "All dependencies have been installed."
