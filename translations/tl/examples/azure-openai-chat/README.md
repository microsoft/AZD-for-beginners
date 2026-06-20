# Aplikasyon ng Chat ng Microsoft Foundry Models

**Landas ng Pag-aaral:** Katamtaman ⭐⭐ | **Oras:** 35-45 minuto | **Gastos:** $50-200/buwan

Isang kumpletong Microsoft Foundry Models chat application na nakadeploy gamit ang Azure Developer CLI (azd). Ipinapakita ng halimbawang ito ang deployment ng gpt-4.1, secure na access sa API, at isang simpleng chat interface.

## 🎯 Ano ang Matututunan Mo

- I-deploy ang Microsoft Foundry Models Service gamit ang modelong gpt-4.1
- I-secure ang OpenAI API keys gamit ang Key Vault
- Gumawa ng simpleng chat interface gamit ang Python
- I-monitor ang paggamit ng token at mga gastos
- Magpatupad ng rate limiting at error handling

## 📦 Ano ang Kasama

✅ **Microsoft Foundry Models Service** - deployment ng modelong gpt-4.1  
✅ **Python Chat App** - Simpleng command-line chat interface  
✅ **Key Vault Integration** - Secure na storage ng API key  
✅ **ARM Templates** - Kumpletong infrastructure as code  
✅ **Cost Monitoring** - Pagsubaybay ng paggamit ng token  
✅ **Rate Limiting** - Pigilan ang pagkaubos ng quota  

## Architecture

```mermaid
graph TD
    App[Aplikasyon ng Chat na Python<br/>Lokal/Ulapan<br/>Command-line na interface<br/>Kasaysayan ng pag-uusap<br/>Pagsubaybay sa paggamit ng mga token] -- "HTTPS (Susi ng API)" --> Foundry[Serbisyo ng Microsoft Foundry Models<br/>Modelo gpt-4.1<br/>Kapasidad na 20K token/min<br/>Failover sa maraming rehiyon]
    Foundry --> KV[Azure Key Vault<br/>Susi ng OpenAI API<br/>URL ng Endpoint]
    Foundry -. Pinamamahalaang Pagkakakilanlan .-> KV
```

## Mga Kinakailangan

### Kinakailangan

- **Azure Developer CLI (azd)** - [Gabay sa pag-install](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** na may access sa OpenAI - [Humiling ng access](https://aka.ms/oai/access)
- **Python 3.9+** - [I-install ang Python](https://www.python.org/downloads/)

### Suriin ang Mga Kinakailangan

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

> **⚠️ Mahalaga:** Nangangailangan ang Microsoft Foundry Models ng pag-apruba ng aplikasyon. Kung hindi ka pa nakapag-aplay, bisitahin ang [aka.ms/oai/access](https://aka.ms/oai/access). Karaniwang tumatagal ng 1-2 araw ng negosyo ang pag-apruba.

## ⏱️ Timeline ng Deployment

| Phase | Duration | What Happens |
|-------|----------|--------------|
| Pagsusuri ng Mga Kinakailangan | 2-3 minuto | Suriin ang pagkakaroon ng quota ng OpenAI |
| I-deploy ang imprastruktura | 8-12 minuto | Lumikha ng OpenAI, Key Vault, deployment ng modelo |
| I-configure ang aplikasyon | 2-3 minuto | I-set up ang kapaligiran at mga dependency |
| **Total** | **12-18 minuto** | Handang makipag-chat gamit ang gpt-4.1 |

**Tandaan:** Ang unang deployment ng OpenAI ay maaaring mas tumagal dahil sa provisioning ng modelo.

## Mabilis na Panimula

```bash
# Pumunta sa halimbawa
cd examples/azure-openai-chat

# Ihanda ang kapaligiran
azd env new myopenai

# I-deploy ang lahat (imprastruktura + konfigurasyon)
azd up
# Hihilingin sa iyo na:
# 1. Piliin ang Azure subscription
# 2. Pumili ng lokasyon kung saan available ang OpenAI (hal., eastus, eastus2, westus)
# 3. Maghintay ng 12-18 minuto para sa deployment

# I-install ang mga dependency ng Python
pip install -r requirements.txt

# Magsimulang makipag-chat!
python chat.py
```

**Inaasahang Output:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Suriin ang Pag-deploy

### Hakbang 1: Suriin ang Mga Azure Resources

```bash
# Tingnan ang mga na-deploy na resource
azd show

# Ipinapakita ng inaasahang output:
# - Serbisyo ng OpenAI: (pangalan ng resource)
# - Key Vault: (pangalan ng resource)
# - Pag-deploy: gpt-4.1
# - Lokasyon: eastus (o ang napili mong rehiyon)
```

### Hakbang 2: Subukan ang OpenAI API

```bash
# Kunin ang endpoint at susi para sa OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Subukan ang tawag sa API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
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

### Hakbang 3: Suriin ang Access sa Key Vault

```bash
# Ilista ang mga lihim sa Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Inaasahang Mga Sekreto:**
- `openai-api-key`
- `openai-endpoint`

**Mga Pamantayan ng Tagumpay:**
- ✅ Nai-deploy ang OpenAI service gamit ang gpt-4.1
- ✅ Nagbabalik ang API call ng wastong completion
- ✅ Naka-store ang mga sekreto sa Key Vault
- ✅ Gumagana ang pagsubaybay ng paggamit ng token

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

### Interface ng Chat (`chat.py`)

Kasama sa chat application ang:

- **Conversation History** - Nananatili ang konteksto sa mga mensahe
- **Token Counting** - Sinusubaybayan ang paggamit at tinatantya ang gastos
- **Error Handling** - Maayos na paghawak ng rate limits at mga error sa API
- **Cost Estimation** - Real-time na kalkulasyon ng gastos kada mensahe
- **Streaming Support** - Opsyonal na streaming na mga tugon

### Mga Utos

Habang nagcha-chat, maaari mong gamitin:
- `quit` o `exit` - Tapusin ang sesyon
- `clear` - I-clear ang kasaysayan ng pag-uusap
- `tokens` - Ipakita ang kabuuang paggamit ng token
- `cost` - Ipakita ang tinatayang kabuuang gastos

### Konfigurasyon (`config.py`)

Naglo-load ng konfigurasyon mula sa mga environment variable:
```python
AZURE_OPENAI_ENDPOINT  # Mula sa Key Vault
AZURE_OPENAI_API_KEY   # Mula sa Key Vault
AZURE_OPENAI_MODEL     # Default: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # Default: 800
```

## Mga Halimbawa ng Paggamit

### Pangunahing Chat

```bash
python chat.py
```

### Chat gamit ang Custom na Modelo

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat na may Streaming

```bash
python chat.py --stream
```

### Halimbawa ng Pag-uusap

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

## Pamamahala ng Gastos

### Presyo ng Token (gpt-4.1)

| Model | Input (bawat 1K token) | Output (bawat 1K token) |
|-------|------------------------|-------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Tinatayang Buwanang Gastos

Batay sa mga pattern ng paggamit:

| Antas ng Paggamit | Mga Mensahe/Araw | Mga Token/Araw | Buwanang Gastos |
|-------------------|------------------|----------------|-----------------|
| **Magaan** | 20 messages | 3,000 tokens | $3-5 |
| **Katamtaman** | 100 messages | 15,000 tokens | $15-25 |
| **Mabigat** | 500 messages | 75,000 tokens | $75-125 |

**Batayang Gastos ng Imprastruktura:** $1-2/buwan (Key Vault + minimal compute)

### Mga Tip sa Pag-optimize ng Gastos

```bash
# 1. Gamitin ang GPT-3.5-Turbo para sa mas simpleng mga gawain (20x na mas mura)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Bawasan ang maximum na tokens para sa mas maiikling mga sagot
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Subaybayan ang paggamit ng tokens
python chat.py --show-tokens

# 4. Itakda ang mga alerto para sa badyet
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Pagmamanman

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

### Tingnan ang Mga Log ng API

```bash
# I-stream ang mga diagnostic log
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Mga log ng query
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Paglutas ng Suliranin

### Isyu: "Access Denied" Error

**Sintomas:** 403 Forbidden kapag tumatawag ng API

**Mga Solusyon:**
```bash
# 1. Tiyaking aprubado ang pag-access sa OpenAI
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Suriin na tama ang API key
azd env get-value AZURE_OPENAI_API_KEY

# 3. Suriin ang format ng endpoint URL
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
  --deployment-name gpt-4.1

# 2. Humiling ng pagtaas ng quota (kung kinakailangan)
# Pumunta sa Azure Portal → OpenAI Resource → Quotas → Request Increase

# 3. Ipatupad ang retry logic (nasa chat.py na)
# Awtomatikong muling sinusubukan ng aplikasyon ang mga kahilingan gamit ang eksponensyal na backoff
```

### Isyu: "Model Not Found"

**Sintomas:** 404 error para sa deployment

**Mga Solusyon:**
```bash
# 1. Ilista ang mga magagamit na deployment
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Suriin ang pangalan ng modelo sa kapaligiran
echo $AZURE_OPENAI_MODEL

# 3. I-update sa tamang pangalan ng deployment
export AZURE_OPENAI_MODEL=gpt-4.1  # o gpt-35-turbo
```

### Isyu: High Latency

**Sintomas:** Mabagal na oras ng tugon (>5 seconds)

**Mga Solusyon:**
```bash
# 1. Suriin ang pagkaantala sa rehiyon
# I-deploy sa rehiyong pinakamalapit sa mga gumagamit

# 2. Bawasan ang max_tokens para sa mas mabilis na mga tugon
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Gumamit ng streaming para sa mas magandang karanasan ng gumagamit
python chat.py --stream
```

## Pinakamahusay na Kasanayan sa Seguridad

### 1. Protektahan ang Mga API Key

```bash
# Huwag kailanman i-commit ang mga susi sa source control
# Gumamit ng Key Vault (naka-configure na)

# Palitan ang mga susi nang regular
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Magpatupad ng Pagsasala ng Nilalaman

```python
# May built-in na pag-filter ng nilalaman ang Microsoft Foundry Models
# I-configure sa Azure Portal:
# OpenAI Resource → Content Filters → Lumikha ng Pasadyang Filter

# Mga Kategorya: Poot, Sekswal, Karahasan, Pananakit sa sarili
# Mga Antas ng pag-filter: Mababang, Katamtaman, Mataas
```

### 3. Gumamit ng Managed Identity (Produksyon)

```bash
# Para sa mga deployment sa production, gumamit ng managed identity
# sa halip na API keys (nangangailangan ng pag-ho-host ng app sa Azure)

# I-update ang infra/openai.bicep upang isama:
# identity: { type: 'SystemAssigned' }
```

## Pag-develop

### Patakbuhin nang Lokal

```bash
# I-install ang mga dependensya
pip install -r src/requirements.txt

# Itakda ang mga variable ng kapaligiran
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# Patakbuhin ang aplikasyon
python src/chat.py
```

### Patakbuhin ang Mga Test

```bash
# I-install ang mga dependency para sa pagsubok
pip install pytest pytest-cov

# Patakbuhin ang mga pagsubok
pytest tests/ -v

# Gamit ang coverage
pytest tests/ --cov=src --cov-report=html
```

### I-update ang Deployment ng Modelo

```bash
# I-deploy ang ibang bersyon ng modelo
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

## Linisin

```bash
# Tanggalin ang lahat ng resources ng Azure
azd down --force --purge

# Tatanggalin nito:
# - Serbisyo ng OpenAI
# - Key Vault (na may 90-araw na soft delete)
# - Grupo ng mga resource
# - Lahat ng mga deployment at mga konfigurasyon
```

## Mga Susunod na Hakbang

### Palawakin ang Halimbawang Ito

1. **Magdagdag ng Web Interface** - Bumuo ng frontend gamit ang React/Vue  
   ```bash
   # Idagdag ang serbisyo ng frontend sa azure.yaml
   # I-deploy sa Azure Static Web Apps
   ```

2. **I-implement ang RAG** - Magdagdag ng paghahanap ng dokumento gamit ang Azure AI Search  
   ```python
   # Isama ang Azure AI Search
   # Mag-upload ng mga dokumento at lumikha ng index ng vector
   ```

3. **Magdagdag ng Function Calling** - Paganahin ang paggamit ng mga tool  
   ```python
   # Tukuyin ang mga function sa chat.py
   # Pahintulutan ang gpt-4.1 na tumawag sa mga external na API
   ```

4. **Suporta sa Maramihang Modelo** - I-deploy ang maramihang modelo  
   ```bash
   # Magdagdag ng gpt-35-turbo at mga modelo ng embeddings
   # Ipatupad ang lohika ng pag-ruta ng modelo
   ```

### Mga Kaugnay na Halimbawa

- **[Retail Multi-Agent](../retail-scenario.md)** - Pinahusay na arkitektura ng multi-agent
- **[Aplikasyon ng Database](../../../../examples/database-app)** - Magdagdag ng persistenteng storage
- **[Container Apps](../../../../examples/container-app)** - I-deploy bilang serbisyong naka-container

### Mga Mapagkukunan sa Pagkatuto

- 📚 [AZD For Beginners Course](../../README.md) - Pangunahing pahina ng kurso
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - Opisyal na dokumentasyon
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - Mga detalye ng API
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - Pinakamahusay na kasanayan

## Karagdagang Mapagkukunan

### Dokumentasyon
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Kumpletong gabay
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Mga kakayahan ng modelo
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Mga tampok sa kaligtasan
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - sanggunian para sa azd

### Mga Tutorial
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Unang deployment
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Paggawa ng chat apps
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Mga advanced na tampok

### Mga Tool
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - Web-based playground
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Pagsulat ng mas mahusay na prompts
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Tantyahin ang paggamit ng token

### Komunidad
- **[Azure AI Discord](https://discord.gg/azure)** - Humingi ng tulong mula sa komunidad
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Forum ng Q&A
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Pinakabagong mga update

---

**🎉 Tagumpay!** Nai-deploy mo ang Microsoft Foundry Models at nakabuo ka ng gumaganang chat application. Simulan ang pag-explore sa mga kakayahan ng gpt-4.1 at subukan ang iba't ibang prompts at mga use case.

**May mga tanong?** [Magbukas ng isyu](https://github.com/microsoft/AZD-for-beginners/issues) o tingnan ang [FAQ](../../resources/faq.md)

**Babala sa Gastos:** Tandaan na patakbuhin ang `azd down` kapag tapos na sa pag-test upang maiwasan ang patuloy na singil (~$50-100/buwan para sa aktibong paggamit).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->