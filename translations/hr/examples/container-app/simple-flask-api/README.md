# Jednostavan Flask API - Primjer aplikacije u kontejneru

**Put učenja:** Početnik ⭐ | **Vrijeme:** 25-35 minuta | **Cijena:** 0-15 $/mjesec

Kompletan, funkcionalan Python Flask REST API implementiran na Azure Container Apps korištenjem Azure Developer CLI (azd). Ovaj primjer prikazuje implementaciju kontejnera, automatsko skaliranje i osnove nadzora.

## 🎯 Što ćete naučiti

- Implementirati Python aplikaciju u kontejneru na Azure
- Konfigurirati automatsko skaliranje s mogućnošću skaliranja na nulu
- Implementirati health probe-ove i provjere spremnosti
- Pratiti zapise i metrike aplikacije
- Koristiti Azure Developer CLI za brzu implementaciju

## 📦 Što je uključeno

✅ **Flask aplikacija** - Potpuni REST API s CRUD operacijama (`src/app.py`)  
✅ **Dockerfile** - Konfiguracija kontejnera spremna za produkciju  
✅ **Bicep infrastruktura** - Okruženje Container Apps i implementacija API-ja  
✅ **AZD konfiguracija** - Postavljanje implementacije jednim naredbom  
✅ **Health probe-ovi** - Konfigurirane provjere životnosti i spremnosti  
✅ **Automatsko skaliranje** - 0-10 replika ovisno o HTTP opterećenju  

## Arhitektura

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

## Preduvjeti

### Potrebno
- **Azure Developer CLI (azd)** - [Upute za instalaciju](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure pretplata** - [Besplatan račun](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instaliraj Docker](https://www.docker.com/products/docker-desktop/) (za lokalno testiranje)

### Provjera preduvjeta

```bash
# Provjerite verziju azd (potrebna 1.5.0 ili novija)
azd version

# Potvrdite Azure prijavu
azd auth login

# Provjerite Docker (opcionalno, za lokalno testiranje)
docker --version
```

## ⏱️ Vremenski okvir implementacije

| Faza | Trajanje | Što se događa |
|-------|----------|--------------||
| Postavljanje okruženja | 30 sekundi | Izrada azd okruženja |
| Izrada kontejnera | 2-3 minute | Docker build Flask aplikacije |
| Postavljanje infrastrukture | 3-5 minuta | Izrada Container Apps, registra, nadzora |
| Implementacija aplikacije | 2-3 minute | Slanje slike i implementacija u Container Apps |
| **Ukupno** | **8-12 minuta** | Implementacija dovršena i spremna |

## Brzi početak

```bash
# Navigirajte do primjera
cd examples/container-app/simple-flask-api

# Inicijalizirajte okruženje (odaberite jedinstveno ime)
azd env new myflaskapi

# Postavite sve (infrastrukturu + aplikaciju)
azd up
# Bit ćete upitani da:
# 1. Odaberete Azure pretplatu
# 2. Izaberete lokaciju (npr. eastus2)
# 3. Pričekate 8-12 minuta za postavljanje

# Nabavite svoj API endpoint
azd env get-values

# Testirajte API
curl $(azd env get-value API_ENDPOINT)/health
```

**Očekivani rezultat:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Provjera implementacije

### Korak 1: Provjera statusa implementacije

```bash
# Prikaži implementirane usluge
azd show

# Očekivani izlaz prikazuje:
# - Usluga: api
# - Krajnja točka: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Pokrenuto
```

### Korak 2: Testiranje API krajnjih točaka

```bash
# Dohvati API krajnu točku
API_URL=$(azd env get-value API_ENDPOINT)

# Testiraj zdravlje
curl $API_URL/health

# Testiraj korijensku krajnju točku
curl $API_URL/

# Kreiraj stavku
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Dohvati sve stavke
curl $API_URL/api/items
```

**Kriteriji uspjeha:**
- ✅ Health endpoint vraća HTTP 200
- ✅ Root endpoint prikazuje informacije o API-ju
- ✅ POST kreira stavku i vraća HTTP 201
- ✅ GET vraća kreirane stavke

### Korak 3: Pregled zapisa

```bash
# Prijenos uživo dnevnika pomoću azd monitor
azd monitor --logs

# Ili koristite Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Trebali biste vidjeti:
# - Poruke o pokretanju Gunicorn
# - Zapisi HTTP zahtjeva
# - Zapisi informacija o aplikaciji
```

## Struktura projekta

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

## API krajnje točke

| Krajnja točka | Metoda | Opis |
|----------|--------|-------------|
| `/health` | GET | Provjera zdravlja |
| `/api/items` | GET | Popis svih stavki |
| `/api/items` | POST | Kreiraj novu stavku |
| `/api/items/{id}` | GET | Dohvati određenu stavku |
| `/api/items/{id}` | PUT | Ažuriraj stavku |
| `/api/items/{id}` | DELETE | Obriši stavku |

## Konfiguracija

### Varijable okruženja

```bash
# Postavi prilagođene postavke
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfiguracija skaliranja

API se automatski skalira na temelju HTTP prometa:
- **Min broj replika**: 0 (skalira na nulu kad je neaktivan)
- **Max broj replika**: 10
- **Istovremeni zahtjevi po replici**: 50

## Razvoj

### Pokretanje lokalno

```bash
# Instalirajte ovisnosti
cd src
pip install -r requirements.txt

# Pokreni aplikaciju
python app.py

# Testiraj lokalno
curl http://localhost:8000/health
```

### Izrada i testiranje kontejnera

```bash
# Izradi Docker sliku
docker build -t flask-api:local ./src

# Pokreni spremnik lokalno
docker run -p 8000:8000 flask-api:local

# Testiraj spremnik
curl http://localhost:8000/health
```

## Implementacija

### Potpuna implementacija

```bash
# Postavi infrastrukturu i aplikaciju
azd up
```

### Implementacija samo koda

```bash
# Implementirajte samo kod aplikacije (infrastruktura nepromijenjena)
azd deploy api
```

### Ažuriranje konfiguracije

```bash
# Ažuriraj varijable okruženja
azd env set API_KEY "new-api-key"

# Ponovno pusti u rad s novom konfiguracijom
azd deploy api
```

## Nadzor

### Pregled zapisa

```bash
# Prikaz uživo dnevnika pomoću azd monitor
azd monitor --logs

# Ili koristite Azure CLI za Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Prikaz zadnjih 100 linija
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Praćenje metrika

```bash
# Otvori Azure Monitor nadzornu ploču
azd monitor --overview

# Prikaži određene metrike
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testiranje

### Provjera zdravlja

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Očekivani odgovor:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Kreiranje stavke

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Dohvati sve stavke

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimizacija troškova

Ova implementacija koristi skaliranje na nulu, pa plaćate samo kad API obrađuje zahtjeve:

- **Trošak u stanju mirovanja**: ~0 $/mjesec (skalirano na nulu)
- **Aktivni trošak**: ~0.000024 $/sekundi po replici
- **Očekivani mjesečni trošak** (lagana upotreba): 5-15 $

### Daljnje smanjenje troškova

```bash
# Smanji maksimalni broj replika za razvoj
azd env set MAX_REPLICAS 3

# Koristi kraći vremenski prekid bez aktivnosti
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuta
```

## Rješavanje problema

### Kontejner se ne pokreće

```bash
# Provjerite zapise kontejnera pomoću Azure CLI-ja
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Provjerite lokalnu gradnju Docker slike
docker build -t test ./src
```

### API nije dostupan

```bash
# Provjerite je li ulaz vanjski
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Visoka vremena odgovora

```bash
# Provjerite upotrebu CPU-a/memorije
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Povećajte resurse ako je potrebno
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Čišćenje

```bash
# Izbrišite sve resurse
azd down --force --purge
```

## Sljedeći koraci

### Proširite ovaj primjer

1. **Dodajte bazu podataka** - Integrirajte Azure Cosmos DB ili SQL bazu
   ```bash
   # Dodajte Cosmos DB modul u infra/main.bicep
   # Ažurirajte app.py s vezom baze podataka
   ```

2. **Dodajte autentifikaciju** - Implementirajte Azure AD ili API ključeve
   ```python
   # Dodajte autentikacijski middleware u app.py
   from functools import wraps
   ```

3. **Postavite CI/CD** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Dodajte Managed Identity** - Siguran pristup Azure servisima
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Srodni primjeri

- **[Database App](../../../../../examples/database-app)** - Kompletan primjer sa SQL bazom
- **[Microservices](../../../../../examples/container-app/microservices)** - Višeservisna arhitektura
- **[Vodič za Container Apps](../README.md)** - Svi obrasci za kontejnere

### Izvori za učenje

- 📚 [AZD za početnike](../../../README.md) - Glavni tečaj
- 📚 [Container Apps obrasci](../README.md) - Više obrazaca za implementaciju
- 📚 [Galerija AZD predložaka](https://azure.github.io/awesome-azd/) - Predlošci zajednice

## Dodatni izvori

### Dokumentacija
- **[Flask dokumentacija](https://flask.palletsprojects.com/)** - Vodič za Flask framework
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Službena Azure dokumentacija
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Reference za azd naredbe

### Tutorijali
- **[Container Apps vodič za početak](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Implementirajte svoju prvu aplikaciju
- **[Python na Azureu](https://learn.microsoft.com/azure/developer/python/)** - Vodič za razvoj u Pythonu
- **[Bicep jezik](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktura kao kod

### Alati
- **[Azure portal](https://portal.azure.com)** - Vizualno upravljanje resursima
- **[VS Code Azure proširenje](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integracija u IDE

---

**🎉 Čestitamo!** Implementirali ste produkcijski spreman Flask API u Azure Container Apps s automatskim skaliranjem i nadzorom.

**Pitanja?** [Otvorite problem](https://github.com/microsoft/AZD-for-beginners/issues) ili provjerite [Česta pitanja](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden pomoću AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako se trudimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku smatra se autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->