# Azure OpenAI Chat Application

**Úroveň znalostí:** Stredne pokročilý ⭐⭐ | **Čas:** 35-45 minút | **Cena:** $50-200/mesiac

Kompletná aplikácia Azure OpenAI chat nasadená pomocou Azure Developer CLI (azd). Tento príklad demonštruje nasadenie GPT-4, bezpečný prístup k API a jednoduché rozhranie pre chat.

## 🎯 Čo sa naučíte

- Nasadiť Azure OpenAI Service s modelom GPT-4
- Zabezpečiť OpenAI API kľúče pomocou Key Vault
- Vytvoriť jednoduché rozhranie pre chat v Pythone
- Monitorovať používanie tokenov a náklady
- Implementovať obmedzenie rýchlosti a spracovanie chýb

## 📦 Čo je súčasťou

✅ **Azure OpenAI Service** - Nasadenie modelu GPT-4  
✅ **Python Chat App** - Jednoduché rozhranie pre chat v príkazovom riadku  
✅ **Integrácia Key Vault** - Bezpečné uloženie API kľúčov  
✅ **ARM Templates** - Kompletná infraštruktúra ako kód  
✅ **Monitorovanie nákladov** - Sledovanie používania tokenov  
✅ **Obmedzenie rýchlosti** - Prevencia vyčerpania kvót  

## Architektúra

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

## Predpoklady

### Požadované

- **Azure Developer CLI (azd)** - [Návod na inštaláciu](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure predplatné** s prístupom k OpenAI - [Požiadať o prístup](https://aka.ms/oai/access)
- **Python 3.9+** - [Inštalácia Pythonu](https://www.python.org/downloads/)

### Overenie predpokladov

```bash
# Skontrolujte verziu azd (potrebná je 1.5.0 alebo vyššia)
azd version

# Overte prihlásenie do Azure
azd auth login

# Skontrolujte verziu Pythonu
python --version  # alebo python3 --version

# Overte prístup k OpenAI (skontrolujte v Azure Portáli)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Dôležité:** Azure OpenAI vyžaduje schválenie aplikácie. Ak ste ešte nepožiadali, navštívte [aka.ms/oai/access](https://aka.ms/oai/access). Schválenie zvyčajne trvá 1-2 pracovné dni.

## ⏱️ Časový harmonogram nasadenia

| Fáza | Trvanie | Čo sa deje |
|------|---------|------------|
| Kontrola predpokladov | 2-3 minúty | Overenie dostupnosti kvóty OpenAI |
| Nasadenie infraštruktúry | 8-12 minút | Vytvorenie OpenAI, Key Vault, nasadenie modelu |
| Konfigurácia aplikácie | 2-3 minúty | Nastavenie prostredia a závislostí |
| **Celkom** | **12-18 minút** | Pripravené na chatovanie s GPT-4 |

**Poznámka:** Prvé nasadenie OpenAI môže trvať dlhšie kvôli príprave modelu.

## Rýchly štart

```bash
# Prejdite na príklad
cd examples/azure-openai-chat

# Inicializujte prostredie
azd env new myopenai

# Nasadiť všetko (infraštruktúra + konfigurácia)
azd up
# Budete vyzvaní:
# 1. Vybrať predplatné Azure
# 2. Vybrať lokalitu s dostupnosťou OpenAI (napr. eastus, eastus2, westus)
# 3. Počkajte 12-18 minút na nasadenie

# Nainštalujte Python závislosti
pip install -r requirements.txt

# Začnite chatovať!
python chat.py
```

**Očakávaný výstup:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Overenie nasadenia

### Krok 1: Skontrolujte Azure zdroje

```bash
# Zobraziť nasadené zdroje
azd show

# Očakávaný výstup ukazuje:
# - OpenAI služba: (názov zdroja)
# - Key Vault: (názov zdroja)
# - Nasadenie: gpt-4
# - Lokalita: eastus (alebo váš vybraný región)
```

### Krok 2: Otestujte OpenAI API

```bash
# Získajte koncový bod OpenAI a kľúč
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Otestujte volanie API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
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
# Zoznam tajomstiev v Key Vault
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
- ✅ OpenAI služba nasadená s GPT-4
- ✅ API volanie vracia platné výsledky
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

### Rozhranie pre chat (`chat.py`)

Aplikácia pre chat obsahuje:

- **História konverzácie** - Udržiava kontext medzi správami
- **Počítanie tokenov** - Sledovanie používania a odhad nákladov
- **Spracovanie chýb** - Elegantné riešenie obmedzení rýchlosti a chýb API
- **Odhad nákladov** - Výpočet nákladov v reálnom čase na správu
- **Podpora streamovania** - Voliteľné streamovanie odpovedí

### Príkazy

Počas chatovania môžete použiť:
- `quit` alebo `exit` - Ukončenie relácie
- `clear` - Vymazanie histórie konverzácie
- `tokens` - Zobrazenie celkového používania tokenov
- `cost` - Zobrazenie odhadovaných celkových nákladov

### Konfigurácia (`config.py`)

Načítava konfiguráciu z environmentálnych premenných:
```python
AZURE_OPENAI_ENDPOINT  # Z trezoru kľúčov
AZURE_OPENAI_API_KEY   # Z trezoru kľúčov
AZURE_OPENAI_MODEL     # Predvolené: gpt-4
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

### Príklad konverzácie

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

## Riadenie nákladov

### Ceny tokenov (GPT-4)

| Model | Vstup (za 1K tokenov) | Výstup (za 1K tokenov) |
|-------|-----------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Odhadované mesačné náklady

Na základe vzorcov používania:

| Úroveň používania | Správy/deň | Tokeny/deň | Mesačné náklady |
|-------------------|------------|------------|-----------------|
| **Nízka** | 20 správ | 3,000 tokenov | $3-5 |
| **Stredná** | 100 správ | 15,000 tokenov | $15-25 |
| **Vysoká** | 500 správ | 75,000 tokenov | $75-125 |

**Základné náklady na infraštruktúru:** $1-2/mesiac (Key Vault + minimálny výpočet)

### Tipy na optimalizáciu nákladov

```bash
# 1. Použite GPT-3.5-Turbo na jednoduchšie úlohy (20x lacnejšie)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Znížte maximálny počet tokenov pre kratšie odpovede
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Sledujte používanie tokenov
python chat.py --show-tokens

# 4. Nastavte upozornenia na rozpočet
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitorovanie

### Zobrazenie používania tokenov

```bash
# V Azure Portáli:
# OpenAI Resource → Metriky → Vyberte "Tokenová transakcia"

# Alebo cez Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Zobrazenie API logov

```bash
# Prenos diagnostických záznamov
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Dotazové záznamy
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

### Problém: "Rate Limit Exceeded"

**Príznaky:** 429 Príliš veľa požiadaviek

**Riešenia:**
```bash
# 1. Skontrolujte aktuálnu kvótu
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Požiadajte o zvýšenie kvóty (ak je to potrebné)
# Prejdite na Azure Portal → OpenAI Resource → Kvóty → Požiadať o zvýšenie

# 3. Implementujte logiku opakovania (už v chat.py)
# Aplikácia automaticky opakuje s exponenciálnym oneskorením
```

### Problém: "Model Not Found"

**Príznaky:** 404 chyba pri nasadení

**Riešenia:**
```bash
# 1. Zoznam dostupných nasadení
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Overte názov modelu v prostredí
echo $AZURE_OPENAI_MODEL

# 3. Aktualizujte na správny názov nasadenia
export AZURE_OPENAI_MODEL=gpt-4  # alebo gpt-35-turbo
```

### Problém: Vysoká latencia

**Príznaky:** Pomalé časy odozvy (>5 sekúnd)

**Riešenia:**
```bash
# 1. Skontrolujte regionálnu latenciu
# Nasadiť do regiónu najbližšieho používateľom

# 2. Znížte max_tokens pre rýchlejšie odpovede
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Použite streamovanie pre lepší UX
python chat.py --stream
```

## Najlepšie bezpečnostné postupy

### 1. Ochrana API kľúčov

```bash
# Nikdy neukladajte kľúče do systému na správu verzií
# Použite Key Vault (už je nakonfigurovaný)

# Pravidelne otáčajte kľúče
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementácia filtrovania obsahu

```python
# Azure OpenAI obsahuje vstavané filtrovanie obsahu
# Konfigurácia v Azure Portáli:
# OpenAI Resource → Filtrovanie obsahu → Vytvoriť vlastný filter

# Kategórie: Nenávisť, Sexuálne, Násilie, Sebapoškodzovanie
# Úrovne: Nízke, Stredné, Vysoké filtrovanie
```

### 3. Použitie Managed Identity (produkcia)

```bash
# Pre produkčné nasadenia použite spravovanú identitu
# namiesto API kľúčov (vyžaduje hosťovanie aplikácie na Azure)

# Aktualizujte infra/openai.bicep tak, aby obsahoval:
# identity: { type: 'SystemAssigned' }
```

## Vývoj

### Spustenie lokálne

```bash
# Nainštalujte závislosti
pip install -r src/requirements.txt

# Nastavte environmentálne premenné
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Spustite aplikáciu
python src/chat.py
```

### Spustenie testov

```bash
# Nainštalujte testovacie závislosti
pip install pytest pytest-cov

# Spustite testy
pytest tests/ -v

# S pokrytím
pytest tests/ --cov=src --cov-report=html
```

### Aktualizácia nasadenia modelu

```bash
# Nasadiť rôzne verzie modelu
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
# Odstrániť všetky zdroje Azure
azd down --force --purge

# Toto odstráni:
# - Službu OpenAI
# - Key Vault (s 90-dňovým mäkkým odstránením)
# - Skupinu zdrojov
# - Všetky nasadenia a konfigurácie
```

## Ďalšie kroky

### Rozšírenie tohto príkladu

1. **Pridanie webového rozhrania** - Vytvorte frontend v React/Vue
   ```bash
   # Pridajte frontendovú službu do azure.yaml
   # Nasadiť do Azure Static Web Apps
   ```

2. **Implementácia RAG** - Pridajte vyhľadávanie dokumentov pomocou Azure AI Search
   ```python
   # Integrácia Azure Cognitive Search
   # Nahrať dokumenty a vytvoriť vektorový index
   ```

3. **Pridanie funkčného volania** - Povolenie používania nástrojov
   ```python
   # Definovať funkcie v chat.py
   # Nechať GPT-4 volať externé API
   ```

4. **Podpora viacerých modelov** - Nasadenie viacerých modelov
   ```bash
   # Pridať gpt-35-turbo, modely embeddings
   # Implementovať logiku smerovania modelov
   ```

### Súvisiace príklady

- **[Retail Multi-Agent](../retail-scenario.md)** - Pokročilá architektúra s viacerými agentmi
- **[Database App](../../../../examples/database-app)** - Pridanie trvalého úložiska
- **[Container Apps](../../../../examples/container-app)** - Nasadenie ako kontajnerová služba

### Vzdelávacie zdroje

- 📚 [AZD For Beginners Course](../../README.md) - Hlavný kurz
- 📚 [Azure OpenAI Dokumentácia](https://learn.microsoft.com/azure/ai-services/openai/) - Oficiálne dokumenty
- 📚 [OpenAI API Referencia](https://platform.openai.com/docs/api-reference) - Detaily API
- 📚 [Zodpovedná AI](https://www.microsoft.com/ai/responsible-ai) - Najlepšie postupy

## Dodatočné zdroje

### Dokumentácia
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Kompletný sprievodca
- **[GPT-4 Modely](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Schopnosti modelov
- **[Filtrovanie obsahu](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Bezpečnostné funkcie
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencia azd

### Tutoriály
- **[OpenAI Rýchly štart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Prvé nasadenie
- **[Chatové dokončenia](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Vytváranie chat aplikácií
- **[Funkčné volanie](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Pokročilé funkcie

### Nástroje
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Webové rozhranie
- **[Sprievodca promptami](https://platform.openai.com/docs/guides/prompt-engineering)** - Písanie lepších promptov
- **[Kalkulačka tokenov](https://platform.openai.com/tokenizer)** - Odhad používania tokenov

### Komunita
- **[Azure AI Discord](https://discord.gg/azure)** - Pomoc od komunity
- **[GitHub Diskusie](https://github.com/Azure-Samples/openai/discussions)** - Fórum otázok a odpovedí
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Najnovšie aktualizácie

---

**🎉 Úspech!** Nasadili ste Azure OpenAI a vytvorili funkčnú chat aplikáciu. Začnite objavovať schopnosti GPT-4 a experimentujte s rôznymi promptami a prípadmi použitia.

**Otázky?** [Otvorte problém](https://github.com/microsoft/AZD-for-beginners/issues) alebo si pozrite [FAQ](../../resources/faq.md)

**Upozornenie na náklady:** Nezabudnite spustiť `azd down` po dokončení testovania, aby ste sa vyhli pokračujúcim poplatkom (~$50-100/mesiac za aktívne používanie).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, uvedomte si, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->