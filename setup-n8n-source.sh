#!/bin/bash

set -e

echo "🚀 Setting up n8n + n8n-MCP from source..."

# Create directories
mkdir -p n8n

# Download n8n source if not exists
if [ ! -d "n8n/.git" ]; then
    echo "📥 Downloading n8n source code..."
    git clone https://github.com/n8n-io/n8n.git n8n
fi

cd n8n

# Create Dockerfile for local build
cat > Dockerfile << 'EOF'
FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
COPY packages ./packages
COPY pnpm-lock.yaml ./
RUN npm install -g pnpm
RUN pnpm install

# Build the project
RUN pnpm build

# Start command
CMD ["pnpm", "start"]

EXPOSE 5678
EOF

cd ..

# Create environment file
cat > .env << 'EOF'
# n8n API Key - will be generated after first run
N8N_API_KEY=

# Database settings
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=postgres
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=n8n
DB_POSTGRESDB_USER=n8n
DB_POSTGRESDB_PASSWORD=n8n_password

# n8n settings
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=password123
N8N_ENDPOINT_WEBHOOK=http://localhost:5678/webhook/
N8N_ENDPOINT_WEBHOOK_TEST=http://localhost:5678/webhook-test/
GENERIC_TIMEZONE=Asia/Ho_Chi_Minh
EOF

echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Run: ./setup-n8n-source.sh"
echo "2. Run: docker-compose -f docker-compose.n8n.yml up -d"
echo "3. Visit: http://localhost:5678"
echo "4. Login: admin / password123"
echo "5. Generate API key in Settings → Personal → API Keys"
echo "6. Update .env file with N8N_API_KEY"
echo "7. Restart: docker-compose -f docker-compose.n8n.yml restart n8n-mcp"