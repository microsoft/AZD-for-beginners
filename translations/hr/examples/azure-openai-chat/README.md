<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-23T19:56:23+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "hr"
}
-->
# Azure OpenAI Chat aplikacija

**Razina učenja:** Srednja ⭐⭐ | **Vrijeme:** 35-45 minuta | **Trošak:** $50-200/mjesečno

Kompletna Azure OpenAI chat aplikacija implementirana pomoću Azure Developer CLI (azd). Ovaj primjer prikazuje implementaciju GPT-4 modela, siguran pristup API-ju i jednostavno sučelje za chat.

## 🎯 Što ćete naučiti

- Implementirati Azure OpenAI Service s GPT-4 modelom
- Osigurati OpenAI API ključeve pomoću Key Vault-a
- Izraditi jednostavno sučelje za chat pomoću Pythona
- Pratiti korištenje tokena i troškove
- Primijeniti ograničenje brzine i rukovanje greškama

## 📦 Što je uključeno

✅ **Azure OpenAI Service** - Implementacija GPT-4 modela  
✅ **Python Chat App** - Jednostavno sučelje za chat u naredbenom retku  
✅ **Integracija s Key Vault-om** - Sigurno pohranjivanje API ključeva  
✅ **ARM predlošci** - Kompletna infrastruktura kao kod  
✅ **Praćenje troškova** - Praćenje korištenja tokena  
✅ **Ograničenje brzine** - Sprječavanje iscrpljivanja kvote  

## Arhitektura

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

## Preduvjeti

### Obavezno

- **Azure Developer CLI (azd)** - [Vodič za instalaciju](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure pretplata** s pristupom OpenAI-u - [Zatraži pristup](https://aka.ms/oai/access)
- **Python 3.9+** - [Instaliraj Python](https://www.python.org/downloads/)

### Provjera preduvjeta

```bash
# Provjerite azd verziju (potrebna je 1.5.0 ili novija)
azd version

# Provjerite prijavu na Azure
azd auth login

# Provjerite Python verziju
python --version  # ili python3 --version

# Provjerite pristup OpenAI (provjerite u Azure Portalu)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Važno:** Azure OpenAI zahtijeva odobrenje aplikacije. Ako niste podnijeli zahtjev, posjetite [aka.ms/oai/access](https://aka.ms/oai/access). Odobrenje obično traje 1-2 radna dana.

## ⏱️ Vremenski okvir implementacije

| Faza | Trajanje | Što se događa |
|------|----------|--------------|
| Provjera preduvjeta | 2-3 minute | Provjera dostupnosti kvote za OpenAI |
| Implementacija infrastrukture | 8-12 minuta | Kreiranje OpenAI-a, Key Vault-a, implementacija modela |
| Konfiguracija aplikacije | 2-3 minute | Postavljanje okruženja i ovisnosti |
| **Ukupno** | **12-18 minuta** | Spremno za chat s GPT-4 |

**Napomena:** Prva implementacija OpenAI-a može potrajati dulje zbog postavljanja modela.

## Brzi početak

```bash
# Navigirajte do primjera
cd examples/azure-openai-chat

# Inicijalizirajte okruženje
azd env new myopenai

# Implementirajte sve (infrastruktura + konfiguracija)
azd up
# Bit ćete upitani da:
# 1. Odaberete Azure pretplatu
# 2. Izaberete lokaciju s dostupnošću OpenAI (npr. eastus, eastus2, westus)
# 3. Pričekate 12-18 minuta za implementaciju

# Instalirajte Python ovisnosti
pip install -r requirements.txt

# Započnite razgovor!
python chat.py
```

**Očekivani izlaz:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Provjera implementacije

### Korak 1: Provjera Azure resursa

```bash
# Pregledajte implementirane resurse
azd show

# Očekivani izlaz prikazuje:
# - OpenAI usluga: (naziv resursa)
# - Key Vault: (naziv resursa)
# - Implementacija: gpt-4
# - Lokacija: eastus (ili vaša odabrana regija)
```

### Korak 2: Testiranje OpenAI API-ja

```bash
# Dohvati OpenAI krajnju točku i ključ
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testiraj API poziv
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Očekivani odgovor:**
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

### Korak 3: Provjera pristupa Key Vault-u

```bash
# Popis tajni u Key Vaultu
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Očekivane tajne:**
- `openai-api-key`
- `openai-endpoint`

**Kriteriji uspjeha:**
- ✅ OpenAI servis implementiran s GPT-4
- ✅ API poziv vraća valjan odgovor
- ✅ Tajne pohranjene u Key Vault-u
- ✅ Praćenje korištenja tokena funkcionira

## Struktura projekta

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

## Značajke aplikacije

### Sučelje za chat (`chat.py`)

Aplikacija za chat uključuje:

- **Povijest razgovora** - Održava kontekst između poruka
- **Brojanje tokena** - Prati korištenje i procjenjuje troškove
- **Rukovanje greškama** - Elegantno rukovanje ograničenjima brzine i API greškama
- **Procjena troškova** - Izračun troškova u stvarnom vremenu po poruci
- **Podrška za streaming** - Opcionalni streaming odgovora

### Naredbe

Tijekom chata možete koristiti:
- `quit` ili `exit` - Završetak sesije
- `clear` - Brisanje povijesti razgovora
- `tokens` - Prikaz ukupnog korištenja tokena
- `cost` - Prikaz procijenjenih ukupnih troškova

### Konfiguracija (`config.py`)

Učitava konfiguraciju iz varijabli okruženja:
```python
AZURE_OPENAI_ENDPOINT  # Iz Key Vaulta
AZURE_OPENAI_API_KEY   # Iz Key Vaulta
AZURE_OPENAI_MODEL     # Zadano: gpt-4
AZURE_OPENAI_MAX_TOKENS # Zadano: 800
```

## Primjeri korištenja

### Osnovni chat

```bash
python chat.py
```

### Chat s prilagođenim modelom

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat sa streamingom

```bash
python chat.py --stream
```

### Primjer razgovora

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

## Upravljanje troškovima

### Cijene tokena (GPT-4)

| Model | Ulaz (po 1K tokena) | Izlaz (po 1K tokena) |
|-------|---------------------|----------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Procijenjeni mjesečni troškovi

Na temelju obrazaca korištenja:

| Razina korištenja | Poruka/dan | Tokena/dan | Mjesečni trošak |
|-------------------|------------|------------|-----------------|
| **Lagano** | 20 poruka | 3,000 tokena | $3-5 |
| **Umjereno** | 100 poruka | 15,000 tokena | $15-25 |
| **Intenzivno** | 500 poruka | 75,000 tokena | $75-125 |

**Osnovni trošak infrastrukture:** $1-2/mjesečno (Key Vault + minimalna računalna snaga)

### Savjeti za optimizaciju troškova

```bash
# 1. Koristite GPT-3.5-Turbo za jednostavnije zadatke (20x jeftinije)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Smanjite maksimalan broj tokena za kraće odgovore
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Pratite korištenje tokena
python chat.py --show-tokens

# 4. Postavite upozorenja za proračun
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Praćenje

### Pregled korištenja tokena

```bash
# U Azure portalu:
# OpenAI resurs → Metrike → Odaberite "Token Transaction"

# Ili putem Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Pregled API logova

```bash
# Prijenos dijagnostičkih zapisa
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Upitni zapisi
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Rješavanje problema

### Problem: "Pristup odbijen" pogreška

**Simptomi:** 403 Forbidden prilikom poziva API-ja

**Rješenja:**
```bash
# 1. Provjerite je li pristup OpenAI odobren
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Provjerite je li API ključ ispravan
azd env get-value AZURE_OPENAI_API_KEY

# 3. Provjerite format URL-a krajnje točke
azd env get-value AZURE_OPENAI_ENDPOINT
# Trebalo bi biti: https://[name].openai.azure.com/
```

### Problem: "Prekoračenje ograničenja brzine"

**Simptomi:** 429 Previše zahtjeva

**Rješenja:**
```bash
# 1. Provjerite trenutnu kvotu
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Zatražite povećanje kvote (ako je potrebno)
# Idite na Azure Portal → OpenAI Resurs → Kvote → Zatražite povećanje

# 3. Implementirajte logiku ponovnog pokušaja (već u chat.py)
# Aplikacija automatski ponavlja s eksponencijalnim povratom
```

### Problem: "Model nije pronađen"

**Simptomi:** 404 pogreška za implementaciju

**Rješenja:**
```bash
# 1. Popis dostupnih implementacija
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Provjerite naziv modela u okruženju
echo $AZURE_OPENAI_MODEL

# 3. Ažurirajte na ispravan naziv implementacije
export AZURE_OPENAI_MODEL=gpt-4  # ili gpt-35-turbo
```

### Problem: Visoka latencija

**Simptomi:** Sporo vrijeme odgovora (>5 sekundi)

**Rješenja:**
```bash
# 1. Provjerite regionalnu latenciju
# Implementirajte u regiji najbližoj korisnicima

# 2. Smanjite max_tokens za brže odgovore
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Koristite streaming za bolje korisničko iskustvo
python chat.py --stream
```

## Najbolje sigurnosne prakse

### 1. Zaštitite API ključeve

```bash
# Nikada ne pohranjujte ključeve u kontrolu verzija
# Koristite Key Vault (već konfiguriran)

# Redovito rotirajte ključeve
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementirajte filtriranje sadržaja

```python
# Azure OpenAI uključuje ugrađeno filtriranje sadržaja
# Konfigurirajte u Azure Portalu:
# OpenAI Resurs → Filtri sadržaja → Kreiraj prilagođeni filter

# Kategorije: Mržnja, Seksualno, Nasilje, Samoozljeđivanje
# Razine: Nisko, Srednje, Visoko filtriranje
```

### 3. Koristite upravljani identitet (produkcija)

```bash
# Za produkcijska postavljanja, koristite upravljani identitet
# umjesto API ključeva (zahtijeva hosting aplikacije na Azureu)

# Ažurirajte infra/openai.bicep da uključuje:
# identitet: { type: 'SystemAssigned' }
```

## Razvoj

### Pokretanje lokalno

```bash
# Instaliraj ovisnosti
pip install -r src/requirements.txt

# Postavi varijable okruženja
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Pokreni aplikaciju
python src/chat.py
```

### Pokretanje testova

```bash
# Instaliraj testne ovisnosti
pip install pytest pytest-cov

# Pokreni testove
pytest tests/ -v

# S pokrivenošću
pytest tests/ --cov=src --cov-report=html
```

### Ažuriranje implementacije modela

```bash
# Implementiraj različitu verziju modela
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

## Čišćenje

```bash
# Izbriši sve Azure resurse
azd down --force --purge

# Ovo uklanja:
# - OpenAI uslugu
# - Key Vault (s 90-dnevnim mekim brisanjem)
# - Grupu resursa
# - Sve implementacije i konfiguracije
```

## Sljedeći koraci

### Proširite ovaj primjer

1. **Dodajte web sučelje** - Izradite frontend u Reactu/Vueu
   ```bash
   # Dodajte frontend uslugu u azure.yaml
   # Implementirajte na Azure Static Web Apps
   ```

2. **Implementirajte RAG** - Dodajte pretraživanje dokumenata pomoću Azure AI Search-a
   ```python
   # Integrirajte Azure Cognitive Search
   # Prenesite dokumente i kreirajte vektorski indeks
   ```

3. **Dodajte pozivanje funkcija** - Omogućite korištenje alata
   ```python
   # Definiraj funkcije u chat.py
   # Dopusti GPT-4 da poziva vanjske API-je
   ```

4. **Podrška za više modela** - Implementirajte više modela
   ```bash
   # Dodaj gpt-35-turbo, modele ugrađivanja
   # Implementiraj logiku usmjeravanja modela
   ```

### Povezani primjeri

- **[Maloprodajni multi-agent](../retail-scenario.md)** - Napredna arhitektura s više agenata
- **[Aplikacija za bazu podataka](../../../../examples/database-app)** - Dodajte trajnu pohranu
- **[Aplikacije u kontejnerima](../../../../examples/container-app)** - Implementirajte kao uslugu u kontejnerima

### Resursi za učenje

- 📚 [AZD za početnike tečaj](../../README.md) - Glavni tečaj
- 📚 [Azure OpenAI dokumentacija](https://learn.microsoft.com/azure/ai-services/openai/) - Službeni dokumenti
- 📚 [OpenAI API referenca](https://platform.openai.com/docs/api-reference) - Detalji API-ja
- 📚 [Odgovorna AI](https://www.microsoft.com/ai/responsible-ai) - Najbolje prakse

## Dodatni resursi

### Dokumentacija
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Kompletan vodič
- **[GPT-4 modeli](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Sposobnosti modela
- **[Filtriranje sadržaja](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Sigurnosne značajke
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd referenca

### Tutorijali
- **[OpenAI Brzi početak](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Prva implementacija
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Izrada aplikacija za chat
- **[Pozivanje funkcija](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Napredne značajke

### Alati
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Web-based playground
- **[Vodič za prompt engineering](https://platform.openai.com/docs/guides/prompt-engineering)** - Pisanje boljih upita
- **[Kalkulator tokena](https://platform.openai.com/tokenizer)** - Procjena korištenja tokena

### Zajednica
- **[Azure AI Discord](https://discord.gg/azure)** - Pomoć od zajednice
- **[GitHub rasprave](https://github.com/Azure-Samples/openai/discussions)** - Forum za pitanja i odgovore
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Najnovije novosti

---

**🎉 Uspjeh!** Implementirali ste Azure OpenAI i izradili funkcionalnu aplikaciju za chat. Počnite istraživati mogućnosti GPT-4 i eksperimentirajte s različitim upitima i slučajevima korištenja.

**Pitanja?** [Otvorite problem](https://github.com/microsoft/AZD-for-beginners/issues) ili provjerite [FAQ](../../resources/faq.md)

**Upozorenje o troškovima:** Ne zaboravite pokrenuti `azd down` nakon testiranja kako biste izbjegli stalne troškove (~$50-100/mjesečno za aktivno korištenje).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->