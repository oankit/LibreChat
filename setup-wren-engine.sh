#!/bin/bash

# Wren Engine MCP Server Setup Script for LibreChat
# This script sets up the Wren Engine integration for enhanced Salesforce querying

echo "🚀 Setting up Wren Engine MCP Server for LibreChat..."

# Check if uv is installed
if ! command -v uv &> /dev/null; then
    echo "❌ uv is not installed. Please install uv first:"
    echo "   curl -LsSf https://astral.sh/uv/install.sh | sh"
    echo "   Or visit: https://docs.astral.sh/uv/getting-started/installation/"
    exit 1
fi

echo "✅ uv is installed"

# Navigate to the Wren Engine MCP server directory
cd wren-engine/mcp-server || {
    echo "❌ Could not find wren-engine/mcp-server directory"
    exit 1
}

echo "📦 Setting up Python environment..."

# Create virtual environment
uv venv

echo "📋 Installing dependencies..."

# Install dependencies
uv sync

echo "📝 Setting up configuration files..."

# Copy environment file if it doesn't exist
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "✅ Created .env file from .env.example"
    echo "⚠️  Please edit .env file with your actual Salesforce credentials"
else
    echo "ℹ️  .env file already exists"
fi

echo "🔧 Checking Wren Engine server..."

# Check if Wren Engine is running
WREN_URL=${WREN_URL:-localhost:8080}
if curl -s "http://$WREN_URL/health" > /dev/null 2>&1; then
    echo "✅ Wren Engine server is running at $WREN_URL"
else
    echo "⚠️  Wren Engine server is not running at $WREN_URL"
    echo "   You can start it using Docker:"
    echo "   cd docker && docker compose up"
fi

echo "🧪 Testing MCP server..."

# Test the MCP server
if uv run app/wren.py --help > /dev/null 2>&1; then
    echo "✅ Wren Engine MCP server is working"
else
    echo "❌ Wren Engine MCP server test failed"
    echo "   Please check your configuration and try again"
fi

echo ""
echo "🎉 Wren Engine MCP Server setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Edit wren-engine/mcp-server/.env with your Salesforce credentials"
echo "2. Start Wren Engine server if not already running"
echo "3. Start LibreChat: npm run dev"
echo "4. Test the integration by asking Salesforce analytics questions"
echo ""
echo "💡 Example queries to try:"
echo "   - 'What is our current pipeline value?'"
echo "   - 'Show me the conversion rate for leads this month'"
echo "   - 'What are the top 5 opportunities by amount?'"
echo "   - 'How many leads were converted this quarter?'"
echo ""