# Azure OpenAI Chat Applikation

**Læringsniveau:** Mellem ⭐⭐ | **Tid:** 35-45 minutter | **Omkostninger:** $50-200/måned

En komplet Azure OpenAI chatapplikation implementeret med Azure Developer CLI (azd). Dette eksempel viser GPT-4 implementering, sikker API-adgang og en simpel chatgrænseflade.

## 🎯 Hvad Du Vil Lære

- Implementere Azure OpenAI Service med GPT-4 model
- Sikre OpenAI API-nøgler med Key Vault
- Bygge en simpel chatgrænseflade med Python
- Overvåge tokenforbrug og omkostninger
- Implementere hastighedsbegrænsning og fejlhåndtering

## 📦 Hvad Der Er Inkluderet

✅ **Azure OpenAI Service** - GPT-4 model implementering  
✅ **Python Chat App** - Simpel kommandolinje chatgrænseflade  
✅ **Key Vault Integration** - Sikker opbevaring af API-nøgler  
✅ **ARM Templates** - Komplet infrastruktur som kode  
✅ **Omkostningsovervågning** - Sporing af tokenforbrug  
✅ **Hastighedsbegrænsning** - Forebyg udtømning af kvoter  

## Arkitektur

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

## Forudsætninger

### Krævet

- **Azure Developer CLI (azd)** - [Installationsvejledning](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-abonnement** med OpenAI adgang - [Anmod om adgang](https://aka.ms/oai/access)
- **Python 3.9+** - [Installer Python](https://www.python.org/downloads/)

### Verificer Forudsætninger

```bash
# Kontroller azd-version (skal være 1.5.0 eller højere)
azd version

# Bekræft Azure-login
azd auth login

# Kontroller Python-version
python --version  # eller python3 --version

# Bekræft OpenAI-adgang (kontroller i Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Vigtigt:** Azure OpenAI kræver ansøgningsgodkendelse. Hvis du ikke har ansøgt, besøg [aka.ms/oai/access](https://aka.ms/oai/access). Godkendelse tager typisk 1-2 arbejdsdage.

## ⏱️ Implementeringstidslinje

| Fase | Varighed | Hvad Sker Der |
|------|----------|--------------|
| Tjek forudsætninger | 2-3 minutter | Verificer OpenAI kvote tilgængelighed |
| Implementer infrastruktur | 8-12 minutter | Opret OpenAI, Key Vault, modelimplementering |
| Konfigurer applikation | 2-3 minutter | Opsæt miljø og afhængigheder |
| **Total** | **12-18 minutter** | Klar til at chatte med GPT-4 |

**Bemærk:** Første gang OpenAI implementeres kan tage længere tid på grund af modelklargøring.

## Hurtig Start

```bash
# Naviger til eksemplet
cd examples/azure-openai-chat

# Initialiser miljø
azd env new myopenai

# Udrul alt (infrastruktur + konfiguration)
azd up
# Du vil blive bedt om at:
# 1. Vælg Azure-abonnement
# 2. Vælg placering med OpenAI-tilgængelighed (f.eks. eastus, eastus2, westus)
# 3. Vent 12-18 minutter på udrulning

# Installer Python-afhængigheder
pip install -r requirements.txt

# Begynd at chatte!
python chat.py
```

**Forventet Output:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verificer Implementering

### Trin 1: Tjek Azure Ressourcer

```bash
# Se deployerede ressourcer
azd show

# Forventet output viser:
# - OpenAI-tjeneste: (ressourcenavn)
# - Key Vault: (ressourcenavn)
# - Deployment: gpt-4
# - Placering: eastus (eller din valgte region)
```

### Trin 2: Test OpenAI API

```bash
# Hent OpenAI endpoint og nøgle
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Test API-opkald
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Forventet Respons:**
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

### Trin 3: Verificer Key Vault Adgang

```bash
# Liste hemmeligheder i Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Forventede Hemmeligheder:**
- `openai-api-key`
- `openai-endpoint`

**Succes Kriterier:**
- ✅ OpenAI service implementeret med GPT-4
- ✅ API-kald returnerer gyldig fuldførelse
- ✅ Hemmeligheder gemt i Key Vault
- ✅ Sporing af tokenforbrug fungerer

## Projektstruktur

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

## Applikationsfunktioner

### Chatgrænseflade (`chat.py`)

Chatapplikationen inkluderer:

- **Samtalehistorik** - Bevarer kontekst på tværs af beskeder
- **Tokenoptælling** - Sporer forbrug og estimerer omkostninger
- **Fejlhåndtering** - Elegant håndtering af hastighedsbegrænsninger og API-fejl
- **Omkostningsestimering** - Real-time omkostningsberegning pr. besked
- **Streaming Support** - Valgfri streaming af svar

### Kommandoer

Mens du chatter, kan du bruge:
- `quit` eller `exit` - Afslut sessionen
- `clear` - Ryd samtalehistorik
- `tokens` - Vis samlet tokenforbrug
- `cost` - Vis estimeret samlet omkostning

### Konfiguration (`config.py`)

Indlæser konfiguration fra miljøvariabler:
```python
AZURE_OPENAI_ENDPOINT  # Fra Key Vault
AZURE_OPENAI_API_KEY   # Fra Key Vault
AZURE_OPENAI_MODEL     # Standard: gpt-4
AZURE_OPENAI_MAX_TOKENS # Standard: 800
```

## Brugs Eksempler

### Grundlæggende Chat

```bash
python chat.py
```

### Chat med Tilpasset Model

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat med Streaming

```bash
python chat.py --stream
```

### Eksempel Samtale

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

## Omkostningsstyring

### Tokenpriser (GPT-4)

| Model | Input (pr. 1K tokens) | Output (pr. 1K tokens) |
|-------|-----------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Estimerede Månedlige Omkostninger

Baseret på brugsniveauer:

| Brugsniveau | Beskeder/Dag | Tokens/Dag | Månedlig Omkostning |
|-------------|--------------|------------|---------------------|
| **Let** | 20 beskeder | 3,000 tokens | $3-5 |
| **Moderat** | 100 beskeder | 15,000 tokens | $15-25 |
| **Tung** | 500 beskeder | 75,000 tokens | $75-125 |

**Basis Infrastruktur Omkostning:** $1-2/måned (Key Vault + minimal compute)

### Tips til Omkostningsoptimering

```bash
# 1. Brug GPT-3.5-Turbo til enklere opgaver (20x billigere)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reducer maks antal tokens for kortere svar
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Overvåg tokenforbrug
python chat.py --show-tokens

# 4. Opsæt budgetadvarsler
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Overvågning

### Se Tokenforbrug

```bash
# I Azure Portal:
# OpenAI Resource → Metrics → Vælg "Token Transaction"

# Eller via Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Se API-Logfiler

```bash
# Stream diagnostiske logfiler
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Forespørgselslogfiler
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Fejlfinding

### Problem: "Access Denied" Fejl

**Symptomer:** 403 Forbidden ved API-kald

**Løsninger:**
```bash
# 1. Bekræft, at OpenAI-adgang er godkendt
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Kontroller, at API-nøglen er korrekt
azd env get-value AZURE_OPENAI_API_KEY

# 3. Bekræft endpoint URL-format
azd env get-value AZURE_OPENAI_ENDPOINT
# Skal være: https://[name].openai.azure.com/
```

### Problem: "Rate Limit Exceeded"

**Symptomer:** 429 For Mange Forespørgsler

**Løsninger:**
```bash
# 1. Kontroller nuværende kvote
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Anmod om kvoteforøgelse (hvis nødvendigt)
# Gå til Azure Portal → OpenAI Resource → Kvoter → Anmod om forøgelse

# 3. Implementer retry-logik (allerede i chat.py)
# Applikationen genforsøger automatisk med eksponentiel backoff
```

### Problem: "Model Not Found"

**Symptomer:** 404 fejl for implementering

**Løsninger:**
```bash
# 1. Liste tilgængelige deploymenter
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Bekræft modelnavn i miljøet
echo $AZURE_OPENAI_MODEL

# 3. Opdater til korrekt deployment-navn
export AZURE_OPENAI_MODEL=gpt-4  # eller gpt-35-turbo
```

### Problem: Høj Latens

**Symptomer:** Langsomme svartider (>5 sekunder)

**Løsninger:**
```bash
# 1. Kontroller regional latenstid
# Udrul til den region, der er tættest på brugerne

# 2. Reducer max_tokens for hurtigere svar
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Brug streaming for bedre brugeroplevelse
python chat.py --stream
```

## Sikkerhedsbedste Praksis

### 1. Beskyt API-nøgler

```bash
# Aldrig forpligt nøgler til kildekontrol
# Brug Key Vault (allerede konfigureret)

# Roter nøgler regelmæssigt
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementer Indholdsfiltrering

```python
# Azure OpenAI inkluderer indbygget indholdsfiltrering
# Konfigurer i Azure Portal:
# OpenAI Ressource → Indholdsfiltre → Opret brugerdefineret filter

# Kategorier: Had, Seksuelt, Vold, Selvskade
# Niveauer: Lav, Medium, Høj filtrering
```

### 3. Brug Managed Identity (Produktion)

```bash
# Til produktionsudrulninger, brug administreret identitet
# i stedet for API-nøgler (kræver app-hosting på Azure)

# Opdater infra/openai.bicep til at inkludere:
# identity: { type: 'SystemAssigned' }
```

## Udvikling

### Kør Lokalt

```bash
# Installer afhængigheder
pip install -r src/requirements.txt

# Indstil miljøvariabler
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Kør applikation
python src/chat.py
```

### Kør Tests

```bash
# Installer testafhængigheder
pip install pytest pytest-cov

# Kør tests
pytest tests/ -v

# Med dækning
pytest tests/ --cov=src --cov-report=html
```

### Opdater Model Implementering

```bash
# Udrul forskellige modelversioner
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

## Ryd Op

```bash
# Slet alle Azure-ressourcer
azd down --force --purge

# Dette fjerner:
# - OpenAI-tjeneste
# - Key Vault (med 90-dages blød sletning)
# - Ressourcegruppe
# - Alle udrulninger og konfigurationer
```

## Næste Skridt

### Udvid Dette Eksempel

1. **Tilføj Webgrænseflade** - Byg React/Vue frontend
   ```bash
   # Tilføj frontend-tjeneste til azure.yaml
   # Udrul til Azure Static Web Apps
   ```

2. **Implementer RAG** - Tilføj dokument søgning med Azure AI Search
   ```python
   # Integrer Azure Cognitive Search
   # Upload dokumenter og opret vektorindeks
   ```

3. **Tilføj Funktionskald** - Aktiver værktøjsbrug
   ```python
   # Definer funktioner i chat.py
   # Lad GPT-4 kalde eksterne API'er
   ```

4. **Multi-Model Support** - Implementer flere modeller
   ```bash
   # Tilføj gpt-35-turbo, embeddings modeller
   # Implementer modelrute-logik
   ```

### Relaterede Eksempler

- **[Retail Multi-Agent](../retail-scenario.md)** - Avanceret multi-agent arkitektur
- **[Database App](../../../../examples/database-app)** - Tilføj vedvarende lagring
- **[Container Apps](../../../../examples/container-app)** - Implementer som containeriseret service

### Læringsressourcer

- 📚 [AZD For Beginners Course](../../README.md) - Hovedkursus
- 📚 [Azure OpenAI Dokumentation](https://learn.microsoft.com/azure/ai-services/openai/) - Officielle dokumenter
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - API detaljer
- 📚 [Ansvarlig AI](https://www.microsoft.com/ai/responsible-ai) - Bedste praksis

## Yderligere Ressourcer

### Dokumentation
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Komplet guide
- **[GPT-4 Modeller](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Modelkapaciteter
- **[Indholdsfiltrering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Sikkerhedsfunktioner
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd reference

### Tutorials
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Første implementering
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Bygge chatapplikationer
- **[Funktionskald](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Avancerede funktioner

### Værktøjer
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Webbaseret playground
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Skriv bedre prompts
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Estimer tokenforbrug

### Fællesskab
- **[Azure AI Discord](https://discord.gg/azure)** - Få hjælp fra fællesskabet
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Q&A forum
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Seneste opdateringer

---

**🎉 Succes!** Du har implementeret Azure OpenAI og bygget en fungerende chatapplikation. Begynd at udforske GPT-4's kapaciteter og eksperimenter med forskellige prompts og anvendelser.

**Spørgsmål?** [Åbn en issue](https://github.com/microsoft/AZD-for-beginners/issues) eller tjek [FAQ](../../resources/faq.md)

**Omkostningsadvarsel:** Husk at køre `azd down`, når du er færdig med at teste for at undgå løbende omkostninger (~$50-100/måned for aktiv brug).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->