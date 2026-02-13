# Lihtne Flask API - konteinerirakenduse näide

**Õppeteekond:** Algaja ⭐ | **Aeg:** 25-35 minutit | **Kulu:** 0-15 $ kuus

Töökindel Python Flask REST API, mis on juurutatud Azure Container Apps keskkonda, kasutades Azure Developer CLI (azd). See näide demonstreerib konteineri juurutamist, automaatset skaleerimist ja põhiseiret.

## 🎯 Mida sa õpid

- Juurutada konteineriseeritud Python rakendus Azure’i
- Konfigureerida automaatne skaleerimine koos skaleerimisega nullini
- Rakendada terviseproove ja valmiduse kontrolle
- Jälgida rakenduse logisid ja mõõdikuid
- Kasutada Azure Developer CLI kiireks juurutamiseks

## 📦 Mida see sisaldab

✅ **Flaski rakendus** - Täielik REST API koos CRUD operatsioonidega (`src/app.py`)  
✅ **Dockerfile** - Tootmiskõlbulik konteineri konfiguratsioon  
✅ **Bicep infrastruktuur** - Container Apps keskkond ja API juurutus  
✅ **AZD konfiguratsioon** - Ühekäsuline juurutuseadistus  
✅ **Terviseproovid** - Liveness ja readiness kontrollid seadistatud  
✅ **Automaatne skaleerimine** - 0-10 koopiat HTTP koormuse põhjal  

## Arhitektuur

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

## Eeltingimused

### Nõutud
- **Azure Developer CLI (azd)** - [Paigaldusjuhend](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure tellimus** - [Tasuta konto](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Paigalda Docker](https://www.docker.com/products/docker-desktop/) (kohalikuks testimiseks)

### Kontrolli eeltingimusi

```bash
# Kontrolli azd versiooni (vajalik 1.5.0 või uuem)
azd version

# Kontrolli Azure sisse logimist
azd auth login

# Kontrolli Dockerit (valikuline, lokaalseks testimiseks)
docker --version
```

## ⏱️ Juurutuse ajaskaala

| Faas | Kestus | Mis toimub |
|-------|----------|--------------||
| Keskkonna seadistus | 30 sekundit | Loo azd keskkond |
| Konteineri ehitus | 2-3 minutit | Ehita Dockeriga Flask rakendus |
| Infrastruktuuri loomine | 3-5 minutit | Loo Container Apps, register, monitooring |
| Rakenduse juurutus | 2-3 minutit | Lükka pilt ja juuruta Container Apps keskkonda |
| **Kõik kokku** | **8-12 minutit** | Juurutus lõpetatud ja valmis |

## Kiire algus

```bash
# Navigeeri näidise juurde
cd examples/container-app/simple-flask-api

# Initsialiseeri keskkond (valige unikaalne nimi)
azd env new myflaskapi

# Paigalda kõik (taristu + rakendus)
azd up
# Sulle esitatakse järgmised küsimused:
# 1. Vali Azure tellimus
# 2. Vali asukoht (nt eastus2)
# 3. Oota 8–12 minutit paigalduseks

# Hangi oma API lõpp-punkt
azd env get-values

# Testi API-t
curl $(azd env get-value API_ENDPOINT)/health
```

**Oodatav väljund:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Kontrolli juurutust

### Samm 1: Kontrolli juurutuse staatust

```bash
# Vaata juurutatud teenuseid
azd show

# Oodatud väljund näitab:
# - Teenus: api
# - Lõpp-punkt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Olekur: Töötamas
```

### Samm 2: Testi API lõpp-punkte

```bash
# API lõpp-punkti hankimine
API_URL=$(azd env get-value API_ENDPOINT)

# Tervise kontrollimine
curl $API_URL/health

# Juure lõpp-punkti testimine
curl $API_URL/

# Üksuse loomine
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Kõigi üksuste hankimine
curl $API_URL/api/items
```

**Edu kriteeriumid:**
- ✅ Tervise lõpp-punkt annab HTTP 200 vastuse
- ✅ Juure lõpp-punkt kuvab API infot
- ✅ POST loob kirje ja tagastab HTTP 201
- ✅ GET tagastab loodud kirjed

### Samm 3: Vaata logisid

```bash
# Voogesitage reaalajas logisid, kasutades azd monitori
azd monitor --logs

# Või kasutage Azure CLI-d:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Te peaksite nägema:
# - Gunicorni käivitussõnumeid
# - HTTP-päringu logisid
# - Rakenduse teabe logisid
```

## Projekti struktuur

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

## API lõpp-punktid

| Lõpp-punkt | Meetod | Kirjeldus |
|----------|--------|-------------|
| `/health` | GET | Tervisekontroll |
| `/api/items` | GET | Kõik kirjed |
| `/api/items` | POST | Uue kirje loomine |
| `/api/items/{id}` | GET | Konkreetne kirje |
| `/api/items/{id}` | PUT | Kirje uuendamine |
| `/api/items/{id}` | DELETE | Kirje kustutamine |

## Konfiguratsioon

### Keskkonnamuutujad

```bash
# Määra kohandatud konfiguratsioon
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skaleerimise konfiguratsioon

API skaleerub automaatselt HTTP liikluse põhjal:
- **Minimaalne koopiate arv**: 0 (skaleerib nullini, kui pole koormust)
- **Maksimaalne koopiate arv**: 10
- **Konkurentsete päringute arv koopia kohta**: 50

## Arendamine

### Käivita kohapeal

```bash
# Paigalda sõltuvused
cd src
pip install -r requirements.txt

# Käivita rakendus
python app.py

# Testi kohapeal
curl http://localhost:8000/health
```

### Konteineri ehitus ja testimine

```bash
# Ehita Dockeri pilt
docker build -t flask-api:local ./src

# Käivita konteiner lokaalselt
docker run -p 8000:8000 flask-api:local

# Testi konteinerit
curl http://localhost:8000/health
```

## Juurutus

### Täielik juurutus

```bash
# Paigalda infrastruktuur ja rakendus
azd up
```

### Ainult koodi juurutus

```bash
# Kasuta ainult rakenduse koodi juurutamist (taristu muutmata)
azd deploy api
```

### Konfiguratsiooni uuendus

```bash
# Uuenda keskkonnamuutujaid
azd env set API_KEY "new-api-key"

# Taaspaiguta uue konfiguratsiooniga
azd deploy api
```

## Monitooring

### Logide vaatamine

```bash
# Voogesita reaalajas logisid, kasutades azd monitori
azd monitor --logs

# Või kasuta Azure CLI-d konteineri rakenduste jaoks:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Vaata viimaseid 100 rida
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Mõõdikute jälgimine

```bash
# Ava Azure Monitori armatuurlaud
azd monitor --overview

# Vaata konkreetseid mõõdikuid
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testimine

### Tervisekontroll

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Oodatud vastus:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Kirje loomine

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Kõikide kirjete päring

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kulude optimeerimine

See juurutus kasutab skaleerimist nullini, seega maksad ainult siis, kui API töötleb päringuid:

- **Tühikäigu kulu**: ~0 $/kuu (skaleeritud nullini)
- **Aktiivne kulu**: ~0.000024 $/sekund koopia kohta
- **Oodatav kuu kulu** (kerge kasutus): 5-15 $

### Kulude veelgi vähendamine

```bash
# Maksimaalsete koopiate arvu vähendamine arenduseks
azd env set MAX_REPLICAS 3

# Kasuta lühemat seisuaega
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutit
```

## Probleemilahendus

### Konteiner ei käivitu

```bash
# Kontrolli konteineri logisid, kasutades Azure CLI-d
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Vea Docker pildi kohalikku ehitamist
docker build -t test ./src
```

### API pole ligipääsetav

```bash
# Kontrolli, et sisenemine oleks väline
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Kõrged latentsusajad

```bash
# Kontrolli CPU/mälu kasutust
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Suurenda ressursse vajadusel
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Koristamine

```bash
# Kustuta kõik ressursid
azd down --force --purge
```

## Järgmised sammud

### Selle näite laiendamine

1. **Lisa andmebaas** - integreeri Azure Cosmos DB või SQL andmebaas  
   ```bash
   # Lisa Cosmos DB moodul infra/main.bicep failile
   # Uuenda app.py faili andmebaasi ühendusega
   ```

2. **Lisa autentimine** - rakenda Azure AD või API võtmed  
   ```python
   # Lisa autentimismiddleware app.py-sse
   from functools import wraps
   ```

3. **Seadista CI/CD** - GitHub Actions töövoog  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Lisa haldatud identiteet** - turvaline ligipääs Azure teenustele  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Seotud näited

- **[Andmebaasi rakendus](../../../../../examples/database-app)** - Täielik näide SQL andmebaasiga  
- **[Mikroteenused](../../../../../examples/container-app/microservices)** - Mitme teenuse arhitektuur  
- **[Container Apps meisterjuhend](../README.md)** - Kõik konteinerite mustrid

### Õppematerjalid

- 📚 [AZD algajatele kursus](../../../README.md) - Peamine kursuse kodu  
- 📚 [Container Apps mustrid](../README.md) - Rohkem juurutuse mustreid  
- 📚 [AZD mallide galerii](https://azure.github.io/awesome-azd/) - Kogukonna mallid

## Täiendavad ressursid

### Dokumentatsioon
- **[Flaski dokumentatsioon](https://flask.palletsprojects.com/)** - Flask raamistik juhend  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Azure ametlik dokumentatsioon  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd käsurea viide

### Juhendid
- **[Container Apps kiire algus](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Sinu esimese rakenduse juurutus  
- **[Python Azure'is](https://learn.microsoft.com/azure/developer/python/)** - Python arenduse juhend  
- **[Bicep keel](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktuuri koodina

### Tööriistad
- **[Azure Portaal](https://portal.azure.com)** - Haldusliides ressursside jaoks  
- **[VS Code Azure laiendus](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integratsioon

---

**🎉 Palju õnne!** Sa oled juurutanud tootmiskõlbuliku Flask API Azure Container Apps keskkonda koos automaatse skaleerimise ja monitooringuga.

**Küsimused?** [Ava probleem](https://github.com/microsoft/AZD-for-beginners/issues) või vaata [KKK-d](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame täpsust, palun pidage meeles, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks lugeda autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse või valesti mõistmise eest, mis tuleneb selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->