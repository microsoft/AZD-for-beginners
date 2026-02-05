# Yksinkertainen Flask-API - Esimerkki konttisovelluksesta

**Oppimispolku:** Aloittelija ⭐ | **Aika:** 25-35 minuuttia | **Kustannus:** $0-15/kuukausi

Täydellinen, toimiva Python Flask REST API, joka on otettu käyttöön Azure Container Apps -palvelussa käyttäen Azure Developer CLI:tä (azd). Tämä esimerkki havainnollistaa konttien käyttöönottoa, automaattista skaalausta ja valvonnan perusteita.

## 🎯 Mitä opit

- Ota käyttöön kontitetty Python-sovellus Azuren palvelussa
- Määritä automaattinen skaalaus nollaan asti
- Toteuta terveys- ja valmiustarkistukset
- Seuraa sovelluksen lokitietoja ja mittareita
- Käytä Azure Developer CLI:tä nopeaan käyttöönottoon

## 📦 Sisältö

✅ **Flask-sovellus** - Täydellinen REST API CRUD-toiminnoilla (`src/app.py`)  
✅ **Dockerfile** - Tuotantovalmiin kontin konfiguraatio  
✅ **Bicep-infrastruktuuri** - Container Apps -ympäristö ja API:n käyttöönotto  
✅ **AZD-konfiguraatio** - Yhden komennon käyttöönotto  
✅ **Terveystarkistukset** - Liveness- ja readiness-tarkistukset määritetty  
✅ **Automaattinen skaalaus** - 0-10 replikaa HTTP-kuorman perusteella  

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

## Esivaatimukset

### Vaaditaan
- **Azure Developer CLI (azd)** - [Asennusohje](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-tilaus** - [Ilmainen tili](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Asenna Docker](https://www.docker.com/products/docker-desktop/) (paikallista testausta varten)

### Varmista esivaatimukset

```bash
# Tarkista azd-versio (tarvitaan 1.5.0 tai uudempi)
azd version

# Vahvista Azure-kirjautuminen
azd auth login

# Tarkista Docker (valinnainen, paikallista testausta varten)
docker --version
```

## ⏱️ Käyttöönoton aikajana

| Vaihe | Kesto | Mitä tapahtuu |
|-------|-------|---------------|
| Ympäristön asennus | 30 sekuntia | Luo azd-ympäristö |
| Rakenna kontti | 2-3 minuuttia | Docker rakentaa Flask-sovelluksen |
| Infrastruktuurin provisiointi | 3-5 minuuttia | Luo Container Apps, rekisteri, valvonta |
| Sovelluksen käyttöönotto | 2-3 minuuttia | Työnnä kuva ja ota käyttöön Container Apps -palvelussa |
| **Yhteensä** | **8-12 minuuttia** | Käyttöönotto valmis |

## Pika-aloitus

```bash
# Siirry esimerkkiin
cd examples/container-app/simple-flask-api

# Alusta ympäristö (valitse ainutlaatuinen nimi)
azd env new myflaskapi

# Ota kaikki käyttöön (infrastruktuuri + sovellus)
azd up
# Sinua kehotetaan:
# 1. Valitse Azure-tilaus
# 2. Valitse sijainti (esim. eastus2)
# 3. Odota 8-12 minuuttia käyttöönottoa

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

## ✅ Vahvista käyttöönotto

### Vaihe 1: Tarkista käyttöönoton tila

```bash
# Näytä käyttöönotetut palvelut
azd show

# Odotettu tulos näyttää:
# - Palvelu: api
# - Päätepiste: https://ca-api-[env].xxx.azurecontainerapps.io
# - Tila: Käynnissä
```

### Vaihe 2: Testaa API-päätepisteet

```bash
# Hae API-päätepiste
API_URL=$(azd env get-value API_ENDPOINT)

# Testaa terveys
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
- ✅ Terveys-päätepiste palauttaa HTTP 200
- ✅ Juuri-päätepiste näyttää API-tiedot
- ✅ POST luo kohteen ja palauttaa HTTP 201
- ✅ GET palauttaa luodut kohteet

### Vaihe 3: Näytä lokit

```bash
# Suoratoista live-lokeja
azd logs api --follow

# Sinun pitäisi nähdä:
# - Gunicornin käynnistysviestit
# - HTTP-pyyntölokit
# - Sovelluksen infolokit
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
|------------|--------|--------|
| `/health` | GET | Terveystarkistus |
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

### Skaalauskonfiguraatio

API skaalautuu automaattisesti HTTP-liikenteen perusteella:
- **Minimi replikoita**: 0 (skaalautuu nollaan, kun ei ole käytössä)
- **Maksimi replikoita**: 10
- **Samanaikaiset pyynnöt per replika**: 50

## Kehitys

### Aja paikallisesti

```bash
# Asenna riippuvuudet
cd src
pip install -r requirements.txt

# Käynnistä sovellus
python app.py

# Testaa paikallisesti
curl http://localhost:8000/health
```

### Rakenna ja testaa kontti

```bash
# Rakenna Docker-kuva
docker build -t flask-api:local ./src

# Aja säiliö paikallisesti
docker run -p 8000:8000 flask-api:local

# Testaa säiliö
curl http://localhost:8000/health
```

## Käyttöönotto

### Täysi käyttöönotto

```bash
# Ota käyttöön infrastruktuuri ja sovellus
azd up
```

### Vain koodin käyttöönotto

```bash
# Ota käyttöön vain sovelluskoodi (infrastruktuuri muuttumaton)
azd deploy api
```

### Päivitä konfiguraatio

```bash
# Päivitä ympäristömuuttujat
azd env set API_KEY "new-api-key"

# Ota uusi kokoonpano käyttöön uudelleen
azd deploy api
```

## Valvonta

### Näytä lokit

```bash
# Suoratoista live-lokeja
azd logs api --follow

# Näytä viimeiset 100 riviä
azd logs api --tail 100
```

### Seuraa mittareita

```bash
# Avaa Azure Monitor -hallintapaneeli
azd monitor --overview

# Tarkastele tiettyjä mittareita
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testaus

### Terveystarkistus

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

Tämä käyttöönotto käyttää skaalausta nollaan, joten maksat vain, kun API käsittelee pyyntöjä:

- **Käyttämättömänä**: ~$0/kuukausi (skaalautuu nollaan)
- **Aktiivinen kustannus**: ~$0.000024/sekunti per replika
- **Odotettu kuukausikustannus** (kevyt käyttö): $5-15

### Vähennä kustannuksia

```bash
# Pienennä maksimi replikoiden määrää kehitystä varten
azd env set MAX_REPLICAS 3

# Käytä lyhyempää käyttämättömyyden aikakatkaisua
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuuttia
```

## Vianetsintä

### Kontti ei käynnisty

```bash
# Tarkista säiliön lokit
azd logs api --tail 100

# Varmista, että Docker-kuva rakentuu paikallisesti
docker build -t test ./src
```

### API ei ole käytettävissä

```bash
# Varmista, että sisääntulo on ulkoinen
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Korkeat vasteajat

```bash
# Tarkista CPU/muistin käyttö
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Lisää resursseja tarvittaessa
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Siivous

```bash
# Poista kaikki resurssit
azd down --force --purge
```

## Seuraavat askeleet

### Laajenna tätä esimerkkiä

1. **Lisää tietokanta** - Integroi Azure Cosmos DB tai SQL Database
   ```bash
   # Lisää Cosmos DB -moduuli infra/main.bicep-tiedostoon
   # Päivitä app.py tietokantayhteydellä
   ```

2. **Lisää autentikointi** - Toteuta Azure AD tai API-avaimet
   ```python
   # Lisää todennusväliohjelma app.py-tiedostoon
   from functools import wraps
   ```

3. **Aseta CI/CD** - GitHub Actions -työnkulku
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

### Liittyvät esimerkit

- **[Tietokantasovellus](../../../../../examples/database-app)** - Täydellinen esimerkki SQL-tietokannalla
- **[Mikropalvelut](../../../../../examples/container-app/microservices)** - Monipalveluarkkitehtuuri
- **[Container Apps Master Guide](../README.md)** - Kaikki konttimallit

### Oppimateriaalit

- 📚 [AZD For Beginners Course](../../../README.md) - Pääkoulutuksen kotisivu
- 📚 [Container Apps Patterns](../README.md) - Lisää käyttöönoton malleja
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Yhteisön mallipohjat

## Lisäresurssit

### Dokumentaatio
- **[Flask-dokumentaatio](https://flask.palletsprojects.com/)** - Flask-kehyksen opas
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Virallinen Azure-dokumentaatio
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-komentoviite

### Tutoriaalit
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Ota ensimmäinen sovellus käyttöön
- **[Python Azuren palvelussa](https://learn.microsoft.com/azure/developer/python/)** - Python-kehityksen opas
- **[Bicep-kieli](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktuuri koodina

### Työkalut
- **[Azure Portal](https://portal.azure.com)** - Hallitse resursseja visuaalisesti
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE-integraatio

---

**🎉 Onnittelut!** Olet ottanut käyttöön tuotantovalmiin Flask-API:n Azure Container Apps -palvelussa automaattisella skaalaamisella ja valvonnalla.

**Kysymyksiä?** [Avaa ongelma](https://github.com/microsoft/AZD-for-beginners/issues) tai tarkista [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->