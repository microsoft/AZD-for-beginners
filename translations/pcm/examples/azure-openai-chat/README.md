# Microsoft Foundry Models Chat App

**Learning Path:** Intermediate ⭐⭐ | **Time:** 35-45 minutes | **Cost:** $50-200/month

Na complete Microsoft Foundry Models chat app wey dem deploy wit Azure Developer CLI (azd). Dis example dey show how to deploy gpt-4.1, secure API access, and one simple chat interface.

## 🎯 Wetin You Go Learn

- Deploy Microsoft Foundry Models Service with gpt-4.1 model  
- Secure OpenAI API keys with Key Vault  
- Build a simple chat interface with Python  
- Monitor token usage and costs  
- Implement rate limiting and error handling

## 📦 Wetin Dey Inside

✅ **Microsoft Foundry Models Service** - gpt-4.1 model deployment  
✅ **Python Chat App** - Simple command-line chat interface  
✅ **Key Vault Integration** - Secure API key storage  
✅ **ARM Templates** - Complete infrastructure as code  
✅ **Cost Monitoring** - Token usage tracking  
✅ **Rate Limiting** - Prevent quota exhaustion  

## Architecture

```mermaid
graph TD
    App[Python Chat App<br/>For local or for cloud<br/>Command-line (terminal)<br/>Conversation history<br/>We dey track token usage] -- "HTTPS (wey get API Key)" --> Foundry[Microsoft Foundry Models Service<br/>gpt-4.1 Model<br/>Fit handle 20K tokens per min<br/>Get multi-region failover]
    Foundry --> KV[Azure Key Vault<br/>OpenAI API Key<br/>Endpoint URL]
    Foundry -. Managed Identity .-> KV
```
## Prerequisites

### Required

- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** with OpenAI access - [Request access](https://aka.ms/oai/access)
- **Python 3.9+** - [Install Python](https://www.python.org/downloads/)

### Verify Prerequisites

```bash
# Make you check azd version (e suppose to be 1.5.0 or higher)
azd version

# Make sure say you don sign in to Azure
azd auth login

# Make you check Python version
python --version  # or python3 --version

# Confirm say you get OpenAI access (check am in Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Important:** Microsoft Foundry Models requires application approval. If you haven't applied, visit [aka.ms/oai/access](https://aka.ms/oai/access). Approval typically takes 1-2 business days.

## ⏱️ Deployment Timeline

| Phase | Duration | What Happens |
|-------|----------|--------------|
| Prerequisites check | 2-3 minutes | Verify OpenAI quota availability |
| Deploy infrastructure | 8-12 minutes | Create OpenAI, Key Vault, model deployment |
| Configure application | 2-3 minutes | Set up environment and dependencies |
| **Total** | **12-18 minutes** | Ready to chat with gpt-4.1 |

**Note:** First-time OpenAI deployment fit take longer because dem dey provision the model.

## Quick Start

```bash
# Waka go the example
cd examples/azure-openai-chat

# Set up di environment
azd env new myopenai

# Deploy everytin (infrastructure + configuration)
azd up
# Dem go ask you to:
# 1. Pick Azure subscription
# 2. Choose location wey get OpenAI availability (e.g., eastus, eastus2, westus)
# 3. Wait 12-18 minutes make deployment finish

# Install di Python dependencies
pip install -r requirements.txt

# Start dey chat!
python chat.py
```

**Expected Output:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verify Deployment

### Step 1: Check Azure Resources

```bash
# See di resources wey dem don deploy
azd show

# Wetin you suppose see:
# - OpenAI Service: (resource name)
# - Key Vault: (resource name)
# - Deployment: gpt-4.1
# - Location: eastus (or di region wey you choose)
```

### Step 2: Test OpenAI API

```bash
# Make sure say you get OpenAI endpoint and key
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Try di API call
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
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

### Step 3: Verify Key Vault Access

```bash
# Make list of secrets wey dey for Key Vault
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
- ✅ OpenAI service deployed with gpt-4.1
- ✅ API call returns valid completion
- ✅ Secrets stored in Key Vault
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

Di chat application get:

- **Conversation History** - Dey maintain context across messages
- **Token Counting** - Dey track usage and estimate costs
- **Error Handling** - Gentle handling for rate limits and API errors
- **Cost Estimation** - Real-time cost calculation per message
- **Streaming Support** - Optional streaming responses

### Commands

While you dey chat, you fit use:
- `quit` or `exit` - End the session
- `clear` - Clear conversation history
- `tokens` - Show total token usage
- `cost` - Show estimated total cost

### Configuration (`config.py`)

E go load configuration from environment variables:
```python
AZURE_OPENAI_ENDPOINT  # Na Key Vault
AZURE_OPENAI_API_KEY   # Na Key Vault
AZURE_OPENAI_MODEL     # Default na gpt-4.1
AZURE_OPENAI_MAX_TOKENS # Default na 800
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
You: Explain Microsoft Foundry Models Service in 3 sentences.
Assistant: Microsoft Foundry Models Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like gpt-4.1 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Microsoft Foundry Models Service offers several model families including gpt-4.1 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Cost Management

### Token Pricing (gpt-4.1)

| Model | Input (per 1K tokens) | Output (per 1K tokens) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Estimated Monthly Costs

Based on how you dey use am:

| Usage Level | Messages/Day | Tokens/Day | Monthly Cost |
|-------------|--------------|------------|--------------|
| **Light** | 20 messages | 3,000 tokens | $3-5 |
| **Moderate** | 100 messages | 15,000 tokens | $15-25 |
| **Heavy** | 500 messages | 75,000 tokens | $75-125 |

**Base Infrastructure Cost:** $1-2/month (Key Vault + minimal compute)

### Cost Optimization Tips

```bash
# 1. Use GPT-3.5-Turbo for small small tasks (20x cheaper)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Cut down max tokens make answers shorter
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Dey monitor how tokens dey used
python chat.py --show-tokens

# 4. Put budget alerts
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitoring

### View Token Usage

```bash
# For Azure Portal:
# OpenAI Resource → Metrics → Pick "Token Transaction"

# Or you fit use Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### View API Logs

```bash
# Make diagnostic log dem dey flow
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Search log dem
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Troubleshooting

### Issue: "Access Denied" Error

**Symptoms:** 403 Forbidden when calling API

**Solutions:**
```bash
# 1. Make sure say OpenAI access don get approval
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Make sure say API key dey correct
azd env get-value AZURE_OPENAI_API_KEY

# 3. Make sure say endpoint URL format dey correct
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
  --deployment-name gpt-4.1

# 2. Request make dem raise quota (if e need)
# Waka go Azure Portal → OpenAI Resource → Quotas → Request Increase

# 3. Add retry logic (e don already dey for chat.py)
# Di application dey retry by itself with exponential backoff
```

### Issue: "Model Not Found"

**Symptoms:** 404 error for deployment

**Solutions:**
```bash
# 1. Make list of deployments wey dey
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Check say di model name dey for environment
echo $AZURE_OPENAI_MODEL

# 3. Change am to di correct deployment name
export AZURE_OPENAI_MODEL=gpt-4.1  # or gpt-35-turbo
```

### Issue: High Latency

**Symptoms:** Slow response times (>5 seconds)

**Solutions:**
```bash
# 1. Check di regional lag
# Deploy to di region wey dey closest to users

# 2. Reduce max_tokens make responses faster
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Use streaming make UX better
python chat.py --stream
```

## Security Best Practices

### 1. Protect API Keys

```bash
# No dey commit keys for source control
# Use Key Vault (e don set up already)

# Dey rotate keys regular
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implement Content Filtering

```python
# Microsoft Foundry Models don get built-in content filtering
# Set am for Azure Portal:
# OpenAI Resource → Content filter dem → Make custom filter

# Category dem: Hate, Sexual, Violence, Self-harm
# Level dem: Low, Medium, High filtering
```

### 3. Use Managed Identity (Production)

```bash
# For production deployments, make you use managed identity
# no dey use API keys (e require say you host di app for Azure)

# Update infra/openai.bicep make e include:
# identity: { type: 'SystemAssigned' }
```

## Development

### Run Locally

```bash
# Install di dependencies
pip install -r src/requirements.txt

# Set di environment variables
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# Run di application
python src/chat.py
```

### Run Tests

```bash
# Install wetin di tests need
pip install pytest pytest-cov

# Run di tests
pytest tests/ -v

# Wit coverage
pytest tests/ --cov=src --cov-report=html
```

### Update Model Deployment

```bash
# Make anoda version of di model go live.
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
# Comot all Azure resources
azd down --force --purge

# E go comot:
# - OpenAI Service
# - Key Vault (wey get 90-day soft delete)
# - Resource Group
# - All deployments dem and configurations dem
```

## Next Steps

### Expand This Example

1. **Add Web Interface** - Build React/Vue frontend
   ```bash
   # Put frontend service enter azure.yaml
   # Deploy go Azure Static Web Apps
   ```

2. **Implement RAG** - Add document search with Azure AI Search
   ```python
   # Make am connect to Azure Cognitive Search
   # Upload di documents and make di vector index
   ```

3. **Add Function Calling** - Enable tool use
   ```python
   # Make di functions for chat.py
   # Make gpt-4.1 fit call external APIs
   ```

4. **Multi-Model Support** - Deploy multiple models
   ```bash
   # Make we add gpt-35-turbo and embeddings models
   # Put di logic wey go route models
   ```

### Related Examples

- **[Retail Multi-Agent](../retail-scenario.md)** - Advanced multi-agent architecture
- **[Database App](../../../../examples/database-app)** - Add persistent storage
- **[Container Apps](../../../../examples/container-app)** - Deploy as containerized service

### Learning Resources

- 📚 [AZD For Beginners Course](../../README.md) - Main course home
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - Official docs
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API details
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - Best practices

## Additional Resources

### Documentation
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Complete guide
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Model capabilities
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Safety features
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd reference

### Tutorials
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - First deployment
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Building chat apps
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Advanced features

### Tools
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - Web-based playground
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - How to write better prompts
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Estimate token usage

### Community
- **[Azure AI Discord](https://discord.gg/azure)** - Get help from community
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Q&A forum
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Latest updates

---

**🎉 Success!** You don deploy Microsoft Foundry Models and don build one working chat application. Start to explore gpt-4.1 capabilities and try different prompts and use cases.

**Questions?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) or check the [FAQ](../../resources/faq.md)

**Cost Alert:** Make you remember to run `azd down` when you don finish testing to avoid ongoing charges (~$50-100/month for active usage).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Abeg note:
This document don translate with AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg sabi say automated translations fit get mistakes or wrong tins. The original document for im original language na di official source wey you suppose trust. For important mata, we recommend make you use professional human translation. We no go liable for any misunderstanding or wrong interpretation wey fit come from using this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->