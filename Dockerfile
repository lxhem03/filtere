FROM python:3.10.8-slim-buster

# Update and upgrade packages
RUN apt-get update && apt-get upgrade -y

# Install git (if needed for your dependencies or deployment)
RUN apt-get install -y git

# Create a working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Command to run the bot
CMD ["python", "bot.py"]
