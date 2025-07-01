FROM n8nio/n8n

USER root

RUN apt-get update && apt-get install -y \
    wget \
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
 && npm install puppeteer \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER node
