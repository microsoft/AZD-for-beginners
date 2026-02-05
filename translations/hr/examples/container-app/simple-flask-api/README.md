# Jednostavna Flask API - Primjer aplikacije u kontejneru

**Put učenja:** Početnik ⭐ | **Vrijeme:** 25-35 minuta | **Trošak:** $0-15/mjesečno

Potpuni, funkcionalni Python Flask REST API implementiran na Azure Container Apps koristeći Azure Developer CLI (azd). Ovaj primjer prikazuje osnove implementacije kontejnera, automatskog skaliranja i praćenja.

## 🎯 Što ćete naučiti

- Implementirati Python aplikaciju u kontejneru na Azure
- Konfigurirati automatsko skaliranje s opcijom skaliranja na nulu
- Postaviti health probes i provjere spremnosti
- Pratiti logove aplikacije i metrike
- Koristiti Azure Developer CLI za brzu implementaciju

## 📦 Što je uključeno

✅ **Flask aplikacija** - Kompletan REST API s CRUD operacijama (`src/app.py`)  
✅ **Dockerfile** - Konfiguracija kontejnera spremna za produkciju  
✅ **Bicep infrastruktura** - Okruženje za Container Apps i implementacija API-ja  
✅ **AZD konfiguracija** - Postavka za implementaciju jednim naredbom  
✅ **Health probes** - Konfigurirane provjere liveness i spremnosti  
✅ **Automatsko skaliranje** - 0-10 replika na temelju HTTP opterećenja  

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

### Obavezno
- **Azure Developer CLI (azd)** - [Vodič za instalaciju](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure pretplata** - [Besplatni račun](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instaliraj Docker](https://www.docker.com/products/docker-desktop/) (za lokalno testiranje)

### Provjera preduvjeta

```bash
# Provjerite azd verziju (potrebna 1.5.0 ili novija)
azd version

# Provjerite prijavu na Azure
azd auth login

# Provjerite Docker (opcionalno, za lokalno testiranje)
docker --version
```

## ⏱️ Vremenski okvir implementacije

| Faza | Trajanje | Što se događa |
|------|----------|--------------||
| Postavljanje okruženja | 30 sekundi | Kreiranje azd okruženja |
| Izgradnja kontejnera | 2-3 minute | Docker gradi Flask aplikaciju |
| Provision infrastrukture | 3-5 minuta | Kreiranje Container Apps, registry, praćenje |
| Implementacija aplikacije | 2-3 minute | Slanje slike i implementacija na Container Apps |
| **Ukupno** | **8-12 minuta** | Kompletna implementacija spremna |

## Brzi početak

```bash
# Idite na primjer
cd examples/container-app/simple-flask-api

# Inicijalizirajte okruženje (odaberite jedinstveno ime)
azd env new myflaskapi

# Implementirajte sve (infrastruktura + aplikacija)
azd up
# Bit ćete upitani da:
# 1. Odaberete Azure pretplatu
# 2. Odaberete lokaciju (npr., eastus2)
# 3. Pričekate 8-12 minuta za implementaciju

# Dobijte svoj API krajnju točku
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
# Pregledajte implementirane usluge
azd show

# Očekivani izlaz prikazuje:
# - Usluga: api
# - Krajnja točka: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Pokrenuto
```

### Korak 2: Testiranje API endpointa

```bash
# Dohvati API krajnju točku
API_URL=$(azd env get-value API_ENDPOINT)

# Testiraj zdravlje
curl $API_URL/health

# Testiraj početnu krajnju točku
curl $API_URL/

# Kreiraj stavku
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Dohvati sve stavke
curl $API_URL/api/items
```

**Kriteriji uspjeha:**
- ✅ Endpoint za zdravlje vraća HTTP 200
- ✅ Root endpoint prikazuje informacije o API-ju
- ✅ POST kreira stavku i vraća HTTP 201
- ✅ GET vraća kreirane stavke

### Korak 3: Pregled logova

```bash
# Prikaz uživo dnevnika
azd logs api --follow

# Trebali biste vidjeti:
# - Poruke pokretanja Gunicorna
# - Dnevnike HTTP zahtjeva
# - Informacijske dnevnike aplikacije
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

## API endpointi

| Endpoint | Metoda | Opis |
|----------|--------|------|
| `/health` | GET | Provjera zdravlja |
| `/api/items` | GET | Popis svih stavki |
| `/api/items` | POST | Kreiranje nove stavke |
| `/api/items/{id}` | GET | Dohvaćanje određene stavke |
| `/api/items/{id}` | PUT | Ažuriranje stavke |
| `/api/items/{id}` | DELETE | Brisanje stavke |

## Konfiguracija

### Varijable okruženja

```bash
# Postavite prilagođenu konfiguraciju
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfiguracija skaliranja

API se automatski skalira na temelju HTTP prometa:
- **Minimalni broj replika**: 0 (skalira na nulu kada je neaktivan)
- **Maksimalni broj replika**: 10
- **Istovremeni zahtjevi po replici**: 50

## Razvoj

### Pokretanje lokalno

```bash
# Instaliraj ovisnosti
cd src
pip install -r requirements.txt

# Pokreni aplikaciju
python app.py

# Testiraj lokalno
curl http://localhost:8000/health
```

### Izgradnja i testiranje kontejnera

```bash
# Izgradite Docker sliku
docker build -t flask-api:local ./src

# Pokrenite kontejner lokalno
docker run -p 8000:8000 flask-api:local

# Testirajte kontejner
curl http://localhost:8000/health
```

## Implementacija

### Potpuna implementacija

```bash
# Implementiraj infrastrukturu i aplikaciju
azd up
```

### Implementacija samo koda

```bash
# Implementiraj samo kod aplikacije (infrastruktura nepromijenjena)
azd deploy api
```

### Ažuriranje konfiguracije

```bash
# Ažuriraj varijable okruženja
azd env set API_KEY "new-api-key"

# Ponovno implementiraj s novom konfiguracijom
azd deploy api
```

## Praćenje

### Pregled logova

```bash
# Prikaz uživo dnevnika
azd logs api --follow

# Pregled zadnjih 100 redaka
azd logs api --tail 100
```

### Praćenje metrika

```bash
# Otvori nadzornu ploču Azure Monitor
azd monitor --overview

# Pregledaj specifične metrike
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

### Dohvaćanje svih stavki

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimizacija troškova

Ova implementacija koristi skaliranje na nulu, tako da plaćate samo kada API obrađuje zahtjeve:

- **Trošak u mirovanju**: ~$0/mjesečno (skalirano na nulu)
- **Trošak aktivnog rada**: ~$0.000024/sekundi po replici
- **Očekivani mjesečni trošak** (lagano korištenje): $5-15

### Daljnje smanjenje troškova

```bash
# Smanjite maksimalni broj replika za razvoj
azd env set MAX_REPLICAS 3

# Koristite kraći vremenski ograničenje neaktivnosti
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuta
```

## Rješavanje problema

### Kontejner se ne pokreće

```bash
# Provjerite zapisnike spremnika
azd logs api --tail 100

# Provjerite lokalnu izgradnju Docker slike
docker build -t test ./src
```

### API nije dostupan

```bash
# Provjerite je li ulaz vanjski
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Visoko vrijeme odgovora

```bash
# Provjeri korištenje CPU-a/memorije
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Povećaj resurse ako je potrebno
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Čišćenje

```bash
# Izbriši sve resurse
azd down --force --purge
```

## Sljedeći koraci

### Proširenje ovog primjera

1. **Dodavanje baze podataka** - Integracija Azure Cosmos DB ili SQL Database
   ```bash
   # Dodajte Cosmos DB modul u infra/main.bicep
   # Ažurirajte app.py s povezivanjem na bazu podataka
   ```

2. **Dodavanje autentifikacije** - Implementacija Azure AD ili API ključeva
   ```python
   # Dodajte middleware za autentifikaciju u app.py
   from functools import wraps
   ```

3. **Postavljanje CI/CD-a** - GitHub Actions workflow
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Dodavanje Managed Identity** - Siguran pristup Azure uslugama
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Povezani primjeri

- **[Aplikacija s bazom podataka](../../../../../examples/database-app)** - Kompletan primjer sa SQL bazom podataka
- **[Mikroservisi](../../../../../examples/container-app/microservices)** - Arhitektura s više servisa
- **[Vodič za Container Apps](../README.md)** - Svi obrasci za kontejnere

### Resursi za učenje

- 📚 [AZD za početnike](../../../README.md) - Glavni tečaj
- 📚 [Obrasci za Container Apps](../README.md) - Više obrazaca za implementaciju
- 📚 [Galerija AZD predložaka](https://azure.github.io/awesome-azd/) - Predlošci zajednice

## Dodatni resursi

### Dokumentacija
- **[Flask dokumentacija](https://flask.palletsprojects.com/)** - Vodič za Flask framework
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Službena Azure dokumentacija
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referenca za azd naredbe

### Tutorijali
- **[Brzi početak za Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Implementirajte svoju prvu aplikaciju
- **[Python na Azure](https://learn.microsoft.com/azure/developer/python/)** - Vodič za razvoj u Pythonu
- **[Bicep jezik](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktura kao kod

### Alati
- **[Azure Portal](https://portal.azure.com)** - Vizualno upravljanje resursima
- **[VS Code Azure ekstenzija](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integracija s IDE-om

---

**🎉 Čestitamo!** Implementirali ste Flask API spreman za produkciju na Azure Container Apps s automatskim skaliranjem i praćenjem.

**Pitanja?** [Otvorite problem](https://github.com/microsoft/AZD-for-beginners/issues) ili provjerite [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->