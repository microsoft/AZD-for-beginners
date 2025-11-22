<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-21T18:43:58+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "nl"
}
-->
# Azure OpenAI Chat Applicatie

**Leerniveau:** Gemiddeld ⭐⭐ | **Tijd:** 35-45 minuten | **Kosten:** $50-200/maand

Een complete Azure OpenAI chatapplicatie geïmplementeerd met Azure Developer CLI (azd). Dit voorbeeld toont de implementatie van GPT-4, veilige API-toegang en een eenvoudige chatinterface.

## 🎯 Wat Je Gaat Leren

- Azure OpenAI Service implementeren met GPT-4 model
- OpenAI API-sleutels beveiligen met Key Vault
- Een eenvoudige chatinterface bouwen met Python
- Tokengebruik en kosten monitoren
- Rate limiting en foutafhandeling implementeren

## 📦 Wat Is Inbegrepen

✅ **Azure OpenAI Service** - GPT-4 model implementatie  
✅ **Python Chat App** - Eenvoudige command-line chatinterface  
✅ **Key Vault Integratie** - Veilige opslag van API-sleutels  
✅ **ARM Templates** - Complete infrastructuur als code  
✅ **Kostenmonitoring** - Tokengebruik bijhouden  
✅ **Rate Limiting** - Voorkomen van quota-uitputting  

## Architectuur

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

## Vereisten

### Vereist

- **Azure Developer CLI (azd)** - [Installatiehandleiding](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-abonnement** met OpenAI-toegang - [Toegang aanvragen](https://aka.ms/oai/access)
- **Python 3.9+** - [Python installeren](https://www.python.org/downloads/)

### Controleer Vereisten

```bash
# Controleer azd-versie (minimaal 1.5.0 of hoger nodig)
azd version

# Verifieer Azure-login
azd auth login

# Controleer Python-versie
python --version  # of python3 --versie

# Verifieer OpenAI-toegang (controleer in Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Belangrijk:** Azure OpenAI vereist goedkeuring van de aanvraag. Als je nog niet hebt aangevraagd, ga naar [aka.ms/oai/access](https://aka.ms/oai/access). Goedkeuring duurt meestal 1-2 werkdagen.

## ⏱️ Implementatietijdlijn

| Fase | Duur | Wat Gebeurt Er |
|------|------|----------------|
| Controle vereisten | 2-3 minuten | Controleer beschikbaarheid OpenAI-quota |
| Infrastructuur implementeren | 8-12 minuten | Maak OpenAI, Key Vault, modelimplementatie |
| Applicatie configureren | 2-3 minuten | Stel omgeving en afhankelijkheden in |
| **Totaal** | **12-18 minuten** | Klaar om te chatten met GPT-4 |

**Opmerking:** De eerste implementatie van OpenAI kan langer duren vanwege modelprovisioning.

## Snelstart

```bash
# Navigeer naar het voorbeeld
cd examples/azure-openai-chat

# Initialiseer omgeving
azd env new myopenai

# Implementeer alles (infrastructuur + configuratie)
azd up
# Je wordt gevraagd om:
# 1. Selecteer Azure-abonnement
# 2. Kies locatie met OpenAI-beschikbaarheid (bijv. eastus, eastus2, westus)
# 3. Wacht 12-18 minuten op implementatie

# Installeer Python-afhankelijkheden
pip install -r requirements.txt

# Begin met chatten!
python chat.py
```

**Verwachte Output:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Implementatie Verifiëren

### Stap 1: Controleer Azure Resources

```bash
# Bekijk ingezette resources
azd show

# Verwachte output toont:
# - OpenAI Service: (resource naam)
# - Key Vault: (resource naam)
# - Implementatie: gpt-4
# - Locatie: eastus (of uw geselecteerde regio)
```

### Stap 2: Test OpenAI API

```bash
# Verkrijg OpenAI endpoint en sleutel
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Test API-aanroep
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Verwachte Reactie:**
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

### Stap 3: Controleer Key Vault Toegang

```bash
# Lijst geheimen in Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Verwachte Geheimen:**
- `openai-api-key`
- `openai-endpoint`

**Succescriteria:**
- ✅ OpenAI-service geïmplementeerd met GPT-4
- ✅ API-aanroep retourneert geldige completion
- ✅ Geheimen opgeslagen in Key Vault
- ✅ Tokengebruik monitoring werkt

## Projectstructuur

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

## Applicatiefuncties

### Chatinterface (`chat.py`)

De chatapplicatie bevat:

- **Gesprekshistorie** - Behoudt context tussen berichten
- **Token Telling** - Houdt gebruik bij en schat kosten
- **Foutafhandeling** - Vriendelijke afhandeling van rate limits en API-fouten
- **Kostenraming** - Real-time kostenberekening per bericht
- **Streaming Ondersteuning** - Optionele streamingreacties

### Commando's

Tijdens het chatten kun je gebruiken:
- `quit` of `exit` - Beëindig de sessie
- `clear` - Wis gesprekshistorie
- `tokens` - Toon totaal tokengebruik
- `cost` - Toon geschatte totale kosten

### Configuratie (`config.py`)

Laadt configuratie vanuit omgevingsvariabelen:
```python
AZURE_OPENAI_ENDPOINT  # Van Key Vault
AZURE_OPENAI_API_KEY   # Van Key Vault
AZURE_OPENAI_MODEL     # Standaard: gpt-4
AZURE_OPENAI_MAX_TOKENS # Standaard: 800
```

## Gebruik Voorbeelden

### Basis Chat

```bash
python chat.py
```

### Chat met Aangepast Model

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat met Streaming

```bash
python chat.py --stream
```

### Voorbeeldgesprek

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

## Kostenbeheer

### Tokenprijzen (GPT-4)

| Model | Input (per 1K tokens) | Output (per 1K tokens) |
|-------|-----------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Geschatte Maandelijkse Kosten

Gebaseerd op gebruikspatronen:

| Gebruiksniveau | Berichten/Dag | Tokens/Dag | Maandelijkse Kosten |
|----------------|---------------|------------|---------------------|
| **Licht** | 20 berichten | 3.000 tokens | $3-5 |
| **Gemiddeld** | 100 berichten | 15.000 tokens | $15-25 |
| **Zwaar** | 500 berichten | 75.000 tokens | $75-125 |

**Basis Infrastructuurkosten:** $1-2/maand (Key Vault + minimale compute)

### Kostenoptimalisatietips

```bash
# 1. Gebruik GPT-3.5-Turbo voor eenvoudigere taken (20x goedkoper)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Verminder maximale tokens voor kortere antwoorden
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Houd het tokengebruik in de gaten
python chat.py --show-tokens

# 4. Stel budgetmeldingen in
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitoring

### Bekijk Tokengebruik

```bash
# In Azure Portal:
# OpenAI Resource → Metrics → Selecteer "Token Transaction"

# Of via Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Bekijk API Logs

```bash
# Stream diagnostische logs
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Query logs
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Probleemoplossing

### Probleem: "Toegang Geweigerd" Fout

**Symptomen:** 403 Forbidden bij API-aanroep

**Oplossingen:**
```bash
# 1. Verifieer of toegang tot OpenAI is goedgekeurd
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Controleer of de API-sleutel correct is
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verifieer het formaat van de endpoint-URL
azd env get-value AZURE_OPENAI_ENDPOINT
# Moet zijn: https://[naam].openai.azure.com/
```

### Probleem: "Rate Limit Overschreden"

**Symptomen:** 429 Too Many Requests

**Oplossingen:**
```bash
# 1. Controleer huidige quota
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Vraag quotaverhoging aan (indien nodig)
# Ga naar Azure Portal → OpenAI Resource → Quotas → Verhoging aanvragen

# 3. Implementeer retry-logica (al aanwezig in chat.py)
# De applicatie probeert automatisch opnieuw met exponentiële backoff
```

### Probleem: "Model Niet Gevonden"

**Symptomen:** 404 fout voor implementatie

**Oplossingen:**
```bash
# 1. Lijst beschikbare deployments
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifieer modelnaam in omgeving
echo $AZURE_OPENAI_MODEL

# 3. Werk bij naar juiste deploymentnaam
export AZURE_OPENAI_MODEL=gpt-4  # of gpt-35-turbo
```

### Probleem: Hoge Latentie

**Symptomen:** Trage reactietijden (>5 seconden)

**Oplossingen:**
```bash
# 1. Controleer regionale latentie
# Implementeer in de regio die het dichtst bij de gebruikers ligt

# 2. Verminder max_tokens voor snellere reacties
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Gebruik streaming voor betere UX
python chat.py --stream
```

## Beveiligingsrichtlijnen

### 1. Bescherm API-sleutels

```bash
# Nooit sleutels in versiebeheer opnemen
# Gebruik Key Vault (al geconfigureerd)

# Draai sleutels regelmatig
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementeer Inhoudsfiltering

```python
# Azure OpenAI bevat ingebouwde inhoudsfiltering
# Configureren in Azure Portal:
# OpenAI Resource → Inhoudsfilters → Aangepast filter maken

# Categorieën: Haat, Seksueel, Geweld, Zelfbeschadiging
# Niveaus: Lage, Middelmatige, Hoge filtering
```

### 3. Gebruik Managed Identity (Productie)

```bash
# Gebruik voor productie-implementaties een beheerde identiteit
# in plaats van API-sleutels (vereist app-hosting op Azure)

# Werk infra/openai.bicep bij om het volgende op te nemen:
# identity: { type: 'SystemAssigned' }
```

## Ontwikkeling

### Lokaal Uitvoeren

```bash
# Installeer afhankelijkheden
pip install -r src/requirements.txt

# Stel omgevingsvariabelen in
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Applicatie uitvoeren
python src/chat.py
```

### Tests Uitvoeren

```bash
# Installeer testafhankelijkheden
pip install pytest pytest-cov

# Voer tests uit
pytest tests/ -v

# Met dekking
pytest tests/ --cov=src --cov-report=html
```

### Modelimplementatie Bijwerken

```bash
# Implementeer verschillende modelversies
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

## Opruimen

```bash
# Verwijder alle Azure-resources
azd down --force --purge

# Dit verwijdert:
# - OpenAI-service
# - Key Vault (met 90 dagen zachte verwijdering)
# - Resourcegroep
# - Alle implementaties en configuraties
```

## Volgende Stappen

### Breid Dit Voorbeeld Uit

1. **Voeg Webinterface Toe** - Bouw een React/Vue frontend
   ```bash
   # Voeg frontend-service toe aan azure.yaml
   # Implementeer naar Azure Static Web Apps
   ```

2. **Implementeer RAG** - Voeg documentzoekfunctie toe met Azure AI Search
   ```python
   # Integreer Azure Cognitive Search
   # Upload documenten en maak vectorindex
   ```

3. **Voeg Functieaanroepen Toe** - Schakel toolgebruik in
   ```python
   # Definieer functies in chat.py
   # Laat GPT-4 externe API's aanroepen
   ```

4. **Ondersteuning Voor Meerdere Modellen** - Implementeer meerdere modellen
   ```bash
   # Voeg gpt-35-turbo, embeddings modellen toe
   # Implementeer model routeringslogica
   ```

### Gerelateerde Voorbeelden

- **[Retail Multi-Agent](../retail-scenario.md)** - Geavanceerde multi-agent architectuur
- **[Database App](../../../../examples/database-app)** - Voeg persistente opslag toe
- **[Container Apps](../../../../examples/container-app)** - Implementeer als containerized service

### Leermiddelen

- 📚 [AZD Voor Beginners Cursus](../../README.md) - Hoofdcursus
- 📚 [Azure OpenAI Documentatie](https://learn.microsoft.com/azure/ai-services/openai/) - Officiële documentatie
- 📚 [OpenAI API Referentie](https://platform.openai.com/docs/api-reference) - API details
- 📚 [Verantwoordelijke AI](https://www.microsoft.com/ai/responsible-ai) - Best practices

## Aanvullende Bronnen

### Documentatie
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Complete gids
- **[GPT-4 Modellen](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Modelmogelijkheden
- **[Inhoudsfiltering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Veiligheidsfuncties
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd referentie

### Tutorials
- **[OpenAI Snelstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Eerste implementatie
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Chatapps bouwen
- **[Functieaanroepen](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Geavanceerde functies

### Tools
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Webgebaseerde playground
- **[Prompt Engineering Gids](https://platform.openai.com/docs/guides/prompt-engineering)** - Betere prompts schrijven
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Tokengebruik schatten

### Community
- **[Azure AI Discord](https://discord.gg/azure)** - Hulp van de community
- **[GitHub Discussies](https://github.com/Azure-Samples/openai/discussions)** - Q&A forum
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Laatste updates

---

**🎉 Succes!** Je hebt Azure OpenAI geïmplementeerd en een werkende chatapplicatie gebouwd. Begin met het verkennen van GPT-4's mogelijkheden en experimenteer met verschillende prompts en use cases.

**Vragen?** [Open een issue](https://github.com/microsoft/AZD-for-beginners/issues) of bekijk de [FAQ](../../resources/faq.md)

**Kostenwaarschuwing:** Vergeet niet `azd down` uit te voeren wanneer je klaar bent met testen om doorlopende kosten (~$50-100/maand voor actief gebruik) te vermijden.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->