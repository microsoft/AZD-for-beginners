# Yksinkertainen Flask-API - Container App -esimerkki

**Oppimispolku:** Aloittelija ⭐ | **Aika:** 25-35 minuuttia | **Kustannus:** $0-15/kuukausi

Täysi, toimiva Python Flask REST API otettuna käyttöön Azure Container Appsissa Azure Developer CLI:llä (azd). Tämä esimerkki havainnollistaa konttien käyttöönottoa, automaattista skaalausta ja valvonnan perusteita.

## 🎯 Mitä opit

- Ota konttisoitu Python-sovellus käyttöön Azuren ympäristöön
- Konfiguroi automaattinen skaalaus, joka skaalaa nollaan
- Toteuta elinvoimaisuustarkastuksia ja valmiustarkistuksia
- Seuraa sovelluksen lokitietoja ja mittareita
- Käytä Azure Developer CLI:tä nopeaan käyttöönottoon

## 📦 Mitä sisältyy

✅ **Flask Application** - Täysi REST API CRUD-operaatioilla (`src/app.py`)  
✅ **Dockerfile** - Tuotantovalmiiksi konfiguroitu säilö  
✅ **Bicep Infrastructure** - Container Apps -ympäristö ja API:n käyttöönotto  
✅ **AZD Configuration** - Yhdellä komennolla suoritettava käyttöönotto  
✅ **Health Probes** - Liveness- ja readiness-tarkistukset konfiguroituina  
✅ **Auto-scaling** - 0-10 replikaa HTTP-kuorman perusteella  

## Arkkitehtuuri

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

## Edellytykset

### Vaaditaan
- **Azure Developer CLI (azd)** - [Asennusohje](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Free account](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (paikallista testausta varten)

### Varmista edellytykset

```bash
# Tarkista azd-versio (vaaditaan 1.5.0 tai uudempi)
azd version

# Varmista Azure-kirjautuminen
azd auth login

# Tarkista Docker (valinnainen, paikallista testausta varten)
docker --version
```

## ⏱️ Käyttöönoton aikajana

| Vaihe | Kesto | Mitä tapahtuu |
|-------|----------|--------------||
| Ympäristön luonti | 30 seconds | Luo azd-ympäristö |
| Rakenna kontti | 2-3 minutes | Docker build Flask app |
| Ota infrastruktuuri käyttöön | 3-5 minutes | Create Container Apps, registry, monitoring |
| Ota sovellus käyttöön | 2-3 minutes | Push image and deploy to Container Apps |
| **Yhteensä** | **8-12 minutes** | Käyttöönotto valmis |

## Pika-aloitus

```bash
# Siirry esimerkkiin
cd examples/container-app/simple-flask-api

# Alusta ympäristö (valitse yksilöllinen nimi)
azd env new myflaskapi

# Ota kaikki käyttöön (infrastruktuuri + sovellus)
azd up
# Sinulta kysytään:
# 1. Valitse Azure-tilaus
# 2. Valitse sijainti (esim. eastus2)
# 3. Odota 8–12 minuuttia käyttöönoton valmistumista

# Hanki API-päätepisteesi
azd env get-values

# Testaa API
curl $(azd env get-value API_ENDPOINT)/health
```

**Odotettu tulos:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Varmista käyttöönotto

### Vaihe 1: Tarkista käyttöönoton tila

```bash
# Näytä käyttöön otetut palvelut
azd show

# Odotettu tulostus näyttää:
# - Palvelu: api
# - Päätepiste: https://ca-api-[env].xxx.azurecontainerapps.io
# - Tila: Käynnissä
```

### Vaihe 2: Testaa API-päätepisteitä

```bash
# Hae API:n päätepiste
API_URL=$(azd env get-value API_ENDPOINT)

# Testaa palvelun tila
curl $API_URL/health

# Testaa juuripäätepiste
curl $API_URL/

# Luo kohde
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Hae kaikki kohteet
curl $API_URL/api/items
```

**Onnistumiskriteerit:**
- ✅ Terveystarkastus palauttaa HTTP 200
- ✅ Juuri-päätepiste näyttää API-tiedot
- ✅ POST luo kohteen ja palauttaa HTTP 201
- ✅ GET palauttaa luodut kohteet

### Vaihe 3: Tarkastele lokit

```bash
# Suoratoista reaaliaikaiset lokit käyttämällä azd monitoria
azd monitor --logs

# Tai käytä Azure CLI:tä:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Sinun pitäisi nähdä:
# - Gunicornin käynnistysviestit
# - HTTP-pyyntöjen lokit
# - Sovelluksen informaatiolokit
```

## Projektin rakenne

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

## API-päätepisteet

| Päätepiste | Metodi | Kuvaus |
|----------|--------|-------------|
| `/health` | GET | Terveystarkastus |
| `/api/items` | GET | Listaa kaikki kohteet |
| `/api/items` | POST | Luo uusi kohde |
| `/api/items/{id}` | GET | Hae tietty kohde |
| `/api/items/{id}` | PUT | Päivitä kohde |
| `/api/items/{id}` | DELETE | Poista kohde |

## Konfiguraatio

### Ympäristömuuttujat

```bash
# Aseta mukautettu kokoonpano
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skaalauksen asetukset

API skaalautuu automaattisesti HTTP-liikenteen perusteella:
- **Minimi-replikoiden määrä**: 0 (skaalaa nollaan ollessaan käyttämättömänä)
- **Maksimi-replikoiden määrä**: 10
- **Saman aikaiset pyynnöt per repliikki**: 50

## Kehitys

### Suorita paikallisesti

```bash
# Asenna riippuvuudet
cd src
pip install -r requirements.txt

# Suorita sovellus
python app.py

# Testaa paikallisesti
curl http://localhost:8000/health
```

### Rakenna ja testaa kontti

```bash
# Rakenna Docker-kuva
docker build -t flask-api:local ./src

# Aja kontti paikallisesti
docker run -p 8000:8000 flask-api:local

# Testaa kontti
curl http://localhost:8000/health
```

## Käyttöönotto

### Täysi käyttöönotto

```bash
# Ota infrastruktuuri ja sovellus käyttöön
azd up
```

### Pelkkä koodin käyttöönotto

```bash
# Ota käyttöön vain sovelluskoodi (infrastruktuuri pysyy muuttumattomana)
azd deploy api
```

### Päivitä konfiguraatio

```bash
# Päivitä ympäristömuuttujat
azd env set API_KEY "new-api-key"

# Julkaise uudelleen uudella kokoonpanolla
azd deploy api
```

## Valvonta

### Katso lokit

```bash
# Suoratoista reaaliaikaisia lokitietoja käyttäen azd monitoria
azd monitor --logs

# Tai käytä Azure CLI:tä Container Appsille:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Näytä viimeiset 100 riviä
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Seuraa mittareita

```bash
# Avaa Azure Monitor -kojelauta
azd monitor --overview

# Näytä tietyt mittarit
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testaus

### Terveystarkastus

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Odotettu vastaus:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Luo kohde

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Hae kaikki kohteet

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kustannusten optimointi

Tämä käyttöönotto käyttää skaalausta nollaan, joten maksat vain silloin kun API käsittelee pyyntöjä:

- **Lepotilan kustannus**: ~$0/kuukausi (skaalautuu nollaan)
- **Aktiivinen kustannus**: ~$0.000024/sekunti per repliikka
- **Odotetut kuukausikustannukset** (kevyt käyttö): $5-15

### Vähennä kustannuksia edelleen

```bash
# Pienennä kehitysympäristön maksimi-instanssien määrää
azd env set MAX_REPLICAS 3

# Käytä lyhyempää odotusaikaa
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuuttia
```

## Vianetsintä

### Kontti ei käynnisty

```bash
# Tarkista konttien lokit Azure CLI:llä
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Varmista, että Docker-kuva rakentuu paikallisesti
docker build -t test ./src
```

### API ei ole saavutettavissa

```bash
# Varmista, että ingress on ulkoinen
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Korkeat vasteajat

```bash
# Tarkista suorittimen ja muistin käyttö
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Lisää resursseja tarvittaessa
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Poista resurssit

```bash
# Poista kaikki resurssit
azd down --force --purge
```

## Seuraavat askeleet

### Laajenna tätä esimerkkiä

1. **Lisää tietokanta** - Integroi Azure Cosmos DB tai SQL Database
   ```bash
   # Lisää Cosmos DB -moduuli tiedostoon infra/main.bicep
   # Päivitä app.py lisäämällä tietokantayhteys
   ```

2. **Lisää todennus** - Ota käyttöön Azure AD tai API-avaimet
   ```python
   # Lisää autentikointiväliohjelmisto app.py-tiedostoon
   from functools import wraps
   ```

3. **Ota käyttöön CI/CD** - GitHub Actions -työnkulku
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Lisää hallittu identiteetti** - Turvaa pääsy Azure-palveluihin
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Aiheeseen liittyviä esimerkkejä

- **[Database App](../../../../../examples/database-app)** - Täydellinen esimerkki SQL-tietokannan kanssa
- **[Microservices](../../../../../examples/container-app/microservices)** - Monipalveluarkkitehtuuri
- **[Container Apps Master Guide](../README.md)** - Kaikki container-kuviot

### Oppimateriaalit

- 📚 [AZD For Beginners Course](../../../README.md) - Kurssin kotisivu
- 📚 [Container Apps Patterns](../README.md) - Lisää käyttöönotto- ja arkkitehtuurimalleja
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Yhteisön malligalleria

## Lisäresurssit

### Dokumentaatio
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask-kehyksen dokumentaatio
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Viralliset Azure-dokumentit
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-komentojen viite

### Oppaat
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Ota ensimmäinen sovellus käyttöön
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python-kehitysopas
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code -opas

### Työkalut
- **[Azure Portal](https://portal.azure.com)** - Hallinnoi resursseja visuaalisesti
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-integraatio

---

**🎉 Onnittelut!** Olet ottanut tuotantovalmiin Flask-API:n käyttöön Azure Container Appsissa automaattisella skaalaamisella ja valvonnalla.

**Kysyttävää?** [Avaa issue](https://github.com/microsoft/AZD-for-beginners/issues) tai katso [UKK](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, automaattikäännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä on pidettävä auktoritatiivisena lähteenä. Tärkeän tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->