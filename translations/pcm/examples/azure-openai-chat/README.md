# Azure OpenAI Chat Application

**Learning Path:** Intermediate ⭐⭐ | **Time:** 35-45 minutes | **Cost:** $50-200/month

Dis na complete Azure OpenAI chat app wey you go deploy using Azure Developer CLI (azd). Dis example go show you how to deploy GPT-4, secure API access, and create simple chat interface.

## 🎯 Wetin You Go Learn

- How to deploy Azure OpenAI Service with GPT-4 model  
- How to secure OpenAI API keys with Key Vault  
- How to build simple chat interface with Python  
- How to monitor token usage and costs  
- How to implement rate limiting and error handling  

## 📦 Wetin Dey Inside

✅ **Azure OpenAI Service** - GPT-4 model deployment  
✅ **Python Chat App** - Simple command-line chat interface  
✅ **Key Vault Integration** - Secure API key storage  
✅ **ARM Templates** - Complete infrastructure as code  
✅ **Cost Monitoring** - Token usage tracking  
✅ **Rate Limiting** - Prevent quota exhaustion  

## Architecture

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## Wetin You Need Before You Start

### Wetin You Must Get

- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Azure subscription** wey get OpenAI access - [Request access](https://aka.ms/oai/access)  
- **Python 3.9+** - [Install Python](https://www.python.org/downloads/)  

### How to Confirm Wetin You Need

```bash
# Check azd version (need 1.5.0 or higher)
azd version

# Confirm say you don log in for Azure
azd auth login

# Check Python version
python --version  # or python3 --version

# Confirm say you fit access OpenAI (check am for Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Important:** Azure OpenAI need make you apply first. If you never apply, go [aka.ms/oai/access](https://aka.ms/oai/access). Approval dey take like 1-2 business days.

## ⏱️ Deployment Timeline

| Phase | Time | Wetin Go Happen |
|-------|------|-----------------|
| Prerequisites check | 2-3 minutes | Confirm say OpenAI quota dey available |
| Deploy infrastructure | 8-12 minutes | Create OpenAI, Key Vault, model deployment |
| Configure application | 2-3 minutes | Set up environment and dependencies |
| **Total** | **12-18 minutes** | Ready to chat with GPT-4 |

**Note:** First-time OpenAI deployment fit take longer because of model provisioning.

## Quick Start

```bash
# Go to di example
cd examples/azure-openai-chat

# Set up di environment
azd env new myopenai

# Put everything for ground (infrastructure + configuration)
azd up
# Dem go ask you to:
# 1. Pick Azure subscription
# 2. Choose location wey get OpenAI (like eastus, eastus2, westus)
# 3. Wait 12-18 minutes make deployment finish

# Install Python dependencies
pip install -r requirements.txt

# Start to dey chat!
python chat.py
```

**Expected Output:**  
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ How to Confirm Deployment

### Step 1: Check Azure Resources

```bash
# See resources wey dem don deploy
azd show

# Wetin we dey expect to show:
# - OpenAI Service: (resource name)
# - Key Vault: (resource name)
# - Deployment: gpt-4
# - Location: eastus (or di region wey you choose)
```

### Step 2: Test OpenAI API

```bash
# Collect OpenAI endpoint and key
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Try API call
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Expected Response:**  
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### Step 3: Confirm Key Vault Access

```bash
# Show all di secret wey dey inside Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Expected Secrets:**  
- `openai-api-key`  
- `openai-endpoint`  

**Success Criteria:**  
- ✅ OpenAI service deploy with GPT-4  
- ✅ API call dey return valid completion  
- ✅ Secrets dey inside Key Vault  
- ✅ Token usage tracking dey work  

## Project Structure

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## Application Features

### Chat Interface (`chat.py`)

Dis chat app get:  
- **Conversation History** - E dey keep context for messages  
- **Token Counting** - E dey track usage and estimate costs  
- **Error Handling** - E dey handle rate limits and API errors well  
- **Cost Estimation** - E dey calculate cost per message in real-time  
- **Streaming Support** - Optional streaming responses  

### Commands

When you dey chat, you fit use:  
- `quit` or `exit` - End the session  
- `clear` - Clear conversation history  
- `tokens` - Show total token usage  
- `cost` - Show estimated total cost  

### Configuration (`config.py`)

E dey load configuration from environment variables:  
```python
AZURE_OPENAI_ENDPOINT  # From Key Vault
AZURE_OPENAI_API_KEY   # From Key Vault
AZURE_OPENAI_MODEL     # Default: gpt-4
AZURE_OPENAI_MAX_TOKENS # Default: 800
```

## Usage Examples

### Basic Chat

```bash
python chat.py
```

### Chat with Custom Model

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat with Streaming

```bash
python chat.py --stream
```

### Example Conversation

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Cost Management

### Token Pricing (GPT-4)

| Model | Input (per 1K tokens) | Output (per 1K tokens) |
|-------|----------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Estimated Monthly Costs

Based on usage patterns:  

| Usage Level | Messages/Day | Tokens/Day | Monthly Cost |
|-------------|--------------|------------|--------------|
| **Light** | 20 messages | 3,000 tokens | $3-5 |
| **Moderate** | 100 messages | 15,000 tokens | $15-25 |
| **Heavy** | 500 messages | 75,000 tokens | $75-125 |

**Base Infrastructure Cost:** $1-2/month (Key Vault + minimal compute)

### Cost Optimization Tips

```bash
# 1. Use GPT-3.5-Turbo for easy work (20x cheaper)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Make max tokens small for short answer
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Check how tokens dey use
python chat.py --show-tokens

# 4. Put budget alert
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitoring

### View Token Usage

```bash
# For Azure Portal:
# OpenAI Resource → Metrics → Choose "Token Transaction"

# Or wit Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### View API Logs

```bash
# Stream di logs wey dey show wetin dey happen
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Check di logs
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Troubleshooting

### Issue: "Access Denied" Error

**Symptoms:** 403 Forbidden when you dey call API  

**Solutions:**  
```bash
# 1. Make sure say OpenAI access don get approval
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Check say API key correct
azd env get-value AZURE_OPENAI_API_KEY

# 3. Make sure say endpoint URL format correct
azd env get-value AZURE_OPENAI_ENDPOINT
# E suppose be: https://[name].openai.azure.com/
```

### Issue: "Rate Limit Exceeded"

**Symptoms:** 429 Too Many Requests  

**Solutions:**  
```bash
# 1. Check di current quota
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Ask for quota increase (if e dey necessary)
# Go Azure Portal → OpenAI Resource → Quotas → Ask for Increase

# 3. Put retry logic (e dey already for chat.py)
# Di app go retry by itself wit exponential backoff
```

### Issue: "Model Not Found"

**Symptoms:** 404 error for deployment  

**Solutions:**  
```bash
# 1. List di deployments wey dey available
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Check model name for environment
echo $AZURE_OPENAI_MODEL

# 3. Change am to di correct deployment name
export AZURE_OPENAI_MODEL=gpt-4  # or gpt-35-turbo
```

### Issue: High Latency

**Symptoms:** Slow response times (>5 seconds)  

**Solutions:**  
```bash
# 1. Check di latency wey dey for di area
# Deploy am for di area wey near users pass

# 2. Reduce max_tokens so response go quick
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Use streaming so user experience go beta
python chat.py --stream
```

## Security Best Practices

### 1. Protect API Keys

```bash
# No put keys for source control
# Use Key Vault (e don already set up)

# Dey change keys steady
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implement Content Filtering

```python
# Azure OpenAI get content filtering wey dem don put inside
# Set am up for Azure Portal:
# OpenAI Resource → Content Filters → Create Custom Filter

# Categories: Hate, Sexual, Violence, Self-harm
# Levels: Low, Medium, High filtering
```

### 3. Use Managed Identity (Production)

```bash
# For production deployments, use managed identity
# instead of API keys (requires app hosting on Azure)

# Update infra/openai.bicep to include:
# identity: { type: 'SystemAssigned' }
```

## Development

### Run Locally

```bash
# Install di things wey di app need
pip install -r src/requirements.txt

# Set di environment variables
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Run di app
python src/chat.py
```

### Run Tests

```bash
# Install test dependences
pip install pytest pytest-cov

# Run di tests
pytest tests/ -v

# Wit coverage
pytest tests/ --cov=src --cov-report=html
```

### Update Model Deployment

```bash
# Deploy different model version
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## Clean Up

```bash
# Delete all Azure resources
azd down --force --purge

# Dis go comot:
# - OpenAI Service
# - Key Vault (wey get 90 days soft delete)
# - Resource Group
# - All deployments and configurations
```

## Next Steps

### Expand This Example

1. **Add Web Interface** - Build React/Vue frontend  
   ```bash
   # Add frontend service for azure.yaml
   # Deploy for Azure Static Web Apps
   ```

2. **Implement RAG** - Add document search with Azure AI Search  
   ```python
   # Join Azure Cognitive Search
   # Upload documents and make vector index
   ```

3. **Add Function Calling** - Enable tool use  
   ```python
   # Define functions for chat.py
   # Make GPT-4 fit call external APIs
   ```

4. **Multi-Model Support** - Deploy multiple models  
   ```bash
   # Add gpt-35-turbo, embeddings models
   # Put model routing logic
   ```

### Related Examples

- **[Retail Multi-Agent](../retail-scenario.md)** - Advanced multi-agent architecture  
- **[Database App](../../../../examples/database-app)** - Add persistent storage  
- **[Container Apps](../../../../examples/container-app)** - Deploy as containerized service  

### Learning Resources

- 📚 [AZD For Beginners Course](../../README.md) - Main course home  
- 📚 [Azure OpenAI Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - Official docs  
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API details  
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - Best practices  

## Additional Resources

### Documentation
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Complete guide  
- **[GPT-4 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Model capabilities  
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Safety features  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd reference  

### Tutorials
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - First deployment  
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Building chat apps  
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Advanced features  

### Tools
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Web-based playground  
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Writing better prompts  
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Estimate token usage  

### Community
- **[Azure AI Discord](https://discord.gg/azure)** - Get help from community  
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Q&A forum  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Latest updates  

---

**🎉 Success!** You don deploy Azure OpenAI and build working chat app. Start to explore GPT-4 capabilities and try different prompts and use cases.

**Questions?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) or check the [FAQ](../../resources/faq.md)

**Cost Alert:** Remember to run `azd down` when you finish testing to avoid ongoing charges (~$50-100/month for active usage).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transleshion service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transleshion. Even as we dey try make am accurate, abeg make you sabi say transleshion wey machine do fit get mistake or no dey correct well. Di original dokyument for im native language na di main source wey you go fit trust. For important informashon, e good make you use professional human transleshion. We no go fit take blame for any misunderstanding or wrong meaning wey fit happen because you use dis transleshion.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->