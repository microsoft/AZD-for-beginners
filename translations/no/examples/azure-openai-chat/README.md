<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-21T18:38:45+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "no"
}
-->
# Azure OpenAI Chat-applikasjon

**Læringsnivå:** Middels ⭐⭐ | **Tid:** 35-45 minutter | **Kostnad:** $50-200/måned

En komplett Azure OpenAI chat-applikasjon distribuert ved hjelp av Azure Developer CLI (azd). Dette eksempelet viser GPT-4-distribusjon, sikker API-tilgang og et enkelt chat-grensesnitt.

## 🎯 Hva du vil lære

- Distribuere Azure OpenAI Service med GPT-4-modellen
- Sikre OpenAI API-nøkler med Key Vault
- Bygge et enkelt chat-grensesnitt med Python
- Overvåke tokenbruk og kostnader
- Implementere hastighetsbegrensning og feilhåndtering

## 📦 Hva som er inkludert

✅ **Azure OpenAI Service** - GPT-4-modell distribusjon  
✅ **Python Chat App** - Enkelt kommandolinje-chat-grensesnitt  
✅ **Key Vault-integrasjon** - Sikker lagring av API-nøkler  
✅ **ARM-maler** - Komplett infrastruktur som kode  
✅ **Kostnadsovervåking** - Sporing av tokenbruk  
✅ **Hastighetsbegrensning** - Forhindre kvoteutarming  

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

## Forutsetninger

### Påkrevd

- **Azure Developer CLI (azd)** - [Installasjonsveiledning](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-abonnement** med OpenAI-tilgang - [Søk om tilgang](https://aka.ms/oai/access)
- **Python 3.9+** - [Installer Python](https://www.python.org/downloads/)

### Verifiser forutsetninger

```bash
# Sjekk azd-versjon (trenger 1.5.0 eller høyere)
azd version

# Verifiser Azure-innlogging
azd auth login

# Sjekk Python-versjon
python --version  # eller python3 --versjon

# Verifiser OpenAI-tilgang (sjekk i Azure Portal)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Viktig:** Azure OpenAI krever søknadsgodkjenning. Hvis du ikke har søkt, besøk [aka.ms/oai/access](https://aka.ms/oai/access). Godkjenning tar vanligvis 1-2 virkedager.

## ⏱️ Distribusjonstidslinje

| Fase | Varighet | Hva skjer |
|------|----------|-----------|
| Sjekk forutsetninger | 2-3 minutter | Verifiser tilgjengelighet av OpenAI-kvote |
| Distribuer infrastruktur | 8-12 minutter | Opprett OpenAI, Key Vault, modell-distribusjon |
| Konfigurer applikasjon | 2-3 minutter | Sett opp miljø og avhengigheter |
| **Totalt** | **12-18 minutter** | Klar til å chatte med GPT-4 |

**Merk:** Førstegangs OpenAI-distribusjon kan ta lengre tid på grunn av modellprovisjonering.

## Kom i gang

```bash
# Naviger til eksempelet
cd examples/azure-openai-chat

# Initialiser miljøet
azd env new myopenai

# Distribuer alt (infrastruktur + konfigurasjon)
azd up
# Du vil bli bedt om å:
# 1. Velge Azure-abonnement
# 2. Velge lokasjon med OpenAI-tilgjengelighet (f.eks., eastus, eastus2, westus)
# 3. Vente 12-18 minutter på distribusjon

# Installer Python-avhengigheter
pip install -r requirements.txt

# Start chatting!
python chat.py
```

**Forventet utdata:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verifiser distribusjon

### Trinn 1: Sjekk Azure-ressurser

```bash
# Vis distribuerte ressurser
azd show

# Forventet output viser:
# - OpenAI-tjeneste: (ressursnavn)
# - Key Vault: (ressursnavn)
# - Distribusjon: gpt-4
# - Plassering: eastus (eller din valgte region)
```

### Trinn 2: Test OpenAI API

```bash
# Hent OpenAI-endepunkt og nøkkel
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Test API-anrop
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Forventet respons:**
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

### Trinn 3: Verifiser Key Vault-tilgang

```bash
# Liste hemmeligheter i Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Forventede hemmeligheter:**
- `openai-api-key`
- `openai-endpoint`

**Suksesskriterier:**
- ✅ OpenAI-tjeneste distribuert med GPT-4
- ✅ API-kall returnerer gyldig fullføring
- ✅ Hemmeligheter lagret i Key Vault
- ✅ Tokenbrukssporing fungerer

## Prosjektstruktur

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

## Applikasjonsfunksjoner

### Chat-grensesnitt (`chat.py`)

Chat-applikasjonen inkluderer:

- **Samtalehistorikk** - Bevarer kontekst mellom meldinger
- **Token-telling** - Sporer bruk og estimerer kostnader
- **Feilhåndtering** - Håndterer hastighetsbegrensninger og API-feil
- **Kostnadsestimering** - Sanntids kostnadsberegning per melding
- **Streaming-støtte** - Valgfri streaming av svar

### Kommandoer

Mens du chatter, kan du bruke:
- `quit` eller `exit` - Avslutt økten
- `clear` - Tøm samtalehistorikk
- `tokens` - Vis totalt tokenbruk
- `cost` - Vis estimert total kostnad

### Konfigurasjon (`config.py`)

Laster konfigurasjon fra miljøvariabler:
```python
AZURE_OPENAI_ENDPOINT  # Fra Key Vault
AZURE_OPENAI_API_KEY   # Fra Key Vault
AZURE_OPENAI_MODEL     # Standard: gpt-4
AZURE_OPENAI_MAX_TOKENS # Standard: 800
```

## Brukseksempler

### Grunnleggende chat

```bash
python chat.py
```

### Chat med tilpasset modell

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat med streaming

```bash
python chat.py --stream
```

### Eksempelsamtale

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

## Kostnadsstyring

### Tokenpriser (GPT-4)

| Modell | Input (per 1K tokens) | Output (per 1K tokens) |
|--------|-----------------------|------------------------|
| GPT-4  | $0.03                | $0.06                 |
| GPT-3.5-Turbo | $0.0015       | $0.002                |

### Estimerte månedlige kostnader

Basert på bruksmønstre:

| Bruksnivå | Meldinger/dag | Tokens/dag | Månedlig kostnad |
|-----------|---------------|------------|------------------|
| **Lett**  | 20 meldinger  | 3,000 tokens | $3-5            |
| **Moderat** | 100 meldinger | 15,000 tokens | $15-25         |
| **Tung**  | 500 meldinger | 75,000 tokens | $75-125         |

**Grunnleggende infrastrukturkostnad:** $1-2/måned (Key Vault + minimal databehandling)

### Tips for kostnadsoptimalisering

```bash
# 1. Bruk GPT-3.5-Turbo for enklere oppgaver (20x billigere)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reduser maks antall tokens for kortere svar
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Overvåk tokenbruk
python chat.py --show-tokens

# 4. Sett opp budsjettvarsler
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Overvåking

### Se tokenbruk

```bash
# I Azure-portalen:
# OpenAI Ressurs → Metrikker → Velg "Token Transaksjon"

# Eller via Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Se API-logger

```bash
# Strøm diagnostiske logger
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Spørringslogger
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Feilsøking

### Problem: "Access Denied"-feil

**Symptomer:** 403 Forbidden ved API-kall

**Løsninger:**
```bash
# 1. Verifiser at OpenAI-tilgang er godkjent
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Sjekk at API-nøkkelen er korrekt
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verifiser formatet på endepunkt-URL
azd env get-value AZURE_OPENAI_ENDPOINT
# Skal være: https://[name].openai.azure.com/
```

### Problem: "Rate Limit Exceeded"

**Symptomer:** 429 Too Many Requests

**Løsninger:**
```bash
# 1. Sjekk nåværende kvote
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Be om økning av kvote (hvis nødvendig)
# Gå til Azure Portal → OpenAI Ressurs → Kvoter → Be om økning

# 3. Implementer retry-logikk (allerede i chat.py)
# Applikasjonen prøver automatisk igjen med eksponentiell backoff
```

### Problem: "Model Not Found"

**Symptomer:** 404-feil for distribusjon

**Løsninger:**
```bash
# 1. Liste tilgjengelige distribusjoner
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifiser modellnavn i miljøet
echo $AZURE_OPENAI_MODEL

# 3. Oppdater til riktig distribusjonsnavn
export AZURE_OPENAI_MODEL=gpt-4  # eller gpt-35-turbo
```

### Problem: Høy ventetid

**Symptomer:** Svar tar lang tid (>5 sekunder)

**Løsninger:**
```bash
# 1. Sjekk regional latens
# Distribuer til region nærmest brukerne

# 2. Reduser max_tokens for raskere svar
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Bruk streaming for bedre brukeropplevelse
python chat.py --stream
```

## Sikkerhetspraksis

### 1. Beskytt API-nøkler

```bash
# Aldri legg inn nøkler i kildekontroll
# Bruk Key Vault (allerede konfigurert)

# Roter nøkler regelmessig
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementer innholdsfiltrering

```python
# Azure OpenAI inkluderer innebygd innholdsfiltrering
# Konfigurer i Azure Portal:
# OpenAI Ressurs → Innholdsfiltre → Opprett Tilpasset Filter

# Kategorier: Hat, Seksuelt, Vold, Selvskading
# Nivåer: Lav, Middels, Høy filtrering
```

### 3. Bruk Managed Identity (Produksjon)

```bash
# For produksjonsutplasseringer, bruk administrert identitet
# i stedet for API-nøkler (krever app-hosting på Azure)

# Oppdater infra/openai.bicep for å inkludere:
# identity: { type: 'SystemAssigned' }
```

## Utvikling

### Kjør lokalt

```bash
# Installer avhengigheter
pip install -r src/requirements.txt

# Sett miljøvariabler
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Kjør applikasjonen
python src/chat.py
```

### Kjør tester

```bash
# Installer testavhengigheter
pip install pytest pytest-cov

# Kjør tester
pytest tests/ -v

# Med dekning
pytest tests/ --cov=src --cov-report=html
```

### Oppdater modelldistribusjon

```bash
# Distribuer forskjellige modellversjoner
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

## Rydd opp

```bash
# Slett alle Azure-ressurser
azd down --force --purge

# Dette fjerner:
# - OpenAI-tjeneste
# - Key Vault (med 90-dagers myk sletting)
# - Ressursgruppe
# - Alle distribusjoner og konfigurasjoner
```

## Neste steg

### Utvid dette eksempelet

1. **Legg til webgrensesnitt** - Bygg React/Vue frontend
   ```bash
   # Legg til frontend-tjeneste i azure.yaml
   # Distribuer til Azure Static Web Apps
   ```

2. **Implementer RAG** - Legg til dokumentsøk med Azure AI Search
   ```python
   # Integrer Azure Cognitive Search
   # Last opp dokumenter og opprett vektorindeks
   ```

3. **Legg til funksjonskall** - Aktiver verktøybruk
   ```python
   # Definer funksjoner i chat.py
   # La GPT-4 kalle eksterne API-er
   ```

4. **Støtte for flere modeller** - Distribuer flere modeller
   ```bash
   # Legg til gpt-35-turbo, embeddings-modeller
   # Implementer modellruteringslogikk
   ```

### Relaterte eksempler

- **[Retail Multi-Agent](../retail-scenario.md)** - Avansert multi-agent arkitektur
- **[Database App](../../../../examples/database-app)** - Legg til vedvarende lagring
- **[Container Apps](../../../../examples/container-app)** - Distribuer som containerisert tjeneste

### Læringsressurser

- 📚 [AZD For Beginners Course](../../README.md) - Hovedkurs
- 📚 [Azure OpenAI Dokumentasjon](https://learn.microsoft.com/azure/ai-services/openai/) - Offisielle dokumenter
- 📚 [OpenAI API Referanse](https://platform.openai.com/docs/api-reference) - API-detaljer
- 📚 [Ansvarlig AI](https://www.microsoft.com/ai/responsible-ai) - Beste praksis

## Tilleggsressurser

### Dokumentasjon
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Komplett guide
- **[GPT-4 Modeller](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Modellkapasiteter
- **[Innholdsfiltrering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Sikkerhetsfunksjoner
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-referanse

### Veiledninger
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Første distribusjon
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Bygge chat-applikasjoner
- **[Funksjonskall](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Avanserte funksjoner

### Verktøy
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Nettbasert lekeplass
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Skriv bedre forespørsler
- **[Token Kalkulator](https://platform.openai.com/tokenizer)** - Estimer tokenbruk

### Fellesskap
- **[Azure AI Discord](https://discord.gg/azure)** - Få hjelp fra fellesskapet
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Spørsmål og svar-forum
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Siste oppdateringer

---

**🎉 Gratulerer!** Du har distribuert Azure OpenAI og bygget en fungerende chat-applikasjon. Begynn å utforske GPT-4s muligheter og eksperimenter med ulike forespørsler og bruksområder.

**Spørsmål?** [Åpne en sak](https://github.com/microsoft/AZD-for-beginners/issues) eller sjekk [FAQ](../../resources/faq.md)

**Kostnadsvarsel:** Husk å kjøre `azd down` når du er ferdig med testing for å unngå løpende kostnader (~$50-100/måned for aktiv bruk).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->