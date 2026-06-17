# Simple Flask API - Container App Example

**Learning Path:** Začátečník ⭐ | **Time:** 25-35 minutes | **Cost:** $0-15/month

Kompletní, funkční Python Flask REST API nasazené do Azure Container Apps pomocí Azure Developer CLI (azd). Tento příklad demonstruje nasazení kontejneru, automatické škálování a základy monitorování.

## 🎯 Co se naučíte

- Nasadit kontejnerizovanou Python aplikaci do Azure
- Nakonfigurovat automatické škálování se škálováním na nulu
- Implementovat health probe a readiness checky
- Monitorovat logy a metriky aplikace
- Používat Azure Developer CLI pro rychlé nasazení

## 📦 Co je součástí

✅ **Flask Application** - Kompletní REST API s CRUD operacemi (`src/app.py`)  
✅ **Dockerfile** - Produkční konfigurace kontejneru  
✅ **Bicep Infrastructure** - Prostředí Container Apps a nasazení API  
✅ **AZD Configuration** - Nastavení nasazení jedním příkazem  
✅ **Health Probes** - Nakonfigurovány liveness a readiness checky  
✅ **Auto-scaling** - 0-10 replik na základě HTTP zátěže  

## Architecture

```mermaid
graph TD
    subgraph ACA[Prostředí Azure Container Apps]
        Flask[Kontejner Flask API<br/>Kontrolní endpointy<br/>REST API<br/>Automatické škálování 0-10 replik]
        AppInsights[Application Insights]
    end
```

## Prerekvizity

### Požadováno
- **Azure Developer CLI (azd)** - [Install guide](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (pro místní testování)

### Ověření požadavků

```bash
# Zkontrolujte verzi azd (vyžaduje se 1.5.0 nebo novější)
azd version

# Ověřte přihlášení do Azure
azd auth login

# Zkontrolujte Docker (volitelné, pro lokální testování)
docker --version
```

## ⏱️ Časový průběh nasazení

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Rychlý start

```bash
# Přejděte na příklad
cd examples/container-app/simple-flask-api

# Inicializujte prostředí (zvolte jedinečný název)
azd env new myflaskapi

# Nasaďte vše (infrastrukturu + aplikaci)
azd up
# Budete vyzváni k:
# 1. Vyberte předplatné Azure
# 2. Zvolte umístění (např. eastus2)
# 3. Počkejte 8-12 minut na nasazení

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

# Test kořenového koncového bodu
curl $API_URL/

# Vytvořit položku
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Získat všechny položky
curl $API_URL/api/items
```

**Kritéria úspěchu:**
- ✅ Health endpoint vrací HTTP 200
- ✅ Kořenový endpoint zobrazí informace o API
- ✅ POST vytvoří položku a vrátí HTTP 201
- ✅ GET vrátí vytvořené položky

### Krok 3: Zobrazení logů

```bash
# Sledujte živé záznamy pomocí azd monitor
azd monitor --logs

# Nebo použijte Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Měli byste vidět:
# - Zprávy o spuštění Gunicornu
# - Záznamy HTTP požadavků
# - Informační záznamy aplikace
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

## Koncové body API

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Kontrola stavu |
| `/api/items` | GET | Vypsat všechny položky |
| `/api/items` | POST | Vytvořit novou položku |
| `/api/items/{id}` | GET | Získat konkrétní položku |
| `/api/items/{id}` | PUT | Aktualizovat položku |
| `/api/items/{id}` | DELETE | Smazat položku |

## Konfigurace

### Proměnné prostředí

```bash
# Nastavit vlastní konfiguraci
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfigurace škálování

API se automaticky škáluje na základě HTTP provozu:
- **Min Replicas**: 0 (škáluje na nulu při nečinnosti)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Vývoj

### Spuštění lokálně

```bash
# Nainstalujte závislosti
cd src
pip install -r requirements.txt

# Spusťte aplikaci
python app.py

# Otestujte lokálně
curl http://localhost:8000/health
```

### Sestavení a testování kontejneru

```bash
# Sestavit Docker image
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
# Nasadit pouze aplikační kód (infrastruktura beze změn)
azd deploy api
```

### Aktualizace konfigurace

```bash
# Aktualizovat proměnné prostředí
azd env set API_KEY "new-api-key"

# Znovu nasadit s novou konfigurací
azd deploy api
```

## Monitorování

### Zobrazení logů

```bash
# Sledujte živé protokoly pomocí azd monitor
azd monitor --logs

# Nebo použijte Azure CLI pro Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Zobrazit posledních 100 řádků
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Sledování metrik

```bash
# Otevřít řídicí panel Azure Monitoru
azd monitor --overview

# Zobrazit konkrétní metriky
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testování

### Kontrola stavu

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

### Vytvoření položky

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

Toto nasazení používá škálování na nulu, takže platíte pouze, když API zpracovává požadavky:

- **Náklady při nečinnosti**: ~$0/month (scaled to zero)
- **Aktivní náklady**: ~$0.000024/second per replica
- **Očekávané měsíční náklady** (při nízkém využití): $5-15

### Další snížení nákladů

```bash
# Snížit maximální počet replik pro vývoj
azd env set MAX_REPLICAS 3

# Použít kratší časový limit nečinnosti
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minut
```

## Řešení problémů

### Kontejner se nespustí

```bash
# Zkontrolujte protokoly kontejneru pomocí Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Ověřte, že se Docker obraz sestavuje lokálně
docker build -t test ./src
```

### API není dostupné

```bash
# Ověřte, že je ingress externí
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Vysoké doby odezvy

```bash
# Zkontrolujte využití CPU/paměti
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Zvyšte prostředky v případě potřeby
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Vyčištění

```bash
# Odstraňte všechny zdroje
azd down --force --purge
```

## Další kroky

### Rozšíření tohoto příkladu

1. **Přidat databázi** - Integrace Azure Cosmos DB nebo SQL Database
   ```bash
   # Přidat modul Cosmos DB do infra/main.bicep
   # Aktualizovat app.py s připojením k databázi
   ```

2. **Přidat autentizaci** - Implementovat Microsoft Entra ID nebo API klíče
   ```python
   # Přidejte autentizační middleware do app.py
   from functools import wraps
   ```

3. **Nastavit CI/CD** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Přidat spravovanou identitu** - Zabezpečit přístup k Azure službám
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Související příklady

- **[Aplikace s databází](../../../../../examples/database-app)** - Kompletní příklad se SQL Database
- **[Mikroslužby](../../../../../examples/container-app/microservices)** - Architektura s více službami
- **[Průvodce Container Apps](../README.md)** - Všechny vzory kontejnerů

### Vzdělávací zdroje

- 📚 [Kurz AZD pro začátečníky](../../../README.md) - Hlavní stránka kurzu
- 📚 [Vzory Container Apps](../README.md) - Další vzory nasazení
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Šablony komunity

## Další zdroje

### Dokumentace
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Průvodce frameworkem Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficiální dokumentace Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Reference příkazů azd

### Tutoriály
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Nasadťe svou první aplikaci
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Průvodce vývojem v Pythonu pro Azure
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktura jako kód

### Nástroje
- **[Azure Portal](https://portal.azure.com)** - Spravujte zdroje vizuálně
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrace do IDE

---

**🎉 Gratulujeme!** Nasadili jste produkční Flask API do Azure Container Apps s automatickým škálováním a monitorováním.

**Dotazy?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) nebo si prohlédněte [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->