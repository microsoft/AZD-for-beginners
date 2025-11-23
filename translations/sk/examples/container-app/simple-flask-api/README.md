<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-23T12:18:24+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "sk"
}
-->
# Jednoduché Flask API - Príklad aplikácie v kontajneri

**Úroveň učenia:** Začiatočník ⭐ | **Čas:** 25-35 minút | **Cena:** $0-15/mesiac

Kompletné, funkčné Python Flask REST API nasadené do Azure Container Apps pomocou Azure Developer CLI (azd). Tento príklad demonštruje nasadenie kontajnera, automatické škálovanie a základy monitorovania.

## 🎯 Čo sa naučíte

- Nasadiť kontajnerizovanú Python aplikáciu do Azure
- Konfigurovať automatické škálovanie s funkciou scale-to-zero
- Implementovať zdravotné sondy a kontroly pripravenosti
- Monitorovať logy aplikácie a metriky
- Používať Azure Developer CLI na rýchle nasadenie

## 📦 Čo je zahrnuté

✅ **Flask aplikácia** - Kompletné REST API s CRUD operáciami (`src/app.py`)  
✅ **Dockerfile** - Konfigurácia kontajnera pripravená na produkciu  
✅ **Bicep infraštruktúra** - Prostredie Container Apps a nasadenie API  
✅ **Konfigurácia AZD** - Nastavenie na nasadenie jedným príkazom  
✅ **Zdravotné sondy** - Konfigurované kontroly živosti a pripravenosti  
✅ **Automatické škálovanie** - 0-10 replík na základe HTTP záťaže  

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
- **Azure Developer CLI (azd)** - [Inštalačný návod](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure predplatné** - [Bezplatný účet](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Inštalácia Dockeru](https://www.docker.com/products/docker-desktop/) (na lokálne testovanie)

### Overenie predpokladov

```bash
# Skontrolujte verziu azd (potrebná je 1.5.0 alebo vyššia)
azd version

# Overte prihlásenie do Azure
azd auth login

# Skontrolujte Docker (voliteľné, pre lokálne testovanie)
docker --version
```

## ⏱️ Časový harmonogram nasadenia

| Fáza | Trvanie | Čo sa deje |
|------|---------|------------||
| Nastavenie prostredia | 30 sekúnd | Vytvorenie azd prostredia |
| Vytvorenie kontajnera | 2-3 minúty | Docker build Flask aplikácie |
| Poskytnutie infraštruktúry | 3-5 minút | Vytvorenie Container Apps, registrácie, monitorovania |
| Nasadenie aplikácie | 2-3 minúty | Nahratie obrazu a nasadenie do Container Apps |
| **Celkom** | **8-12 minút** | Kompletné pripravené nasadenie |

## Rýchly štart

```bash
# Prejdite na príklad
cd examples/container-app/simple-flask-api

# Inicializujte prostredie (vyberte jedinečný názov)
azd env new myflaskapi

# Nasadzujte všetko (infraštruktúra + aplikácia)
azd up
# Budete vyzvaní:
# 1. Vybrať predplatné Azure
# 2. Vybrať lokalitu (napr. eastus2)
# 3. Počkajte 8-12 minút na nasadenie

# Získajte svoj API endpoint
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

# Očakávaný výstup ukazuje:
# - Služba: api
# - Koncový bod: https://ca-api-[env].xxx.azurecontainerapps.io
# - Stav: Beží
```

### Krok 2: Testujte API endpointy

```bash
# Získať API endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Otestovať zdravie
curl $API_URL/health

# Otestovať root endpoint
curl $API_URL/

# Vytvoriť položku
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Získať všetky položky
curl $API_URL/api/items
```

**Kritériá úspechu:**
- ✅ Endpoint zdravia vracia HTTP 200
- ✅ Root endpoint zobrazuje informácie o API
- ✅ POST vytvára položku a vracia HTTP 201
- ✅ GET vracia vytvorené položky

### Krok 3: Zobrazenie logov

```bash
# Streamujte živé logy
azd logs api --follow

# Mali by ste vidieť:
# - Správy o spustení Gunicorn
# - Logy HTTP požiadaviek
# - Logy informácií aplikácie
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

## API Endpointy

| Endpoint | Metóda | Popis |
|----------|--------|-------|
| `/health` | GET | Kontrola zdravia |
| `/api/items` | GET | Zoznam všetkých položiek |
| `/api/items` | POST | Vytvorenie novej položky |
| `/api/items/{id}` | GET | Získanie konkrétnej položky |
| `/api/items/{id}` | PUT | Aktualizácia položky |
| `/api/items/{id}` | DELETE | Odstránenie položky |

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
- **Minimálny počet replík**: 0 (škáluje na nulu, keď je nečinné)
- **Maximálny počet replík**: 10
- **Počet súbežných požiadaviek na repliku**: 50

## Vývoj

### Spustenie lokálne

```bash
# Nainštalujte závislosti
cd src
pip install -r requirements.txt

# Spustite aplikáciu
python app.py

# Otestujte lokálne
curl http://localhost:8000/health
```

### Vytvorenie a testovanie kontajnera

```bash
# Vytvorte Docker obraz
docker build -t flask-api:local ./src

# Spustite kontajner lokálne
docker run -p 8000:8000 flask-api:local

# Otestujte kontajner
curl http://localhost:8000/health
```

## Nasadenie

### Kompletné nasadenie

```bash
# Nasadiť infraštruktúru a aplikáciu
azd up
```

### Nasadenie iba kódu

```bash
# Nasadiť iba aplikačný kód (infraštruktúra nezmenená)
azd deploy api
```

### Aktualizácia konfigurácie

```bash
# Aktualizovať premenné prostredia
azd env set API_KEY "new-api-key"

# Znovu nasadiť s novou konfiguráciou
azd deploy api
```

## Monitorovanie

### Zobrazenie logov

```bash
# Streamovať živé logy
azd logs api --follow

# Zobraziť posledných 100 riadkov
azd logs api --tail 100
```

### Monitorovanie metrík

```bash
# Otvorte panel Azure Monitor
azd monitor --overview

# Zobraziť konkrétne metriky
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testovanie

### Kontrola zdravia

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

### Vytvorenie položky

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Získanie všetkých položiek

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimalizácia nákladov

Toto nasadenie používa scale-to-zero, takže platíte iba vtedy, keď API spracováva požiadavky:

- **Náklady pri nečinnosti**: ~$0/mesiac (škálované na nulu)
- **Náklady pri aktívnom používaní**: ~$0.000024/sekunda na repliku
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
# Skontrolujte logy kontajnera
azd logs api --tail 100

# Overte, či sa Docker image zostavuje lokálne
docker build -t test ./src
```

### API nie je dostupné

```bash
# Overte, že prístup je externý
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Vysoké časy odozvy

```bash
# Skontrolujte využitie CPU/pamäte
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Zväčšite zdroje, ak je to potrebné
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Vyčistenie

```bash
# Odstrániť všetky zdroje
azd down --force --purge
```

## Ďalšie kroky

### Rozšírenie tohto príkladu

1. **Pridanie databázy** - Integrácia Azure Cosmos DB alebo SQL Database
   ```bash
   # Pridajte modul Cosmos DB do infra/main.bicep
   # Aktualizujte app.py s pripojením k databáze
   ```

2. **Pridanie autentifikácie** - Implementácia Azure AD alebo API kľúčov
   ```python
   # Pridajte middleware autentifikácie do app.py
   from functools import wraps
   ```

3. **Nastavenie CI/CD** - Workflow GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Pridanie spravovanej identity** - Zabezpečený prístup k Azure službám
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Súvisiace príklady

- **[Aplikácia s databázou](../../../../../examples/database-app)** - Kompletný príklad so SQL databázou
- **[Mikroslužby](../../../../../examples/container-app/microservices)** - Architektúra s viacerými službami
- **[Hlavný sprievodca Container Apps](../README.md)** - Všetky vzory kontajnerov

### Zdroje na učenie

- 📚 [Kurz AZD pre začiatočníkov](../../../README.md) - Hlavná stránka kurzu
- 📚 [Vzory Container Apps](../README.md) - Ďalšie vzory nasadenia
- 📚 [Galéria šablón AZD](https://azure.github.io/awesome-azd/) - Šablóny od komunity

## Dodatočné zdroje

### Dokumentácia
- **[Dokumentácia Flask](https://flask.palletsprojects.com/)** - Sprievodca frameworkom Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficiálna dokumentácia Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referencia príkazov azd

### Tutoriály
- **[Rýchly štart Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Nasadenie vašej prvej aplikácie
- **[Python na Azure](https://learn.microsoft.com/azure/developer/python/)** - Sprievodca vývojom v Pythone
- **[Jazyk Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infraštruktúra ako kód

### Nástroje
- **[Azure Portal](https://portal.azure.com)** - Vizualizované spravovanie zdrojov
- **[Rozšírenie VS Code Azure](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrácia do IDE

---

**🎉 Gratulujeme!** Nasadili ste produkčne pripravené Flask API do Azure Container Apps s automatickým škálovaním a monitorovaním.

**Otázky?** [Otvorte problém](https://github.com/microsoft/AZD-for-beginners/issues) alebo si pozrite [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->