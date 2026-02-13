# Egyszerű Flask API - Container App példa

**Tanulási út:** Kezdő ⭐ | **Idő:** 25-35 perc | **Költség:** 0-15 $/hó

Egy teljes, működő Python Flask REST API telepítve Azure Container Apps-be az Azure Developer CLI (azd) használatával. Ez a példa bemutatja a konténer telepítést, az automatikus skálázást és az alapvető monitorozást.

## 🎯 Amit megtanulsz

- Konténerizált Python alkalmazás telepítése Azure-ra
- Automatikus skálázás konfigurálása scale-to-zero funkcióval
- Health probe-ok és readiness ellenőrzések megvalósítása
- Alkalmazás logok és metrikák monitorozása
- Azure Developer CLI gyors telepítéshez használata

## 📦 Mi tartozik hozzá

✅ **Flask alkalmazás** - Teljes REST API CRUD műveletekkel (`src/app.py`)  
✅ **Dockerfile** - Gyártásra kész konténer konfiguráció  
✅ **Bicep infrastruktúra** - Container Apps környezet és API telepítés  
✅ **AZD konfiguráció** - Egy parancsos telepítés beállítása  
✅ **Health probe-ok** - Liveness és readiness ellenőrzések konfigurálva  
✅ **Automatikus skálázás** - 0-10 replika HTTP terhelés alapján  

## Architektúra

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

## Előfeltételek

### Szükséges
- **Azure Developer CLI (azd)** - [Telepítési útmutató](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure előfizetés** - [Ingyenes fiók](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Docker telepítése](https://www.docker.com/products/docker-desktop/) (helyi teszthez)

### Ellenőrizd az előfeltételeket

```bash
# Az azd verzió ellenőrzése (1.5.0 vagy újabb szükséges)
azd version

# Azure bejelentkezés ellenőrzése
azd auth login

# Docker ellenőrzése (opcionális, helyi teszteléshez)
docker --version
```

## ⏱️ Telepítési idővonal

| Fázis | Időtartam | Mi történik |
|-------|----------|--------------||
| Környezet beállítása | 30 másodperc | azd környezet létrehozása |
| Konténer építése | 2-3 perc | Docker build Flask app |
| Infrastruktúra előkészítése | 3-5 perc | Container Apps, regisztráció, monitorozás |
| Alkalmazás telepítése | 2-3 perc | Image feltöltése és deploy Container Apps-be |
| **Összesen** | **8-12 perc** | Teljes telepítés kész |

## Gyors kezdés

```bash
# Navigáljon a példához
cd examples/container-app/simple-flask-api

# Inicializálja a környezetet (válasszon egyedi nevet)
azd env new myflaskapi

# Telepítsen mindent (infrastruktúra + alkalmazás)
azd up
# A következőkre fogják kérni:
# 1. Válassza ki az Azure előfizetést
# 2. Válasszon helyszínt (pl. eastus2)
# 3. Várjon 8-12 percet a telepítésre

# Szerezze meg az API végpontját
azd env get-values

# Tesztelje az API-t
curl $(azd env get-value API_ENDPOINT)/health
```

**Várt kimenet:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Telepítés ellenőrzése

### 1. lépés: Telepítési státusz ellenőrzése

```bash
# Telepített szolgáltatások megtekintése
azd show

# A várt kimenet a következőket mutatja:
# - Szolgáltatás: api
# - Végpont: https://ca-api-[env].xxx.azurecontainerapps.io
# - Állapot: Futásban
```

### 2. lépés: API végpontok tesztelése

```bash
# API végpont lekérése
API_URL=$(azd env get-value API_ENDPOINT)

# Egészség tesztelése
curl $API_URL/health

# Gyökér végpont tesztelése
curl $API_URL/

# Elem létrehozása
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Összes elem lekérése
curl $API_URL/api/items
```

**Siker kritériumok:**
- ✅ A health végpont HTTP 200 választ ad
- ✅ A gyökér végpont API információkat mutat
- ✅ A POST létrehozza az elemet és HTTP 201 választ ad
- ✅ A GET visszaadja a létrehozott elemeket

### 3. lépés: Logok megtekintése

```bash
# Élő naplók folyamának megtekintése az azd monitor segítségével
azd monitor --logs

# Vagy használd az Azure CLI-t:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Ezt kell látnod:
# - Gunicorn indítási üzenetek
# - HTTP kérés naplók
# - Alkalmazás információs naplók
```

## Projekt struktúra

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

## API végpontok

| Végpont | Módszer | Leírás |
|----------|--------|-------------|
| `/health` | GET | Egészség-ellenőrzés |
| `/api/items` | GET | Az összes elem lekérése |
| `/api/items` | POST | Új elem létrehozása |
| `/api/items/{id}` | GET | Egy adott elem lekérése |
| `/api/items/{id}` | PUT | Elem frissítése |
| `/api/items/{id}` | DELETE | Elem törlése |

## Konfiguráció

### Környezeti változók

```bash
# Egyéni konfiguráció beállítása
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skálázási konfiguráció

Az API automatikusan skálázódik a HTTP forgalom alapján:
- **Minimális replika**: 0 (scale-to-zero, ha nincs terhelés)
- **Maximális replika**: 10
- **Egyidejű kérés replika szerint**: 50

## Fejlesztés

### Helyi futtatás

```bash
# Függőségek telepítése
cd src
pip install -r requirements.txt

# Alkalmazás futtatása
python app.py

# Helyi tesztelés
curl http://localhost:8000/health
```

### Konténer építése és tesztelése

```bash
# Docker kép készítése
docker build -t flask-api:local ./src

# Konténer futtatása helyben
docker run -p 8000:8000 flask-api:local

# Konténer tesztelése
curl http://localhost:8000/health
```

## Telepítés

### Teljes telepítés

```bash
# Infrastruktúra és alkalmazás telepítése
azd up
```

### Csak kód telepítés

```bash
# Csak az alkalmazáskód telepítése (az infrastruktúra változatlan)
azd deploy api
```

### Konfiguráció frissítése

```bash
# Környezeti változók frissítése
azd env set API_KEY "new-api-key"

# Új konfigurációval való újratelepítés
azd deploy api
```

## Monitorozás

### Logok megtekintése

```bash
# Élő naplók folyam közvetítése az azd monitorral
azd monitor --logs

# Vagy használd az Azure CLI-t a Container Apps-hez:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Az utolsó 100 sor megtekintése
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Metrikák monitorozása

```bash
# Azure Monitor műszerfal megnyitása
azd monitor --overview

# Specifikus mérőszámok megtekintése
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Tesztelés

### Egészség-ellenőrzés

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Várt válasz:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Elem létrehozása

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Összes elem lekérése

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Költségoptimalizálás

Ez a telepítés scale-to-zero-t használ, így csak akkor fizetsz, amikor az API kérdéseket dolgoz fel:

- **Tétlen költség**: kb. 0 $/hó (nullára skálázva)
- **Aktív költség**: kb. 0,000024 $/másodperc replika során
- **Várt havi költség** (könnyű használat): 5-15 $

### További költségcsökkentés

```bash
# Csökkentse a maximális replikák számát fejlesztéshez
azd env set MAX_REPLICAS 3

# Használjon rövidebb inaktivitási időtúllépést
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 perc
```

## Hibakeresés

### Nem indul el a konténer

```bash
# Konténer naplók ellenőrzése Azure CLI használatával
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Docker image-ek helyi buildelésének ellenőrzése
docker build -t test ./src
```

### Az API nem elérhető

```bash
# Ellenőrizze, hogy a bejövő forgalom külső-e
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Magas válaszidők

```bash
# CPU/memória használat ellenőrzése
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Erőforrások bővítése szükség esetén
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Takarítás

```bash
# Minden erőforrás törlése
azd down --force --purge
```

## További lépések

### A példa bővítése

1. **Adatbázis hozzáadása** - Integráld az Azure Cosmos DB-t vagy SQL adatbázist  
   ```bash
   # Add Cosmos DB modult az infra/main.bicep-hez
   # Frissítsd az app.py-t az adatbázis kapcsolattal
   ```

2. **Hitelesítés hozzáadása** - Implementáld az Azure AD-t vagy API kulcsokat  
   ```python
   # Hitelesítési middleware hozzáadása az app.py-hez
   from functools import wraps
   ```

3. **CI/CD beállítása** - GitHub Actions munkafolyamat  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity hozzáadása** - Biztonságos hozzáférés az Azure szolgáltatásokhoz  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Kapcsolódó példák

- **[Adatbázis alkalmazás](../../../../../examples/database-app)** - Teljes példa SQL adatbázissal  
- **[Microservices](../../../../../examples/container-app/microservices)** - Többszolgáltatásos architektúra  
- **[Container Apps fő útmutató](../README.md)** - Minden konténer minta

### Tanulási források

- 📚 [AZD kezdőknek tanfolyam](../../../README.md) - Fő tanfolyam  
- 📚 [Container Apps minták](../README.md) - Több telepítési minta  
- 📚 [AZD sablon galéria](https://azure.github.io/awesome-azd/) - Közösségi sablonok

## További források

### Dokumentáció
- **[Flask dokumentáció](https://flask.palletsprojects.com/)** - Flask keretrendszer útmutató  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Hivatalos Azure dokumentáció  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd parancs referencia

### Oktatóanyagok
- **[Container Apps gyors kezdés](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Első alkalmazás telepítése  
- **[Python Azure-on](https://learn.microsoft.com/azure/developer/python/)** - Python fejlesztési útmutató  
- **[Bicep nyelv](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktúra kód formájában

### Eszközök
- **[Azure Portal](https://portal.azure.com)** - Erőforrások vizuális kezelése  
- **[VS Code Azure bővítmény](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integráció

---

**🎉 Gratulálunk!** Egy gyártásra kész Flask API-t telepítettél Azure Container Apps-be automatikus skálázással és monitorozással.

**Kérdésed van?** [Nyiss egy hibajegyet](https://github.com/microsoft/AZD-for-beginners/issues) vagy nézd meg a [GYIK-et](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:
Ezt a dokumentumot az AI fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk le. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, anyanyelvi dokumentumot kell tekinteni a hiteles forrásnak. Fontos információk esetén javasolt szakmai, emberi fordítást igénybe venni. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->