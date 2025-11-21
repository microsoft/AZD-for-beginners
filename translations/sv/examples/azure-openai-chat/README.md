<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-21T10:36:56+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "sv"
}
-->
# Azure OpenAI Chat-applikation

**Lärandebana:** Medel ⭐⭐ | **Tid:** 35-45 minuter | **Kostnad:** $50-200/månad

En komplett Azure OpenAI-chatapplikation distribuerad med Azure Developer CLI (azd). Detta exempel visar GPT-4-distribution, säker API-åtkomst och ett enkelt chattgränssnitt.

## 🎯 Vad du kommer att lära dig

- Distribuera Azure OpenAI Service med GPT-4-modell
- Skydda OpenAI API-nycklar med Key Vault
- Bygg ett enkelt chattgränssnitt med Python
- Övervaka tokenanvändning och kostnader
- Implementera hastighetsbegränsning och felhantering

## 📦 Vad som ingår

✅ **Azure OpenAI Service** - GPT-4-modell distribution  
✅ **Python Chat App** - Enkelt kommandoradsbaserat chattgränssnitt  
✅ **Key Vault Integration** - Säker lagring av API-nycklar  
✅ **ARM-mallar** - Komplett infrastruktur som kod  
✅ **Kostnadsövervakning** - Spårning av tokenanvändning  
✅ **Hastighetsbegränsning** - Förhindra att kvoten överskrids  

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

## Förutsättningar

### Krävs

- **Azure Developer CLI (azd)** - [Installationsguide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-abonnemang** med OpenAI-åtkomst - [Ansök om åtkomst](https://aka.ms/oai/access)
- **Python 3.9+** - [Installera Python](https://www.python.org/downloads/)

### Verifiera förutsättningar

```bash
# Kontrollera azd-version (behöver 1.5.0 eller högre)
azd version

# Verifiera Azure-inloggning
azd auth login

# Kontrollera Python-version
python --version  # eller python3 --version

# Verifiera OpenAI-åtkomst (kontrollera i Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Viktigt:** Azure OpenAI kräver ansökningsgodkännande. Om du inte har ansökt, besök [aka.ms/oai/access](https://aka.ms/oai/access). Godkännande tar vanligtvis 1-2 arbetsdagar.

## ⏱️ Tidslinje för distribution

| Fas | Varaktighet | Vad händer |
|-----|-------------|------------|
| Kontroll av förutsättningar | 2-3 minuter | Verifiera OpenAI-kvotens tillgänglighet |
| Distribuera infrastruktur | 8-12 minuter | Skapa OpenAI, Key Vault, modelldistribution |
| Konfigurera applikation | 2-3 minuter | Ställ in miljö och beroenden |
| **Totalt** | **12-18 minuter** | Redo att chatta med GPT-4 |

**Obs:** Första gången OpenAI distribueras kan det ta längre tid på grund av modellförberedelse.

## Snabbstart

```bash
# Navigera till exemplet
cd examples/azure-openai-chat

# Initiera miljön
azd env new myopenai

# Distribuera allt (infrastruktur + konfiguration)
azd up
# Du kommer att uppmanas att:
# 1. Välj Azure-abonnemang
# 2. Välj plats med OpenAI tillgänglighet (t.ex. eastus, eastus2, westus)
# 3. Vänta 12-18 minuter för distribution

# Installera Python-beroenden
pip install -r requirements.txt

# Börja chatta!
python chat.py
```

**Förväntad output:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verifiera distribution

### Steg 1: Kontrollera Azure-resurser

```bash
# Visa distribuerade resurser
azd show

# Förväntad output visar:
# - OpenAI-tjänst: (resursnamn)
# - Nyckelvalv: (resursnamn)
# - Distribution: gpt-4
# - Plats: eastus (eller din valda region)
```

### Steg 2: Testa OpenAI API

```bash
# Hämta OpenAI-endpoint och nyckel
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testa API-anrop
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Förväntat svar:**
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

### Steg 3: Verifiera Key Vault-åtkomst

```bash
# Lista hemligheter i Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Förväntade hemligheter:**
- `openai-api-key`
- `openai-endpoint`

**Kriterier för framgång:**
- ✅ OpenAI-tjänst distribuerad med GPT-4
- ✅ API-anrop returnerar giltigt svar
- ✅ Hemligheter lagrade i Key Vault
- ✅ Spårning av tokenanvändning fungerar

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

### Chattgränssnitt (`chat.py`)

Chattapplikationen inkluderar:

- **Konversationshistorik** - Bibehåller kontext mellan meddelanden
- **Tokenräkning** - Spårar användning och uppskattar kostnader
- **Felhantering** - Smidig hantering av hastighetsbegränsningar och API-fel
- **Kostnadsberäkning** - Realtidsberäkning av kostnad per meddelande
- **Streamingstöd** - Valfritt stöd för strömmande svar

### Kommandon

Under chatt kan du använda:
- `quit` eller `exit` - Avsluta sessionen
- `clear` - Rensa konversationshistorik
- `tokens` - Visa totalt antal använda tokens
- `cost` - Visa uppskattad total kostnad

### Konfiguration (`config.py`)

Läser konfiguration från miljövariabler:
```python
AZURE_OPENAI_ENDPOINT  # Från Key Vault
AZURE_OPENAI_API_KEY   # Från Key Vault
AZURE_OPENAI_MODEL     # Standard: gpt-4
AZURE_OPENAI_MAX_TOKENS # Standard: 800
```

## Användningsexempel

### Grundläggande chatt

```bash
python chat.py
```

### Chatt med anpassad modell

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chatt med streaming

```bash
python chat.py --stream
```

### Exempelkonversation

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

## Kostnadshantering

### Tokenpriser (GPT-4)

| Modell | Input (per 1K tokens) | Output (per 1K tokens) |
|--------|-----------------------|------------------------|
| GPT-4  | $0.03                | $0.06                 |
| GPT-3.5-Turbo | $0.0015       | $0.002                |

### Uppskattade månadskostnader

Baserat på användningsmönster:

| Användningsnivå | Meddelanden/dag | Tokens/dag | Månadskostnad |
|-----------------|-----------------|------------|---------------|
| **Lätt**       | 20 meddelanden  | 3,000 tokens | $3-5          |
| **Måttlig**    | 100 meddelanden | 15,000 tokens | $15-25        |
| **Tung**       | 500 meddelanden | 75,000 tokens | $75-125       |

**Grundläggande infrastrukturkostnad:** $1-2/månad (Key Vault + minimal beräkning)

### Tips för kostnadsoptimering

```bash
# 1. Använd GPT-3.5-Turbo för enklare uppgifter (20x billigare)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Minska max antal tokens för kortare svar
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Övervaka tokenanvändning
python chat.py --show-tokens

# 4. Ställ in budgetvarningar
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Övervakning

### Visa tokenanvändning

```bash
# I Azure Portal:
# OpenAI-resurs → Mätvärden → Välj "Token Transaction"

# Eller via Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Visa API-loggar

```bash
# Strömma diagnostiska loggar
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Frågeloggar
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Felsökning

### Problem: "Access Denied"-fel

**Symptom:** 403 Forbidden vid API-anrop

**Lösningar:**
```bash
# 1. Verifiera att OpenAI-åtkomst är godkänd
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Kontrollera att API-nyckeln är korrekt
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verifiera formatet för endpoint-URL
azd env get-value AZURE_OPENAI_ENDPOINT
# Bör vara: https://[name].openai.azure.com/
```

### Problem: "Rate Limit Exceeded"

**Symptom:** 429 Too Many Requests

**Lösningar:**
```bash
# 1. Kontrollera aktuell kvot
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Begär kvotökning (om det behövs)
# Gå till Azure Portal → OpenAI Resource → Kvoter → Begär ökning

# 3. Implementera återförsökslogik (redan i chat.py)
# Applikationen försöker automatiskt igen med exponentiell backoff
```

### Problem: "Model Not Found"

**Symptom:** 404-fel för distribution

**Lösningar:**
```bash
# 1. Lista tillgängliga distributioner
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifiera modellnamn i miljön
echo $AZURE_OPENAI_MODEL

# 3. Uppdatera till korrekt distributionsnamn
export AZURE_OPENAI_MODEL=gpt-4  # eller gpt-35-turbo
```

### Problem: Hög latens

**Symptom:** Långsamma svarstider (>5 sekunder)

**Lösningar:**
```bash
# 1. Kontrollera regional latens
# Distribuera till region närmast användarna

# 2. Minska max_tokens för snabbare svar
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Använd streaming för bättre UX
python chat.py --stream
```

## Säkerhetsbästa praxis

### 1. Skydda API-nycklar

```bash
# Lämna aldrig nycklar till versionskontroll
# Använd Key Vault (redan konfigurerad)

# Rotera nycklar regelbundet
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementera innehållsfiltrering

```python
# Azure OpenAI inkluderar inbyggd innehållsfiltrering
# Konfigurera i Azure Portal:
# OpenAI-resurs → Innehållsfilter → Skapa anpassat filter

# Kategorier: Hat, Sexuellt, Våld, Självskada
# Nivåer: Låg, Medel, Hög filtrering
```

### 3. Använd hanterad identitet (produktion)

```bash
# För produktionsdistributioner, använd hanterad identitet
# istället för API-nycklar (kräver apphosting på Azure)

# Uppdatera infra/openai.bicep för att inkludera:
# identity: { type: 'SystemAssigned' }
```

## Utveckling

### Kör lokalt

```bash
# Installera beroenden
pip install -r src/requirements.txt

# Ställ in miljövariabler
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Kör applikationen
python src/chat.py
```

### Kör tester

```bash
# Installera testberoenden
pip install pytest pytest-cov

# Kör tester
pytest tests/ -v

# Med täckning
pytest tests/ --cov=src --cov-report=html
```

### Uppdatera modelldistribution

```bash
# Distribuera olika modellversioner
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

## Rensa upp

```bash
# Ta bort alla Azure-resurser
azd down --force --purge

# Detta tar bort:
# - OpenAI-tjänst
# - Key Vault (med 90-dagars mjuk borttagning)
# - Resursgrupp
# - Alla distributioner och konfigurationer
```

## Nästa steg

### Utöka detta exempel

1. **Lägg till webbgränssnitt** - Bygg frontend med React/Vue
   ```bash
   # Lägg till frontendtjänst i azure.yaml
   # Distribuera till Azure Static Web Apps
   ```

2. **Implementera RAG** - Lägg till dokumentssökning med Azure AI Search
   ```python
   # Integrera Azure Cognitive Search
   # Ladda upp dokument och skapa vektorindex
   ```

3. **Lägg till funktionsanrop** - Aktivera verktygsanvändning
   ```python
   # Definiera funktioner i chat.py
   # Låt GPT-4 anropa externa API:er
   ```

4. **Stöd för flera modeller** - Distribuera flera modeller
   ```bash
   # Lägg till gpt-35-turbo, embeddingsmodeller
   # Implementera modellroutningslogik
   ```

### Relaterade exempel

- **[Retail Multi-Agent](../retail-scenario.md)** - Avancerad multi-agent-arkitektur
- **[Database App](../../../../examples/database-app)** - Lägg till persistent lagring
- **[Container Apps](../../../../examples/container-app)** - Distribuera som containeriserad tjänst

### Lärresurser

- 📚 [AZD För Nybörjare Kurs](../../README.md) - Huvudkursens startsida
- 📚 [Azure OpenAI Dokumentation](https://learn.microsoft.com/azure/ai-services/openai/) - Officiella dokument
- 📚 [OpenAI API Referens](https://platform.openai.com/docs/api-reference) - API-detaljer
- 📚 [Ansvarsfull AI](https://www.microsoft.com/ai/responsible-ai) - Bästa praxis

## Ytterligare resurser

### Dokumentation
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Komplett guide
- **[GPT-4 Modeller](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Modellkapaciteter
- **[Innehållsfiltrering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Säkerhetsfunktioner
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-referens

### Tutorials
- **[OpenAI Snabbstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Första distributionen
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Bygga chattapplikationer
- **[Funktionsanrop](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Avancerade funktioner

### Verktyg
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Webbaserad lekplats
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Skriv bättre prompts
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Beräkna tokenanvändning

### Community
- **[Azure AI Discord](https://discord.gg/azure)** - Få hjälp från communityn
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Frågor och svar-forum
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Senaste uppdateringarna

---

**🎉 Framgång!** Du har distribuerat Azure OpenAI och byggt en fungerande chattapplikation. Börja utforska GPT-4:s kapaciteter och experimentera med olika prompts och användningsfall.

**Frågor?** [Öppna ett ärende](https://github.com/microsoft/AZD-for-beginners/issues) eller kolla [FAQ](../../resources/faq.md)

**Kostnadsvarning:** Kom ihåg att köra `azd down` när du är klar med testningen för att undvika löpande kostnader (~$50-100/månad för aktiv användning).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->