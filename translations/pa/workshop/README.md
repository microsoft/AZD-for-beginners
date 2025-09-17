<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T21:07:37+00:00",
  "source_file": "workshop/README.md",
  "language_code": "pa"
}
-->
# AZD ਫਾਰ ਏਆਈ ਡਿਵੈਲਪਰਜ਼ ਵਰਕਸ਼ਾਪ

**ਵਰਕਸ਼ਾਪ ਨੈਵੀਗੇਸ਼ਨ**  
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਫਾਰ ਬਿਗਿਨਰਜ਼](../README.md)  
- **📖 ਸੰਬੰਧਤ ਅਧਿਆਇ**: ਸ਼ਾਮਲ ਕਰਦਾ ਹੈ [ਅਧਿਆਇ 1](../README.md#-chapter-1-foundation--quick-start), [ਅਧਿਆਇ 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers), ਅਤੇ [ਅਧਿਆਇ 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)  
- **🛠️ ਹੈਂਡਸ-ਆਨ ਲੈਬ**: [ਏਆਈ ਵਰਕਸ਼ਾਪ ਲੈਬ](../docs/ai-foundry/ai-workshop-lab.md)  
- **🚀 ਅਗਲੇ ਕਦਮ**: [ਵਰਕਸ਼ਾਪ ਲੈਬ ਮੋਡੀਊਲ](../../../workshop)  

AZD (Azure Developer CLI) ਸਿੱਖਣ ਲਈ ਇਸ ਹੈਂਡਸ-ਆਨ ਵਰਕਸ਼ਾਪ ਵਿੱਚ ਤੁਹਾਡਾ ਸਵਾਗਤ ਹੈ, ਜਿਸ ਵਿੱਚ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ 'ਤੇ ਧਿਆਨ ਦਿੱਤਾ ਗਿਆ ਹੈ। ਇਹ ਵਰਕਸ਼ਾਪ ਤੁਹਾਨੂੰ AZD ਦੀ ਬੁਨਿਆਦ ਤੋਂ ਲੈ ਕੇ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਏਆਈ ਹੱਲ ਤੱਕ ਪਹੁੰਚਾਉਣ ਲਈ ਤਿਆਰ ਕੀਤੀ ਗਈ ਹੈ।  

## ਵਰਕਸ਼ਾਪ ਦਾ ਝਲਕ

**ਅਵਧੀ:** 2-3 ਘੰਟੇ  
**ਪੱਧਰ:** ਸ਼ੁਰੂਆਤੀ ਤੋਂ ਦਰਮਿਆਨਾ  
**ਪੂਰਵ ਸ਼ਰਤਾਂ:** Azure, ਕਮਾਂਡ ਲਾਈਨ ਟੂਲਜ਼, ਅਤੇ ਏਆਈ ਸੰਕਲਪਾਂ ਦੀ ਬੁਨਿਆਦੀ ਜਾਣਕਾਰੀ  

### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ

- **AZD ਦੀ ਬੁਨਿਆਦ**: AZD ਨਾਲ ਇੰਫਰਾਸਟਰਕਚਰ ਐਜ਼ ਕੋਡ ਨੂੰ ਸਮਝਣਾ  
- 🤖 **ਏਆਈ ਸਰਵਿਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: Azure OpenAI, AI Search, ਅਤੇ ਹੋਰ ਏਆਈ ਸਰਵਿਸਜ਼ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨਾ  
- **ਕੰਟੇਨਰ ਡਿਪਲੌਇਮੈਂਟ**: AZD ਨਾਲ Azure Container Apps ਦੀ ਵਰਤੋਂ  
- **ਸੁਰੱਖਿਆ ਦੇ ਸਰਵੋਤਮ ਤਰੀਕੇ**: Managed Identity ਅਤੇ ਸੁਰੱਖਿਅਤ ਸੰਰਚਨਾਵਾਂ ਲਾਗੂ ਕਰਨਾ  
- **ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਦ੍ਰਿਸ਼ਟੀਕੋਣ**: AZD ਲਈ Application Insights ਸੈਟਅੱਪ ਕਰਨਾ  
- **ਪ੍ਰੋਡਕਸ਼ਨ ਪੈਟਰਨਜ਼**: ਐਂਟਰਪ੍ਰਾਈਜ਼-ਤਿਆਰ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ  

## ਵਰਕਸ਼ਾਪ ਦੀ ਬਣਤਰ

### ਮੋਡੀਊਲ 1: AZD ਦੀ ਬੁਨਿਆਦ (30 ਮਿੰਟ)  
- AZD ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕਨਫਿਗਰ ਕਰਨਾ  
- AZD ਪ੍ਰੋਜੈਕਟ ਸਟ੍ਰਕਚਰ ਨੂੰ ਸਮਝਣਾ  
- ਆਪਣੀ ਪਹਿਲੀ AZD ਡਿਪਲੌਇਮੈਂਟ  
- **ਲੈਬ**: ਇੱਕ ਸਧਾਰਨ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ  

### ਮੋਡੀਊਲ 2: Azure OpenAI ਇੰਟੀਗ੍ਰੇਸ਼ਨ (45 ਮਿੰਟ)  
- Azure OpenAI ਸਰੋਤ ਸੈਟਅੱਪ ਕਰਨਾ  
- ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ  
- API ਐਕਸੈਸ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ ਕਨਫਿਗਰ ਕਰਨਾ  
- **ਲੈਬ**: GPT-4 ਨਾਲ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ  

### ਮੋਡੀਊਲ 3: RAG ਐਪਲੀਕੇਸ਼ਨਜ਼ (45 ਮਿੰਟ)  
- Azure AI Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ  
- Azure Document Intelligence ਨਾਲ ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ  
- ਵੈਕਟਰ ਐਮਬੈਡਿੰਗ ਅਤੇ ਸੈਮੈਂਟਿਕ ਸਰਚ  
- **ਲੈਬ**: ਦਸਤਾਵੇਜ਼ Q&A ਸਿਸਟਮ ਬਣਾਓ  

### ਮੋਡੀਊਲ 4: ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ (30 ਮਿੰਟ)  
- ਕੰਟੇਨਰ ਐਪਸ ਕਨਫਿਗਰੇਸ਼ਨ  
- ਸਕੇਲਿੰਗ ਅਤੇ ਪ੍ਰਦਰਸ਼ਨ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ  
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ  
- **ਲੈਬ**: ਦ੍ਰਿਸ਼ਟੀਕੋਣ ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ ਵਿੱਚ ਡਿਪਲੌਇ ਕਰੋ  

### ਮੋਡੀਊਲ 5: ਉੱਨਤ ਪੈਟਰਨਜ਼ (15 ਮਿੰਟ)  
- ਮਲਟੀ-ਇਨਵਾਇਰਨਮੈਂਟ ਡਿਪਲੌਇਮੈਂਟ  
- CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ  
- ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ  
- **ਸਮਾਪਤੀ**: ਪ੍ਰੋਡਕਸ਼ਨ ਤਿਆਰੀ ਚੈਕਲਿਸਟ  

## ਪੂਰਵ ਸ਼ਰਤਾਂ

### ਲੋੜੀਂਦੇ ਟੂਲਜ਼

ਕਿਰਪਾ ਕਰਕੇ ਵਰਕਸ਼ਾਪ ਤੋਂ ਪਹਿਲਾਂ ਇਹ ਟੂਲਜ਼ ਇੰਸਟਾਲ ਕਰੋ:  

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

### Azure ਖਾਤਾ ਸੈਟਅੱਪ

1. **Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ**: [ਮੁਫ਼ਤ ਸਾਈਨ ਅਪ ਕਰੋ](https://azure.microsoft.com/free/)  
2. **Azure OpenAI ਐਕਸੈਸ**: [ਐਕਸੈਸ ਦੀ ਬੇਨਤੀ ਕਰੋ](https://aka.ms/oai/access)  
3. **ਲੋੜੀਂਦੇ ਅਧਿਕਾਰ**:  
   - ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਜਾਂ ਰਿਸੋਰਸ ਗਰੁੱਪ 'ਤੇ Contributor ਰੋਲ  
   - User Access Administrator (RBAC ਅਸਾਈਨਮੈਂਟ ਲਈ)  

### ਪੂਰਵ ਸ਼ਰਤਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ

ਆਪਣੀ ਸੈਟਅੱਪ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨ ਲਈ ਇਹ ਸਕ੍ਰਿਪਟ ਚਲਾਓ:  

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

ਹਰ ਮੋਡੀਊਲ ਵਿੱਚ ਸਟਾਰਟਰ ਕੋਡ ਅਤੇ ਕਦਮ-ਦਰ-ਕਦਮ ਹਦਾਇਤਾਂ ਵਾਲੇ ਹੈਂਡਸ-ਆਨ ਲੈਬ ਸ਼ਾਮਲ ਹਨ:  

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - ਆਪਣੀ ਪਹਿਲੀ AZD ਡਿਪਲੌਇਮੈਂਟ  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI ਨਾਲ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AZD ਨਾਲ RAG ਐਪਲੀਕੇਸ਼ਨ  
- **[lab-4-production/](../../../workshop/lab-4-production)** - ਪ੍ਰੋਡਕਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨਜ਼  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - ਉੱਨਤ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀਆਂ  

### ਰਿਫਰੈਂਸ ਸਮੱਗਰੀ

- **[AI Foundry ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਗਾਈਡ](../docs/ai-foundry/azure-ai-foundry-integration.md)** - ਵਿਸਥਾਰਤ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨਜ਼  
- **[AI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](../docs/ai-foundry/ai-model-deployment.md)** - ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਦੇ ਸਰਵੋਤਮ ਤਰੀਕੇ  
- **[ਪ੍ਰੋਡਕਸ਼ਨ ਏਆਈ ਪ੍ਰੈਕਟਿਸਜ਼](../docs/ai-foundry/production-ai-practices.md)** - ਐਂਟਰਪ੍ਰਾਈਜ਼ ਡਿਪਲੌਇਮੈਂਟ ਪੈਟਰਨਜ਼  
- **[AI ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ](../docs/troubleshooting/ai-troubleshooting.md)** - ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ  

### ਸੈਂਪਲ ਟੈਂਪਲੇਟ

ਆਮ ਏਆਈ ਸਥਿਤੀਆਂ ਲਈ ਕਵਿਕ-ਸਟਾਰਟ ਟੈਂਪਲੇਟ:  

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```  

## ਸ਼ੁਰੂਆਤ ਕਰਨਾ

### ਵਿਕਲਪ 1: GitHub Codespaces (ਸਿਫਾਰਸ਼ ਕੀਤੀ ਗਈ)

ਵਰਕਸ਼ਾਪ ਸ਼ੁਰੂ ਕਰਨ ਦਾ ਸਭ ਤੋਂ ਤੇਜ਼ ਤਰੀਕਾ:  

[![GitHub Codespaces ਵਿੱਚ ਖੋਲ੍ਹੋ](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)  

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

### ਵਿਕਲਪ 3: ਇੰਸਟਰਕਟਰ-ਲੈਡ ਵਰਕਸ਼ਾਪ

ਜੇ ਤੁਸੀਂ ਇੰਸਟਰਕਟਰ-ਲੈਡ ਸੈਸ਼ਨ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋ ਰਹੇ ਹੋ:  

- 🎥 **ਵਰਕਸ਼ਾਪ ਰਿਕਾਰਡਿੰਗ**: [ਮੰਗ 'ਤੇ ਉਪਲਬਧ](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord ਕਮਿਊਨਟੀ**: [ਲਾਈਵ ਸਹਾਇਤਾ ਲਈ ਸ਼ਾਮਲ ਹੋਵੋ](https://aka.ms/foundry/discord)  
- **ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ**: [ਆਪਣਾ ਅਨੁਭਵ ਸਾਂਝਾ ਕਰੋ](https://aka.ms/azd-workshop-feedback)  

## ਵਰਕਸ਼ਾਪ ਟਾਈਮਲਾਈਨ

### ਸਵੈ-ਗਤੀ ਸਿੱਖਣਾ (3 ਘੰਟੇ)  

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```  

### ਇੰਸਟਰਕਟਰ-ਲੈਡ ਸੈਸ਼ਨ (2.5 ਘੰਟੇ)  

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

## ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ

ਵਰਕਸ਼ਾਪ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਵੋਗੇ:  

✅ **AZD ਟੈਂਪਲੇਟਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨਜ਼ ਡਿਪਲੌਇ ਕਰੋ**  
✅ **Azure OpenAI ਸਰਵਿਸਜ਼ ਨੂੰ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਕਨਫਿਗਰ ਕਰੋ**  
✅ **RAG ਐਪਲੀਕੇਸ਼ਨਜ਼ ਬਣਾਓ** Azure AI Search ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ  
✅ **ਐਂਟਰਪ੍ਰਾਈਜ਼ ਏਆਈ ਵਰਕਲੋਡਜ਼ ਲਈ ਪ੍ਰੋਡਕਸ਼ਨ ਪੈਟਰਨਜ਼ ਲਾਗੂ ਕਰੋ**  
✅ **ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਟਰਬਲਸ਼ੂਟਿੰਗ ਕਰੋ**  
✅ **ਏਆਈ ਵਰਕਲੋਡਜ਼ ਲਈ ਲਾਗਤ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋ**  

## ਕਮਿਊਨਟੀ ਅਤੇ ਸਹਾਇਤਾ

### ਵਰਕਸ਼ਾਪ ਦੌਰਾਨ

- 🙋 **ਸਵਾਲ**: ਵਰਕਸ਼ਾਪ ਚੈਟ ਦਾ ਇਸਤੇਮਾਲ ਕਰੋ ਜਾਂ ਹੱਥ ਖੜ੍ਹਾ ਕਰੋ  
- 🐛 **ਸਮੱਸਿਆਵਾਂ**: [ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ](../docs/troubleshooting/ai-troubleshooting.md) ਚੈੱਕ ਕਰੋ  
- **ਟਿੱਪਸ**: ਹੋਰ ਭਾਗੀਦਾਰਾਂ ਨਾਲ ਖੋਜਾਂ ਸਾਂਝੀਆਂ ਕਰੋ  

### ਵਰਕਸ਼ਾਪ ਤੋਂ ਬਾਅਦ

- 💬 **Discord**: [Azure AI Foundry ਕਮਿਊਨਟੀ](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [ਟੈਂਪਲੇਟ ਸਮੱਸਿਆਵਾਂ ਦੀ ਰਿਪੋਰਟ ਕਰੋ](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **ਫੀਡਬੈਕ**: [ਵਰਕਸ਼ਾਪ ਮੁਲਾਂਕਣ ਫਾਰਮ](https://aka.ms/azd-workshop-feedback)  

## ਅਗਲੇ ਕਦਮ

### ਸਿੱਖਣਾ ਜਾਰੀ ਰੱਖੋ

1. **ਉੱਨਤ ਸਥਿਤੀਆਂ**: [ਮਲਟੀ-ਰੀਜਨ ਡਿਪਲੌਇਮੈਂਟ](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) ਦੀ ਪੜਚੋਲ ਕਰੋ  
2. **CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ**: [GitHub Actions ਵਰਕਫਲੋਜ਼](../docs/deployment/github-actions.md) ਸੈਟਅੱਪ ਕਰੋ  
3. **ਕਸਟਮ ਟੈਂਪਲੇਟ**: ਆਪਣੇ [AZD ਟੈਂਪਲੇਟ](../docs/getting-started/custom-templates.md) ਬਣਾਓ  

### ਆਪਣੇ ਪ੍ਰੋਜੈਕਟਾਂ ਵਿੱਚ ਲਾਗੂ ਕਰੋ

1. **ਮੁਲਾਂਕਣ**: ਸਾਡੀ [ਤਿਆਰੀ ਚੈਕਲਿਸਟ](./production-readiness-checklist.md) ਦੀ ਵਰਤੋਂ ਕਰੋ  
2. **ਟੈਂਪਲੇਟ**: ਸਾਡੇ [ਏਆਈ-ਵਿਸ਼ੇਸ਼ ਟੈਂਪਲੇਟ](../../../workshop/templates) ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ  
3. **ਸਹਾਇਤਾ**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord) ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ  

### ਆਪਣੀ ਸਫਲਤਾ ਸਾਂਝੀ ਕਰੋ

- ⭐ **ਰਿਪੋਜ਼ਟਰੀ ਨੂੰ ਸਟਾਰ ਕਰੋ** ਜੇ ਇਹ ਵਰਕਸ਼ਾਪ ਤੁਹਾਡੇ ਲਈ ਮਦਦਗਾਰ ਸੀ  
- 🐦 **ਸੋਸ਼ਲ ਮੀਡੀਆ 'ਤੇ ਸਾਂਝਾ ਕਰੋ** #AzureDeveloperCLI #AzureAI ਨਾਲ  
- 📝 **ਆਪਣੀ ਏਆਈ ਡਿਪਲੌਇਮੈਂਟ ਯਾਤਰਾ ਬਾਰੇ ਬਲੌਗ ਪੋਸਟ ਲਿਖੋ**  

---

## ਵਰਕਸ਼ਾਪ ਫੀਡਬੈਕ

ਤੁਹਾਡਾ ਫੀਡਬੈਕ ਸਾਨੂੰ ਵਰਕਸ਼ਾਪ ਦੇ ਅਨੁਭਵ ਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ:  

| ਪਹਲੂ | ਰੇਟਿੰਗ (1-5) | ਟਿੱਪਣੀਆਂ |  
|--------|--------------|----------|  
| ਸਮੱਗਰੀ ਦੀ ਗੁਣਵੱਤਾ | ⭐⭐⭐⭐⭐ | |  
| ਹੈਂਡਸ-ਆਨ ਲੈਬ | ⭐⭐⭐⭐⭐ | |  
| ਦਸਤਾਵੇਜ਼ੀਕਰਨ | ⭐⭐⭐⭐⭐ | |  
| ਮੁਸ਼ਕਲ ਪੱਧਰ | ⭐⭐⭐⭐⭐ | |  
| ਕੁੱਲ ਅਨੁਭਵ | ⭐⭐⭐⭐⭐ | |  

**ਫੀਡਬੈਕ ਜਮ੍ਹਾਂ ਕਰੋ**: [ਵਰਕਸ਼ਾਪ ਮੁਲਾਂਕਣ ਫਾਰਮ](https://aka.ms/azd-workshop-feedback)  

---

**ਪਿਛਲਾ:** [AI ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ](../docs/troubleshooting/ai-troubleshooting.md) | **ਅਗਲਾ:** [ਲੈਬ 1: AZD ਬੇਸਿਕਸ](../../../workshop/lab-1-azd-basics) ਸ਼ੁਰੂ ਕਰੋ  

**AZD ਨਾਲ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਬਣਾਉਣ ਲਈ ਤਿਆਰ ਹੋ?**  

[ਲੈਬ 1 ਸ਼ੁਰੂ ਕਰੋ: AZD ਫਾਊਂਡੇਸ਼ਨਜ਼ →](./lab-1-azd-basics/README.md)  

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੇ ਪ੍ਰਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।  