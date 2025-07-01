FROM node:18-bullseye

# Tạo thư mục làm việc
WORKDIR /app

# Cài các thư viện cần thiết cho Puppeteer
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

# Copy source code vào container
COPY . .

# Cài puppeteer (và các thư viện khác nếu có)
RUN npm install puppeteer

# Chạy file Puppeteer chính (ví dụ crawl-aeon.js)
CMD ["node", "crawl-aeon.js"]
