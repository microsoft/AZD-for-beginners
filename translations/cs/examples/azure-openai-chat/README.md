# Azure OpenAI Chat Aplikace

**Úroveň znalostí:** Středně pokročilý ⭐⭐ | **Čas:** 35-45 minut | **Cena:** $50-200/měsíc

Kompletní Azure OpenAI chat aplikace nasazená pomocí Azure Developer CLI (azd). Tento příklad ukazuje nasazení GPT-4, zabezpečený přístup k API a jednoduché chatovací rozhraní.

## 🎯 Co se naučíte

- Nasadit Azure OpenAI Service s modelem GPT-4  
- Zabezpečit klíče OpenAI API pomocí Key Vault  
- Vytvořit jednoduché chatovací rozhraní v Pythonu  
- Monitorovat využití tokenů a náklady  
- Implementovat omezení rychlosti a zpracování chyb  

## 📦 Co je součástí

✅ **Azure OpenAI Service** - Nasazení modelu GPT-4  
✅ **Python Chat App** - Jednoduché chatovací rozhraní v příkazovém řádku  
✅ **Integrace Key Vault** - Zabezpečené ukládání klíčů API  
✅ **ARM Templates** - Kompletní infrastruktura jako kód  
✅ **Monitorování nákladů** - Sledování využití tokenů  
✅ **Omezení rychlosti** - Prevence vyčerpání kvóty  

## Architektura

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

## Předpoklady

### Požadováno

- **Azure Developer CLI (azd)** - [Průvodce instalací](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Azure předplatné** s přístupem k OpenAI - [Požádejte o přístup](https://aka.ms/oai/access)  
- **Python 3.9+** - [Instalace Pythonu](https://www.python.org/downloads/)  

### Ověření předpokladů

```bash
# Zkontrolujte verzi azd (potřebná je 1.5.0 nebo vyšší)
azd version

# Ověřte přihlášení do Azure
azd auth login

# Zkontrolujte verzi Pythonu
python --version  # nebo python3 --version

# Ověřte přístup k OpenAI (zkontrolujte v Azure Portálu)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Důležité:** Azure OpenAI vyžaduje schválení aplikace. Pokud jste ještě nepožádali, navštivte [aka.ms/oai/access](https://aka.ms/oai/access). Schválení obvykle trvá 1-2 pracovní dny.

## ⏱️ Časový harmonogram nasazení

| Fáze | Doba trvání | Co se děje |
|------|-------------|------------|
| Kontrola předpokladů | 2-3 minuty | Ověření dostupnosti kvóty OpenAI |
| Nasazení infrastruktury | 8-12 minut | Vytvoření OpenAI, Key Vault, nasazení modelu |
| Konfigurace aplikace | 2-3 minuty | Nastavení prostředí a závislostí |
| **Celkem** | **12-18 minut** | Připraveno k chatování s GPT-4 |

**Poznámka:** První nasazení OpenAI může trvat déle kvůli zajištění modelu.

## Rychlý start

```bash
# Přejděte na příklad
cd examples/azure-openai-chat

# Inicializujte prostředí
azd env new myopenai

# Nasadit vše (infrastruktura + konfigurace)
azd up
# Budete vyzváni k:
# 1. Výběru předplatného Azure
# 2. Výběru lokace s dostupností OpenAI (např. eastus, eastus2, westus)
# 3. Počkejte 12-18 minut na nasazení

# Nainstalujte Python závislosti
pip install -r requirements.txt

# Začněte chatovat!
python chat.py
```

**Očekávaný výstup:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Ověření nasazení

### Krok 1: Zkontrolujte Azure zdroje

```bash
# Zobrazit nasazené zdroje
azd show

# Očekávaný výstup ukazuje:
# - OpenAI služba: (název zdroje)
# - Key Vault: (název zdroje)
# - Nasazení: gpt-4
# - Umístění: eastus (nebo vámi vybraný region)
```

### Krok 2: Otestujte OpenAI API

```bash
# Získejte koncový bod OpenAI a klíč
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Otestujte volání API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Očekávaná odpověď:**
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

### Krok 3: Ověřte přístup k Key Vault

```bash
# Vypsat tajemství v Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Očekávané tajné klíče:**
- `openai-api-key`  
- `openai-endpoint`  

**Kritéria úspěchu:**
- ✅ OpenAI služba nasazena s GPT-4  
- ✅ API volání vrací platné výsledky  
- ✅ Tajné klíče uložené v Key Vault  
- ✅ Sledování využití tokenů funguje  

## Struktura projektu

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

## Funkce aplikace

### Chatovací rozhraní (`chat.py`)

Chatovací aplikace zahrnuje:

- **Historie konverzací** - Udržuje kontext mezi zprávami  
- **Počítání tokenů** - Sledování využití a odhad nákladů  
- **Zpracování chyb** - Elegantní řešení omezení rychlosti a chyb API  
- **Odhad nákladů** - Výpočet nákladů na zprávu v reálném čase  
- **Podpora streamování** - Volitelné streamování odpovědí  

### Příkazy

Během chatování můžete použít:  
- `quit` nebo `exit` - Ukončení relace  
- `clear` - Vymazání historie konverzací  
- `tokens` - Zobrazení celkového využití tokenů  
- `cost` - Zobrazení odhadovaných celkových nákladů  

### Konfigurace (`config.py`)

Načítá konfiguraci z proměnných prostředí:  
```python
AZURE_OPENAI_ENDPOINT  # Z Key Vaultu
AZURE_OPENAI_API_KEY   # Z Key Vaultu
AZURE_OPENAI_MODEL     # Výchozí: gpt-4
AZURE_OPENAI_MAX_TOKENS # Výchozí: 800
```

## Příklady použití

### Základní chat

```bash
python chat.py
```

### Chat s vlastním modelem

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat se streamováním

```bash
python chat.py --stream
```

### Ukázková konverzace

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

## Správa nákladů

### Ceny tokenů (GPT-4)

| Model | Vstup (za 1K tokenů) | Výstup (za 1K tokenů) |
|-------|-----------------------|-----------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Odhadované měsíční náklady

Na základě vzorců využití:

| Úroveň využití | Zprávy/den | Tokeny/den | Měsíční náklady |
|----------------|------------|------------|-----------------|
| **Nízké** | 20 zpráv | 3 000 tokenů | $3-5 |
| **Střední** | 100 zpráv | 15 000 tokenů | $15-25 |
| **Vysoké** | 500 zpráv | 75 000 tokenů | $75-125 |

**Základní náklady na infrastrukturu:** $1-2/měsíc (Key Vault + minimální výpočetní výkon)

### Tipy na optimalizaci nákladů

```bash
# 1. Použijte GPT-3.5-Turbo pro jednodušší úkoly (20x levnější)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Snižte maximální počet tokenů pro kratší odpovědi
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Sledujte využití tokenů
python chat.py --show-tokens

# 4. Nastavte upozornění na rozpočet
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitorování

### Zobrazení využití tokenů

```bash
# V Azure Portálu:
# OpenAI Resource → Metriky → Vyberte "Tokenová transakce"

# Nebo přes Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Zobrazení logů API

```bash
# Streamovat diagnostické logy
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Dotazovat se na logy
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Řešení problémů

### Problém: Chyba "Access Denied"

**Příznaky:** 403 Forbidden při volání API  

**Řešení:**  
```bash
# 1. Ověřte, že přístup k OpenAI je schválen
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Zkontrolujte, zda je API klíč správný
azd env get-value AZURE_OPENAI_API_KEY

# 3. Ověřte formát URL koncového bodu
azd env get-value AZURE_OPENAI_ENDPOINT
# Mělo by být: https://[name].openai.azure.com/
```

### Problém: Překročený limit rychlosti

**Příznaky:** 429 Too Many Requests  

**Řešení:**  
```bash
# 1. Zkontrolujte aktuální kvótu
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Požádejte o zvýšení kvóty (pokud je potřeba)
# Přejděte na Azure Portal → OpenAI Resource → Kvóty → Požádat o zvýšení

# 3. Implementujte logiku opakování (již v chat.py)
# Aplikace automaticky opakuje s exponenciálním zpožděním
```

### Problém: Model nenalezen

**Příznaky:** Chyba 404 při nasazení  

**Řešení:**  
```bash
# 1. Seznam dostupných nasazení
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Ověřte název modelu v prostředí
echo $AZURE_OPENAI_MODEL

# 3. Aktualizujte na správný název nasazení
export AZURE_OPENAI_MODEL=gpt-4  # nebo gpt-35-turbo
```

### Problém: Vysoká latence

**Příznaky:** Pomalejší odezvy (>5 sekund)  

**Řešení:**  
```bash
# 1. Zkontrolujte regionální latenci
# Nasadit do regionu nejbližšího uživatelům

# 2. Snižte max_tokens pro rychlejší odpovědi
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Použijte streamování pro lepší UX
python chat.py --stream
```

## Nejlepší bezpečnostní postupy

### 1. Ochrana klíčů API

```bash
# Nikdy neukládejte klíče do verzovacího systému
# Použijte Key Vault (již nakonfigurováno)

# Pravidelně otáčejte klíče
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementace filtrování obsahu

```python
# Azure OpenAI zahrnuje vestavěné filtrování obsahu
# Konfigurace v Azure Portálu:
# OpenAI Resource → Filtry obsahu → Vytvořit vlastní filtr

# Kategorie: Nenávist, Sexuální, Násilí, Sebepoškozování
# Úrovně: Nízké, Střední, Vysoké filtrování
```

### 3. Použití spravované identity (produkční prostředí)

```bash
# Pro produkční nasazení použijte spravovanou identitu
# místo API klíčů (vyžaduje hostování aplikace na Azure)

# Aktualizujte infra/openai.bicep, aby zahrnoval:
# identity: { type: 'SystemAssigned' }
```

## Vývoj

### Spuštění lokálně

```bash
# Nainstalujte závislosti
pip install -r src/requirements.txt

# Nastavte proměnné prostředí
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Spusťte aplikaci
python src/chat.py
```

### Spuštění testů

```bash
# Nainstalujte testovací závislosti
pip install pytest pytest-cov

# Spusťte testy
pytest tests/ -v

# S pokrytím
pytest tests/ --cov=src --cov-report=html
```

### Aktualizace nasazení modelu

```bash
# Nasadit různé verze modelu
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

## Vyčištění

```bash
# Smazat všechny prostředky Azure
azd down --force --purge

# Toto odstraní:
# - Službu OpenAI
# - Key Vault (s 90denním měkkým odstraněním)
# - Skupinu prostředků
# - Všechny nasazení a konfigurace
```

## Další kroky

### Rozšíření tohoto příkladu

1. **Přidání webového rozhraní** - Vytvořte frontend v React/Vue  
   ```bash
   # Přidejte frontendovou službu do azure.yaml
   # Nasadit do Azure Static Web Apps
   ```

2. **Implementace RAG** - Přidejte vyhledávání dokumentů pomocí Azure AI Search  
   ```python
   # Integrace Azure Cognitive Search
   # Nahrát dokumenty a vytvořit vektorový index
   ```

3. **Přidání volání funkcí** - Aktivujte použití nástrojů  
   ```python
   # Definujte funkce v chat.py
   # Umožněte GPT-4 volat externí API
   ```

4. **Podpora více modelů** - Nasazení více modelů  
   ```bash
   # Přidat gpt-35-turbo, modely vkládání
   # Implementovat logiku směrování modelů
   ```

### Související příklady

- **[Retail Multi-Agent](../retail-scenario.md)** - Pokročilá architektura s více agenty  
- **[Database App](../../../../examples/database-app)** - Přidání trvalého úložiště  
- **[Container Apps](../../../../examples/container-app)** - Nasazení jako kontejnerová služba  

### Výukové materiály

- 📚 [Kurz AZD pro začátečníky](../../README.md) - Hlavní stránka kurzu  
- 📚 [Dokumentace Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Oficiální dokumentace  
- 📚 [Referenční příručka OpenAI API](https://platform.openai.com/docs/api-reference) - Detaily API  
- 📚 [Odpovědná AI](https://www.microsoft.com/ai/responsible-ai) - Nejlepší postupy  

## Další zdroje

### Dokumentace
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Kompletní průvodce  
- **[Modely GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Schopnosti modelů  
- **[Filtrování obsahu](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Bezpečnostní funkce  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referenční příručka azd  

### Tutoriály
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - První nasazení  
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Vytváření chatovacích aplikací  
- **[Volání funkcí](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Pokročilé funkce  

### Nástroje
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Webové rozhraní  
- **[Průvodce návrhem promptů](https://platform.openai.com/docs/guides/prompt-engineering)** - Lepší návrh promptů  
- **[Kalkulačka tokenů](https://platform.openai.com/tokenizer)** - Odhad využití tokenů  

### Komunita
- **[Azure AI Discord](https://discord.gg/azure)** - Pomoc od komunity  
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Fórum otázek a odpovědí  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Nejnovější aktualizace  

---

**🎉 Úspěch!** Nasadili jste Azure OpenAI a vytvořili funkční chatovací aplikaci. Začněte objevovat schopnosti GPT-4 a experimentujte s různými prompty a případy použití.

**Dotazy?** [Otevřete problém](https://github.com/microsoft/AZD-for-beginners/issues) nebo zkontrolujte [FAQ](../../resources/faq.md)

**Upozornění na náklady:** Nezapomeňte spustit `azd down`, když dokončíte testování, abyste se vyhnuli průběžným poplatkům (~$50-100/měsíc za aktivní využití).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->