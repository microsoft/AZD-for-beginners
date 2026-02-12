# Preprost Flask API - Primer Container App

**Učna pot:** Začetnik ⭐ | **Čas:** 25-35 minut | **Strošek:** $0-15/month

Popoln, delujoč Python Flask REST API, nameščen v Azure Container Apps z uporabo Azure Developer CLI (azd). Ta primer prikazuje razmestitev kontejnerja, samodejno skaliranje in osnove spremljanja.

## 🎯 Česa se boste naučili

- Razmestiti vsebovan Python program v Azure
- Konfigurirati samodejno skaliranje z zmanjševanjem na nič
- Implementirati zdravstvene preglede in readiness checks
- Spremljati dnevnike aplikacije in meritve
- Uporabiti Azure Developer CLI za hitro razmestitev

## 📦 Kaj je vključeno

✅ **Flask Application** - Popoln REST API z operacijami CRUD (`src/app.py`)  
✅ **Dockerfile** - Priprava kontejnerja za produkcijo  
✅ **Bicep Infrastructure** - Okolje Container Apps in razmestitev API-ja  
✅ **AZD Configuration** - Nastavitev za en ukaz razmestitve  
✅ **Health Probes** - Nastavljeni liveness in readiness pregledi  
✅ **Auto-scaling** - 0-10 replik glede na HTTP obremenitev  

## Architecture

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

## Predpogoji

### Zahtevano
- **Azure Developer CLI (azd)** - [Vodnik za namestitev](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Brezplačen račun](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Install Docker](https://www.docker.com/products/docker-desktop/) (za lokalno testiranje)

### Preverite predpogoje

```bash
# Preverite različico azd (zahtevana 1.5.0 ali novejša)
azd version

# Preverite prijavo v Azure
azd auth login

# Preverite Docker (neobvezno, za lokalno testiranje)
docker --version
```

## ⏱️ Časovni okvir razmestitve

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Ustvari azd okolje |
| Build container | 2-3 minutes | Docker zgradi Flask aplikacijo |
| Provision infrastructure | 3-5 minutes | Ustvari Container Apps, registracijo, spremljanje |
| Deploy application | 2-3 minutes | Potisne sliko in razstavi v Container Apps |
| **Total** | **8-12 minutes** | Celotna razmestitev pripravljena |

## Hiter začetek

```bash
# Pojdite do primera
cd examples/container-app/simple-flask-api

# Inicializirajte okolje (izberite edinstveno ime)
azd env new myflaskapi

# Namestite vse (infrastruktura + aplikacija)
azd up
# Boste pozvani, da:
# 1. Izberite naročnino Azure
# 2. Izberite lokacijo (npr. eastus2)
# 3. Počakajte 8-12 minut za namestitev

# Pridobite končno točko API-ja
azd env get-values

# Preizkusite API
curl $(azd env get-value API_ENDPOINT)/health
```

**Pričakovani izhod:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Preverite razmestitev

### Korak 1: Preverite stanje razmestitve

```bash
# Ogled nameščenih storitev
azd show

# Pričakovani izhod prikazuje:
# - Storitev: api
# - Končna točka: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: V teku
```

### Korak 2: Preizkusite API končne točke

```bash
# Pridobi končno točko API-ja
API_URL=$(azd env get-value API_ENDPOINT)

# Preveri stanje
curl $API_URL/health

# Preveri osnovno končno točko
curl $API_URL/

# Ustvari postavko
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Pridobi vse postavke
curl $API_URL/api/items
```

**Kriteriji uspeha:**
- ✅ Zdravstvena končna točka vrne HTTP 200
- ✅ Glavna končna točka prikaže informacije o API-ju
- ✅ POST ustvari element in vrne HTTP 201
- ✅ GET vrne ustvarjene elemente

### Korak 3: Ogled dnevnikov

```bash
# Pretakajte žive dnevnike z ukazom azd monitor
azd monitor --logs

# Ali uporabite Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Morali bi videti:
# - Zagonska sporočila Gunicorn
# - Dnevniki HTTP zahtev
# - Dnevniki informacij o aplikaciji
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

## API končne točke

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Preverjanje zdravja |
| `/api/items` | GET | Seznam vseh elementov |
| `/api/items` | POST | Ustvari nov element |
| `/api/items/{id}` | GET | Pridobi določen element |
| `/api/items/{id}` | PUT | Posodobi element |
| `/api/items/{id}` | DELETE | Izbriši element |

## Konfiguracija

### Spremenljivke okolja

```bash
# Nastavite prilagojeno konfiguracijo
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfiguracija skaliranja

API se samodejno skalira glede na HTTP promet:
- **Najmanjše replike**: 0 (se zmanjša na nič, ko ni prometa)
- **Največ replik**: 10
- **Sočasnih zahtev na repliko**: 50

## Razvoj

### Zaženi lokalno

```bash
# Namesti odvisnosti
cd src
pip install -r requirements.txt

# Zaženi aplikacijo
python app.py

# Preizkusi lokalno
curl http://localhost:8000/health
```

### Zgradi in testiraj kontejner

```bash
# Izgradi Docker sliko
docker build -t flask-api:local ./src

# Zaženi kontejner lokalno
docker run -p 8000:8000 flask-api:local

# Preizkusi kontejner
curl http://localhost:8000/health
```

## Razmestitev

### Polna razmestitev

```bash
# Razporedi infrastrukturo in aplikacijo
azd up
```

### Razmestitev samo z izvorno kodo

```bash
# Razmestite samo kodo aplikacije (infrastruktura nespremenjena)
azd deploy api
```

### Posodobi konfiguracijo

```bash
# Posodobi spremenljivke okolja
azd env set API_KEY "new-api-key"

# Ponovno razporedi z novo konfiguracijo
azd deploy api
```

## Spremljanje

### Ogled dnevnikov

```bash
# Pretakajte dnevniške zapise v živo z azd monitor
azd monitor --logs

# Ali uporabite Azure CLI za Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Prikaži zadnjih 100 vrstic
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Spremljanje metrik

```bash
# Odpri nadzorno ploščo Azure Monitor
azd monitor --overview

# Prikaži določene metrike
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testiranje

### Preverjanje zdravja

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Pričakovan odgovor:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Ustvari element

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Pridobi vse elemente

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimizacija stroškov

Ta razmestitev uporablja skaliranje na nič, zato plačate le, ko API obdeluje zahteve:

- **Idle cost**: ~$0/month (skalirano na nič)
- **Active cost**: ~$0.000024/second per replica
- **Expected monthly cost** (lahka uporaba): $5-15

### Dodatno zmanjšajte stroške

```bash
# Zmanjšajte največje število replik za razvoj
azd env set MAX_REPLICAS 3

# Uporabite krajšo časovno omejitev neaktivnosti
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minut
```

## Odpravljanje težav

### Kontejner se ne zažene

```bash
# Preverite dnevnike kontejnerja z Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Preverite, ali se Dockerova slika izgradi lokalno
docker build -t test ./src
```

### API ni dostopen

```bash
# Preverite, ali je ingress zunanji
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Visoki časi odziva

```bash
# Preveri porabo CPU in pomnilnika
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Po potrebi povečaj vire
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Čiščenje

```bash
# Izbrišite vse vire
azd down --force --purge
```

## Naslednji koraki

### Razširite ta primer

1. **Dodaj bazo podatkov** - Integrirajte Azure Cosmos DB ali SQL Database
   ```bash
   # Dodaj modul Cosmos DB v infra/main.bicep
   # Posodobi app.py z povezavo do baze podatkov
   ```

2. **Dodajte avtentikacijo** - Implementirajte Azure AD ali API ključe
   ```python
   # Dodaj middleware za preverjanje pristnosti v app.py
   from functools import wraps
   ```

3. **Vzpostavite CI/CD** - Delovni tok GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Dodajte upravljano identiteto** - Zavarujte dostop do storitev Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Sorodni primeri

- **[Aplikacija z bazo podatkov](../../../../../examples/database-app)** - Celovit primer z SQL Database
- **[Mikrostoritve](../../../../../examples/container-app/microservices)** - Arhitektura z več storitvami
- **[Container Apps Master Guide](../README.md)** - Vsi vzorci kontejnerjev

### Izobraževalni viri

- 📚 [AZD For Beginners Course](../../../README.md) - Glavna stran tečaja
- 📚 [Container Apps Patterns](../README.md) - Več vzorcev razmestitve
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Predloge skupnosti

## Dodatni viri

### Dokumentacija
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Vodnik po ogrodju Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Uradna dokumentacija Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referenca ukazov azd

### Vadnice
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Razmestite svojo prvo aplikacijo
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Vodnik za razvoj v Pythonu
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktura kot koda

### Orodja
- **[Azure Portal](https://portal.azure.com)** - Upravljanje virov vizualno
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integracija v IDE

---

**🎉 Čestitke!** Razmestili ste produkcijsko pripravljen Flask API v Azure Container Apps s samodejnim skaliranjem in spremljanjem.

**Vprašanja?** [Open an issue](https://github.com/microsoft/AZD-for-beginners/issues) ali preverite [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden s pomočjo storitve za prevajanje z umetno inteligenco Co-op Translator (https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvor­nem jeziku velja za merodajen vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->