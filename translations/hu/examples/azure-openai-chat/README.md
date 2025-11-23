<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-23T12:42:47+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "hu"
}
-->
# Azure OpenAI Chat Alkalmazás

**Tanulási szint:** Középhaladó ⭐⭐ | **Idő:** 35-45 perc | **Költség:** $50-200/hó

Egy teljes Azure OpenAI chat alkalmazás, amelyet az Azure Developer CLI (azd) segítségével telepítettek. Ez a példa bemutatja a GPT-4 telepítését, a biztonságos API-hozzáférést és egy egyszerű chat felületet.

## 🎯 Amit Megtanulsz

- Azure OpenAI Service telepítése GPT-4 modellel
- OpenAI API kulcsok biztonságos tárolása Key Vault segítségével
- Egyszerű chat felület készítése Pythonban
- Tokenhasználat és költségek monitorozása
- Sebességkorlátozás és hibakezelés megvalósítása

## 📦 Mi Van Benne

✅ **Azure OpenAI Service** - GPT-4 modell telepítése  
✅ **Python Chat App** - Egyszerű parancssoros chat felület  
✅ **Key Vault Integráció** - API kulcsok biztonságos tárolása  
✅ **ARM Sablonok** - Teljes infrastruktúra kódként  
✅ **Költségfigyelés** - Tokenhasználat követése  
✅ **Sebességkorlátozás** - Kvóta kimerülésének megelőzése  

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

## Előfeltételek

### Szükséges

- **Azure Developer CLI (azd)** - [Telepítési útmutató](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure előfizetés** OpenAI hozzáféréssel - [Hozzáférés igénylése](https://aka.ms/oai/access)
- **Python 3.9+** - [Python telepítése](https://www.python.org/downloads/)

### Előfeltételek Ellenőrzése

```bash
# Ellenőrizze az azd verziót (1.5.0 vagy magasabb szükséges)
azd version

# Ellenőrizze az Azure bejelentkezést
azd auth login

# Ellenőrizze a Python verziót
python --version  # vagy python3 --version

# Ellenőrizze az OpenAI hozzáférést (ellenőrizze az Azure Portálon)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Fontos:** Az Azure OpenAI használatához alkalmazási jóváhagyás szükséges. Ha még nem igényelted, látogass el ide: [aka.ms/oai/access](https://aka.ms/oai/access). A jóváhagyás általában 1-2 munkanapot vesz igénybe.

## ⏱️ Telepítési Idővonal

| Fázis | Időtartam | Mi Történik |
|-------|----------|--------------|
| Előfeltételek ellenőrzése | 2-3 perc | OpenAI kvóta elérhetőségének ellenőrzése |
| Infrastruktúra telepítése | 8-12 perc | OpenAI, Key Vault, modell telepítése |
| Alkalmazás konfigurálása | 2-3 perc | Környezet és függőségek beállítása |
| **Összesen** | **12-18 perc** | Kész a GPT-4 chatelésre |

**Megjegyzés:** Az első OpenAI telepítés hosszabb ideig tarthat a modell előkészítése miatt.

## Gyors Indítás

```bash
# Navigáljon a példához
cd examples/azure-openai-chat

# Inicializálja a környezetet
azd env new myopenai

# Telepítse mindent (infrastruktúra + konfiguráció)
azd up
# A következőkre lesz felszólítva:
# 1. Válassza ki az Azure előfizetést
# 2. Válasszon helyet az OpenAI elérhetőségével (pl. eastus, eastus2, westus)
# 3. Várjon 12-18 percet a telepítésre

# Telepítse a Python függőségeket
pip install -r requirements.txt

# Kezdjen el csevegni!
python chat.py
```

**Várható Kimenet:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Telepítés Ellenőrzése

### 1. lépés: Azure Erőforrások Ellenőrzése

```bash
# Megtekintés telepített erőforrások
azd show

# Várható kimenet mutatja:
# - OpenAI Szolgáltatás: (erőforrás neve)
# - Kulcstár: (erőforrás neve)
# - Telepítés: gpt-4
# - Helyszín: eastus (vagy az Ön által kiválasztott régió)
```

### 2. lépés: OpenAI API Tesztelése

```bash
# Szerezd meg az OpenAI végpontot és kulcsot
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Teszt API hívás
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Várható Válasz:**
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

### 3. lépés: Key Vault Hozzáférés Ellenőrzése

```bash
# Titkok listázása a Key Vault-ban
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Várható Titkok:**
- `openai-api-key`
- `openai-endpoint`

**Siker Kritériumok:**
- ✅ OpenAI szolgáltatás GPT-4 modellel telepítve
- ✅ API hívás érvényes választ ad
- ✅ Titkok tárolva a Key Vault-ban
- ✅ Tokenhasználat követése működik

## Projekt Struktúra

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

## Alkalmazás Funkciók

### Chat Felület (`chat.py`)

A chat alkalmazás tartalmazza:

- **Beszélgetési Előzmények** - Üzenetek közötti kontextus megőrzése
- **Token Számlálás** - Használat követése és költségek becslése
- **Hibakezelés** - Sebességkorlátozás és API hibák kezelése
- **Költségbecslés** - Valós idejű költségszámítás üzenetenként
- **Streaming Támogatás** - Opcionális streaming válaszok

### Parancsok

Chatelés közben használhatod:
- `quit` vagy `exit` - Kilépés a munkamenetből
- `clear` - Beszélgetési előzmények törlése
- `tokens` - Összes tokenhasználat megjelenítése
- `cost` - Becsült teljes költség megjelenítése

### Konfiguráció (`config.py`)

Betölti a konfigurációt környezeti változókból:
```python
AZURE_OPENAI_ENDPOINT  # Kulcstárból
AZURE_OPENAI_API_KEY   # Kulcstárból
AZURE_OPENAI_MODEL     # Alapértelmezett: gpt-4
AZURE_OPENAI_MAX_TOKENS # Alapértelmezett: 800
```

## Használati Példák

### Alap Chat

```bash
python chat.py
```

### Chat Egyedi Modellel

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat Streaminggel

```bash
python chat.py --stream
```

### Példa Beszélgetés

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

## Költségkezelés

### Token Árazás (GPT-4)

| Modell | Bemenet (1K tokenenként) | Kimenet (1K tokenenként) |
|-------|--------------------------|--------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Becsült Havi Költségek

Használati minták alapján:

| Használati Szint | Üzenetek/nap | Tokenek/nap | Havi Költség |
|------------------|--------------|-------------|--------------|
| **Könnyű** | 20 üzenet | 3,000 token | $3-5 |
| **Mérsékelt** | 100 üzenet | 15,000 token | $15-25 |
| **Nagy** | 500 üzenet | 75,000 token | $75-125 |

**Alap Infrastruktúra Költség:** $1-2/hó (Key Vault + minimális számítási kapacitás)

### Költségoptimalizálási Tippek

```bash
# 1. Használja a GPT-3.5-Turbo-t egyszerűbb feladatokhoz (20x olcsóbb)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Csökkentse a maximális tokenek számát rövidebb válaszokhoz
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Figyelje a tokenhasználatot
python chat.py --show-tokens

# 4. Állítson be költségkeret-értesítéseket
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitorozás

### Tokenhasználat Megtekintése

```bash
# Az Azure Portálon:
# OpenAI Erőforrás → Metrikák → Válassza a "Token Tranzakciót"

# Vagy az Azure CLI-n keresztül:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API Naplók Megtekintése

```bash
# Diagnosztikai naplók streamelése
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Naplók lekérdezése
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Hibakeresés

### Probléma: "Hozzáférés Megtagadva" Hiba

**Tünetek:** 403 Forbidden API híváskor

**Megoldások:**
```bash
# 1. Ellenőrizze, hogy az OpenAI hozzáférés engedélyezett-e
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Ellenőrizze, hogy az API kulcs helyes-e
azd env get-value AZURE_OPENAI_API_KEY

# 3. Ellenőrizze az endpoint URL formátumát
azd env get-value AZURE_OPENAI_ENDPOINT
# Ennek így kell lennie: https://[name].openai.azure.com/
```

### Probléma: "Sebességkorlát Túllépve"

**Tünetek:** 429 Túl Sok Kérés

**Megoldások:**
```bash
# 1. Ellenőrizze az aktuális kvótát
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Kérjen kvótanövelést (ha szükséges)
# Lépjen az Azure Portálra → OpenAI Erőforrás → Kvóták → Növelés kérése

# 3. Valósítsa meg az újrapróbálkozási logikát (már a chat.py-ben van)
# Az alkalmazás automatikusan újrapróbálkozik exponenciális visszaeséssel
```

### Probléma: "Modell Nem Található"

**Tünetek:** 404 hiba a telepítésnél

**Megoldások:**
```bash
# 1. Listázza a rendelkezésre álló telepítéseket
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Ellenőrizze a modell nevét a környezetben
echo $AZURE_OPENAI_MODEL

# 3. Frissítse a megfelelő telepítési névre
export AZURE_OPENAI_MODEL=gpt-4  # vagy gpt-35-turbo
```

### Probléma: Magas Késleltetés

**Tünetek:** Lassú válaszidők (>5 másodperc)

**Megoldások:**
```bash
# 1. Ellenőrizze a regionális késleltetést
# Telepítse a felhasználókhoz legközelebbi régióba

# 2. Csökkentse a max_tokens értéket a gyorsabb válaszok érdekében
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Használjon streaminget a jobb felhasználói élmény érdekében
python chat.py --stream
```

## Biztonsági Legjobb Gyakorlatok

### 1. API Kulcsok Védelme

```bash
# Soha ne tegyél kulcsokat verziókezelésbe
# Használj Key Vault-ot (már konfigurálva van)

# Rendszeresen forgass kulcsokat
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Tartalomszűrés Megvalósítása

```python
# Az Azure OpenAI beépített tartalomszűrést tartalmaz
# Konfigurálás az Azure Portálon:
# OpenAI Erőforrás → Tartalomszűrők → Egyéni szűrő létrehozása

# Kategóriák: Gyűlölet, Szexuális, Erőszak, Önkárosítás
# Szintek: Alacsony, Közepes, Magas szűrés
```

### 3. Kezelt Identitás Használata (Éles Környezetben)

```bash
# A gyártási telepítésekhez használjon kezelt identitást
# API kulcsok helyett (Azure-on történő alkalmazás hosztolást igényel)

# Frissítse az infra/openai.bicep fájlt, hogy tartalmazza:
# identity: { type: 'SystemAssigned' }
```

## Fejlesztés

### Helyi Futtatás

```bash
# Telepítse a függőségeket
pip install -r src/requirements.txt

# Állítsa be a környezeti változókat
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Futtassa az alkalmazást
python src/chat.py
```

### Tesztek Futtatása

```bash
# Telepítse a tesztfüggőségeket
pip install pytest pytest-cov

# Futtassa a teszteket
pytest tests/ -v

# Lefedettséggel
pytest tests/ --cov=src --cov-report=html
```

### Modell Telepítés Frissítése

```bash
# Telepítsen különböző modellverziót
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

## Tisztítás

```bash
# Törölje az összes Azure erőforrást
azd down --force --purge

# Ez eltávolítja:
# - OpenAI szolgáltatás
# - Kulcstár (90 napos puha törléssel)
# - Erőforráscsoport
# - Minden telepítést és konfigurációt
```

## Következő Lépések

### Példa Kibővítése

1. **Webes Felület Hozzáadása** - React/Vue frontend készítése
   ```bash
   # Adja hozzá a frontend szolgáltatást az azure.yaml-hoz
   # Telepítés az Azure Static Web Apps-re
   ```

2. **RAG Megvalósítása** - Dokumentumkeresés hozzáadása Azure AI Search segítségével
   ```python
   # Integrálja az Azure Cognitive Search-t
   # Dokumentumok feltöltése és vektorindex létrehozása
   ```

3. **Funkcióhívás Hozzáadása** - Eszközhasználat engedélyezése
   ```python
   # Függvények definiálása a chat.py-ben
   # Engedélyezze a GPT-4 számára külső API-k hívását
   ```

4. **Több Modell Támogatása** - Több modell telepítése
   ```bash
   # Adja hozzá a gpt-35-turbo, embeddings modelleket
   # Valósítsa meg a modellirányítási logikát
   ```

### Kapcsolódó Példák

- **[Kiskereskedelmi Multi-Agent](../retail-scenario.md)** - Fejlett multi-agent architektúra
- **[Adatbázis Alkalmazás](../../../../examples/database-app)** - Tartós tárolás hozzáadása
- **[Kontejner Alkalmazások](../../../../examples/container-app)** - Konténerizált szolgáltatásként való telepítés

### Tanulási Források

- 📚 [AZD Kezdőknek Tanfolyam](../../README.md) - Fő tanfolyam oldala
- 📚 [Azure OpenAI Dokumentáció](https://learn.microsoft.com/azure/ai-services/openai/) - Hivatalos dokumentáció
- 📚 [OpenAI API Referencia](https://platform.openai.com/docs/api-reference) - API részletek
- 📚 [Felelős AI](https://www.microsoft.com/ai/responsible-ai) - Legjobb gyakorlatok

## További Források

### Dokumentáció
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Teljes útmutató
- **[GPT-4 Modellek](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Modell képességek
- **[Tartalomszűrés](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Biztonsági funkciók
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd referencia

### Útmutatók
- **[OpenAI Gyorsindítás](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Első telepítés
- **[Chat Kiegészítések](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Chat alkalmazások készítése
- **[Funkcióhívás](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Fejlett funkciók

### Eszközök
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Webes játszótér
- **[Prompt Engineering Útmutató](https://platform.openai.com/docs/guides/prompt-engineering)** - Jobb promptok írása
- **[Token Kalkulátor](https://platform.openai.com/tokenizer)** - Tokenhasználat becslése

### Közösség
- **[Azure AI Discord](https://discord.gg/azure)** - Segítség a közösségtől
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Kérdések és válaszok fóruma
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Legfrissebb hírek

---

**🎉 Siker!** Telepítetted az Azure OpenAI-t és létrehoztál egy működő chat alkalmazást. Kezdj el kísérletezni a GPT-4 képességeivel, és próbálj ki különböző promptokat és felhasználási eseteket.

**Kérdések?** [Nyiss egy hibajegyet](https://github.com/microsoft/AZD-for-beginners/issues) vagy nézd meg a [GYIK-et](../../resources/faq.md)

**Költségfigyelmeztetés:** Ne felejtsd el futtatni az `azd down` parancsot, ha befejezted a tesztelést, hogy elkerüld a folyamatos költségeket (~$50-100/hó aktív használat esetén).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->