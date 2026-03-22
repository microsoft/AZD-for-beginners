# Microsoft Foundry Models Chat-applikasjon

**Læringssti:** Middels ⭐⭐ | **Tid:** 35-45 minutter | **Kostnad:** $50-200/måned

En komplett Microsoft Foundry Models chat-applikasjon distribuert ved bruk av Azure Developer CLI (azd). Dette eksemplet demonstrerer gpt-4.1 distribusjon, sikker API-tilgang, og et enkelt chattegrensesnitt.

## 🎯 Hva Du Vil Lære

- Distribuere Microsoft Foundry Models Service med gpt-4.1-modell  
- Sikre OpenAI API-nøkler med Key Vault  
- Bygge et enkelt chattegrensesnitt med Python  
- Overvåke tokenbruk og kostnader  
- Implementere begrensning av hastighet og feilhåndtering  

## 📦 Hva Som Er Inkludert

✅ **Microsoft Foundry Models Service** - gpt-4.1 modell distribusjon  
✅ **Python Chat App** - Enkelt kommandolinje chat-grensesnitt  
✅ **Key Vault Integrasjon** - Sikker lagring av API-nøkler  
✅ **ARM-maler** - Komplett infrastruktur som kode  
✅ **Kostnadsovervåking** - Sporing av tokenbruk  
✅ **Begrensning av hastighet** - Forhindre kvotauttømming  

## Arkitektur

```mermaid
graph TD
    App[Python Chat-applikasjon<br/>Lokal/sky<br/>Kommandolinjegrensesnitt<br/>Samtalehistorikk<br/>Sporing av tokenbruk] -- "HTTPS (API-nøkkel)" --> Foundry[Microsoft Foundry Modelltjeneste<br/>gpt-4.1 Modell<br/>20K tokens/min kapasitet<br/>Multi-region failover]
    Foundry --> KV[Azure Key Vault<br/>OpenAI API-nøkkel<br/>Endepunkt-URL]
    Foundry -. Administrert identitet .-> KV
```
## Forutsetninger

### Påkrevd

- **Azure Developer CLI (azd)** - [Installasjonsveiledning](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Azure-abonnement** med OpenAI-tilgang - [Be om tilgang](https://aka.ms/oai/access)  
- **Python 3.9+** - [Installer Python](https://www.python.org/downloads/)  

### Verifiser Forutsetninger

```bash
# Sjekk azd-versjon (må være 1.5.0 eller høyere)
azd version

# Verifiser Azure-pålogging
azd auth login

# Sjekk Python-versjon
python --version  # eller python3 --version

# Verifiser OpenAI-tilgang (sjekk i Azure-portalen)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Viktig:** Microsoft Foundry Models krever godkjenning av applikasjon. Hvis du ikke har søkt, besøk [aka.ms/oai/access](https://aka.ms/oai/access). Godkjenning tar vanligvis 1-2 virkedager.

## ⏱️ Distribusjonstidslinje

| Fase | Varighet | Hva Skjer |
|-------|----------|-----------|
| Sjekk av forutsetninger | 2-3 minutter | Verifisere tilgjengelig OpenAI-kvote |
| Distribuere infrastruktur | 8-12 minutter | Opprette OpenAI, Key Vault, modell distribusjon |
| Konfigurere applikasjon | 2-3 minutter | Sette opp miljø og avhengigheter |
| **Totalt** | **12-18 minutter** | Klar til chat med gpt-4.1 |

**Merk:** Første gangs OpenAI-distribusjon kan ta lengre tid på grunn av modellprovisjonering.

## Rask Start

```bash
# Naviger til eksemplet
cd examples/azure-openai-chat

# Initialiser miljø
azd env new myopenai

# Distribuer alt (infrastruktur + konfigurasjon)
azd up
# Du vil bli bedt om å:
# 1. Velg Azure-abonnement
# 2. Velg lokasjon med OpenAI-tilgjengelighet (f.eks., eastus, eastus2, westus)
# 3. Vent 12-18 minutter på distribusjon

# Installer Python-avhengigheter
pip install -r requirements.txt

# Start å chatte!
python chat.py
```

**Forventet Output:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verifiser Distribusjon

### Trinn 1: Sjekk Azure-ressurser

```bash
# Vis distribuerte ressurser
azd show

# Forventet utdata viser:
# - OpenAI-tjeneste: (ressursnavn)
# - Key Vault: (ressursnavn)
# - Distribusjon: gpt-4.1
# - Lokasjon: eastus (eller din valgte region)
```

### Trinn 2: Test OpenAI API

```bash
# Hent OpenAI-endepunkt og nøkkel
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Test API-kall
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
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

### Trinn 3: Verifiser Key Vault-tilgang

```bash
# Liste hemmeligheter i Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Forventede Hemmeligheter:**
- `openai-api-key`  
- `openai-endpoint`  

**Suksesskriterier:**
- ✅ OpenAI-tjeneste distribuert med gpt-4.1  
- ✅ API-kall returnerer gyldig fullføring  
- ✅ Hemmeligheter lagret i Key Vault  
- ✅ Sporing av tokenbruk fungerer  

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

- **Samtalehistorikk** - Opprettholder kontekst mellom meldinger  
- **Token-telling** - Sporer bruk og estimerer kostnader  
- **Feilhåndtering** - Skånsom håndtering av hastighetsbegrensninger og API-feil  
- **Kostnadsestimering** - Sanntidsberegning av kostnad per melding  
- **Streaming-støtte** - Valgfri strømming av svar  

### Kommandoer

Under chatting kan du bruke:  
- `quit` eller `exit` - Avslutt økten  
- `clear` - Tøm samtalehistorikken  
- `tokens` - Vis total tokenbruk  
- `cost` - Vis estimert totalkostnad  

### Konfigurasjon (`config.py`)

Laster konfigurasjon fra miljøvariabler:  
```python
AZURE_OPENAI_ENDPOINT  # Fra Key Vault
AZURE_OPENAI_API_KEY   # Fra Key Vault
AZURE_OPENAI_MODEL     # Standard: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # Standard: 800
```

## Brukseksempler

### Enkel Chat

```bash
python chat.py
```

### Chat med Egendefinert Modell

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat med Strømming

```bash
python chat.py --stream
```

### Eksempel på Samtale

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

## Kostnadsstyring

### Token-prising (gpt-4.1)

| Modell | Inndata (per 1K tokens) | Utdata (per 1K tokens) |
|-------|---------------------------|-------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Estimerte Månedskostnader

Basert på bruksmønstre:

| Bruksnivå | Meldinger/Dag | Tokens/Dag | Månedskostnad |
|-------------|---------------|------------|---------------|
| **Lett** | 20 meldinger | 3 000 tokens | $3-5 |
| **Moderat** | 100 meldinger | 15 000 tokens | $15-25 |
| **Tung** | 500 meldinger | 75 000 tokens | $75-125 |

**Basisinfrastrukturkostnad:** $1-2/måned (Key Vault + minimal beregning)

### Tips for Kostnadsoptimalisering

```bash
# 1. Bruk GPT-3.5-Turbo for enklere oppgaver (20x billigere)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reduser maks antall token for kortere svar
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Overvåk token-bruk
python chat.py --show-tokens

# 4. Sett opp budsjettvarsler
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Overvåking

### Se Tokenbruk

```bash
# I Azure-portalen:
# OpenAI-ressurs → Metrikker → Velg "Token Transaksjon"

# Eller via Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Se API-logger

```bash
# Strøm diagnostikklogger
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

### Problem: "Access Denied" Feil

**Symptomer:** 403 Forbidden ved kall til API

**Løsninger:**  
```bash
# 1. Verifiser at OpenAI-tilgang er godkjent
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Sjekk at API-nøkkelen er korrekt
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verifiser formatet på endepunkt-URL-en
azd env get-value AZURE_OPENAI_ENDPOINT
# Skal være: https://[navn].openai.azure.com/
```

### Problem: "Rate Limit Exceeded"

**Symptomer:** 429 Too Many Requests

**Løsninger:**  
```bash
# 1. Sjekk gjeldende kvote
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. Be om kvoteøkning (hvis nødvendig)
# Gå til Azure-portalen → OpenAI-ressurs → Kvoter → Be om økning

# 3. Implementer retry-logikk (allerede i chat.py)
# Applikasjonen prøver automatisk igjen med eksponentiell tilbakekobling
```

### Problem: "Model Not Found"

**Symptomer:** 404-feil ved distribusjon

**Løsninger:**  
```bash
# 1. Liste tilgjengelige distribusjoner
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Bekreft modellnavn i miljø
echo $AZURE_OPENAI_MODEL

# 3. Oppdater til korrekt distribusjonsnavn
export AZURE_OPENAI_MODEL=gpt-4.1  # eller gpt-35-turbo
```

### Problem: Høy Forsinkelse

**Symptomer:** Langsomme responstider (>5 sekunder)

**Løsninger:**  
```bash
# 1. Sjekk regional ventetid
# Distribuer til region nærmest brukerne

# 2. Reduser max_tokens for raskere responser
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Bruk streaming for bedre brukeropplevelse
python chat.py --stream
```

## Sikkerhetsbeste Fremgangsmåter

### 1. Beskytt API-nøkler

```bash
# Ikke legg nøkler i versjonskontroll
# Bruk Key Vault (allerede konfigurert)

# Roter nøkler regelmessig
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementer Innholdsfiltrering

```python
# Microsoft Foundry Models inkluderer innebygd innholdsfiltrering
# Konfigurer i Azure-portalen:
# OpenAI-ressurs → Innholdsfiltre → Opprett egendefinert filter

# Kategorier: Hat, Seksuelt, Vold, Selvskading
# Nivåer: Lav, Medium, Høy filtrering
```

### 3. Bruk Administrert Identitet (Produksjon)

```bash
# For produksjonsdistribusjoner, bruk administrert identitet
# i stedet for API-nøkler (krever at appen hostes på Azure)

# Oppdater infra/openai.bicep for å inkludere:
# identity: { type: 'SystemAssigned' }
```

## Utvikling

### Kjør Lokalt

```bash
# Installer avhengigheter
pip install -r src/requirements.txt

# Sett miljøvariabler
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# Kjør applikasjon
python src/chat.py
```

### Kjør Tester

```bash
# Installer testavhengigheter
pip install pytest pytest-cov

# Kjør tester
pytest tests/ -v

# Med dekning
pytest tests/ --cov=src --cov-report=html
```

### Oppdater Modell Distribusjon

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

## Rydd Opp

```bash
# Slett alle Azure-ressurser
azd down --force --purge

# Dette fjerner:
# - OpenAI-tjeneste
# - Key Vault (med 90 dagers myk sletting)
# - Ressursgruppe
# - Alle distribusjoner og konfigurasjoner
```

## Neste Steg

### Utvid Dette Eksempelet

1. **Legg til Web-grensesnitt** - Bygg React/Vue frontend  
   ```bash
   # Legg til frontend-tjeneste i azure.yaml
   # Distribuer til Azure Static Web Apps
   ```

2. **Implementer RAG** - Legg til dokumentsøk med Azure AI Search  
   ```python
   # Integrer Azure Cognitive Search
   # Last opp dokumenter og opprett vektorindeks
   ```

3. **Legg til Funksjonskall** - Aktiver verktøybruk  
   ```python
   # Definer funksjoner i chat.py
   # La gpt-4.1 kalle eksterne API-er
   ```

4. **Støtte for Flere Modeller** - Distribuer flere modeller  
   ```bash
   # Legg til gpt-35-turbo, embeddings modeller
   # Implementer modellruterlogikk
   ```

### Relaterte Eksempler

- **[Retail Multi-Agent](../retail-scenario.md)** - Avansert multi-agent arkitektur  
- **[Database App](../../../../examples/database-app)** - Legg til persistent lagring  
- **[Container Apps](../../../../examples/container-app)** - Distribuer som containerisert tjeneste  

### Læringsressurser

- 📚 [AZD For Beginners Course](../../README.md) - Hovedkurs  
- 📚 [Microsoft Foundry Models Dokumentasjon](https://learn.microsoft.com/azure/ai-services/openai/) - Offisielle dokumenter  
- 📚 [OpenAI API Referanse](https://platform.openai.com/docs/api-reference) - API-detaljer  
- 📚 [Ansvarlig AI](https://www.microsoft.com/ai/responsible-ai) - Beste praksis  

## Ytterligere Ressurser

### Dokumentasjon  
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Komplett guide  
- **[gpt-4.1 Modeller](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Modellkapasiteter  
- **[Innholdsfiltrering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Sikkerhetsfunksjoner  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd referanse  

### Veiledninger  
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Første distribusjon  
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Bygge chat-applikasjoner  
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Avanserte funksjoner  

### Verktøy  
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - Nettbasert lekeplass  
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Skrive bedre prompts  
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Estimer tokenbruk  

### Fellesskap  
- **[Azure AI Discord](https://discord.gg/azure)** - Få hjelp fra fellesskapet  
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Spørsmål og svar forum  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Siste oppdateringer  

---

**🎉 Suksess!** Du har distribuert Microsoft Foundry Models og bygget en fungerende chat-applikasjon. Begynn å utforske gpt-4.1 sine muligheter og eksperimenter med ulike prompts og bruksområder.

**Spørsmål?** [Åpne en issue](https://github.com/microsoft/AZD-for-beginners/issues) eller sjekk [FAQ](../../resources/faq.md)

**Kostnadsvarsel:** Husk å kjøre `azd down` når du er ferdig med testing for å unngå løpende kostnader (~$50-100/måned for aktiv bruk).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->