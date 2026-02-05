# Azure OpenAI Chat Application

**Landas ng Pag-aaral:** Intermediate ⭐⭐ | **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan

Isang kumpletong Azure OpenAI chat application na na-deploy gamit ang Azure Developer CLI (azd). Ang halimbawang ito ay nagpapakita ng GPT-4 deployment, secure API access, at isang simpleng chat interface.

## 🎯 Ano ang Matututuhan Mo

- I-deploy ang Azure OpenAI Service gamit ang GPT-4 model  
- Siguraduhing ligtas ang OpenAI API keys gamit ang Key Vault  
- Gumawa ng simpleng chat interface gamit ang Python  
- Subaybayan ang paggamit ng token at mga gastos  
- Magpatupad ng rate limiting at error handling  

## 📦 Kasama sa Package

✅ **Azure OpenAI Service** - GPT-4 model deployment  
✅ **Python Chat App** - Simpleng command-line chat interface  
✅ **Key Vault Integration** - Ligtas na imbakan ng API key  
✅ **ARM Templates** - Kumpletong infrastructure as code  
✅ **Cost Monitoring** - Pagsubaybay sa paggamit ng token  
✅ **Rate Limiting** - Iwasan ang pagkaubos ng quota  

## Arkitektura

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

## Mga Kinakailangan

### Kailangan

- **Azure Developer CLI (azd)** - [Gabay sa Pag-install](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Azure subscription** na may OpenAI access - [Mag-apply para sa access](https://aka.ms/oai/access)  
- **Python 3.9+** - [I-download ang Python](https://www.python.org/downloads/)  

### I-verify ang Mga Kinakailangan

```bash
# Suriin ang bersyon ng azd (kailangan 1.5.0 o mas mataas)
azd version

# Tiyakin ang pag-login sa Azure
azd auth login

# Suriin ang bersyon ng Python
python --version  # o python3 --version

# Tiyakin ang access sa OpenAI (suriin sa Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Mahalagang Paalala:** Ang Azure OpenAI ay nangangailangan ng pag-apruba ng aplikasyon. Kung hindi ka pa nakakapag-apply, bisitahin ang [aka.ms/oai/access](https://aka.ms/oai/access). Karaniwang tumatagal ng 1-2 araw ng negosyo ang pag-apruba.

## ⏱️ Timeline ng Deployment

| Yugto | Tagal | Ano ang Nangyayari |
|-------|-------|--------------------|
| Pagsusuri ng mga kinakailangan | 2-3 minuto | I-verify ang availability ng OpenAI quota |
| I-deploy ang imprastraktura | 8-12 minuto | Gumawa ng OpenAI, Key Vault, model deployment |
| I-configure ang aplikasyon | 2-3 minuto | I-set up ang environment at dependencies |
| **Kabuuan** | **12-18 minuto** | Handa nang makipag-chat gamit ang GPT-4 |

**Tandaan:** Ang unang deployment ng OpenAI ay maaaring mas matagal dahil sa model provisioning.

## Mabilisang Simula

```bash
# Mag-navigate sa halimbawa
cd examples/azure-openai-chat

# I-initialize ang kapaligiran
azd env new myopenai

# I-deploy ang lahat (infrastructure + configuration)
azd up
# Ikaw ay tatanungin na:
# 1. Piliin ang Azure subscription
# 2. Pumili ng lokasyon na may OpenAI availability (hal., eastus, eastus2, westus)
# 3. Maghintay ng 12-18 minuto para sa deployment

# I-install ang mga Python dependencies
pip install -r requirements.txt

# Simulan ang pakikipag-chat!
python chat.py
```

**Inaasahang Output:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ I-verify ang Deployment

### Hakbang 1: Suriin ang Azure Resources

```bash
# Tingnan ang mga na-deploy na resources
azd show

# Ipinapakita ang inaasahang output:
# - OpenAI Service: (pangalan ng resource)
# - Key Vault: (pangalan ng resource)
# - Deployment: gpt-4
# - Lokasyon: eastus (o ang napili mong rehiyon)
```

### Hakbang 2: Subukan ang OpenAI API

```bash
# Kunin ang OpenAI endpoint at key
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Subukan ang tawag sa API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Inaasahang Tugon:**
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

### Hakbang 3: I-verify ang Access sa Key Vault

```bash
# Ilista ang mga lihim sa Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Inaasahang Mga Lihim:**
- `openai-api-key`  
- `openai-endpoint`  

**Pamantayan ng Tagumpay:**
- ✅ Na-deploy ang OpenAI service gamit ang GPT-4  
- ✅ Ang API call ay nagbabalik ng wastong completion  
- ✅ Ang mga lihim ay nakaimbak sa Key Vault  
- ✅ Gumagana ang pagsubaybay sa paggamit ng token  

## Istruktura ng Proyekto

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

## Mga Tampok ng Aplikasyon

### Chat Interface (`chat.py`)

Kasama sa chat application ang:  
- **Kasaysayan ng Usapan** - Pinapanatili ang konteksto sa bawat mensahe  
- **Pagbibilang ng Token** - Sinusubaybayan ang paggamit at tinatantya ang mga gastos  
- **Error Handling** - Maayos na paghawak ng rate limits at mga error sa API  
- **Pagtatantya ng Gastos** - Real-time na kalkulasyon ng gastos kada mensahe  
- **Streaming Support** - Opsyonal na streaming responses  

### Mga Utos

Habang nakikipag-chat, maaari mong gamitin:  
- `quit` o `exit` - Tapusin ang session  
- `clear` - Burahin ang kasaysayan ng usapan  
- `tokens` - Ipakita ang kabuuang paggamit ng token  
- `cost` - Ipakita ang tinatayang kabuuang gastos  

### Configuration (`config.py`)

Naglo-load ng configuration mula sa environment variables:  
```python
AZURE_OPENAI_ENDPOINT  # Mula sa Key Vault
AZURE_OPENAI_API_KEY   # Mula sa Key Vault
AZURE_OPENAI_MODEL     # Default: gpt-4
AZURE_OPENAI_MAX_TOKENS # Default: 800
```

## Mga Halimbawa ng Paggamit

### Simpleng Chat

```bash
python chat.py
```

### Chat gamit ang Custom Model

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat gamit ang Streaming

```bash
python chat.py --stream
```

### Halimbawa ng Usapan

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

## Pamamahala ng Gastos

### Presyo ng Token (GPT-4)

| Model | Input (bawat 1K tokens) | Output (bawat 1K tokens) |
|-------|-------------------------|--------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Tinatayang Buwanang Gastos

Batay sa mga pattern ng paggamit:

| Antas ng Paggamit | Mensahe/Araw | Tokens/Araw | Buwanang Gastos |
|-------------------|--------------|-------------|-----------------|
| **Mababa** | 20 mensahe | 3,000 tokens | $3-5 |
| **Katamtaman** | 100 mensahe | 15,000 tokens | $15-25 |
| **Mataas** | 500 mensahe | 75,000 tokens | $75-125 |

**Base Infrastructure Cost:** $1-2/buwan (Key Vault + minimal compute)

### Mga Tip sa Pag-optimize ng Gastos

```bash
# 1. Gamitin ang GPT-3.5-Turbo para sa mas simpleng gawain (20x mas mura)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Bawasan ang max tokens para sa mas maikling sagot
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Subaybayan ang paggamit ng token
python chat.py --show-tokens

# 4. Mag-set up ng mga alerto sa badyet
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Pagsubaybay

### Tingnan ang Paggamit ng Token

```bash
# Sa Azure Portal:
# OpenAI Resource → Metrics → Piliin ang "Token Transaction"

# O sa pamamagitan ng Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Tingnan ang API Logs

```bash
# I-stream ang mga diagnostic log
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Mag-query ng mga log
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Pag-troubleshoot

### Isyu: "Access Denied" Error

**Sintomas:** 403 Forbidden kapag tumatawag sa API  

**Mga Solusyon:**  
```bash
# 1. Tiyakin na ang access sa OpenAI ay aprubado
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Suriin kung tama ang API key
azd env get-value AZURE_OPENAI_API_KEY

# 3. Tiyakin ang tamang format ng endpoint URL
azd env get-value AZURE_OPENAI_ENDPOINT
# Dapat ay: https://[name].openai.azure.com/
```

### Isyu: "Rate Limit Exceeded"

**Sintomas:** 429 Too Many Requests  

**Mga Solusyon:**  
```bash
# 1. Suriin ang kasalukuyang quota
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Humiling ng pagtaas ng quota (kung kinakailangan)
# Pumunta sa Azure Portal → OpenAI Resource → Quotas → Humiling ng Pagtaas

# 3. Ipatupad ang retry logic (nasa chat.py na)
# Awtomatikong inuulit ng application gamit ang exponential backoff
```

### Isyu: "Model Not Found"

**Sintomas:** 404 error para sa deployment  

**Mga Solusyon:**  
```bash
# 1. Ilista ang mga available na deployment
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Tiyakin ang pangalan ng modelo sa kapaligiran
echo $AZURE_OPENAI_MODEL

# 3. I-update sa tamang pangalan ng deployment
export AZURE_OPENAI_MODEL=gpt-4  # o gpt-35-turbo
```

### Isyu: Mataas na Latency

**Sintomas:** Mabagal na oras ng tugon (>5 segundo)  

**Mga Solusyon:**  
```bash
# 1. Suriin ang latency ng rehiyon
# I-deploy sa rehiyon na pinakamalapit sa mga gumagamit

# 2. Bawasan ang max_tokens para sa mas mabilis na mga tugon
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Gumamit ng streaming para sa mas magandang UX
python chat.py --stream
```

## Mga Pinakamahusay na Kasanayan sa Seguridad

### 1. Protektahan ang API Keys

```bash
# Huwag kailanman mag-commit ng mga susi sa source control
# Gumamit ng Key Vault (nakakonfigura na)

# Regular na i-rotate ang mga susi
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Magpatupad ng Content Filtering

```python
# Kasama sa Azure OpenAI ang built-in na pagsasala ng nilalaman
# I-configure sa Azure Portal:
# OpenAI Resource → Mga Filter ng Nilalaman → Gumawa ng Custom na Filter

# Mga Kategorya: Poot, Sekswal, Karahasan, Pagpapakamatay
# Mga Antas: Mababang, Katamtaman, Mataas na pagsasala
```

### 3. Gumamit ng Managed Identity (Production)

```bash
# Para sa production deployments, gumamit ng managed identity
# sa halip na API keys (nangangailangan ng app hosting sa Azure)

# I-update ang infra/openai.bicep upang isama:
# identity: { type: 'SystemAssigned' }
```

## Pag-develop

### Patakbuhin nang Lokal

```bash
# I-install ang mga dependency
pip install -r src/requirements.txt

# Itakda ang mga variable ng kapaligiran
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Patakbuhin ang aplikasyon
python src/chat.py
```

### Patakbuhin ang Mga Pagsubok

```bash
# I-install ang mga dependency para sa pagsusuri
pip install pytest pytest-cov

# Patakbuhin ang mga pagsusuri
pytest tests/ -v

# Kasama ang coverage
pytest tests/ --cov=src --cov-report=html
```

### I-update ang Model Deployment

```bash
# I-deploy ang iba't ibang bersyon ng modelo
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

## Paglilinis

```bash
# Tanggalin ang lahat ng Azure resources
azd down --force --purge

# Tatanggalin nito:
# - OpenAI Service
# - Key Vault (na may 90-araw na soft delete)
# - Resource Group
# - Lahat ng deployments at configurations
```

## Mga Susunod na Hakbang

### Palawakin ang Halimbawang Ito

1. **Magdagdag ng Web Interface** - Gumawa ng React/Vue frontend  
   ```bash
   # Magdagdag ng frontend service sa azure.yaml
   # I-deploy sa Azure Static Web Apps
   ```

2. **Magpatupad ng RAG** - Magdagdag ng document search gamit ang Azure AI Search  
   ```python
   # Isama ang Azure Cognitive Search
   # Mag-upload ng mga dokumento at lumikha ng vector index
   ```

3. **Magdagdag ng Function Calling** - Paganahin ang paggamit ng tool  
   ```python
   # Tukuyin ang mga function sa chat.py
   # Payagan ang GPT-4 na tumawag ng mga panlabas na API
   ```

4. **Suporta sa Multi-Model** - Mag-deploy ng maraming modelo  
   ```bash
   # Magdagdag ng gpt-35-turbo, mga modelo ng embeddings
   # Ipatupad ang lohika ng pag-ruta ng modelo
   ```

### Kaugnay na Mga Halimbawa

- **[Retail Multi-Agent](../retail-scenario.md)** - Advanced na multi-agent architecture  
- **[Database App](../../../../examples/database-app)** - Magdagdag ng permanenteng storage  
- **[Container Apps](../../../../examples/container-app)** - I-deploy bilang containerized service  

### Mga Mapagkukunan ng Pag-aaral

- 📚 [AZD Para sa Mga Baguhan na Kurso](../../README.md) - Pangunahing kurso  
- 📚 [Azure OpenAI Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - Opisyal na dokumentasyon  
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - Mga detalye ng API  
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - Mga pinakamahusay na kasanayan  

## Karagdagang Mapagkukunan

### Dokumentasyon
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Kumpletong gabay  
- **[GPT-4 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Mga kakayahan ng modelo  
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Mga tampok sa kaligtasan  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd reference  

### Mga Tutorial
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Unang deployment  
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Paggawa ng chat apps  
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Advanced na mga tampok  

### Mga Tool
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Web-based playground  
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Pagsusulat ng mas mahusay na prompts  
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Tantiya ng paggamit ng token  

### Komunidad
- **[Azure AI Discord](https://discord.gg/azure)** - Humingi ng tulong mula sa komunidad  
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Forum ng Q&A  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Pinakabagong balita  

---

**🎉 Tagumpay!** Na-deploy mo ang Azure OpenAI at nakabuo ng gumaganang chat application. Simulan ang paggalugad sa mga kakayahan ng GPT-4 at mag-eksperimento sa iba't ibang prompts at use cases.

**Mga Tanong?** [Magbukas ng isyu](https://github.com/microsoft/AZD-for-beginners/issues) o tingnan ang [FAQ](../../resources/faq.md)

**Babala sa Gastos:** Tandaan na patakbuhin ang `azd down` kapag tapos na sa pagsubok upang maiwasan ang patuloy na singil (~$50-100/buwan para sa aktibong paggamit).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->