<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-23T12:16:45+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "cs"
}
-->
# Jednoduché Flask API - Příklad aplikace v kontejneru

**Úroveň znalostí:** Začátečník ⭐ | **Čas:** 25-35 minut | **Cena:** $0-15/měsíc

Kompletní, funkční Python Flask REST API nasazené do Azure Container Apps pomocí Azure Developer CLI (azd). Tento příklad ukazuje základy nasazení kontejneru, automatického škálování a monitorování.

## 🎯 Co se naučíte

- Nasadit kontejnerizovanou Python aplikaci do Azure
- Nastavit automatické škálování s funkcí scale-to-zero
- Implementovat zdravotní sondy a kontroly připravenosti
- Monitorovat aplikační logy a metriky
- Používat Azure Developer CLI pro rychlé nasazení

## 📦 Co je součástí

✅ **Flask aplikace** - Kompletní REST API s CRUD operacemi (`src/app.py`)  
✅ **Dockerfile** - Konfigurace kontejneru připravená pro produkci  
✅ **Bicep infrastruktura** - Prostředí Container Apps a nasazení API  
✅ **Konfigurace AZD** - Nastavení pro nasazení jedním příkazem  
✅ **Zdravotní sondy** - Konfigurované kontroly živosti a připravenosti  
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

## Předpoklady

### Požadováno
- **Azure Developer CLI (azd)** - [Průvodce instalací](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure předplatné** - [Bezplatný účet](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instalace Dockeru](https://www.docker.com/products/docker-desktop/) (pro lokální testování)

### Ověření předpokladů

```bash
# Zkontrolujte verzi azd (potřebná verze 1.5.0 nebo vyšší)
azd version

# Ověřte přihlášení do Azure
azd auth login

# Zkontrolujte Docker (volitelné, pro lokální testování)
docker --version
```

## ⏱️ Časový plán nasazení

| Fáze | Doba trvání | Co se děje |
|------|-------------|------------|
| Nastavení prostředí | 30 sekund | Vytvoření azd prostředí |
| Sestavení kontejneru | 2-3 minuty | Docker sestaví Flask aplikaci |
| Zajištění infrastruktury | 3-5 minut | Vytvoření Container Apps, registru, monitorování |
| Nasazení aplikace | 2-3 minuty | Push image a nasazení do Container Apps |
| **Celkem** | **8-12 minut** | Kompletní připravené nasazení |

## Rychlý start

```bash
# Přejděte na příklad
cd examples/container-app/simple-flask-api

# Inicializujte prostředí (vyberte jedinečný název)
azd env new myflaskapi

# Nasazení všeho (infrastruktura + aplikace)
azd up
# Budete vyzváni k:
# 1. Výběru předplatného Azure
# 2. Výběru umístění (např. eastus2)
# 3. Počkejte 8-12 minut na nasazení

# Získejte svůj API endpoint
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

### Krok 2: Testujte API endpointy

```bash
# Získat API endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Otestovat zdraví
curl $API_URL/health

# Otestovat kořenový endpoint
curl $API_URL/

# Vytvořit položku
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Získat všechny položky
curl $API_URL/api/items
```

**Kritéria úspěchu:**
- ✅ Endpoint zdraví vrací HTTP 200
- ✅ Root endpoint zobrazuje informace o API
- ✅ POST vytvoří položku a vrátí HTTP 201
- ✅ GET vrací vytvořené položky

### Krok 3: Zobrazení logů

```bash
# Streamujte živé logy
azd logs api --follow

# Měli byste vidět:
# - Zprávy o spuštění Gunicornu
# - Logy HTTP požadavků
# - Logy informací aplikace
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

## API Endpointy

| Endpoint | Metoda | Popis |
|----------|--------|-------|
| `/health` | GET | Kontrola zdraví |
| `/api/items` | GET | Seznam všech položek |
| `/api/items` | POST | Vytvoření nové položky |
| `/api/items/{id}` | GET | Získání konkrétní položky |
| `/api/items/{id}` | PUT | Aktualizace položky |
| `/api/items/{id}` | DELETE | Smazání položky |

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
- **Minimální počet replik**: 0 (škáluje na nulu, když je nečinné)
- **Maximální počet replik**: 10
- **Počet současných požadavků na repliku**: 50

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
# Vytvořit Docker image
docker build -t flask-api:local ./src

# Spustit kontejner lokálně
docker run -p 8000:8000 flask-api:local

# Otestovat kontejner
curl http://localhost:8000/health
```

## Nasazení

### Kompletní nasazení

```bash
# Nasadit infrastrukturu a aplikaci
azd up
```

### Nasazení pouze kódu

```bash
# Nasadit pouze aplikační kód (infrastruktura nezměněna)
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
# Streamujte živé logy
azd logs api --follow

# Zobrazte posledních 100 řádků
azd logs api --tail 100
```

### Monitorování metrik

```bash
# Otevřít dashboard Azure Monitor
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

### Vytvoření položky

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Získání všech položek

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimalizace nákladů

Toto nasazení používá scale-to-zero, takže platíte pouze tehdy, když API zpracovává požadavky:

- **Náklady při nečinnosti**: ~$0/měsíc (škálováno na nulu)
- **Náklady při aktivitě**: ~$0.000024/sekundu na repliku
- **Očekávané měsíční náklady** (lehký provoz): $5-15

### Další snížení nákladů

```bash
# Snižte maximální počet replik pro vývoj
azd env set MAX_REPLICAS 3

# Použijte kratší časový limit nečinnosti
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minut
```

## Řešení problémů

### Kontejner se nespustí

```bash
# Zkontrolujte logy kontejneru
azd logs api --tail 100

# Ověřte, že Docker image se sestavuje lokálně
docker build -t test ./src
```

### API není dostupné

```bash
# Ověřte, že vstup je externí
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Vysoké doby odezvy

```bash
# Zkontrolujte využití CPU/paměti
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Zvyšte zdroje, pokud je to potřeba
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Vyčištění

```bash
# Smazat všechny zdroje
azd down --force --purge
```

## Další kroky

### Rozšíření tohoto příkladu

1. **Přidání databáze** - Integrace Azure Cosmos DB nebo SQL Database
   ```bash
   # Přidejte modul Cosmos DB do infra/main.bicep
   # Aktualizujte app.py s připojením k databázi
   ```

2. **Přidání autentizace** - Implementace Azure AD nebo API klíčů
   ```python
   # Přidejte middleware pro autentizaci do app.py
   from functools import wraps
   ```

3. **Nastavení CI/CD** - Workflow GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Přidání spravované identity** - Zabezpečený přístup k Azure službám
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Související příklady

- **[Aplikace s databází](../../../../../examples/database-app)** - Kompletní příklad se SQL databází
- **[Mikroslužby](../../../../../examples/container-app/microservices)** - Architektura s více službami
- **[Hlavní průvodce Container Apps](../README.md)** - Všechny vzory kontejnerů

### Výukové materiály

- 📚 [Kurz AZD pro začátečníky](../../../README.md) - Hlavní stránka kurzu
- 📚 [Vzory Container Apps](../README.md) - Další vzory nasazení
- 📚 [Galerie šablon AZD](https://azure.github.io/awesome-azd/) - Šablony od komunity

## Další zdroje

### Dokumentace
- **[Dokumentace Flask](https://flask.palletsprojects.com/)** - Průvodce frameworkem Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficiální dokumentace Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referenční příručka příkazů azd

### Tutoriály
- **[Rychlý start Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Nasazení první aplikace
- **[Python na Azure](https://learn.microsoft.com/azure/developer/python/)** - Průvodce vývojem v Pythonu
- **[Jazyk Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktura jako kód

### Nástroje
- **[Azure Portal](https://portal.azure.com)** - Vizualní správa zdrojů
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrace do IDE

---

**🎉 Gratulujeme!** Nasadili jste produkčně připravené Flask API do Azure Container Apps s automatickým škálováním a monitorováním.

**Dotazy?** [Otevřete problém](https://github.com/microsoft/AZD-for-beginners/issues) nebo si přečtěte [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->