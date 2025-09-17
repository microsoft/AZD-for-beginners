<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T19:46:55+00:00",
  "source_file": "workshop/README.md",
  "language_code": "pa"
}
-->
# AZD ਫਾਰ ਐਆਈ ਡਿਵੈਲਪਰਜ਼ ਵਰਕਸ਼ਾਪ

**ਪਿਛਲਾ:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **ਅਗਲਾ:** [Workshop Lab Modules](../../../workshop)

AZD (Azure Developer CLI) ਅਤੇ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਸਿੱਖਣ ਲਈ ਇਸ ਹੈਂਡਸ-ਆਨ ਵਰਕਸ਼ਾਪ ਵਿੱਚ ਤੁਹਾਡਾ ਸਵਾਗਤ ਹੈ। ਇਹ ਵਰਕਸ਼ਾਪ ਤੁਹਾਨੂੰ AZD ਦੀ ਬੁਨਿਆਦ ਤੋਂ ਲੈ ਕੇ ਪ੍ਰੋਡਕਸ਼ਨ-ਰੇਡੀ AI ਹੱਲ ਤੱਕ ਪਹੁੰਚਾਉਣ ਲਈ ਡਿਜ਼ਾਇਨ ਕੀਤੀ ਗਈ ਹੈ।

## ਵਰਕਸ਼ਾਪ ਦਾ ਜਾਇਜ਼ਾ

**ਅਵਧੀ:** 2-3 ਘੰਟੇ  
**ਸਤਰ:** ਸ਼ੁਰੂਆਤੀ ਤੋਂ ਮੱਧਮ  
**ਪੂਰਵ ਸ਼ਰਤਾਂ:** Azure, ਕਮਾਂਡ ਲਾਈਨ ਟੂਲਜ਼, ਅਤੇ AI ਸੰਕਲਪਾਂ ਦੀ ਬੁਨਿਆਦੀ ਜਾਣਕਾਰੀ

### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ

- **AZD ਬੁਨਿਆਦਾਂ**: AZD ਨਾਲ ਇਨਫਰਾਸਟਰਕਚਰ ਐਜ਼ ਕੋਡ ਦੀ ਸਮਝ  
- 🤖 **AI ਸੇਵਾ ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: Azure OpenAI, AI Search, ਅਤੇ ਹੋਰ AI ਸੇਵਾਵਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨਾ  
- **ਕੰਟੇਨਰ ਡਿਪਲੌਇਮੈਂਟ**: AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ Azure Container Apps ਦੀ ਵਰਤੋਂ  
- **ਸੁਰੱਖਿਆ ਦੇ ਸਰਵੋਤਮ ਤਰੀਕੇ**: Managed Identity ਅਤੇ ਸੁਰੱਖਿਅਤ ਕਨਫਿਗਰੇਸ਼ਨ ਲਾਗੂ ਕਰਨਾ  
- **ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਟਾਵਲਤਾ**: AI ਵਰਕਲੋਡ ਲਈ Application Insights ਸੈਟਅਪ ਕਰਨਾ  
- **ਪ੍ਰੋਡਕਸ਼ਨ ਪੈਟਰਨ**: ਇੰਟਰਪ੍ਰਾਈਜ਼-ਰੇਡੀ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ

## ਵਰਕਸ਼ਾਪ ਦੀ ਬਣਤਰ

### ਮੋਡਿਊਲ 1: AZD ਬੁਨਿਆਦਾਂ (30 ਮਿੰਟ)
- AZD ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨਾ  
- AZD ਪ੍ਰੋਜੈਕਟ ਬਣਤਰ ਦੀ ਸਮਝ  
- ਤੁਹਾਡਾ ਪਹਿਲਾ AZD ਡਿਪਲੌਇਮੈਂਟ  
- **ਲੈਬ**: ਇੱਕ ਸਧਾਰਨ ਵੈਬ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ  

### ਮੋਡਿਊਲ 2: Azure OpenAI ਇੰਟੀਗ੍ਰੇਸ਼ਨ (45 ਮਿੰਟ)
- Azure OpenAI ਸਰੋਤ ਸੈਟਅਪ ਕਰਨਾ  
- ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ  
- API ਐਕਸੈਸ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ ਕਨਫਿਗਰ ਕਰਨਾ  
- **ਲੈਬ**: GPT-4 ਨਾਲ ਇੱਕ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ  

### ਮੋਡਿਊਲ 3: RAG ਐਪਲੀਕੇਸ਼ਨ (45 ਮਿੰਟ)
- Azure AI Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ  
- Azure Document Intelligence ਨਾਲ ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ  
- ਵੈਕਟਰ ਐਮਬੈਡਿੰਗ ਅਤੇ ਸੈਮੈਂਟਿਕ ਸੇਰਚ  
- **ਲੈਬ**: ਇੱਕ ਦਸਤਾਵੇਜ਼ Q&A ਸਿਸਟਮ ਬਣਾਓ  

### ਮੋਡਿਊਲ 4: ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ (30 ਮਿੰਟ)
- Container Apps ਕਨਫਿਗਰੇਸ਼ਨ  
- ਸਕੇਲਿੰਗ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਅਨੁਕੂਲਤਾ  
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ  
- **ਲੈਬ**: ਦ੍ਰਿਸ਼ਟਾਵਲਤਾ ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ ਵਿੱਚ ਡਿਪਲੌਇ ਕਰੋ  

### ਮੋਡਿਊਲ 5: ਉੱਚ ਪੈਟਰਨ (15 ਮਿੰਟ)
- ਬਹੁ-ਵਾਤਾਵਰਣ ਡਿਪਲੌਇਮੈਂਟ  
- CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ  
- ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਰਣਨੀਤੀਆਂ  
- **ਸਮਾਪਤੀ**: ਪ੍ਰੋਡਕਸ਼ਨ ਤਿਆਰੀ ਚੈਕਲਿਸਟ  

## ਪੂਰਵ ਸ਼ਰਤਾਂ

### ਲੋੜੀਂਦੇ ਟੂਲ

ਕਿਰਪਾ ਕਰਕੇ ਵਰਕਸ਼ਾਪ ਤੋਂ ਪਹਿਲਾਂ ਇਹ ਟੂਲ ਇੰਸਟਾਲ ਕਰੋ:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azure ਖਾਤਾ ਸੈਟਅਪ

1. **Azure Subscription**: [ਮੁਫ਼ਤ ਸਾਈਨ ਅਪ ਕਰੋ](https://azure.microsoft.com/free/)  
2. **Azure OpenAI ਐਕਸੈਸ**: [ਐਕਸੈਸ ਦੀ ਬੇਨਤੀ ਕਰੋ](https://aka.ms/oai/access)  
3. **ਲੋੜੀਂਦੇ ਅਧਿਕਾਰ**:  
   - Contributor ਰੋਲ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਜਾਂ ਰਿਸੋਰਸ ਗਰੁੱਪ 'ਤੇ  
   - User Access Administrator (RBAC ਅਸਾਈਨਮੈਂਟ ਲਈ)  

### ਪੂਰਵ ਸ਼ਰਤਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

ਆਪਣੀ ਸੈਟਅਪ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨ ਲਈ ਇਹ ਸਕ੍ਰਿਪਟ ਚਲਾਓ:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## ਵਰਕਸ਼ਾਪ ਸਮੱਗਰੀ

### ਲੈਬ ਅਭਿਆਸ

ਹਰ ਮੋਡਿਊਲ ਵਿੱਚ ਸਟਾਰਟਰ ਕੋਡ ਅਤੇ ਕਦਮ-ਦਰ-ਕਦਮ ਹਦਾਇਤਾਂ ਨਾਲ ਹੈਂਡਸ-ਆਨ ਲੈਬ ਸ਼ਾਮਲ ਹੈ:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - ਤੁਹਾਡਾ ਪਹਿਲਾ AZD ਡਿਪਲੌਇਮੈਂਟ  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI ਨਾਲ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Search ਨਾਲ RAG ਐਪਲੀਕੇਸ਼ਨ  
- **[lab-4-production/](../../../workshop/lab-4-production)** - ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - ਉੱਚ ਡਿਪਲੌਇਮੈਂਟ ਦ੍ਰਿਸ਼ਟਾਂਤ  

### ਰਿਫਰੈਂਸ ਸਮੱਗਰੀ

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - ਵਿਸਤ੍ਰਿਤ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ  
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਦੇ ਸਰਵੋਤਮ ਤਰੀਕੇ  
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - ਇੰਟਰਪ੍ਰਾਈਜ਼ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨ  
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ  

### ਸੈਂਪਲ ਟੈਂਪਲੇਟ

ਆਮ AI ਦ੍ਰਿਸ਼ਟਾਂਤਾਂ ਲਈ ਕਵਿਕ-ਸਟਾਰਟ ਟੈਂਪਲੇਟ:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## ਸ਼ੁਰੂਆਤ ਕਰਨਾ

### ਵਿਕਲਪ 1: GitHub Codespaces (ਸਿਫਾਰਸ਼ੀ)

ਵਰਕਸ਼ਾਪ ਸ਼ੁਰੂ ਕਰਨ ਦਾ ਸਭ ਤੋਂ ਤੇਜ਼ ਤਰੀਕਾ:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### ਵਿਕਲਪ 2: ਸਥਾਨਕ ਵਿਕਾਸ

1. **ਵਰਕਸ਼ਾਪ ਰਿਪੋਜ਼ਟਰੀ ਕਲੋਨ ਕਰੋ:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Azure ਵਿੱਚ ਲੌਗਇਨ ਕਰੋ:**  
```bash
az login
azd auth login
```

3. **ਲੈਬ 1 ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### ਵਿਕਲਪ 3: ਇੰਸਟ੍ਰਕਟਰ-ਲੈਡ ਵਰਕਸ਼ਾਪ

ਜੇ ਤੁਸੀਂ ਇੰਸਟ੍ਰਕਟਰ-ਲੈਡ ਸੈਸ਼ਨ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋ ਰਹੇ ਹੋ:

- 🎥 **ਵਰਕਸ਼ਾਪ ਰਿਕਾਰਡਿੰਗ**: [ਮੰਗ 'ਤੇ ਉਪਲਬਧ](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord Community**: [ਲਾਈਵ ਸਹਾਇਤਾ ਲਈ ਸ਼ਾਮਲ ਹੋਵੋ](https://aka.ms/foundry/discord)  
- **ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: [ਆਪਣਾ ਅਨੁਭਵ ਸਾਂਝਾ ਕਰੋ](https://aka.ms/azd-workshop-feedback)  

## ਵਰਕਸ਼ਾਪ ਟਾਈਮਲਾਈਨ

### ਸਵੈ-ਪੇਸਡ ਸਿੱਖਣਾ (3 ਘੰਟੇ)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### ਇੰਸਟ੍ਰਕਟਰ-ਲੈਡ ਸੈਸ਼ਨ (2.5 ਘੰਟੇ)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## ਸਫਲਤਾ ਮਾਪਦੰਡ

ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ:

✅ **AZD ਟੈਂਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ**  
✅ **Azure OpenAI ਸੇਵਾਵਾਂ ਨੂੰ ਸਹੀ ਸੁਰੱਖਿਆ ਨਾਲ ਕਨਫਿਗਰ ਕਰੋ**  
✅ **AI Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ RAG ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਓ**  
✅ **ਇੰਟਰਪ੍ਰਾਈਜ਼ AI ਵਰਕਲੋਡ ਲਈ ਪ੍ਰੋਡਕਸ਼ਨ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ**  
✅ **AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਕਰੋ**  
✅ **AI ਵਰਕਲੋਡ ਲਈ ਲਾਗਤ ਅਨੁਕੂਲਤਾ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋ**  

## ਕਮਿਊਨਿਟੀ ਅਤੇ ਸਹਾਇਤਾ

### ਵਰਕਸ਼ਾਪ ਦੌਰਾਨ

- 🙋 **ਸਵਾਲ**: ਵਰਕਸ਼ਾਪ ਚੈਟ ਦੀ ਵਰਤੋਂ ਕਰੋ ਜਾਂ ਹੱਥ ਚੁੱਕੋ  
- 🐛 **ਸਮੱਸਿਆਵਾਂ**: [ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ](../docs/troubleshooting/ai-troubleshooting.md) ਚੈੱਕ ਕਰੋ  
- **ਟਿਪਸ**: ਹੋਰ ਭਾਗੀਦਾਰਾਂ ਨਾਲ ਖੋਜਾਂ ਸਾਂਝੀਆਂ ਕਰੋ  

### ਵਰਕਸ਼ਾਪ ਤੋਂ ਬਾਅਦ

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [ਟੈਂਪਲੇਟ ਸਮੱਸਿਆਵਾਂ ਦੀ ਰਿਪੋਰਟ ਕਰੋ](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **ਫੀਡਬੈਕ**: [ਵਰਕਸ਼ਾਪ ਮੁਲਾਂਕਣ ਫਾਰਮ](https://aka.ms/azd-workshop-feedback)  

## ਅਗਲੇ ਕਦਮ

### ਸਿੱਖਣਾ ਜਾਰੀ ਰੱਖੋ

1. **ਉੱਚ ਦ੍ਰਿਸ਼ਟਾਂਤ**: [ਬਹੁ-ਖੇਤਰ ਡਿਪਲੌਇਮੈਂਟ](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) ਦੀ ਖੋਜ ਕਰੋ  
2. **CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: [GitHub Actions ਵਰਕਫਲੋ](../docs/deployment/github-actions.md) ਸੈਟਅਪ ਕਰੋ  
3. **ਕਸਟਮ ਟੈਂਪਲੇਟ**: ਆਪਣੇ [AZD ਟੈਂਪਲੇਟ](../docs/getting-started/custom-templates.md) ਬਣਾਓ  

### ਆਪਣੇ ਪ੍ਰੋਜੈਕਟਾਂ ਵਿੱਚ ਲਾਗੂ ਕਰੋ

1. **ਮੁਲਾਂਕਣ**: [ਤਿਆਰੀ ਚੈਕਲਿਸਟ](./production-readiness-checklist.md) ਦੀ ਵਰਤੋਂ ਕਰੋ  
2. **ਟੈਂਪਲੇਟ**: ਸਾਡੇ [AI-ਵਿਸ਼ੇਸ਼ ਟੈਂਪਲੇਟ](../../../workshop/templates) ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ  
3. **ਸਹਾਇਤਾ**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord) ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ  

### ਆਪਣੀ ਸਫਲਤਾ ਸਾਂਝੀ ਕਰੋ

- ⭐ **ਰਿਪੋਜ਼ਟਰੀ ਨੂੰ ਸਟਾਰ ਕਰੋ** ਜੇ ਇਹ ਵਰਕਸ਼ਾਪ ਤੁਹਾਡੀ ਮਦਦ ਕਰਦਾ ਹੈ  
- 🐦 **ਸੋਸ਼ਲ ਮੀਡੀਆ 'ਤੇ ਸਾਂਝਾ ਕਰੋ** #AzureDeveloperCLI #AzureAI ਨਾਲ  
- 📝 **ਆਪਣੀ AI ਡਿਪਲੌਇਮੈਂਟ ਯਾਤਰਾ ਬਾਰੇ ਬਲੌਗ ਪੋਸਟ ਲਿਖੋ**  

---

## ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ

ਤੁਹਾਡਾ ਫੀਡਬੈਕ ਵਰਕਸ਼ਾਪ ਦੇ ਅਨੁਭਵ ਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣ ਵਿੱਚ ਸਹਾਇਕ ਹੈ:

| ਪਹਲੂ | ਰੇਟਿੰਗ (1-5) | ਟਿੱਪਣੀਆਂ |
|------|--------------|----------|
| ਸਮੱਗਰੀ ਦੀ ਗੁਣਵੱਤਾ | ⭐⭐⭐⭐⭐ | |
| ਹੈਂਡਸ-ਆਨ ਲੈਬ | ⭐⭐⭐⭐⭐ | |
| ਦਸਤਾਵੇਜ਼ | ⭐⭐⭐⭐⭐ | |
| ਮੁਸ਼ਕਲ ਸਤਰ | ⭐⭐⭐⭐⭐ | |
| ਕੁੱਲ ਅਨੁਭਵ | ⭐⭐⭐⭐⭐ | |

**ਫੀਡਬੈਕ ਜਮ੍ਹਾਂ ਕਰੋ**: [ਵਰਕਸ਼ਾਪ ਮੁਲਾਂਕਣ ਫਾਰਮ](https://aka.ms/azd-workshop-feedback)

---

**ਪਿਛਲਾ:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **ਅਗਲਾ:** [ਲੈਬ 1: AZD ਬੁਨਿਆਦਾਂ](../../../workshop/lab-1-azd-basics)

**AZD ਨਾਲ AI ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਲਈ ਤਿਆਰ ਹੋ?**

[ਲੈਬ 1 ਸ਼ੁਰੂ ਕਰੋ: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**ਅਸਵੀਕਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁਚਨਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।