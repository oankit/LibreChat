@echo off
REM Wren Engine MCP Server Setup Script for LibreChat (Windows)
REM This script sets up the Wren Engine integration for enhanced Salesforce querying

echo 🚀 Setting up Wren Engine MCP Server for LibreChat...

REM Check if uv is installed
uv --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ uv is not installed. Please install uv first:
    echo    Visit: https://docs.astral.sh/uv/getting-started/installation/
    pause
    exit /b 1
)

echo ✅ uv is installed

REM Navigate to the Wren Engine MCP server directory
if not exist "wren-engine\mcp-server" (
    echo ❌ Could not find wren-engine\mcp-server directory
    pause
    exit /b 1
)

cd wren-engine\mcp-server

echo 📦 Setting up Python environment...

REM Create virtual environment
uv venv

echo 📋 Installing dependencies...

REM Install dependencies
uv sync

echo 📝 Setting up configuration files...

REM Copy environment file if it doesn't exist
if not exist ".env" (
    copy .env.example .env
    echo ✅ Created .env file from .env.example
    echo ⚠️  Please edit .env file with your actual Salesforce credentials
) else (
    echo ℹ️  .env file already exists
)

echo 🔧 Checking Wren Engine server...

REM Check if Wren Engine is running (simplified check for Windows)
echo ⚠️  Please ensure Wren Engine server is running at localhost:8080
echo    You can start it using Docker:
echo    cd docker ^&^& docker compose up

echo 🧪 Testing MCP server...

REM Test the MCP server
uv run app/wren.py --help >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Wren Engine MCP server is working
) else (
    echo ❌ Wren Engine MCP server test failed
    echo    Please check your configuration and try again
)

echo.
echo 🎉 Wren Engine MCP Server setup complete!
echo.
echo 📋 Next steps:
echo 1. Edit wren-engine\mcp-server\.env with your Salesforce credentials
echo 2. Start Wren Engine server if not already running
echo 3. Start LibreChat: npm run dev
echo 4. Test the integration by asking Salesforce analytics questions
echo.
echo 💡 Example queries to try:
echo    - 'What is our current pipeline value?'
echo    - 'Show me the conversion rate for leads this month'
echo    - 'What are the top 5 opportunities by amount?'
echo    - 'How many leads were converted this quarter?'
echo.
pause