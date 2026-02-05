# Azure OpenAI Pokalbių Programa

**Mokymosi lygis:** Vidutinis ⭐⭐ | **Laikas:** 35-45 minutės | **Kaina:** $50-200/mėn

Pilnai veikianti Azure OpenAI pokalbių programa, įdiegta naudojant Azure Developer CLI (azd). Šis pavyzdys demonstruoja GPT-4 diegimą, saugų API prieigą ir paprastą pokalbių sąsają.

## 🎯 Ko Išmoksite

- Diegti Azure OpenAI paslaugą su GPT-4 modeliu
- Saugoti OpenAI API raktus Key Vault
- Kurti paprastą pokalbių sąsają su Python
- Stebėti žetonų naudojimą ir išlaidas
- Įgyvendinti užklausų ribojimą ir klaidų valdymą

## 📦 Kas Įtraukta

✅ **Azure OpenAI paslauga** - GPT-4 modelio diegimas  
✅ **Python pokalbių programa** - Paprasta komandų eilutės pokalbių sąsaja  
✅ **Key Vault integracija** - Saugus API raktų saugojimas  
✅ **ARM šablonai** - Pilna infrastruktūra kaip kodas  
✅ **Išlaidų stebėjimas** - Žetonų naudojimo sekimas  
✅ **Užklausų ribojimas** - Apsauga nuo kvotų išnaudojimo  

## Architektūra

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

## Reikalavimai

### Būtini

- **Azure Developer CLI (azd)** - [Diegimo vadovas](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure prenumerata** su OpenAI prieiga - [Prašyti prieigos](https://aka.ms/oai/access)
- **Python 3.9+** - [Atsisiųsti Python](https://www.python.org/downloads/)

### Patikrinkite Reikalavimus

```bash
# Patikrinkite azd versiją (reikia 1.5.0 ar naujesnės)
azd version

# Patikrinkite Azure prisijungimą
azd auth login

# Patikrinkite Python versiją
python --version  # arba python3 --version

# Patikrinkite OpenAI prieigą (patikrinkite Azure portale)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Svarbu:** Azure OpenAI reikalauja paraiškos patvirtinimo. Jei dar nepateikėte, apsilankykite [aka.ms/oai/access](https://aka.ms/oai/access). Patvirtinimas paprastai trunka 1-2 darbo dienas.

## ⏱️ Diegimo Laiko Juosta

| Etapas | Trukmė | Kas Vyksta |
|--------|--------|-----------|
| Reikalavimų patikrinimas | 2-3 minutės | Patikrinama OpenAI kvotų prieinamumas |
| Infrastruktūros diegimas | 8-12 minučių | Sukuriama OpenAI, Key Vault, modelio diegimas |
| Programos konfigūravimas | 2-3 minutės | Nustatoma aplinka ir priklausomybės |
| **Iš viso** | **12-18 minučių** | Paruošta pokalbiams su GPT-4 |

**Pastaba:** Pirmasis OpenAI diegimas gali užtrukti ilgiau dėl modelio paruošimo.

## Greitas Pradėjimas

```bash
# Pereikite prie pavyzdžio
cd examples/azure-openai-chat

# Inicializuokite aplinką
azd env new myopenai

# Įdiekite viską (infrastruktūrą + konfigūraciją)
azd up
# Jums bus pateiktas prašymas:
# 1. Pasirinkti Azure prenumeratą
# 2. Pasirinkti vietą su OpenAI prieinamumu (pvz., eastus, eastus2, westus)
# 3. Palaukti 12-18 minučių, kol įdiegimas bus baigtas

# Įdiekite Python priklausomybes
pip install -r requirements.txt

# Pradėkite pokalbį!
python chat.py
```

**Tikėtinas Rezultatas:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Patikrinkite Diegimą

### 1 žingsnis: Patikrinkite Azure Išteklius

```bash
# Peržiūrėti įdiegtus išteklius
azd show

# Tikėtinas rezultatas rodo:
# - OpenAI paslauga: (išteklių pavadinimas)
# - Raktų saugykla: (išteklių pavadinimas)
# - Diegimas: gpt-4
# - Vieta: eastus (arba jūsų pasirinktas regionas)
```

### 2 žingsnis: Testuokite OpenAI API

```bash
# Gauti OpenAI galinį tašką ir raktą
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Išbandyti API užklausą
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Tikėtinas Atsakymas:**
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

### 3 žingsnis: Patikrinkite Key Vault Prieigą

```bash
# Išvardinti paslaptis Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Tikėtini Slaptažodžiai:**
- `openai-api-key`
- `openai-endpoint`

**Sėkmės Kriterijai:**
- ✅ OpenAI paslauga įdiegta su GPT-4
- ✅ API užklausa grąžina galiojantį atsakymą
- ✅ Slaptažodžiai saugomi Key Vault
- ✅ Žetonų naudojimo sekimas veikia

## Projekto Struktūra

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

## Programos Funkcijos

### Pokalbių Sąsaja (`chat.py`)

Pokalbių programa apima:

- **Pokalbių Istorija** - Išlaiko kontekstą tarp žinučių
- **Žetonų Skaičiavimas** - Sekamas naudojimas ir išlaidų įvertinimas
- **Klaidų Valdymas** - Sklandus užklausų ribojimo ir API klaidų tvarkymas
- **Išlaidų Įvertinimas** - Realaus laiko išlaidų skaičiavimas už žinutę
- **Srautinio Perdavimo Palaikymas** - Pasirinktiniai srautiniai atsakymai

### Komandos

Pokalbio metu galite naudoti:
- `quit` arba `exit` - Baigti sesiją
- `clear` - Išvalyti pokalbių istoriją
- `tokens` - Rodyti bendrą žetonų naudojimą
- `cost` - Rodyti apytikslę bendrą kainą

### Konfigūracija (`config.py`)

Įkelia konfigūraciją iš aplinkos kintamųjų:
```python
AZURE_OPENAI_ENDPOINT  # Iš Key Vault
AZURE_OPENAI_API_KEY   # Iš Key Vault
AZURE_OPENAI_MODEL     # Numatytasis: gpt-4
AZURE_OPENAI_MAX_TOKENS # Numatytasis: 800
```

## Naudojimo Pavyzdžiai

### Paprastas Pokalbis

```bash
python chat.py
```

### Pokalbis su Pasirinktu Modeliu

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Pokalbis su Srautiniais Atsakymais

```bash
python chat.py --stream
```

### Pavyzdinis Pokalbis

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

## Išlaidų Valdymas

### Žetonų Kainos (GPT-4)

| Modelis | Įvestis (už 1K žetonų) | Išvestis (už 1K žetonų) |
|---------|------------------------|-------------------------|
| GPT-4   | $0.03                 | $0.06                  |
| GPT-3.5-Turbo | $0.0015         | $0.002                 |

### Apytikslės Mėnesio Išlaidos

Pagal naudojimo modelius:

| Naudojimo Lygis | Žinutės/Diena | Žetonai/Diena | Mėnesio Kaina |
|------------------|--------------|---------------|---------------|
| **Lengvas**     | 20 žinučių   | 3,000 žetonų  | $3-5          |
| **Vidutinis**   | 100 žinučių  | 15,000 žetonų | $15-25        |
| **Intensyvus**  | 500 žinučių  | 75,000 žetonų | $75-125       |

**Bazinės Infrastruktūros Kaina:** $1-2/mėn (Key Vault + minimalus skaičiavimas)

### Išlaidų Optimizavimo Patarimai

```bash
# 1. Naudokite GPT-3.5-Turbo paprastesnėms užduotims (20 kartų pigiau)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Sumažinkite maksimalų žetonų skaičių trumpesniems atsakymams
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Stebėkite žetonų naudojimą
python chat.py --show-tokens

# 4. Nustatykite biudžeto įspėjimus
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Stebėjimas

### Peržiūrėti Žetonų Naudojimą

```bash
# Azure portale:
# OpenAI išteklius → Metrikos → Pasirinkite "Token Transaction"

# Arba per Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Peržiūrėti API Žurnalus

```bash
# Srauto diagnostikos žurnalai
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Užklausų žurnalai
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Trikčių Šalinimas

### Problema: "Prieiga Atmesta" Klaida

**Simptomai:** 403 Forbidden, kai kviečiama API

**Sprendimai:**
```bash
# 1. Patikrinkite, ar OpenAI prieiga yra patvirtinta
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Patikrinkite, ar API raktas yra teisingas
azd env get-value AZURE_OPENAI_API_KEY

# 3. Patikrinkite, ar galinio taško URL formatas yra teisingas
azd env get-value AZURE_OPENAI_ENDPOINT
# Turėtų būti: https://[name].openai.azure.com/
```

### Problema: "Viršytas Užklausų Limitas"

**Simptomai:** 429 Per Daug Užklausų

**Sprendimai:**
```bash
# 1. Patikrinkite dabartinę kvotą
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Prašykite kvotos padidinimo (jei reikia)
# Eikite į Azure Portal → OpenAI Resource → Quotas → Request Increase

# 3. Įgyvendinkite pakartojimo logiką (jau yra chat.py)
# Programa automatiškai bando iš naujo su eksponentiniu atidėjimu
```

### Problema: "Modelis Nerastas"

**Simptomai:** 404 klaida dėl diegimo

**Sprendimai:**
```bash
# 1. Išvardykite galimus diegimus
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Patikrinkite modelio pavadinimą aplinkoje
echo $AZURE_OPENAI_MODEL

# 3. Atnaujinkite į teisingą diegimo pavadinimą
export AZURE_OPENAI_MODEL=gpt-4  # arba gpt-35-turbo
```

### Problema: Didelė Vėlavimo Trukmė

**Simptomai:** Lėti atsakymai (>5 sekundės)

**Sprendimai:**
```bash
# 1. Patikrinkite regioninį vėlavimą
# Diegti regione, kuris yra arčiausiai vartotojų

# 2. Sumažinkite max_tokens greitesniems atsakymams
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Naudokite srautą geresnei vartotojo patirčiai
python chat.py --stream
```

## Saugumo Geriausios Praktikos

### 1. Apsaugokite API Raktus

```bash
# Niekada neįkelkite raktų į versijų kontrolę
# Naudokite Key Vault (jau sukonfigūruotas)

# Reguliariai keiskite raktus
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Įgyvendinkite Turinį Filtravimą

```python
# „Azure OpenAI“ apima įmontuotą turinio filtravimą
# Konfigūruoti „Azure Portal“:
# „OpenAI Resource“ → „Content Filters“ → „Create Custom Filter“

# Kategorijos: Neapykanta, Seksualinis, Smurtas, Savęs žalojimas
# Lygiai: Žemas, Vidutinis, Aukštas filtravimas
```

### 3. Naudokite Valdomą Tapatybę (Gamyboje)

```bash
# Naudokite valdomą tapatybę gamybos diegimams
# vietoj API raktų (reikalauja programos talpinimo Azure)

# Atnaujinkite infra/openai.bicep, kad įtrauktumėte:
# identity: { type: 'SystemAssigned' }
```

## Kūrimas

### Paleiskite Vietoje

```bash
# Įdiegti priklausomybes
pip install -r src/requirements.txt

# Nustatyti aplinkos kintamuosius
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Paleisti programą
python src/chat.py
```

### Paleiskite Testus

```bash
# Įdiegti testavimo priklausomybes
pip install pytest pytest-cov

# Paleisti testus
pytest tests/ -v

# Su aprėptimi
pytest tests/ --cov=src --cov-report=html
```

### Atnaujinkite Modelio Diegimą

```bash
# Įdiegti skirtingą modelio versiją
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

## Išvalymas

```bash
# Ištrinti visus Azure išteklius
azd down --force --purge

# Tai pašalina:
# - OpenAI paslaugą
# - Key Vault (su 90 dienų minkštuoju ištrynimu)
# - Išteklių grupę
# - Visus diegimus ir konfigūracijas
```

## Kiti Žingsniai

### Išplėskite Šį Pavyzdį

1. **Pridėkite Interneto Sąsają** - Sukurkite React/Vue frontendą
   ```bash
   # Pridėti frontend paslaugą į azure.yaml
   # Diegti į Azure Static Web Apps
   ```

2. **Įgyvendinkite RAG** - Pridėkite dokumentų paiešką su Azure AI Search
   ```python
   # Integruoti Azure Cognitive Search
   # Įkelti dokumentus ir sukurti vektorinį indeksą
   ```

3. **Pridėkite Funkcijų Kviečiamumą** - Įgalinkite įrankių naudojimą
   ```python
   # Apibrėžkite funkcijas faile chat.py
   # Leiskite GPT-4 iškviesti išorinius API
   ```

4. **Daugiamodelis Palaikymas** - Diegkite kelis modelius
   ```bash
   # Pridėti gpt-35-turbo, įterpimo modelius
   # Įgyvendinti modelio maršrutizavimo logiką
   ```

### Susiję Pavyzdžiai

- **[Mažmeninės Prekybos Multi-Agentas](../retail-scenario.md)** - Pažangi multi-agentų architektūra
- **[Duomenų Bazės Programa](../../../../examples/database-app)** - Pridėkite nuolatinę saugyklą
- **[Konteinerių Programos](../../../../examples/container-app)** - Diegimas kaip konteinerizuota paslauga

### Mokymosi Ištekliai

- 📚 [AZD Pradedantiesiems Kursas](../../README.md) - Pagrindinis kursas
- 📚 [Azure OpenAI Dokumentacija](https://learn.microsoft.com/azure/ai-services/openai/) - Oficiali dokumentacija
- 📚 [OpenAI API Nuoroda](https://platform.openai.com/docs/api-reference) - API detalės
- 📚 [Atsakingas AI](https://www.microsoft.com/ai/responsible-ai) - Geriausios praktikos

## Papildomi Ištekliai

### Dokumentacija
- **[Azure OpenAI Paslauga](https://learn.microsoft.com/azure/ai-services/openai/)** - Pilnas vadovas
- **[GPT-4 Modeliai](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Modelių galimybės
- **[Turinio Filtravimas](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Saugumo funkcijos
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd nuoroda

### Pamokos
- **[OpenAI Greitas Pradėjimas](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Pirmasis diegimas
- **[Pokalbių Užbaigimai](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Pokalbių programų kūrimas
- **[Funkcijų Kviečiamumas](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Pažangios funkcijos

### Įrankiai
- **[Azure OpenAI Studija](https://oai.azure.com/)** - Internetinė žaidimų aikštelė
- **[Promptų Inžinerijos Vadovas](https://platform.openai.com/docs/guides/prompt-engineering)** - Geresnių užklausų rašymas
- **[Žetonų Skaičiuoklė](https://platform.openai.com/tokenizer)** - Žetonų naudojimo įvertinimas

### Bendruomenė
- **[Azure AI Discord](https://discord.gg/azure)** - Pagalba iš bendruomenės
- **[GitHub Diskusijos](https://github.com/Azure-Samples/openai/discussions)** - Klausimų ir atsakymų forumas
- **[Azure Tinklaraštis](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Naujausi atnaujinimai

---

**🎉 Sėkmė!** Jūs įdiegėte Azure OpenAI ir sukūrėte veikiančią pokalbių programą. Pradėkite tyrinėti GPT-4 galimybes ir eksperimentuokite su skirtingomis užklausomis bei naudojimo atvejais.

**Klausimai?** [Atidarykite problemą](https://github.com/microsoft/AZD-for-beginners/issues) arba peržiūrėkite [DUK](../../resources/faq.md)

**Išlaidų Įspėjimas:** Nepamirškite paleisti `azd down`, kai baigsite testavimą, kad išvengtumėte nuolatinių mokesčių (~$50-100/mėn aktyviam naudojimui).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->