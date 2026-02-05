# Lihtne Flask API - Konteinerirakenduse näide

**Õppetasand:** Algaja ⭐ | **Aeg:** 25-35 minutit | **Maksumus:** $0-15/kuus

Täielik ja töötav Python Flask REST API, mis on juurutatud Azure Container Apps abil, kasutades Azure Developer CLI-d (azd). See näide demonstreerib konteinerite juurutamist, automaatset skaleerimist ja jälgimise põhitõdesid.

## 🎯 Mida õpid

- Juurutada konteineriseeritud Python rakendus Azure'i
- Konfigureerida automaatset skaleerimist koos nullini skaleerimisega
- Rakendada tervisekontrolli ja valmisoleku kontrolli
- Jälgida rakenduse logisid ja mõõdikuid
- Kasutada Azure Developer CLI-d kiireks juurutamiseks

## 📦 Mis on kaasas

✅ **Flask rakendus** - Täielik REST API koos CRUD operatsioonidega (`src/app.py`)  
✅ **Dockerfile** - Tootmisvalmis konteineri konfiguratsioon  
✅ **Bicep infrastruktuur** - Container Apps keskkond ja API juurutamine  
✅ **AZD konfiguratsioon** - Ühe käsuga juurutamise seadistus  
✅ **Tervisekontrollid** - Liveness ja valmisoleku kontrollid konfigureeritud  
✅ **Automaatne skaleerimine** - 0-10 replikaid HTTP koormuse alusel  

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

### Vajalik
- **Azure Developer CLI (azd)** - [Paigaldusjuhend](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure tellimus** - [Tasuta konto](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Paigalda Docker](https://www.docker.com/products/docker-desktop/) (kohalikuks testimiseks)

### Kontrolli eeltingimusi

```bash
# Kontrolli azd versiooni (vaja 1.5.0 või uuemat)
azd version

# Kontrolli Azure'i sisselogimist
azd auth login

# Kontrolli Dockeri (valikuline, kohalikuks testimiseks)
docker --version
```

## ⏱️ Juurutamise ajakava

| Faas | Kestus | Mis toimub |
|------|--------|------------|
| Keskkonna seadistamine | 30 sekundit | Loo azd keskkond |
| Konteineri ehitamine | 2-3 minutit | Docker ehitab Flask rakenduse |
| Infrastruktuuri loomine | 3-5 minutit | Loo Container Apps, register, jälgimine |
| Rakenduse juurutamine | 2-3 minutit | Pildi üleslaadimine ja juurutamine Container Apps-i |
| **Kokku** | **8-12 minutit** | Täielik juurutamine valmis |

## Kiire algus

```bash
# Navigeeri näitele
cd examples/container-app/simple-flask-api

# Initsialiseeri keskkond (vali unikaalne nimi)
azd env new myflaskapi

# Paigalda kõik (infrastruktuur + rakendus)
azd up
# Teile kuvatakse järgmised juhised:
# 1. Valige Azure'i tellimus
# 2. Valige asukoht (nt eastus2)
# 3. Oodake 8-12 minutit paigaldamiseks

# Hankige oma API lõpp-punkt
azd env get-values

# Testige API-d
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

## ✅ Kontrolli juurutamist

### Samm 1: Kontrolli juurutamise staatust

```bash
# Vaata juurutatud teenuseid
azd show

# Oodatav väljund näitab:
# - Teenus: api
# - Lõpp-punkt: https://ca-api-[env].xxx.azurecontainerapps.io
# - Staatus: Töötav
```

### Samm 2: Testi API lõpp-punkte

```bash
# Hangi API lõpp-punkt
API_URL=$(azd env get-value API_ENDPOINT)

# Testi tervist
curl $API_URL/health

# Testi juurlõpp-punkti
curl $API_URL/

# Loo üksus
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Hangi kõik üksused
curl $API_URL/api/items
```

**Edu kriteeriumid:**
- ✅ Tervisekontrolli lõpp-punkt tagastab HTTP 200
- ✅ Juure lõpp-punkt kuvab API teavet
- ✅ POST loob elemendi ja tagastab HTTP 201
- ✅ GET tagastab loodud elemendid

### Samm 3: Vaata logisid

```bash
# Edasta reaalajas logisid
azd logs api --follow

# Sa peaksid nägema:
# - Gunicorni käivitussõnumeid
# - HTTP päringute logisid
# - Rakenduse info logisid
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
|------------|--------|-----------|
| `/health` | GET | Tervisekontroll |
| `/api/items` | GET | Kuvab kõik elemendid |
| `/api/items` | POST | Loob uue elemendi |
| `/api/items/{id}` | GET | Kuvab konkreetse elemendi |
| `/api/items/{id}` | PUT | Uuendab elementi |
| `/api/items/{id}` | DELETE | Kustutab elemendi |

## Konfiguratsioon

### Keskkonnamuutujad

```bash
# Määra kohandatud konfiguratsioon
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skaleerimise konfiguratsioon

API skaleerub automaatselt HTTP liikluse alusel:
- **Minimaalne replika arv**: 0 (skaleerub nullini, kui pole aktiivne)
- **Maksimaalne replika arv**: 10
- **Konkureerivad päringud replika kohta**: 50

## Arendus

### Käivita kohalikult

```bash
# Paigalda sõltuvused
cd src
pip install -r requirements.txt

# Käivita rakendus
python app.py

# Testi kohapeal
curl http://localhost:8000/health
```

### Ehitamine ja testimine konteineris

```bash
# Ehita Dockeri pilt
docker build -t flask-api:local ./src

# Käivita konteiner kohapeal
docker run -p 8000:8000 flask-api:local

# Testi konteinerit
curl http://localhost:8000/health
```

## Juurutamine

### Täielik juurutamine

```bash
# Paigalda infrastruktuur ja rakendus
azd up
```

### Ainult koodi juurutamine

```bash
# Paigalda ainult rakenduse kood (infrastruktuur muutmata)
azd deploy api
```

### Konfiguratsiooni uuendamine

```bash
# Uuenda keskkonnamuutujaid
azd env set API_KEY "new-api-key"

# Paigalda uuesti uue konfiguratsiooniga
azd deploy api
```

## Jälgimine

### Vaata logisid

```bash
# Edasta reaalajas logisid
azd logs api --follow

# Vaata viimaseid 100 rida
azd logs api --tail 100
```

### Jälgi mõõdikuid

```bash
# Ava Azure Monitori juhtpaneel
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

Oodatav vastus:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Elemendi loomine

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Kõigi elementide kuvamine

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kulude optimeerimine

See juurutamine kasutab nullini skaleerimist, seega maksad ainult siis, kui API töötleb päringuid:

- **Tühikäigu kulu**: ~$0/kuus (skaleeritud nullini)
- **Aktiivne kulu**: ~$0.000024/sekund replika kohta
- **Eeldatav kuukulu** (kerge kasutus): $5-15

### Kulude edasine vähendamine

```bash
# Vähenda maksimaalsete replikaate arvu arenduses
azd env set MAX_REPLICAS 3

# Kasuta lühemat jõudeoleku ajavahemikku
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutit
```

## Tõrkeotsing

### Konteiner ei käivitu

```bash
# Kontrolli konteineri logisid
azd logs api --tail 100

# Kontrolli, kas Dockeri pilt ehitatakse kohapeal
docker build -t test ./src
```

### API pole ligipääsetav

```bash
# Kontrolli, et sisenemine on väline
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Kõrged vastuseajad

```bash
# Kontrolli CPU/mälu kasutust
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Suurenda ressursse, kui vaja
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Puhastamine

```bash
# Kustuta kõik ressursid
azd down --force --purge
```

## Järgmised sammud

### Laienda seda näidet

1. **Lisa andmebaas** - Integreeri Azure Cosmos DB või SQL andmebaas
   ```bash
   # Lisa Cosmos DB moodul infra/main.bicep faili
   # Uuenda app.py andmebaasiühendusega
   ```

2. **Lisa autentimine** - Rakenda Azure AD või API võtmed
   ```python
   # Lisa autentimise vahend app.py-le
   from functools import wraps
   ```

3. **Seadista CI/CD** - GitHub Actions töövoog
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Lisa hallatud identiteet** - Turvaline juurdepääs Azure teenustele
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Seotud näited

- **[Andmebaasi rakendus](../../../../../examples/database-app)** - Täielik näide SQL andmebaasiga
- **[Mikroteenused](../../../../../examples/container-app/microservices)** - Mitme teenuse arhitektuur
- **[Container Apps põhijuhend](../README.md)** - Kõik konteinerite mustrid

### Õppematerjalid

- 📚 [AZD algajatele kursus](../../../README.md) - Peamine kursuse leht
- 📚 [Container Apps mustrid](../README.md) - Rohkem juurutamise mustreid
- 📚 [AZD mallide galerii](https://azure.github.io/awesome-azd/) - Kogukonna mallid

## Täiendavad ressursid

### Dokumentatsioon
- **[Flask dokumentatsioon](https://flask.palletsprojects.com/)** - Flask raamistik juhend
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Ametlik Azure dokumentatsioon
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd käsu viide

### Õpetused
- **[Container Apps kiirstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Juuruta oma esimene rakendus
- **[Python Azure'is](https://learn.microsoft.com/azure/developer/python/)** - Python arenduse juhend
- **[Bicep keel](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktuur koodina

### Tööriistad
- **[Azure portaal](https://portal.azure.com)** - Halda ressursse visuaalselt
- **[VS Code Azure laiendus](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integratsioon

---

**🎉 Palju õnne!** Oled juurutanud tootmisvalmis Flask API Azure Container Apps-i automaatse skaleerimise ja jälgimisega.

**Küsimused?** [Ava probleem](https://github.com/microsoft/AZD-for-beginners/issues) või vaata [KKK](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->