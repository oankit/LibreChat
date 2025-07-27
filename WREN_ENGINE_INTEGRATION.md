# Wren Engine Integration for LibreChat

This document describes the integration of Wren Engine as a semantic layer for enhanced Salesforce querying in LibreChat.

## Overview

Wren Engine provides a semantic layer that enhances the accuracy of Salesforce data queries through:

- **Semantic Understanding**: Natural language processing of sales terminology
- **Business Intelligence**: Pre-built calculations for sales metrics and KPIs
- **Data Governance**: Trusted calculations and consistent business definitions
- **Enhanced Analytics**: Complex queries across Salesforce objects with relationships

## Architecture

```
LibreChat Interface
├── Salesforce MCP Server (Direct CRUD operations)
└── Wren Engine MCP Server (Semantic layer + Analytics)
    ├── Semantic Models (MDL)
    ├── Business Calculations
    └── Salesforce Data Source
```

## Features

### 🎯 Enhanced Query Accuracy
- Semantic understanding of sales terminology
- Context-aware data interpretation
- Reduced query errors through semantic modeling

### 📊 Business Intelligence
- Pre-built sales metrics (conversion rates, pipeline value, etc.)
- Complex analytics across multiple Salesforce objects
- Relationship-aware queries

### 🔒 Data Governance
- Consistent business definitions
- Trusted calculations
- Centralized semantic models

### 🚀 Scalable Architecture
- Modular design
- Easy to extend with new semantic models
- Performance optimized queries

## Setup Instructions

### Prerequisites

1. **uv** - Python package manager
   ```bash
   # Install uv
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```

2. **Wren Engine Server** - Running instance
   ```bash
   # Start with Docker (if not already running)
   cd wren-engine/docker
   docker compose up
   ```

3. **Salesforce Credentials** - Valid Salesforce connection

### Quick Setup

#### Linux/macOS
```bash
./setup-wren-engine.sh
```

#### Windows
```cmd
setup-wren-engine.bat
```

### Manual Setup

1. **Navigate to MCP server directory**
   ```bash
   cd wren-engine/mcp-server
   ```

2. **Create Python environment**
   ```bash
   uv venv
   uv sync
   ```

3. **Configure environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your Salesforce credentials
   ```

4. **Test the setup**
   ```bash
   uv run app/wren.py --help
   ```

## Configuration

### Environment Variables

| Variable | Description | Example |
|----------|-------------|----------|
| `WREN_URL` | Wren Engine server URL | `localhost:8080` |
| `CONNECTION_INFO_FILE` | Salesforce connection config | `etc/salesforce_connection.json` |
| `MDL_PATH` | Semantic model definition | `etc/salesforce_mdl.json` |
| `SALESFORCE_INSTANCE_URL` | Your Salesforce instance | `https://yourcompany.salesforce.com` |
| `SALESFORCE_USERNAME` | Salesforce username | `user@company.com` |
| `SALESFORCE_PASSWORD` | Salesforce password | `your-password` |
| `SALESFORCE_SECURITY_TOKEN` | Salesforce security token | `your-token` |
| `SALESFORCE_CLIENT_ID` | Connected app client ID | `your-client-id` |
| `SALESFORCE_CLIENT_SECRET` | Connected app client secret | `your-client-secret` |

### Semantic Models (MDL)

The integration includes pre-built semantic models for:

- **Account**: Company/organization records
- **Contact**: Individual contact records
- **Lead**: Potential customer records
- **Opportunity**: Sales opportunity records
- **SalesMetrics**: Calculated business metrics

#### Key Business Calculations

- `total_pipeline_value`: Sum of open opportunity amounts
- `conversion_rate`: Percentage of won vs. total closed opportunities
- `average_deal_size`: Average amount of won opportunities
- `lead_conversion_rate`: Percentage of converted leads

## Usage Examples

### Basic Analytics Queries

```
"What is our current pipeline value?"
"Show me the conversion rate for this quarter"
"How many leads were converted this month?"
"What's the average deal size for won opportunities?"
```

### Complex Relationship Queries

```
"Show me accounts with the most opportunities"
"Which lead sources generate the highest value opportunities?"
"What's the conversion rate by industry?"
"Show me the top 10 opportunities by amount with their account details"
```

### Comparative Analytics

```
"Compare this quarter's pipeline to last quarter"
"Show me conversion rates by month for the past year"
"Which sales reps have the highest win rates?"
"What's the trend in average deal size over time?"
```

## Troubleshooting

### Common Issues

1. **Wren Engine not running**
   ```bash
   # Check if Wren Engine is accessible
   curl http://localhost:8080/health
   
   # Start Wren Engine with Docker
   cd wren-engine/docker
   docker compose up
   ```

2. **Salesforce connection issues**
   - Verify credentials in `.env` file
   - Check Salesforce security token
   - Ensure IP is whitelisted in Salesforce

3. **MCP server not starting**
   ```bash
   # Check Python environment
   cd wren-engine/mcp-server
   uv run app/wren.py
   ```

4. **LibreChat not detecting MCP servers**
   - Restart LibreChat after configuration changes
   - Check `librechat.yaml` configuration
   - Verify file paths in MCP server configuration

### Debug Mode

Enable debug logging by setting environment variables:
```bash
export DEBUG=1
export LOG_LEVEL=DEBUG
```

## Advanced Configuration

### Custom Semantic Models

You can extend the semantic models by editing `etc/salesforce_mdl.json`:

1. Add new models for custom Salesforce objects
2. Define additional calculated fields
3. Create new relationships between objects
4. Add business-specific metrics

### Performance Optimization

- Use appropriate indexes in your data source
- Optimize MDL queries for your specific use cases
- Consider caching for frequently accessed metrics
- Monitor query performance through Wren Engine logs

### Security Considerations

- Store sensitive credentials in environment variables
- Use Salesforce Connected Apps for OAuth
- Implement proper access controls in Salesforce
- Regular security token rotation

## Integration Benefits

### For Sales Representatives
- Natural language queries for Salesforce data
- Instant access to sales metrics and KPIs
- Reduced time spent on manual reporting
- Improved data accuracy through semantic understanding

### For Sales Managers
- Advanced analytics and business intelligence
- Team performance insights
- Pipeline forecasting capabilities
- Comprehensive sales reporting

### For Sales Administrators
- Centralized semantic model management
- Consistent business definitions across the organization
- Enhanced data governance
- Scalable analytics infrastructure

## Support

For issues and questions:

1. Check the troubleshooting section above
2. Review Wren Engine documentation: [Wren AI](https://getwren.ai/)
3. Check LibreChat MCP documentation
4. Review MCP protocol documentation: [Model Context Protocol](https://modelcontextprotocol.io/)

## Contributing

To contribute to the Wren Engine integration:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This integration follows the same license as LibreChat and Wren Engine.