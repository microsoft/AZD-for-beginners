# Jednoduché Flask API - príklad Container App

**Vzdelávacia cesta:** Začiatočník ⭐ | **Čas:** 25-35 minút | **Náklady:** $0-15/mesiac

Kompletné, fungujúce Python Flask REST API nasadené do Azure Container Apps pomocou Azure Developer CLI (azd). Tento príklad demonštruje nasadenie kontajnera, automatické škálovanie a základy monitorovania.

## 🎯 Čo sa naučíte

- Nasadiť kontajnerizovanú Python aplikáciu do Azure
- Nakonfigurovať automatické škálovanie so škálovaním na nulu
- Implementovať health probe a readiness checky
- Monitorovať logy a metriky aplikácie
- Použiť Azure Developer CLI pre rýchle nasadenie

## 📦 Čo je zahrnuté

✅ **Flask Application** - Kompletné REST API s CRUD operáciami (`src/app.py`)  
✅ **Dockerfile** - Produkčná konfigurácia kontajnera  
✅ **Bicep Infrastructure** - Prostredie Container Apps a nasadenie API  
✅ **AZD Configuration** - Nasadenie jedným príkazom  
✅ **Health Probes** - Nakonfigurované kontroly liveness a readiness  
✅ **Auto-scaling** - 0-10 replík na základe HTTP záťaže  

## Architektúra

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Predpoklady

### Požadované
- **Azure Developer CLI (azd)** - [Návod na inštaláciu](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Bezplatný účet](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Inštalácia Dockeru](https://www.docker.com/products/docker-desktop/) (pre lokálne testovanie)

### Overenie predpokladov

```bash
# Skontrolujte verziu azd (potrebná verzia 1.5.0 alebo novšia)
azd version

# Overte prihlásenie do Azure
azd auth login

# Skontrolujte Docker (voliteľné, pre lokálne testovanie)
docker --version
```

## ⏱️ Časový priebeh nasadenia

| Fáza | Trvanie | Čo sa deje |
|-------|----------|--------------||
| Nastavenie prostredia | 30 sekúnd | Vytvorenie azd prostredia |
| Zostavenie kontajnera | 2-3 minúty | Docker build Flask aplikácie |
| Zabezpečenie infraštruktúry | 3-5 minút | Vytvorenie Container Apps, registru, monitorovania |
| Nasadenie aplikácie | 2-3 minúty | Push image a nasadenie do Container Apps |
| **Spolu** | **8-12 minút** | Kompletné nasadenie pripravené |

## Rýchly štart

```bash
# Prejdite na príklad
cd examples/container-app/simple-flask-api

# Inicializujte prostredie (zvoľte jedinečný názov)
azd env new myflaskapi

# Nasaďte všetko (infraštruktúra + aplikácia)
azd up
# Budete vyzvaní:
# 1. Vyberte predplatné Azure
# 2. Vyberte umiestnenie (napr. eastus2)
# 3. Počkajte 8-12 minút na nasadenie

# Získajte koncový bod svojho API
azd env get-values

# Otestujte API
curl $(azd env get-value API_ENDPOINT)/health
```

**Očakávaný výstup:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Overenie nasadenia

### Krok 1: Skontrolujte stav nasadenia

```bash
# Zobraziť nasadené služby
azd show

# Očakávaný výstup zobrazuje:
# - Služba: api
# - Koncový bod: https://ca-api-[env].xxx.azurecontainerapps.io
# - Stav: Beží
```

### Krok 2: Otestujte koncové body API

```bash
# Získať koncový bod API
API_URL=$(azd env get-value API_ENDPOINT)

# Test stavu služby
curl $API_URL/health

# Test koreňového koncového bodu
curl $API_URL/

# Vytvoriť položku
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Získať všetky položky
curl $API_URL/api/items
```

**Kritériá úspechu:**
- ✅ Koncový bod /health vracia HTTP 200
- ✅ Koreňový koncový bod zobrazuje informácie o API
- ✅ POST vytvorí položku a vráti HTTP 201
- ✅ GET vráti vytvorené položky

### Krok 3: Zobraziť logy

```bash
# Streamujte živé protokoly pomocou azd monitor
azd monitor --logs

# Alebo použite Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Mali by ste vidieť:
# - Správy pri spustení Gunicornu
# - Protokoly HTTP požiadaviek
# - Protokoly s informáciami o aplikácii
```

## Štruktúra projektu

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Koncové body API

| Koncový bod | Metóda | Popis |
|----------|--------|-------------|
| `/health` | GET | Kontrola zdravia |
| `/api/items` | GET | Zoznam všetkých položiek |
| `/api/items` | POST | Vytvoriť novú položku |
| `/api/items/{id}` | GET | Získať konkrétnu položku |
| `/api/items/{id}` | PUT | Aktualizovať položku |
| `/api/items/{id}` | DELETE | Vymazať položku |

## Konfigurácia

### Premenné prostredia

```bash
# Nastaviť vlastnú konfiguráciu
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfigurácia škálovania

API sa automaticky škáluje na základe HTTP prevádzky:
- **Min Replicas**: 0 (škáluje na nulu, keď je nečinné)
- **Max Replicas**: 10
- **Počet súbežných požiadaviek na repliku**: 50

## Vývoj

### Spustiť lokálne

```bash
# Nainštalujte závislosti
cd src
pip install -r requirements.txt

# Spustite aplikáciu
python app.py

# Otestujte lokálne
curl http://localhost:8000/health
```

### Zostavenie a testovanie kontajnera

```bash
# Vytvoriť Docker obraz
docker build -t flask-api:local ./src

# Spustiť kontajner lokálne
docker run -p 8000:8000 flask-api:local

# Otestovať kontajner
curl http://localhost:8000/health
```

## Nasadenie

### Plné nasadenie

```bash
# Nasadiť infraštruktúru a aplikáciu
azd up
```

### Nasadenie len kódu

```bash
# Nasadiť len aplikačný kód (infraštruktúra nezmenená)
azd deploy api
```

### Aktualizovať konfiguráciu

```bash
# Aktualizovať premenné prostredia
azd env set API_KEY "new-api-key"

# Znovu nasadiť s novou konfiguráciou
azd deploy api
```

## Monitorovanie

### Zobraziť logy

```bash
# Streamujte živé logy pomocou azd monitor
azd monitor --logs

# Alebo použite Azure CLI pre Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Zobraziť posledných 100 riadkov
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitorovať metriky

```bash
# Otvoriť panel služby Azure Monitor
azd monitor --overview

# Zobraziť konkrétne metriky
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testovanie

### Kontrola zdravotného stavu

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Očakávaná odpoveď:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Vytvoriť položku

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Získať všetky položky

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimalizácia nákladov

Toto nasadenie používa škálovanie na nulu, takže platíte len keď API spracúva požiadavky:

- **Náklady v nečinnosti**: ~$0/mesiac (škálované na nulu)
- **Aktívne náklady**: ~$0.000024/sekundu za repliku
- **Očakávané mesačné náklady** (ľahké používanie): $5-15

### Ďalšie zníženie nákladov

```bash
# Znížiť maximálny počet replík pre vývoj
azd env set MAX_REPLICAS 3

# Použiť kratší časový limit nečinnosti
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minút
```

## Riešenie problémov

### Kontajner sa nespustí

```bash
# Skontrolujte protokoly kontajnera pomocou Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Overte, či sa Docker obraz zostaví lokálne
docker build -t test ./src
```

### API nie je prístupné

```bash
# Overiť, či je ingress externý
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Vysoké časy odozvy

```bash
# Skontrolovať využitie CPU/pamäte
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Zvýšiť zdroje podľa potreby
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Vyčistenie

```bash
# Odstrániť všetky zdroje
azd down --force --purge
```

## Ďalšie kroky

### Rozšíriť tento príklad

1. **Pridať databázu** - Integrovať Azure Cosmos DB alebo SQL Database
   ```bash
   # Pridať modul Cosmos DB do infra/main.bicep
   # Aktualizovať app.py s pripojením k databáze
   ```

2. **Pridať autentifikáciu** - Implementovať Azure AD alebo API kľúče
   ```python
   # Pridať middleware pre autentifikáciu do app.py
   from functools import wraps
   ```

3. **Nastaviť CI/CD** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Pridať Managed Identity** - Zabezpečiť prístup k službám Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Súvisiace príklady

- **[Aplikácia s databázou](../../../../../examples/database-app)** - Kompletný príklad so SQL databázou
- **[Mikroslužby](../../../../../examples/container-app/microservices)** - Architektúra s viacerými službami
- **[Sprievodca Container Apps](../README.md)** - Všetky vzory pre kontajnery

### Vzdelávacie zdroje

- 📚 [Kurz AZD pre začiatočníkov](../../../README.md) - Hlavná stránka kurzu
- 📚 [Vzory Container Apps](../README.md) - Viac vzorov nasadenia
- 📚 [Galéria AZD šablón](https://azure.github.io/awesome-azd/) - Šablóny komunity

## Ďalšie zdroje

### Dokumentácia
- **[Dokumentácia Flask](https://flask.palletsprojects.com/)** - Sprievodca frameworkom Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficiálna dokumentácia Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencia príkazov azd

### Tutoriály
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Nasadiť vašu prvú aplikáciu
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Sprievodca vývojom v Pythone
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktúra ako kód

### Nástroje
- **[Azure Portal](https://portal.azure.com)** - Spravovanie zdrojov vizuálne
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrácia do IDE

---

**🎉 Gratulujeme!** Nasadili ste produkčne pripravené Flask API do Azure Container Apps s automatickým škálovaním a monitorovaním.

**Máte otázky?** [Otvorte issue](https://github.com/microsoft/AZD-for-beginners/issues) alebo skontrolujte [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o vylúčení zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie odporúčame profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->