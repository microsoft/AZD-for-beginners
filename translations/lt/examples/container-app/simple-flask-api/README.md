# Paprastas Flask API - Container App pavyzdys

**Mokymosi kelias:** Pradedantiesiems ⭐ | **Laikas:** 25-35 minučių | **Kaina:** $0-15/mėn

Pilnas, veikiantis Python Flask REST API, išdiegtas į Azure Container Apps naudojant Azure Developer CLI (azd). Šis pavyzdys demonstruoja konteinerio diegimą, automatinį skalavimą ir monitoringo pagrindus.

## 🎯 Ką sužinosite

- Išdiegti konteinerizuotą Python programą į Azure
- Konfigūruoti automatinį skalavimą (scale-to-zero)
- Įdiegti būklės patikrinimus (health probes) ir pasirengimo patikras (readiness checks)
- Stebėti programos žurnalus ir metrikas
- Naudoti Azure Developer CLI greitam diegimui

## 📦 Kas įtraukta

✅ **Flask programa** - Pilnas REST API su CRUD operacijomis (`src/app.py`)  
✅ **Dockerfile** - Gamybai paruošta konteinerio konfigūracija  
✅ **Bicep infrastruktūra** - Container Apps aplinka ir API diegimas  
✅ **AZD konfigūracija** - Vienos komandos diegimo nustatymas  
✅ **Būklės patikrinimai** - Sukonfigūruoti liveness ir readiness patikrinimai  
✅ **Automatinis skalavimas** - 0-10 replikų pagal HTTP apkrovą  

## Architektūra

```mermaid
graph TD
    subgraph ACA[Azure Container Apps aplinka]
        Flask[Flask API konteineris<br/>Sveikatos galiniai taškai<br/>REST API<br/>Automatinis mastelio keitimas 0-10 kopijų]
        AppInsights[Programos įžvalgos]
    end
```

## Reikalavimai

### Reikalinga
- **Azure Developer CLI (azd)** - [Diegimo vadovas](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Nemokama paskyra](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Įdiegti Docker](https://www.docker.com/products/docker-desktop/) (lokaliniam testavimui)

### Patikrinkite reikalavimus

```bash
# Patikrinkite azd versiją (reikia 1.5.0 arba naujesnės)
azd version

# Patikrinkite prisijungimą prie Azure
azd auth login

# Patikrinkite Docker (neprivaloma, vietiniam testavimui)
docker --version
```

## ⏱️ Diegimo laikas

| Fazė | Trukmė | Kas vyksta |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Iš viso** | **8-12 minutes** | Diegimas baigtas |

## Greita pradžia

```bash
# Eikite į pavyzdį
cd examples/container-app/simple-flask-api

# Inicializuokite aplinką (pasirinkite unikalų pavadinimą)
azd env new myflaskapi

# Įdiekite viską (infrastruktūrą + programą)
azd up
# Jums bus paprašyta:
# 1. Pasirinkite Azure prenumeratą
# 2. Pasirinkite vietą (pvz., eastus2)
# 3. Palaukite 8–12 minučių, kol vyks diegimas

# Gaukite savo API galinį tašką
azd env get-values

# Išbandykite API
curl $(azd env get-value API_ENDPOINT)/health
```

**Tikėtinas išvestis:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Patikrinkite diegimą

### 1 žingsnis: Patikrinkite diegimo būseną

```bash
# Peržiūrėti įdiegtas paslaugas
azd show

# Laukiamas išvesties rezultatas:
# - Paslauga: api
# - Galinis taškas: https://ca-api-[env].xxx.azurecontainerapps.io
# - Būsena: Veikia
```

### 2 žingsnis: Išbandykite API galinius taškus

```bash
# Gauti API galinį tašką
API_URL=$(azd env get-value API_ENDPOINT)

# Patikrinti sveikatą
curl $API_URL/health

# Patikrinti pagrindinį galinį tašką
curl $API_URL/

# Sukurti elementą
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Gauti visus elementus
curl $API_URL/api/items
```

**Sėkmės kriterijai:**
- ✅ /health galinis taškas grąžina HTTP 200
- ✅ Root endpoint rodo API informaciją
- ✅ POST sukuria elementą ir grąžina HTTP 201
- ✅ GET grąžina sukurtus elementus

### 3 žingsnis: Peržiūrėkite žurnalus

```bash
# Srautiniu būdu transliuokite gyvus žurnalus naudodami azd monitor
azd monitor --logs

# Arba naudokite Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Turėtumėte pamatyti:
# - Gunicorn paleidimo pranešimus
# - HTTP užklausų žurnalus
# - Programos informacijos žurnalus
```

## Projekto struktūra

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

## API galiniai taškai

| Galinis taškas | Metodas | Aprašymas |
|----------|--------|-------------|
| `/health` | GET | Sveikatos patikra |
| `/api/items` | GET | Išvardinti visus elementus |
| `/api/items` | POST | Sukurti naują elementą |
| `/api/items/{id}` | GET | Gauti konkretų elementą |
| `/api/items/{id}` | PUT | Atnaujinti elementą |
| `/api/items/{id}` | DELETE | Ištrinti elementą |

## Konfigūracija

### Aplinkos kintamieji

```bash
# Nustatyti pasirinktinius nustatymus
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skalavimo konfigūracija

API automatiškai skalauja pagal HTTP srautą:
- **Min. replikų skaičius**: 0 (skalavimas iki nulio, kai neveikia)
- **Maks. replikų skaičius**: 10
- **Vienu metu užklausų per repliką**: 50

## Kūrimas

### Vykdyti lokaliai

```bash
# Įdiegti priklausomybes
cd src
pip install -r requirements.txt

# Paleisti programą
python app.py

# Testuoti lokaliai
curl http://localhost:8000/health
```

### Sukurti ir išbandyti konteinerį

```bash
# Sukurti Docker atvaizdą
docker build -t flask-api:local ./src

# Paleisti konteinerį lokaliai
docker run -p 8000:8000 flask-api:local

# Išbandyti konteinerį
curl http://localhost:8000/health
```

## Diegimas

### Pilnas diegimas

```bash
# Įdiegti infrastruktūrą ir taikomąją programą
azd up
```

### Tik kodo diegimas

```bash
# Diegti tik programos kodą (infrastruktūra nekeičiama)
azd deploy api
```

### Atnaujinti konfigūraciją

```bash
# Atnaujinkite aplinkos kintamuosius
azd env set API_KEY "new-api-key"

# Įdiekite iš naujo su nauja konfigūracija
azd deploy api
```

## Stebėjimas

### Peržiūrėti žurnalus

```bash
# Transliuokite gyvus žurnalus naudodami azd monitor
azd monitor --logs

# Arba naudokite Azure CLI Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Peržiūrėkite paskutines 100 eilučių
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Stebėti metrikas

```bash
# Atidaryti Azure Monitor prietaisų skydelį
azd monitor --overview

# Peržiūrėti konkrečias metrikas
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testavimas

### Būklės patikra

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Tikėtinas atsakymas:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Sukurti elementą

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Gauti visus elementus

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kaštų optimizavimas

Šis diegimas naudoja scale-to-zero, tad mokate tik tada, kai API apdoroja užklausas:

- **Neaktyvumo kaina**: ~$0/mėn. (skalavimas iki nulio)
- **Aktyvi kaina**: ~$0.000024/sekundę už repliką
- **Tikėtinos mėnesinės išlaidos** (mažas naudojimas): $5-15

### Tolimesnis išlaidų mažinimas

```bash
# Sumažinti maksimalų replikų skaičių vystymo aplinkai
azd env set MAX_REPLICAS 3

# Naudoti trumpesnį neveiklumo laiką
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutės
```

## Trikčių šalinimas

### Konteineris nepaleidžiamas

```bash
# Patikrinkite konteinerio žurnalus naudodami Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Patikrinkite, ar Docker atvaizdas kuriamas lokaliai
docker build -t test ./src
```

### API nepasiekiama

```bash
# Patikrinkite, ar Ingress yra išorinis
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Ilgi atsako laikai

```bash
# Patikrinkite procesoriaus/atminties naudojimą
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Padidinkite išteklius, jei reikia
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Išvalymas

```bash
# Ištrinti visus išteklius
azd down --force --purge
```

## Tolimesni žingsniai

### Išplėsti šį pavyzdį

1. **Pridėti duomenų bazę** - Integruoti Azure Cosmos DB arba SQL duomenų bazę
   ```bash
   # Pridėti Cosmos DB modulį į infra/main.bicep
   # Atnaujinti app.py su duomenų bazės prisijungimu
   ```

2. **Pridėti autentifikaciją** - Įdiegti Microsoft Entra ID arba API raktus
   ```python
   # Pridėti autentifikacijos tarpinį sluoksnį į app.py
   from functools import wraps
   ```

3. **Sukurti CI/CD** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Pridėti valdomą identitetą** - Užtikrinti saugų prieigą prie Azure paslaugų
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Susiję pavyzdžiai

- **[Duomenų bazės programa](../../../../../examples/database-app)** - Pilnas pavyzdys su SQL duomenų baze
- **[Mikropaslaugos](../../../../../examples/container-app/microservices)** - Daugiaservisė architektūra
- **[Container Apps pagrindinis vadovas](../README.md)** - Visi konteinerių modeliai

### Mokymosi ištekliai

- 📚 [AZD Pradedantiesiems kursas](../../../README.md) - Pagrindinis kurso puslapis
- 📚 [Container Apps modeliai](../README.md) - Daugiau diegimo modelių
- 📚 [AZD šablonų galerija](https://azure.github.io/awesome-azd/) - Bendruomenės šablonai

## Papildomi ištekliai

### Dokumentacija
- **[Flask dokumentacija](https://flask.palletsprojects.com/)** - Flask karkaso vadovas
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficiali Azure dokumentacija
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd komandų aprašymas

### Mokymai
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Įdiekite savo pirmąją programą
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python kūrimo vadovas
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktūra kaip kodas

### Įrankiai
- **[Azure Portal](https://portal.azure.com)** - Valdykite išteklius vizualiai
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integracija

---

**🎉 Sveikiname!** Jūs išdiegėte gamybai paruoštą Flask API į Azure Container Apps su automatinio skalavimo ir stebėjimo galimybėmis.

**Klausimų?** [Atidarykite problemą](https://github.com/microsoft/AZD-for-beginners/issues) arba peržiūrėkite [DUK](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->