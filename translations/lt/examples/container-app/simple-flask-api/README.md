# Paprastas Flask API - Container App pavyzdys

**Mokymosi kelias:** Pradedantysis ⭐ | **Trukmė:** 25-35 minučių | **Kaina:** $0-15/mėn

Pilnas veikiantis Python Flask REST API, diegiamas į Azure Container Apps naudojant Azure Developer CLI (azd). Šis pavyzdys demonstruoja konteinerių diegimą, automatinį skalavimą ir stebėjimo pagrindus.

## 🎯 Ko išmoksite

- Diegti konteinerizuotą Python programą į Azure
- Konfigūruoti automatinį skalavimą (scale-to-zero)
- Įdiegti sveikatos patikrinimus (health probes) ir pasirengimo (readiness) patikras
- Stebėti programos žurnalus ir metrikas
- Naudoti Azure Developer CLI greitam diegimui

## 📦 Kas įtraukta

✅ **Flask programa** - Pilnas REST API su CRUD operacijomis (`src/app.py`)  
✅ **Dockerfile** - Gamybai paruošta konteinerio konfigūracija  
✅ **Bicep infrastruktūra** - Container Apps aplinka ir API diegimas  
✅ **AZD konfigūracija** - Vieno komandos diegimo nustatymas  
✅ **Sveikatos patikros** - Konfigūruotos liveness ir readiness patikros  
✅ **Automatinis skalavimas** - 0-10 replikų pagal HTTP apkrovą  

## Architektūra

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

## Reikalavimai

### Reikalinga
- **Azure Developer CLI (azd)** - [Įdiegimo vadovas](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure prenumerata** - [Nemokama paskyra](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Įdiegti Docker](https://www.docker.com/products/docker-desktop/) (lokaliniam testavimui)

### Patikrinkite reikalavimus

```bash
# Patikrinkite azd versiją (reikia 1.5.0 arba naujesnės)
azd version

# Patikrinkite Azure prisijungimą
azd auth login

# Patikrinkite Docker (neprivaloma, vietiniam testavimui)
docker --version
```

## ⏱️ Diegimo laikas

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

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
# 3. Palaukite 8-12 minučių, kol vyks diegimas

# Gaukite savo API galinį tašką
azd env get-values

# Išbandykite API
curl $(azd env get-value API_ENDPOINT)/health
```

**Tikėtinas rezultatas:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Patikrinkite diegimą

### Žingsnis 1: Patikrinkite diegimo būseną

```bash
# Peržiūrėti įdiegtas paslaugas
azd show

# Tikėtinas išvesties rezultatas:
# - Paslauga: api
# - Galinis taškas: https://ca-api-[env].xxx.azurecontainerapps.io
# - Būsena: Veikia
```

### Žingsnis 2: Išbandykite API galinius taškus

```bash
# Gauti API galinį tašką
API_URL=$(azd env get-value API_ENDPOINT)

# Patikrinti būklę
curl $API_URL/health

# Patikrinti šaknies galinį tašką
curl $API_URL/

# Sukurti elementą
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Gauti visus elementus
curl $API_URL/api/items
```

**Sėkmės kriterijai:**
- ✅ Sveikatos endpointas grąžina HTTP 200
- ✅ Pagrindinis (root) endpointas rodo API informaciją
- ✅ POST sukuria elementą ir grąžina HTTP 201
- ✅ GET grąžina sukurtus elementus

### Žingsnis 3: Peržiūrėkite žurnalus

```bash
# Transliuokite tiesioginius žurnalus naudodami azd monitor
azd monitor --logs

# Arba naudokite Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Turėtumėte matyti:
# - Gunicorn paleidimo pranešimai
# - HTTP užklausų žurnalai
# - Programos informacijos žurnalai
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

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Sveikatos patikra |
| `/api/items` | GET | Išvardinti visus elementus |
| `/api/items` | POST | Kurti naują elementą |
| `/api/items/{id}` | GET | Gauti konkretų elementą |
| `/api/items/{id}` | PUT | Atnaujinti elementą |
| `/api/items/{id}` | DELETE | Ištrinti elementą |

## Konfigūracija

### Aplinkos kintamieji

```bash
# Nustatyti pasirinktinę konfigūraciją
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skalavimo konfigūracija

API automatiškai prisitaiko pagal HTTP srautą:
- **Min Replicas**: 0 (skalavimas iki nulio, kai nenaudojama)
- **Max Replicas**: 10
- **Concurrent Requests per Replica**: 50

## Vystymas

### Paleisti lokaliai

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
# Sukurti Docker vaizdą
docker build -t flask-api:local ./src

# Paleisti konteinerį lokaliai
docker run -p 8000:8000 flask-api:local

# Išbandyti konteinerį
curl http://localhost:8000/health
```

## Diegimas

### Pilnas diegimas

```bash
# Diegti infrastruktūrą ir programą
azd up
```

### Diegimas tik su kodu

```bash
# Diegti tik programos kodą (infrastruktūra nekeičiama)
azd deploy api
```

### Atnaujinti konfigūraciją

```bash
# Atnaujinti aplinkos kintamuosius
azd env set API_KEY "new-api-key"

# Perdiegti su nauja konfigūracija
azd deploy api
```

## Stebėjimas

### Peržiūrėti žurnalus

```bash
# Srautiniu būdu peržiūrėkite gyvus žurnalus naudodami azd monitor
azd monitor --logs

# Arba naudokite Azure CLI Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Peržiūrėti paskutinių 100 eilučių
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Stebėti metrikas

```bash
# Atidaryti Azure Monitor suvestinę
azd monitor --overview

# Peržiūrėti konkrečius rodiklius
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testavimas

### Sveikatos patikra

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

### Kurti elementą

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Gauti visus elementus

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kainos optimizavimas

Šis diegimas naudoja scale-to-zero, todėl mokate tik tada, kai API apdoroja užklausas:

- **Tuščiojo periodo kaina**: ~$0/mėn (skaluojama iki nulio)
- **Aktyvus kaštas**: ~$0.000024/sek. už repliką
- **Numatoma mėnesinė kaina** (mažas naudojimas): $5-15

### Tolimesnis kaštų mažinimas

```bash
# Sumažinti maksimalų replikų skaičių vystymui
azd env set MAX_REPLICAS 3

# Naudoti trumpesnį neveikimo laiką
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutės
```

## Trikčių šalinimas

### Konteineris nepaleidžiamas

```bash
# Patikrinkite konteinerio žurnalus naudodami Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Patikrinkite, ar Docker vaizdas kuriamas lokaliai
docker build -t test ./src
```

### API neprieinama

```bash
# Patikrinkite, ar įėjimas yra išorinis
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Ilgi atsako laikai

```bash
# Patikrinkite CPU ir atminties naudojimą
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

## Kiti žingsniai

### Išplėskite šį pavyzdį

1. **Pridėti duomenų bazę** - Integruoti Azure Cosmos DB arba SQL duomenų bazę
   ```bash
   # Pridėti Cosmos DB modulį į infra/main.bicep
   # Atnaujinti app.py su duomenų bazės prisijungimu
   ```

2. **Pridėti autentifikaciją** - Įdiegti Azure AD arba API raktus
   ```python
   # Pridėti autentifikavimo tarpinę programinę įrangą į app.py
   from functools import wraps
   ```

3. **Nustatyti CI/CD** - GitHub Actions darbo eiga
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Pridėti valdomą tapatybę** - Saugus prieigos prie Azure paslaugų užtikrinimas
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Susiję pavyzdžiai

- **[Duomenų bazės programa](../../../../../examples/database-app)** - Pilnas pavyzdys su SQL duomenų baze
- **[Microservices](../../../../../examples/container-app/microservices)** - Daugiaservisinė architektūra
- **[Container Apps Master Guide](../README.md)** - Visi konteinerių modeliai

### Mokymosi ištekliai

- 📚 [AZD pradedantiesiems kursas](../../../README.md) - Pagrindinis kurso puslapis
- 📚 [Container Apps modeliai](../README.md) - Daugiau diegimo modelių
- 📚 [AZD šablonų galerija](https://azure.github.io/awesome-azd/) - Bendruomenės šablonai

## Papildomi ištekliai

### Dokumentacija
- **[Flask dokumentacija](https://flask.palletsprojects.com/)** - Flask karkaso vadovas
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficialūs Azure dokumentai
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd komandų nuoroda

### Pamokos
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Išdiegti pirmąją programą
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python kūrimo gidas
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktūra kaip kodas

### Įrankiai
- **[Azure Portal](https://portal.azure.com)** - Valdykite išteklius vizualiai
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integracija

---

**🎉 Sveikiname!** Jūs išdiegėte gamybai paruoštą Flask API į Azure Container Apps su automatinio skalavimo ir stebėjimo galimybėmis.

**Klausimų?** [Pateikite problemą](https://github.com/microsoft/AZD-for-beginners/issues) arba peržiūrėkite [DUK](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą Co-op Translator (https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas pradinėje kalboje turėtų būti laikomas autoritetingu šaltiniu. Svarbios informacijos atveju rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingas interpretacijas, kylančias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->