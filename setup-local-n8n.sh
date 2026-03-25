#!/bin/bash

set -e

echo "🚀 Setting up Local n8n + n8n-MCP Environment..."

# Create directories for workflows and credentials
mkdir -p workflows credentials

# Create environment file
if [ ! -f .env ]; then
    echo "📝 Creating environment configuration..."
    cat > .env << 'EOF'
# n8n API Key (generate this after first setup)
N8N_API_KEY=

# Database configuration
POSTGRES_DB=n8n
POSTGRES_USER=n8n
POSTGRES_PASSWORD=n8n_password
EOF
fi

echo "🐳 Starting services with Docker Compose..."

# Start the services
docker-compose -f docker-compose.local.yml up -d

echo "⏳ Waiting for services to start..."
sleep 30

# Check if n8n is running
if curl -s http://localhost:5678/healthz > /dev/null; then
    echo "✅ n8n is running!"
    echo ""
    echo "🌐 Access points:"
    echo "   n8n UI: http://localhost:5678"
    echo "   Username: admin"
    echo "   Password: password123"
    echo ""
    echo "📋 Next steps:"
    echo "1. Visit http://localhost:5678 and login"
    echo "2. Go to Settings → Personal → API Keys"
    echo "3. Generate a new API key"
    echo "4. Add the key to .env file: N8N_API_KEY=your_generated_key"
    echo "5. Restart MCP: docker-compose -f docker-compose.local.yml restart n8n-mcp"
    echo "6. n8n-MCP will be available at: http://localhost:3001"
    echo ""
    echo "🎯 Ready for AI workflow creation!"
else
    echo "❌ n8n failed to start. Check logs:"
    echo "   docker-compose -f docker-compose.local.yml logs n8n"
fi