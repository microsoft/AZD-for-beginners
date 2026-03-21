# Chatovacia aplikácia Microsoft Foundry Models

**Vzdelávacia cesta:** Stredne pokročilý ⭐⭐ | **Čas:** 35-45 minutes | **Náklady:** $50-200/month

Kompletná chatovacia aplikácia Microsoft Foundry Models nasadená pomocou Azure Developer CLI (azd). Tento príklad demonštruje nasadenie gpt-4.1, zabezpečený prístup k API a jednoduché chatové rozhranie.

## 🎯 Čo sa naučíte

- Nasadiť Microsoft Foundry Models Service s modelom gpt-4.1
- Zabezpečiť OpenAI API kľúče pomocou Key Vault
- Vytvoriť jednoduché chatové rozhranie v Pythone
- Monitorovať používanie tokenov a náklady
- Implementovať obmedzovanie rýchlosti a spracovanie chýb

## 📦 Čo je zahrnuté

✅ **Microsoft Foundry Models Service** - gpt-4.1 model deployment  
✅ **Python Chat App** - Simple command-line chat interface  
✅ **Key Vault Integration** - Secure API key storage  
✅ **ARM Templates** - Complete infrastructure as code  
✅ **Cost Monitoring** - Token usage tracking  
✅ **Rate Limiting** - Prevent quota exhaustion  

## Architektúra

```mermaid
graph TD
    App[Python chatovacia aplikácia<br/>Lokálne/Cloud<br/>Príkazové rozhranie<br/>História konverzácií<br/>Sledovanie využitia tokenov] -- "HTTPS (API kľúč)" --> Foundry[Služba Microsoft Foundry Models<br/>Model gpt-4.1<br/>Kapacita 20K tokenov/min<br/>Failover v viacerých regiónoch]
    Foundry --> KV[Azure Key Vault<br/>API kľúč OpenAI<br/>URL koncového bodu]
    Foundry -. Spravovaná identita .-> KV
```
## Predpoklady

### Požadované

- **Azure Developer CLI (azd)** - [Návod na inštaláciu](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** with OpenAI access - [Request access](https://aka.ms/oai/access)
- **Python 3.9+** - [Inštalácia Pythonu](https://www.python.org/downloads/)

### Overenie predpokladov

```bash
# Skontrolujte verziu azd (potrebná verzia 1.5.0 alebo novšia)
azd version

# Overte prihlásenie do Azure
azd auth login

# Skontrolujte verziu Pythonu
python --version  # alebo python3 --version

# Overte prístup k OpenAI (skontrolujte v Azure portáli)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Dôležité:** Microsoft Foundry Models vyžaduje schválenie žiadosti. Ak ste to ešte neurobili, navštívte [aka.ms/oai/access](https://aka.ms/oai/access). Schválenie obvykle trvá 1-2 pracovné dni.

## ⏱️ Časový harmonogram nasadenia

| Phase | Duration | What Happens |
|-------|----------|--------------|
| Prerequisites check | 2-3 minutes | Verify OpenAI quota availability |
| Deploy infrastructure | 8-12 minutes | Vytvorenie služieb OpenAI, Key Vault a nasadenie modelu |
| Configure application | 2-3 minutes | Nastavenie prostredia a závislostí |
| **Celkom** | **12-18 minút** | Pripravené na chat s gpt-4.1 |

**Poznámka:** Prvé nasadenie služby OpenAI môže trvať dlhšie kvôli príprave modelu.

## Rýchly štart

```bash
# Prejdite k príkladu
cd examples/azure-openai-chat

# Inicializujte prostredie
azd env new myopenai

# Nasadiť všetko (infraštruktúra + konfigurácia)
azd up
# Budete vyzvaní na:
# 1. Vyberte predplatné Azure
# 2. Zvoľte lokalitu, kde je dostupný OpenAI (napr. eastus, eastus2, westus)
# 3. Počkajte 12-18 minút na nasadenie

# Nainštalujte závislosti Pythonu
pip install -r requirements.txt

# Začnite chatovať!
python chat.py
```

**Očakávaný výstup:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Overenie nasadenia

### Krok 1: Skontrolujte zdroje v Azure

```bash
# Zobraziť nasadené prostriedky
azd show

# Očakávaný výstup zobrazuje:
# - Služba OpenAI: (názov prostriedku)
# - Trezor kľúčov: (názov prostriedku)
# - Nasadenie: gpt-4.1
# - Lokalita: eastus (alebo váš vybraný región)
```

### Krok 2: Otestujte OpenAI API

```bash
# Získať koncový bod OpenAI a kľúč
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Otestovať volanie API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Očakávaná odpoveď:**
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

### Krok 3: Overte prístup k Key Vault

```bash
# Zobraziť tajomstvá v Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Očakávané tajomstvá:**
- `openai-api-key`
- `openai-endpoint`

**Kritériá úspechu:**
- ✅ Služba OpenAI nasadená s gpt-4.1
- ✅ Volanie API vráti platnú odpoveď
- ✅ Tajomstvá uložené v Key Vault
- ✅ Sledovanie používania tokenov funguje

## Štruktúra projektu

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

## Funkcie aplikácie

### Chatové rozhranie (`chat.py`)

Chatová aplikácia obsahuje:

- **História konverzácie** - Zachováva kontext medzi správami
- **Počítanie tokenov** - Sleduje používanie a odhaduje náklady
- **Spracovanie chýb** - Ošetrenie obmedzení rýchlosti a chýb API
- **Odhad nákladov** - Výpočet nákladov v reálnom čase na správu
- **Podpora streamovania** - Voliteľné streamovanie odpovedí

### Príkazy

Počas chatovania môžete použiť:
- `quit` or `exit` - Ukončiť reláciu
- `clear` - Vymazať históriu konverzácie
- `tokens` - Zobraziť celkové používanie tokenov
- `cost` - Zobraziť odhadované celkové náklady

### Konfigurácia (`config.py`)

Načítava konfiguráciu z premenných prostredia:
```python
AZURE_OPENAI_ENDPOINT  # Zo služby Key Vault
AZURE_OPENAI_API_KEY   # Zo služby Key Vault
AZURE_OPENAI_MODEL     # Predvolené: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # Predvolené: 800
```

## Príklady použitia

### Základný chat

```bash
python chat.py
```

### Chat s vlastným modelom

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat so streamovaním

```bash
python chat.py --stream
```

### Ukážková konverzácia

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

## Správa nákladov

### Ceny tokenov (gpt-4.1)

| Model | Vstup (za 1K tokenov) | Výstup (za 1K tokenov) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Odhadované mesačné náklady

Na základe vzorov používania:

| Úroveň používania | Správy/Deň | Tokens/Deň | Mesačné náklady |
|-------------|--------------|------------|--------------|
| **Ľahké** | 20 messages | 3,000 tokens | $3-5 |
| **Stredné** | 100 messages | 15,000 tokens | $15-25 |
| **Náročné** | 500 messages | 75,000 tokens | $75-125 |

**Základné náklady na infraštruktúru:** $1-2/month (Key Vault + minimálny výpočtový výkon)

### Tipy na optimalizáciu nákladov

```bash
# 1. Použite GPT-3.5-Turbo pre jednoduchšie úlohy (20× lacnejšie)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Znížte max. počet tokenov pre kratšie odpovede
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Sledujte používanie tokenov
python chat.py --show-tokens

# 4. Nastavte rozpočtové upozornenia
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitorovanie

### Zobraziť používanie tokenov

```bash
# V Azure Portáli:
# OpenAI zdroj → Metriky → Vyberte "Transakcia tokenov"

# Alebo cez Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Zobraziť protokoly API

```bash
# Prenášať diagnostické záznamy
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Záznamy dotazov
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Riešenie problémov

### Problém: Chyba "Access Denied"

**Príznaky:** 403 Forbidden pri volaní API

**Riešenia:**
```bash
# 1. Overte, či je prístup k OpenAI schválený
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Skontrolujte, či je API kľúč správny
azd env get-value AZURE_OPENAI_API_KEY

# 3. Overte formát URL koncového bodu
azd env get-value AZURE_OPENAI_ENDPOINT
# Malo by byť: https://[name].openai.azure.com/
```

### Problém: Chyba "Rate Limit Exceeded"

**Príznaky:** 429 Too Many Requests

**Riešenia:**
```bash
# 1. Skontrolujte aktuálnu kvótu
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. Požiadajte o zvýšenie kvóty (ak je to potrebné)
# Prejdite na Azure Portal → zdroj OpenAI → Kvóty → Požiadajte o zvýšenie

# 3. Implementujte logiku opätovných pokusov (už v chat.py)
# Aplikácia automaticky opakuje pokusy s exponenciálnym oneskorením
```

### Problém: Chyba "Model Not Found"

**Príznaky:** 404 error pri nasadení

**Riešenia:**
```bash
# 1. Zobrazte dostupné nasadenia
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Overte názov modelu v prostredí
echo $AZURE_OPENAI_MODEL

# 3. Aktualizujte na správny názov nasadenia
export AZURE_OPENAI_MODEL=gpt-4.1  # alebo gpt-35-turbo
```

### Problém: Vysoká latencia

**Príznaky:** Pomalé reakčné časy (>5 seconds)

**Riešenia:**
```bash
# 1. Skontrolujte regionálnu latenciu
# Nasadiť do regiónu najbližšie k používateľom

# 2. Znížte max_tokens pre rýchlejšie odpovede
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Použite streamovanie pre lepší používateľský zážitok
python chat.py --stream
```

## Najlepšie bezpečnostné postupy

### 1. Chráňte API kľúče

```bash
# Nikdy neukladajte kľúče do systému správy verzií
# Použite Key Vault (už nakonfigurované)

# Pravidelne obmieňajte kľúče
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementujte filtrovanie obsahu

```python
# Microsoft Foundry Models obsahuje vstavané filtrovanie obsahu
# Konfigurujte v Azure portáli:
# OpenAI zdroj → Filtre obsahu → Vytvoriť vlastný filter

# Kategórie: nenávisť, sexuálny obsah, násilie, sebaubližovanie
# Úrovne: nízke, stredné, vysoké filtrovanie
```

### 3. Používajte Managed Identity (produkcia)

```bash
# Pre produkčné nasadenia používajte spravovanú identitu
# namiesto API kľúčov (vyžaduje hosťovanie aplikácie na Azure)

# Aktualizujte infra/openai.bicep, aby obsahoval:
# identity: { type: 'SystemAssigned' }
```

## Vývoj

### Spustenie lokálne

```bash
# Nainštalovať závislosti
pip install -r src/requirements.txt

# Nastaviť premenné prostredia
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# Spustiť aplikáciu
python src/chat.py
```

### Spustenie testov

```bash
# Nainštalovať testovacie závislosti
pip install pytest pytest-cov

# Spustiť testy
pytest tests/ -v

# S pokrytím kódu
pytest tests/ --cov=src --cov-report=html
```

### Aktualizácia nasadenia modelu

```bash
# Nasadiť inú verziu modelu
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

## Vyčistenie

```bash
# Odstrániť všetky Azure prostriedky
azd down --force --purge

# Toto odstráni:
# - Služba OpenAI
# - Key Vault (s 90-dňovým mäkkým zmazaním)
# - Skupina prostriedkov
# - Všetky nasadenia a konfigurácie
```

## Ďalšie kroky

### Rozšírenie tohto príkladu

1. **Pridať webové rozhranie** - Vytvoriť frontend v React/Vue
   ```bash
   # Pridať frontend službu do azure.yaml
   # Nasadiť na Azure Static Web Apps
   ```

2. **Implementovať RAG** - Pridať vyhľadávanie v dokumentoch pomocou Azure AI Search
   ```python
   # Integrovať Azure Cognitive Search
   # Nahrať dokumenty a vytvoriť vektorový index
   ```

3. **Pridať volanie funkcií** - Povoliť používanie nástrojov
   ```python
   # Definujte funkcie v chat.py
   # Povoľte gpt-4.1 volať externé API
   ```

4. **Podpora viacerých modelov** - Nasadiť viacero modelov
   ```bash
   # Pridať gpt-35-turbo a modely embeddings
   # Implementovať logiku smerovania modelov
   ```

### Súvisiace príklady

- **[Retail Multi-Agent](../retail-scenario.md)** - Pokročilá architektúra viacerých agentov
- **[Database App](../../../../examples/database-app)** - Pridať perzistentné úložisko
- **[Container Apps](../../../../examples/container-app)** - Nasadiť ako kontajnerovú službu

### Vzdelávacie zdroje

- 📚 [AZD For Beginners Course](../../README.md) - Hlavná stránka kurzu
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - Oficiálna dokumentácia
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - Detaily API
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - Najlepšie postupy

## Dodatočné zdroje

### Dokumentácia
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Kompletný sprievodca
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Schopnosti modelu
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Bezpečnostné funkcie
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd reference

### Tutoriály
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Prvé nasadenie
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Vytváranie chat aplikácií
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Pokročilé funkcie

### Nástroje
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - Webové testovacie prostredie
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Písanie lepších promptov
- **[Token Calculator](https://platform.openai.com/tokenizer)** - Odhad používania tokenov

### Komunita
- **[Azure AI Discord](https://discord.gg/azure)** - Získajte pomoc od komunity
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Fórum otázok a odpovedí
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Najnovšie aktualizácie

---

**🎉 Úspech!** Nasadili ste Microsoft Foundry Models a vytvorili funkčnú chatovaciu aplikáciu. Začnite objavovať možnosti gpt-4.1 a experimentujte s rôznymi promptami a prípadmi použitia.

**Máte otázky?** [Otvorte issue](https://github.com/microsoft/AZD-for-beginners/issues) alebo skontrolujte [FAQ](../../resources/faq.md)

**Upozornenie na náklady:** Nezabudnite spustiť `azd down`, keď skončíte testovanie, aby ste sa vyhli priebežným poplatkom (~$50-100/mesiac pri aktívnom používaní).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladovej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->