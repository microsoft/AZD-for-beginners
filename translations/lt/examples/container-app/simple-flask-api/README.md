<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-24T10:02:00+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "lt"
}
-->
# Paprastas Flask API - Konteinerinės programos pavyzdys

**Mokymosi lygis:** Pradedantysis ⭐ | **Laikas:** 25-35 minutės | **Kaina:** $0-15/mėn.

Pilnai veikiantis Python Flask REST API, įdiegtas į Azure Container Apps naudojant Azure Developer CLI (azd). Šis pavyzdys demonstruoja konteinerių diegimą, automatinį mastelį ir pagrindinius stebėjimo aspektus.

## 🎯 Ką išmoksite

- Diegti konteinerizuotą Python programą į Azure
- Konfigūruoti automatinį mastelį su mastelio sumažinimu iki nulio
- Įgyvendinti sveikatos patikras ir pasirengimo patikrinimus
- Stebėti programos žurnalus ir metrikas
- Naudoti Azure Developer CLI greitam diegimui

## 📦 Kas įtraukta

✅ **Flask programa** - Pilnas REST API su CRUD operacijomis (`src/app.py`)  
✅ **Dockerfile** - Paruošta konteinerio konfigūracija gamybai  
✅ **Bicep infrastruktūra** - Container Apps aplinka ir API diegimas  
✅ **AZD konfigūracija** - Vieno komandos diegimo nustatymas  
✅ **Sveikatos patikros** - Suaktyvintos gyvybingumo ir pasirengimo patikros  
✅ **Automatinis mastelis** - 0-10 replikų pagal HTTP apkrovą  

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

### Būtina
- **Azure Developer CLI (azd)** - [Diegimo vadovas](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure prenumerata** - [Nemokama paskyra](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Įdiegti Docker](https://www.docker.com/products/docker-desktop/) (vietiniam testavimui)

### Patikrinkite reikalavimus

```bash
# Patikrinkite azd versiją (reikia 1.5.0 ar naujesnės)
azd version

# Patikrinkite Azure prisijungimą
azd auth login

# Patikrinkite Docker (neprivaloma, vietiniam testavimui)
docker --version
```

## ⏱️ Diegimo laiko juosta

| Etapas | Trukmė | Kas vyksta |
|--------|--------|------------|
| Aplinkos nustatymas | 30 sekundžių | Sukuriama azd aplinka |
| Konteinerio kūrimas | 2-3 minutės | Docker sukuria Flask programą |
| Infrastruktūros paruošimas | 3-5 minutės | Sukuriama Container Apps, registras, stebėjimas |
| Programos diegimas | 2-3 minutės | Vaizdas įkeliamas ir diegiamas į Container Apps |
| **Iš viso** | **8-12 minučių** | Pilnai paruoštas diegimas |

## Greitas startas

```bash
# Pereikite prie pavyzdžio
cd examples/container-app/simple-flask-api

# Inicializuokite aplinką (pasirinkite unikalų pavadinimą)
azd env new myflaskapi

# Įdiekite viską (infrastruktūrą + programą)
azd up
# Jums bus pateiktas prašymas:
# 1. Pasirinkti Azure prenumeratą
# 2. Pasirinkti vietą (pvz., eastus2)
# 3. Palaukti 8-12 minučių, kol diegimas bus baigtas

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

### 1 žingsnis: Patikrinkite diegimo būseną

```bash
# Peržiūrėti įdiegtas paslaugas
azd show

# Tikėtinas rezultatas rodo:
# - Paslauga: api
# - Pabaigos taškas: https://ca-api-[env].xxx.azurecontainerapps.io
# - Būsena: Veikia
```

### 2 žingsnis: Testuokite API galinius taškus

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
- ✅ Sveikatos galinis taškas grąžina HTTP 200
- ✅ Pagrindinis galinis taškas rodo API informaciją
- ✅ POST sukuria elementą ir grąžina HTTP 201
- ✅ GET grąžina sukurtus elementus

### 3 žingsnis: Peržiūrėkite žurnalus

```bash
# Transliuoti tiesioginius žurnalus
azd logs api --follow

# Turėtumėte matyti:
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
|----------------|---------|-----------|
| `/health` | GET | Sveikatos patikra |
| `/api/items` | GET | Visų elementų sąrašas |
| `/api/items` | POST | Naujo elemento kūrimas |
| `/api/items/{id}` | GET | Konkretus elementas |
| `/api/items/{id}` | PUT | Elemento atnaujinimas |
| `/api/items/{id}` | DELETE | Elemento ištrynimas |

## Konfigūracija

### Aplinkos kintamieji

```bash
# Nustatyti pasirinktinius nustatymus
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Mastelio konfigūracija

API automatiškai masteliais pagal HTTP srautą:
- **Minimalios replikos**: 0 (mastelis sumažinamas iki nulio, kai nenaudojama)
- **Maksimalios replikos**: 10
- **Vienu metu užklausos vienai replikai**: 50

## Kūrimas

### Paleidimas lokaliai

```bash
# Įdiekite priklausomybes
cd src
pip install -r requirements.txt

# Paleiskite programą
python app.py

# Testuokite vietoje
curl http://localhost:8000/health
```

### Konteinerio kūrimas ir testavimas

```bash
# Sukurti Docker atvaizdą
docker build -t flask-api:local ./src

# Paleisti konteinerį vietoje
docker run -p 8000:8000 flask-api:local

# Testuoti konteinerį
curl http://localhost:8000/health
```

## Diegimas

### Pilnas diegimas

```bash
# Diegti infrastruktūrą ir programą
azd up
```

### Tik kodo diegimas

```bash
# Diegti tik programos kodą (infrastruktūra nepakitusi)
azd deploy api
```

### Konfigūracijos atnaujinimas

```bash
# Atnaujinti aplinkos kintamuosius
azd env set API_KEY "new-api-key"

# Perdiegti su nauja konfigūracija
azd deploy api
```

## Stebėjimas

### Žurnalų peržiūra

```bash
# Transliuoti tiesioginius žurnalus
azd logs api --follow

# Peržiūrėti paskutines 100 eilučių
azd logs api --tail 100
```

### Metrikų stebėjimas

```bash
# Atidaryti Azure Monitor prietaisų skydelį
azd monitor --overview

# Peržiūrėti konkrečius metrikos duomenis
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

### Elemento kūrimas

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Visų elementų gavimas

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Kainų optimizavimas

Šis diegimas naudoja mastelio sumažinimą iki nulio, todėl mokate tik tada, kai API apdoroja užklausas:

- **Neaktyvios būsenos kaina**: ~$0/mėn. (mastelis sumažintas iki nulio)
- **Aktyvios būsenos kaina**: ~$0.000024/sekundę vienai replikai
- **Tikėtina mėnesio kaina** (mažas naudojimas): $5-15

### Kaip dar labiau sumažinti išlaidas

```bash
# Sumažinti maksimalų replikų skaičių vystymo aplinkai
azd env set MAX_REPLICAS 3

# Naudoti trumpesnį neveiklumo laiką
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutės
```

## Trikčių šalinimas

### Konteineris nepaleidžiamas

```bash
# Patikrinkite konteinerio žurnalus
azd logs api --tail 100

# Patikrinkite, ar „Docker“ vaizdas vietoje sukuriamas
docker build -t test ./src
```

### API nepasiekiamas

```bash
# Patikrinkite, ar įėjimas yra išorinis
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Ilgi atsako laikai

```bash
# Patikrinkite CPU/Atminties naudojimą
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Padidinkite išteklius, jei reikia
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Valymas

```bash
# Ištrinti visus išteklius
azd down --force --purge
```

## Kiti žingsniai

### Išplėskite šį pavyzdį

1. **Pridėkite duomenų bazę** - Integruokite Azure Cosmos DB arba SQL Database
   ```bash
   # Pridėti Cosmos DB modulį į infra/main.bicep
   # Atnaujinti app.py su duomenų bazės ryšiu
   ```

2. **Pridėkite autentifikaciją** - Įgyvendinkite Azure AD arba API raktus
   ```python
   # Pridėkite autentifikavimo tarpinę programą į app.py
   from functools import wraps
   ```

3. **Nustatykite CI/CD** - GitHub Actions darbo eigą
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Pridėkite valdomą tapatybę** - Saugus prieigos prie Azure paslaugų užtikrinimas
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Susiję pavyzdžiai

- **[Duomenų bazės programa](../../../../../examples/database-app)** - Pilnas pavyzdys su SQL Database
- **[Mikropaslaugos](../../../../../examples/container-app/microservices)** - Daugiafunkcinė architektūra
- **[Container Apps pagrindinis vadovas](../README.md)** - Visi konteinerių šablonai

### Mokymosi ištekliai

- 📚 [AZD pradedantiesiems kursas](../../../README.md) - Pagrindinis kurso puslapis
- 📚 [Container Apps šablonai](../README.md) - Daugiau diegimo šablonų
- 📚 [AZD šablonų galerija](https://azure.github.io/awesome-azd/) - Bendruomenės šablonai

## Papildomi ištekliai

### Dokumentacija
- **[Flask dokumentacija](https://flask.palletsprojects.com/)** - Flask sistemos vadovas
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Oficialūs Azure dokumentai
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd komandų nuoroda

### Pamokos
- **[Container Apps greitas startas](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Pirmojo programos diegimas
- **[Python Azure](https://learn.microsoft.com/azure/developer/python/)** - Python kūrimo vadovas
- **[Bicep kalba](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktūra kaip kodas

### Įrankiai
- **[Azure portalas](https://portal.azure.com)** - Vizualus išteklių valdymas
- **[VS Code Azure plėtinys](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integracija

---

**🎉 Sveikiname!** Jūs įdiegėte gamybai paruoštą Flask API į Azure Container Apps su automatiniu masteliu ir stebėjimu.

**Klausimai?** [Atidarykite problemą](https://github.com/microsoft/AZD-for-beginners/issues) arba peržiūrėkite [DUK](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->