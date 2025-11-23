<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-23T12:15:04+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "hu"
}
-->
# Egyszerű Flask API - Konténeres alkalmazás példa

**Tanulási útvonal:** Kezdő ⭐ | **Idő:** 25-35 perc | **Költség:** $0-15/hó

Egy teljes, működő Python Flask REST API, amely az Azure Container Apps szolgáltatásba van telepítve az Azure Developer CLI (azd) segítségével. Ez a példa bemutatja a konténeres telepítést, az automatikus skálázást és az alapvető monitorozást.

## 🎯 Amit megtanulsz

- Konténeres Python alkalmazás telepítése az Azure-ba
- Automatikus skálázás konfigurálása nullára skálázással
- Egészségügyi vizsgálatok és készenléti ellenőrzések megvalósítása
- Alkalmazásnaplók és metrikák monitorozása
- Gyors telepítés az Azure Developer CLI segítségével

## 📦 Mi van benne?

✅ **Flask alkalmazás** - Teljes REST API CRUD műveletekkel (`src/app.py`)  
✅ **Dockerfile** - Konténer konfiguráció, amely készen áll a termelésre  
✅ **Bicep infrastruktúra** - Container Apps környezet és API telepítés  
✅ **AZD konfiguráció** - Egyparancsos telepítési beállítás  
✅ **Egészségügyi vizsgálatok** - Liveness és readiness ellenőrzések konfigurálva  
✅ **Automatikus skálázás** - 0-10 replikák HTTP terhelés alapján  

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
- **Docker Desktop** - [Docker telepítése](https://www.docker.com/products/docker-desktop/) (helyi teszteléshez)

### Előfeltételek ellenőrzése

```bash
# Ellenőrizze az azd verziót (1.5.0 vagy magasabb szükséges)
azd version

# Ellenőrizze az Azure bejelentkezést
azd auth login

# Ellenőrizze a Dockert (opcionális, helyi teszteléshez)
docker --version
```

## ⏱️ Telepítési idővonal

| Fázis | Időtartam | Mi történik |
|-------|----------|--------------||
| Környezet beállítása | 30 másodperc | Azd környezet létrehozása |
| Konténer építése | 2-3 perc | Flask alkalmazás Docker build |
| Infrastruktúra létrehozása | 3-5 perc | Container Apps, registry, monitorozás létrehozása |
| Alkalmazás telepítése | 2-3 perc | Kép feltöltése és telepítése Container Apps-be |
| **Összesen** | **8-12 perc** | Teljes telepítés készen |

## Gyors kezdés

```bash
# Navigáljon a példához
cd examples/container-app/simple-flask-api

# Inicializálja a környezetet (válasszon egyedi nevet)
azd env new myflaskapi

# Telepítse mindent (infrastruktúra + alkalmazás)
azd up
# A következőkre lesz felszólítva:
# 1. Válassza ki az Azure előfizetést
# 2. Válassza ki a helyet (pl. eastus2)
# 3. Várjon 8-12 percet a telepítésre

# Szerezze meg az API végpontját
azd env get-values

# Tesztelje az API-t
curl $(azd env get-value API_ENDPOINT)/health
```

**Várható kimenet:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Telepítés ellenőrzése

### 1. lépés: Telepítési állapot ellenőrzése

```bash
# Megtekintés telepített szolgáltatások
azd show

# Várható kimenet mutatja:
# - Szolgáltatás: api
# - Végpont: https://ca-api-[env].xxx.azurecontainerapps.io
# - Állapot: Futásban
```

### 2. lépés: API végpontok tesztelése

```bash
# Szerezze meg az API végpontot
API_URL=$(azd env get-value API_ENDPOINT)

# Tesztelje az egészséget
curl $API_URL/health

# Tesztelje a gyökér végpontot
curl $API_URL/

# Hozzon létre egy elemet
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Szerezze meg az összes elemet
curl $API_URL/api/items
```

**Siker kritériumok:**
- ✅ Egészségügyi végpont HTTP 200-at ad vissza
- ✅ Gyökér végpont megjeleníti az API információkat
- ✅ POST létrehoz egy elemet és HTTP 201-et ad vissza
- ✅ GET visszaadja a létrehozott elemeket

### 3. lépés: Naplók megtekintése

```bash
# Élő naplók streamelése
azd logs api --follow

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
| `/health` | GET | Egészségügyi ellenőrzés |
| `/api/items` | GET | Összes elem listázása |
| `/api/items` | POST | Új elem létrehozása |
| `/api/items/{id}` | GET | Konkrét elem lekérése |
| `/api/items/{id}` | PUT | Elem frissítése |
| `/api/items/{id}` | DELETE | Elem törlése |

## Konfiguráció

### Környezeti változók

```bash
# Állítsa be az egyéni konfigurációt
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Skálázási konfiguráció

Az API automatikusan skálázódik a HTTP forgalom alapján:
- **Minimális replikák száma**: 0 (nullára skálázódik, ha nincs terhelés)
- **Maximális replikák száma**: 10
- **Egy replikára jutó egyidejű kérések száma**: 50

## Fejlesztés

### Helyi futtatás

```bash
# Telepítse a függőségeket
cd src
pip install -r requirements.txt

# Futtassa az alkalmazást
python app.py

# Tesztelje helyben
curl http://localhost:8000/health
```

### Konténer építése és tesztelése

```bash
# Docker kép létrehozása
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

### Csak kód telepítése

```bash
# Csak az alkalmazáskódot telepítse (infrastruktúra változatlan)
azd deploy api
```

### Konfiguráció frissítése

```bash
# Frissítse a környezeti változókat
azd env set API_KEY "new-api-key"

# Telepítse újra az új konfigurációval
azd deploy api
```

## Monitorozás

### Naplók megtekintése

```bash
# Élő naplók streamelése
azd logs api --follow

# Az utolsó 100 sor megtekintése
azd logs api --tail 100
```

### Metrikák monitorozása

```bash
# Nyissa meg az Azure Monitor irányítópultot
azd monitor --overview

# Tekintse meg a konkrét metrikákat
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Tesztelés

### Egészségügyi ellenőrzés

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Várható válasz:
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

Ez a telepítés nullára skálázódik, így csak akkor fizetsz, amikor az API kéréseket dolgoz fel:

- **Tétlen költség**: ~$0/hó (nullára skálázva)
- **Aktív költség**: ~$0.000024/másodperc replikánként
- **Várható havi költség** (könnyű használat): $5-15

### További költségcsökkentés

```bash
# Csökkentse a maximális replikák számát fejlesztéshez
azd env set MAX_REPLICAS 3

# Használjon rövidebb tétlenségi időkorlátot
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 perc
```

## Hibakeresés

### A konténer nem indul el

```bash
# Ellenőrizze a konténer naplóit
azd logs api --tail 100

# Ellenőrizze, hogy a Docker kép helyben épül-e
docker build -t test ./src
```

### Az API nem érhető el

```bash
# Ellenőrizze, hogy a belépés külső-e
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Magas válaszidők

```bash
# Ellenőrizze a CPU/Memória használatot
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Növelje az erőforrásokat, ha szükséges
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Takarítás

```bash
# Törölje az összes erőforrást
azd down --force --purge
```

## Következő lépések

### Példa bővítése

1. **Adatbázis hozzáadása** - Integrálj Azure Cosmos DB-t vagy SQL adatbázist
   ```bash
   # Adja hozzá a Cosmos DB modult az infra/main.bicep fájlhoz
   # Frissítse az app.py fájlt az adatbázis kapcsolattal
   ```

2. **Hitelesítés hozzáadása** - Implementálj Azure AD-t vagy API kulcsokat
   ```python
   # Adja hozzá az autentikációs köztes szoftvert az app.py-hoz
   from functools import wraps
   ```

3. **CI/CD beállítása** - GitHub Actions munkafolyamat
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Kezelt identitás hozzáadása** - Biztonságos hozzáférés az Azure szolgáltatásokhoz
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Kapcsolódó példák

- **[Adatbázis alkalmazás](../../../../../examples/database-app)** - Teljes példa SQL adatbázissal
- **[Mikroszolgáltatások](../../../../../examples/container-app/microservices)** - Több szolgáltatásból álló architektúra
- **[Container Apps mester útmutató](../README.md)** - Minden konténeres minta

### Tanulási források

- 📚 [AZD kezdőknek kurzus](../../../README.md) - Fő kurzus oldala
- 📚 [Container Apps minták](../README.md) - További telepítési minták
- 📚 [AZD sablonok galéria](https://azure.github.io/awesome-azd/) - Közösségi sablonok

## További források

### Dokumentáció
- **[Flask dokumentáció](https://flask.palletsprojects.com/)** - Flask keretrendszer útmutató
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Hivatalos Azure dokumentáció
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd parancs referencia

### Útmutatók
- **[Container Apps gyors kezdés](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Az első alkalmazás telepítése
- **[Python az Azure-ban](https://learn.microsoft.com/azure/developer/python/)** - Python fejlesztési útmutató
- **[Bicep nyelv](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktúra kódként

### Eszközök
- **[Azure Portal](https://portal.azure.com)** - Erőforrások vizuális kezelése
- **[VS Code Azure kiegészítő](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE integráció

---

**🎉 Gratulálunk!** Sikeresen telepítettél egy termelésre kész Flask API-t az Azure Container Apps-be automatikus skálázással és monitorozással.

**Kérdések?** [Nyiss egy hibajegyet](https://github.com/microsoft/AZD-for-beginners/issues) vagy nézd meg a [GYIK](../../../resources/faq.md) oldalt.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy félremagyarázásért, amely a fordítás használatából eredhet.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->