# Jednoduché Flask API - příklad Container App

**Učební cesta:** Začátečník ⭐ | **Čas:** 25-35 minut | **Cena:** $0-15/měsíc

Kompletní, funkční REST API v Python Flask nasazené do Azure Container Apps pomocí Azure Developer CLI (azd). Tento příklad demonstruje základy nasazení kontejneru, automatického škálování a monitorování.

## 🎯 Co se naučíte

- Nasadit kontejnerizovanou Python aplikaci do Azure
- Nakonfigurovat automatické škálování se škálováním na nulu
- Implementovat zdravotní sondy a kontroly připravenosti
- Sledovat protokoly aplikace a metriky
- Použít Azure Developer CLI pro rychlé nasazení

## 📦 Co je zahrnuto

✅ **Flask aplikace** - Kompletní REST API s CRUD operacemi (`src/app.py`)  
✅ **Dockerfile** - Konfigurace kontejneru připravená pro produkci  
✅ **Infrastruktura Bicep** - prostředí Container Apps a nasazení API  
✅ **Konfigurace AZD** - nastavení nasazení jedním příkazem  
✅ **Health sondy** - nakonfigurované liveness a readiness kontroly  
✅ **Automatické škálování** - 0-10 replik na základě HTTP zátěže  

## Architektura

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

## Požadavky

### Požadováno
- **Azure Developer CLI (azd)** - [Návod k instalaci](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure předplatné** - [Bezplatný účet](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Nainstalovat Docker](https://www.docker.com/products/docker-desktop/) (pro lokální testování)

### Ověření požadavků

```bash
# Zkontrolujte verzi azd (potřebujete 1.5.0 nebo vyšší)
azd version

# Ověřte přihlášení do Azure
azd auth login

# Zkontrolujte Docker (volitelné, pro lokální testování)
docker --version
```

## ⏱️ Časový plán nasazení

| Fáze | Doba trvání | Co se děje |
|-------|----------|--------------||
| Nastavení prostředí | 30 sekund | Vytvoření azd prostředí |
| Sestavení kontejneru | 2-3 minuty | Sestavení Flask aplikace pomocí Dockeru |
| Zajištění infrastruktury | 3-5 minut | Vytvoření Container Apps, registru, monitorování |
| Nasazení aplikace | 2-3 minuty | Nahrání image a nasazení do Container Apps |
| **Celkem** | **8-12 minut** | Nasazení dokončeno a připraveno |

## Rychlý start

```bash
# Přejděte na příklad
cd examples/container-app/simple-flask-api

# Inicializujte prostředí (zvolte jedinečné jméno)
azd env new myflaskapi

# Nasadit vše (infrastruktura + aplikace)
azd up
# Budete vyzváni k:
# 1. Vyberte předplatné Azure
# 2. Zvolte umístění (např. eastus2)
# 3. Počkejte 8–12 minut na nasazení

# Získejte svůj koncový bod API
azd env get-values

# Otestujte API
curl $(azd env get-value API_ENDPOINT)/health
```

**Očekávaný výstup:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Ověření nasazení

### Krok 1: Zkontrolujte stav nasazení

```bash
# Zobrazit nasazené služby
azd show

# Očekávaný výstup ukazuje:
# - Služba: api
# - Koncový bod: https://ca-api-[env].xxx.azurecontainerapps.io
# - Stav: Běží
```

### Krok 2: Otestujte koncové body API

```bash
# Získat koncový bod API
API_URL=$(azd env get-value API_ENDPOINT)

# Kontrola stavu
curl $API_URL/health

# Test kořenového endpointu
curl $API_URL/

# Vytvořit položku
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Získat všechny položky
curl $API_URL/api/items
```

**Kritéria úspěchu:**
- ✅ Health endpoint vrátí HTTP 200
- ✅ Kořenový endpoint zobrazí informace o API
- ✅ POST vytvoří položku a vrátí HTTP 201
- ✅ GET vrátí vytvořené položky

### Krok 3: Zobrazit logy

```bash
# Sledujte živé záznamy pomocí azd monitor
azd monitor --logs

# Nebo použijte Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Měli byste vidět:
# - zprávy o spuštění Gunicornu
# - záznamy HTTP požadavků
# - informační záznamy aplikace
```

## Struktura projektu

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

## API koncové body

| Koncový bod | Metoda | Popis |
|----------|--------|-------------|
| `/health` | GET | Kontrola stavu |
| `/api/items` | GET | Vypsat všechny položky |
| `/api/items` | POST | Vytvořit novou položku |
| `/api/items/{id}` | GET | Získat konkrétní položku |
| `/api/items/{id}` | PUT | Aktualizovat položku |
| `/api/items/{id}` | DELETE | Odstranit položku |

## Konfigurace

### Proměnné prostředí

```bash
# Nastavte vlastní konfiguraci
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfigurace škálování

API se automaticky škáluje na základě HTTP provozu:
- **Minimální repliky**: 0 (škáluje na nulu, když je nečinné)
- **Maximální repliky**: 10
- **Současné požadavky na repliku**: 50

## Vývoj

### Spuštění lokálně

```bash
# Nainstalovat závislosti
cd src
pip install -r requirements.txt

# Spustit aplikaci
python app.py

# Otestovat lokálně
curl http://localhost:8000/health
```

### Sestavení a testování kontejneru

```bash
# Sestavit Docker obraz
docker build -t flask-api:local ./src

# Spustit kontejner lokálně
docker run -p 8000:8000 flask-api:local

# Otestovat kontejner
curl http://localhost:8000/health
```

## Nasazení

### Plné nasazení

```bash
# Nasadit infrastrukturu a aplikaci
azd up
```

### Nasazení pouze kódu

```bash
# Nasadit pouze kód aplikace (infrastruktura beze změny)
azd deploy api
```

### Aktualizace konfigurace

```bash
# Aktualizujte proměnné prostředí
azd env set API_KEY "new-api-key"

# Znovu nasaďte s novou konfigurací
azd deploy api
```

## Monitorování

### Zobrazit logy

```bash
# Streamujte živé protokoly pomocí azd monitor
azd monitor --logs

# Nebo použijte Azure CLI pro Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Zobrazit posledních 100 řádků
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Sledovat metriky

```bash
# Otevřít řídicí panel Azure Monitor
azd monitor --overview

# Zobrazit konkrétní metriky
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testování

### Kontrola zdraví

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Očekávaná odpověď:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Vytvořit položku

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Získat všechny položky

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimalizace nákladů

Toto nasazení používá škálování na nulu, takže platíte pouze když API zpracovává požadavky:

- **Náklady v nečinnosti**: ~$0/měsíc (škálováno na nulu)
- **Aktivní náklady**: ~$0.000024/sekundu za repliku
- **Odhadované měsíční náklady** (při malém zatížení): $5-15

### Další snížení nákladů

```bash
# Snížit maximální počet replik pro vývojové prostředí
azd env set MAX_REPLICAS 3

# Použít kratší časový limit nečinnosti
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minut
```

## Řešení problémů

### Kontejner se nespustí

```bash
# Zkontrolujte protokoly kontejneru pomocí Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Ověřte lokální sestavení Docker obrazu
docker build -t test ./src
```

### API není přístupné

```bash
# Ověřte, že ingress je externí
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Vysoké časy odezvy

```bash
# Zkontrolujte využití CPU a paměti
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Zvyšte zdroje podle potřeby
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Úklid

```bash
# Smazat všechny zdroje
azd down --force --purge
```

## Další kroky

### Rozšíření tohoto příkladu

1. **Přidat databázi** - Integrujte Azure Cosmos DB nebo SQL Database
   ```bash
   # Přidat modul Cosmos DB do infra/main.bicep
   # Aktualizovat app.py s připojením k databázi
   ```

2. **Přidat autentizaci** - Implementujte Azure AD nebo API klíče
   ```python
   # Přidejte middleware pro autentizaci do app.py
   from functools import wraps
   ```

3. **Nastavit CI/CD** - pracovní postup GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Přidat spravovanou identitu** - Zabezpečit přístup k službám Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Související příklady

- **[Databázová aplikace](../../../../../examples/database-app)** - Kompletní příklad se SQL databází
- **[Mikroslužby](../../../../../examples/container-app/microservices)** - Architektura s více službami
- **[Hlavní průvodce Container Apps](../README.md)** - Všechny vzory kontejnerů

### Studijní zdroje

- 📚 [Kurz AZD pro začátečníky](../../../README.md) - Hlavní stránka kurzu
- 📚 [Vzorové postupy Container Apps](../README.md) - Více vzorů nasazení
- 📚 [Galerie šablon AZD](https://azure.github.io/awesome-azd/) - Šablony od komunity

## Další zdroje

### Dokumentace
- **[Dokumentace Flask](https://flask.palletsprojects.com/)** - Průvodce frameworkem Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficiální dokumentace Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - referenční příručka příkazů azd

### Návody
- **[Rychlý start Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Nasazení první aplikace
- **[Python na Azure](https://learn.microsoft.com/azure/developer/python/)** - Průvodce vývojem v Pythonu
- **[Jazyk Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktura jako kód

### Nástroje
- **[Azure Portal](https://portal.azure.com)** - Spravovat prostředky vizuálně
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrace do IDE

---

**🎉 Gratulujeme!** Nasadili jste produkční Flask API do Azure Container Apps s automatickým škálováním a monitorováním.

**Máte dotazy?** [Otevřete issue](https://github.com/microsoft/AZD-for-beginners/issues) nebo zkontrolujte [Často kladené dotazy (FAQ)](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí služby pro překlad založené na umělé inteligenci [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho originálním jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nepřebíráme odpovědnost za jakákoli nedorozumění nebo chybné výklady vzniklé z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->