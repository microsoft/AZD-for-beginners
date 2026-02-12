# Azure OpenAI Chat Aplikacija

**Nivo učenja:** Srednji ⭐⭐ | **Vreme:** 35-45 minuta | **Cena:** $50-200/mesec

Kompletna Azure OpenAI chat aplikacija implementirana pomoću Azure Developer CLI (azd). Ovaj primer demonstrira GPT-4 implementaciju, siguran API pristup i jednostavan chat interfejs.

## 🎯 Šta ćete naučiti

- Implementacija Azure OpenAI servisa sa GPT-4 modelom
- Sigurno čuvanje OpenAI API ključeva pomoću Key Vault-a
- Izrada jednostavnog chat interfejsa u Python-u
- Praćenje potrošnje tokena i troškova
- Implementacija ograničenja brzine i rukovanje greškama

## 📦 Šta je uključeno

✅ **Azure OpenAI Service** - Implementacija GPT-4 modela  
✅ **Python Chat App** - Jednostavan komandno-linijski chat interfejs  
✅ **Key Vault Integracija** - Sigurno čuvanje API ključeva  
✅ **ARM Šabloni** - Kompletna infrastruktura kao kod  
✅ **Praćenje troškova** - Praćenje potrošnje tokena  
✅ **Ograničenje brzine** - Prevencija iscrpljivanja kvote  

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

## Preduslovi

### Obavezno

- **Azure Developer CLI (azd)** - [Vodič za instalaciju](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure pretplata** sa pristupom OpenAI - [Zahtev za pristup](https://aka.ms/oai/access)
- **Python 3.9+** - [Preuzmite Python](https://www.python.org/downloads/)

### Provera preduslova

```bash
# Проверите верзију azd (потребна 1.5.0 или новија)
azd version

# Потврдите пријаву на Azure
azd auth login

# Проверите верзију Python-а
python --version  # или python3 --version

# Потврдите приступ OpenAI (проверите у Azure порталу)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Važno:** Azure OpenAI zahteva odobrenje aplikacije. Ako niste podneli zahtev, posetite [aka.ms/oai/access](https://aka.ms/oai/access). Odobrenje obično traje 1-2 radna dana.

## ⏱️ Vremenska linija implementacije

| Faza | Trajanje | Šta se dešava |
|------|----------|---------------|
| Provera preduslova | 2-3 minuta | Provera dostupnosti OpenAI kvote |
| Implementacija infrastrukture | 8-12 minuta | Kreiranje OpenAI, Key Vault-a, implementacija modela |
| Konfiguracija aplikacije | 2-3 minuta | Postavljanje okruženja i zavisnosti |
| **Ukupno** | **12-18 minuta** | Spremno za chat sa GPT-4 |

**Napomena:** Prva implementacija OpenAI može trajati duže zbog postavljanja modela.

## Brzi početak

```bash
# Идите на пример
cd examples/azure-openai-chat

# Иницијализујте окружење
azd env new myopenai

# Деплојтујте све (инфраструктура + конфигурација)
azd up
# Бићете упитани да:
# 1. Изаберете Azure претплату
# 2. Одаберете локацију са OpenAI доступношћу (нпр. eastus, eastus2, westus)
# 3. Сачекате 12-18 минута за деплојмент

# Инсталирајте Python зависности
pip install -r requirements.txt

# Почните да ћаскате!
python chat.py
```

**Očekivani rezultat:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Provera implementacije

### Korak 1: Proverite Azure resurse

```bash
# Прикажи распоређене ресурсе
azd show

# Очекивани излаз приказује:
# - OpenAI услуга: (име ресурса)
# - Key Vault: (име ресурса)
# - Распоређивање: gpt-4
# - Локација: eastus (или изабрани регион)
```

### Korak 2: Testirajte OpenAI API

```bash
# Преузми OpenAI крајњу тачку и кључ
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Тестирај API позив
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

### Korak 3: Proverite pristup Key Vault-u

```bash
# Листај тајне у Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Očekivane tajne:**
- `openai-api-key`
- `openai-endpoint`

**Kriterijumi uspeha:**
- ✅ OpenAI servis implementiran sa GPT-4
- ✅ API poziv vraća validan odgovor
- ✅ Tajne sačuvane u Key Vault-u
- ✅ Praćenje potrošnje tokena funkcioniše

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

## Funkcionalnosti aplikacije

### Chat interfejs (`chat.py`)

Chat aplikacija uključuje:

- **Istorija razgovora** - Održava kontekst između poruka
- **Brojanje tokena** - Praćenje potrošnje i procena troškova
- **Rukovanje greškama** - Elegantno rukovanje ograničenjima brzine i API greškama
- **Procena troškova** - Proračun troškova u realnom vremenu po poruci
- **Podrška za strimovanje** - Opcionalni strimovani odgovori

### Komande

Tokom chata, možete koristiti:
- `quit` ili `exit` - Završetak sesije
- `clear` - Brisanje istorije razgovora
- `tokens` - Prikaz ukupne potrošnje tokena
- `cost` - Prikaz procenjenih ukupnih troškova

### Konfiguracija (`config.py`)

Učitava konfiguraciju iz promenljivih okruženja:
```python
AZURE_OPENAI_ENDPOINT  # Из Key Vault-а
AZURE_OPENAI_API_KEY   # Из Key Vault-а
AZURE_OPENAI_MODEL     # Подразумевано: gpt-4
AZURE_OPENAI_MAX_TOKENS # Подразумевано: 800
```

## Primeri upotrebe

### Osnovni chat

```bash
python chat.py
```

### Chat sa prilagođenim modelom

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat sa strimovanjem

```bash
python chat.py --stream
```

### Primer razgovora

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

### Cena tokena (GPT-4)

| Model | Ulaz (po 1K tokena) | Izlaz (po 1K tokena) |
|-------|---------------------|----------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Procena mesečnih troškova

Na osnovu obrazaca korišćenja:

| Nivo korišćenja | Poruka/Dan | Tokena/Dan | Mesečni trošak |
|------------------|------------|------------|----------------|
| **Lagano** | 20 poruka | 3,000 tokena | $3-5 |
| **Umereno** | 100 poruka | 15,000 tokena | $15-25 |
| **Intenzivno** | 500 poruka | 75,000 tokena | $75-125 |

**Osnovni trošak infrastrukture:** $1-2/mesec (Key Vault + minimalni resursi)

### Saveti za optimizaciju troškova

```bash
# 1. Користите GPT-3.5-Turbo за једноставније задатке (20x јефтиније)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Смањите максималан број токена за краће одговоре
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Пратите употребу токена
python chat.py --show-tokens

# 4. Поставите упозорења за буџет
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Praćenje

### Pregled potrošnje tokena

```bash
# У Azure порталу:
# OpenAI ресурс → Метрике → Изаберите "Трансакција токена"

# Или преко Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Pregled API logova

```bash
# Стримуј дијагностичке записе
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Упити записе
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Rešavanje problema

### Problem: "Pristup odbijen" greška

**Simptomi:** 403 Forbidden prilikom poziva API-ja

**Rešenja:**
```bash
# 1. Проверите да ли је приступ OpenAI одобрен
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Проверите да ли је API кључ исправан
azd env get-value AZURE_OPENAI_API_KEY

# 3. Проверите формат URL адресе крајње тачке
azd env get-value AZURE_OPENAI_ENDPOINT
# Треба да буде: https://[name].openai.azure.com/
```

### Problem: "Prekoračenje ograničenja brzine"

**Simptomi:** 429 Previše zahteva

**Rešenja:**
```bash
# 1. Проверите тренутну квоту
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Затражите повећање квоте (ако је потребно)
# Идите на Azure Portal → OpenAI Resource → Quotas → Request Increase

# 3. Примените логику поновног покушаја (већ у chat.py)
# Апликација аутоматски поново покушава са експоненцијалним одлагањем
```

### Problem: "Model nije pronađen"

**Simptomi:** 404 greška za implementaciju

**Rešenja:**
```bash
# 1. Наведи доступне деплојменте
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Потврди име модела у окружењу
echo $AZURE_OPENAI_MODEL

# 3. Ажурирај на исправно име деплојмента
export AZURE_OPENAI_MODEL=gpt-4  # или gpt-35-turbo
```

### Problem: Visoka latencija

**Simptomi:** Sporo vreme odgovora (>5 sekundi)

**Rešenja:**
```bash
# 1. Проверите регионалну латенцију
# Деплојте у регион најближи корисницима

# 2. Смањите max_tokens за брже одговоре
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Користите стриминг за бољи UX
python chat.py --stream
```

## Najbolje prakse za sigurnost

### 1. Zaštitite API ključeve

```bash
# Никада не чувајте кључеве у систему за контролу верзија
# Користите Key Vault (већ конфигурисан)

# Редовно ротирајте кључеве
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementirajte filtriranje sadržaja

```python
# Azure OpenAI укључује уграђено филтрирање садржаја
# Конфигуришите у Azure порталу:
# OpenAI ресурс → Филтери садржаја → Креирајте прилагођени филтер

# Категорије: Мржња, Сексуално, Насиље, Самоповређивање
# Нивои: Ниско, Средње, Високо филтрирање
```

### 3. Koristite upravljani identitet (produkcija)

```bash
# За продукциона распоређивања, користите управљани идентитет
# уместо API кључева (захтева хостовање апликације на Azure)

# Ажурирајте infra/openai.bicep да укључи:
# идентитет: { type: 'SystemAssigned' }
```

## Razvoj

### Pokretanje lokalno

```bash
# Инсталирај зависности
pip install -r src/requirements.txt

# Постави променљиве окружења
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Покрени апликацију
python src/chat.py
```

### Pokretanje testova

```bash
# Инсталирај тест зависности
pip install pytest pytest-cov

# Покрени тестове
pytest tests/ -v

# Са покривеношћу
pytest tests/ --cov=src --cov-report=html
```

### Ažuriranje implementacije modela

```bash
# Разместите различиту верзију модела
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
# Избриши све Azure ресурсе
azd down --force --purge

# Ово уклања:
# - OpenAI услугу
# - Key Vault (са 90-дневним меканим брисањем)
# - Ресурсну групу
# - Све деплојменте и конфигурације
```

## Sledeći koraci

### Proširite ovaj primer

1. **Dodajte web interfejs** - Izradite frontend u React/Vue
   ```bash
   # Додајте фронтенд сервис у azure.yaml
   # Деплој на Azure Static Web Apps
   ```

2. **Implementirajte RAG** - Dodajte pretragu dokumenata sa Azure AI Search
   ```python
   # Интегришите Azure Cognitive Search
   # Отпремите документе и креирајте векторски индекс
   ```

3. **Dodajte pozivanje funkcija** - Omogućite korišćenje alata
   ```python
   # Дефиниши функције у chat.py
   # Дозволи GPT-4 да позива спољашње API-је
   ```

4. **Podrška za više modela** - Implementirajte više modela
   ```bash
   # Додај gpt-35-turbo, моделе за угњежђивање
   # Имплементирај логику усмеравања модела
   ```

### Povezani primeri

- **[Maloprodajni Multi-Agent](../retail-scenario.md)** - Napredna arhitektura sa više agenata
- **[Aplikacija za bazu podataka](../../../../examples/database-app)** - Dodajte trajno skladištenje
- **[Aplikacije u kontejnerima](../../../../examples/container-app)** - Implementirajte kao uslugu u kontejnerima

### Resursi za učenje

- 📚 [AZD za početnike](../../README.md) - Glavni kurs
- 📚 [Azure OpenAI Dokumentacija](https://learn.microsoft.com/azure/ai-services/openai/) - Zvanična dokumentacija
- 📚 [OpenAI API Referenca](https://platform.openai.com/docs/api-reference) - Detalji API-ja
- 📚 [Odgovorna AI](https://www.microsoft.com/ai/responsible-ai) - Najbolje prakse

## Dodatni resursi

### Dokumentacija
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Kompletan vodič
- **[GPT-4 Modeli](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Sposobnosti modela
- **[Filtriranje sadržaja](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Bezbednosne funkcije
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd referenca

### Tutorijali
- **[OpenAI Brzi početak](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Prva implementacija
- **[Chat Kompletacije](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Izrada chat aplikacija
- **[Pozivanje funkcija](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Napredne funkcije

### Alati
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Web-based okruženje
- **[Vodič za pisanje upita](https://platform.openai.com/docs/guides/prompt-engineering)** - Pisanje boljih upita
- **[Kalkulator tokena](https://platform.openai.com/tokenizer)** - Procena potrošnje tokena

### Zajednica
- **[Azure AI Discord](https://discord.gg/azure)** - Pomoć od zajednice
- **[GitHub Diskusije](https://github.com/Azure-Samples/openai/discussions)** - Forum za pitanja i odgovore
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Najnovije vesti

---

**🎉 Uspeh!** Implementirali ste Azure OpenAI i izradili funkcionalnu chat aplikaciju. Počnite da istražujete mogućnosti GPT-4 i eksperimentišite sa različitim upitima i slučajevima upotrebe.

**Pitanja?** [Otvorite problem](https://github.com/microsoft/AZD-for-beginners/issues) ili proverite [FAQ](../../resources/faq.md)

**Upozorenje o troškovima:** Ne zaboravite da pokrenete `azd down` kada završite testiranje kako biste izbegli stalne troškove (~$50-100/mesec za aktivno korišćenje).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање од одговорности**:  
Овај документ је преведен помоћу услуге за превођење вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->