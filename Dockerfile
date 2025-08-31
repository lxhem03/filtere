FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install system dependencies required for Pillow and tgcrypto
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    gcc \
    libc-dev \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Command to run the bot
CMD ["python", "bot.py"]
