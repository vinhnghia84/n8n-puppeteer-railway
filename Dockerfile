FROM node:18-bullseye

# Create app directory
WORKDIR /app

# Install system dependencies for puppeteer
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    fonts-liberation \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libgtk-3-0 \
    libnss3 \
    libxss1 \
    xdg-utils \
    libasound2 \
    --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Copy source files
COPY . .

# Install n8n and puppeteer
RUN npm install n8n puppeteer

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
