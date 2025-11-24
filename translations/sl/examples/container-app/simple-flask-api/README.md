<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-23T23:15:08+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "sl"
}
-->
# Preprosta Flask API - Primer aplikacije v vsebniku

**Učna pot:** Začetnik ⭐ | **Čas:** 25-35 minut | **Cena:** $0-15/mesec

Popolna, delujoča Python Flask REST API aplikacija, nameščena v Azure Container Apps z uporabo Azure Developer CLI (azd). Ta primer prikazuje osnovne korake za namestitev vsebnika, samodejno skaliranje in spremljanje.

## 🎯 Kaj se boste naučili

- Namestitev Python aplikacije v vsebniku na Azure
- Konfiguracija samodejnega skaliranja s skaliranjem na nič
- Implementacija sond za preverjanje zdravja in pripravljenosti
- Spremljanje dnevnikov aplikacije in metrik
- Uporaba Azure Developer CLI za hitro namestitev

## 📦 Kaj je vključeno

✅ **Flask aplikacija** - Popoln REST API z operacijami CRUD (`src/app.py`)  
✅ **Dockerfile** - Konfiguracija vsebnika za produkcijo  
✅ **Bicep infrastruktura** - Okolje za Container Apps in namestitev API-ja  
✅ **AZD konfiguracija** - Namestitev z enim ukazom  
✅ **Sonde za zdravje** - Konfigurirane sonde za živost in pripravljenost  
✅ **Samodejno skaliranje** - 0-10 replik glede na HTTP obremenitev  

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

## Predpogoji

### Zahtevano
- **Azure Developer CLI (azd)** - [Navodila za namestitev](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure naročnina** - [Brezplačen račun](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Namestite Docker](https://www.docker.com/products/docker-desktop/) (za lokalno testiranje)

### Preverite predpogoje

```bash
# Preveri azd različico (potrebna je 1.5.0 ali višja)
azd version

# Preveri prijavo v Azure
azd auth login

# Preveri Docker (neobvezno, za lokalno testiranje)
docker --version
```

## ⏱️ Časovnica namestitve

| Faza | Trajanje | Kaj se zgodi |
|------|----------|--------------|
| Nastavitev okolja | 30 sekund | Ustvarjanje azd okolja |
| Gradnja vsebnika | 2-3 minute | Gradnja Flask aplikacije z Dockerjem |
| Zagotovitev infrastrukture | 3-5 minut | Ustvarjanje Container Apps, registracije, spremljanja |
| Namestitev aplikacije | 2-3 minute | Potiskanje slike in namestitev v Container Apps |
| **Skupaj** | **8-12 minut** | Popolna pripravljena namestitev |

## Hiter začetek

```bash
# Pomaknite se do primera
cd examples/container-app/simple-flask-api

# Inicializirajte okolje (izberite edinstveno ime)
azd env new myflaskapi

# Namestite vse (infrastrukturo + aplikacijo)
azd up
# Prikazano bo naslednje:
# 1. Izberite naročnino Azure
# 2. Izberite lokacijo (npr. eastus2)
# 3. Počakajte 8-12 minut za namestitev

# Pridobite svoj API končni točki
azd env get-values

# Preizkusite API
curl $(azd env get-value API_ENDPOINT)/health
```

**Pričakovani rezultat:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Preverite namestitev

### Korak 1: Preverite stanje namestitve

```bash
# Ogled nameščenih storitev
azd show

# Pričakovani izhod prikazuje:
# - Storitev: api
# - Končna točka: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Deluje
```

### Korak 2: Testirajte API končne točke

```bash
# Pridobi API končno točko
API_URL=$(azd env get-value API_ENDPOINT)

# Preveri zdravje
curl $API_URL/health

# Preveri osnovno končno točko
curl $API_URL/

# Ustvari element
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Pridobi vse elemente
curl $API_URL/api/items
```

**Kriteriji uspeha:**
- ✅ Končna točka za zdravje vrne HTTP 200
- ✅ Glavna končna točka prikazuje informacije o API-ju
- ✅ POST ustvari element in vrne HTTP 201
- ✅ GET vrne ustvarjene elemente

### Korak 3: Preglejte dnevnike

```bash
# Pretakanje živih dnevnikov
azd logs api --follow

# Videti bi morali:
# - Sporočila ob zagonu Gunicorn
# - Dnevnike HTTP zahtevkov
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

## API končne točke

| Končna točka | Metoda | Opis |
|--------------|--------|------|
| `/health` | GET | Preverjanje zdravja |
| `/api/items` | GET | Seznam vseh elementov |
| `/api/items` | POST | Ustvari nov element |
| `/api/items/{id}` | GET | Pridobi določen element |
| `/api/items/{id}` | PUT | Posodobi element |
| `/api/items/{id}` | DELETE | Izbriši element |

## Konfiguracija

### Spremenljivke okolja

```bash
# Nastavi prilagojeno konfiguracijo
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfiguracija skaliranja

API se samodejno skalira glede na HTTP promet:
- **Minimalno število replik**: 0 (skalira na nič, ko ni aktivnosti)
- **Maksimalno število replik**: 10
- **Sočasne zahteve na repliko**: 50

## Razvoj

### Zagon lokalno

```bash
# Namestite odvisnosti
cd src
pip install -r requirements.txt

# Zaženite aplikacijo
python app.py

# Preizkusite lokalno
curl http://localhost:8000/health
```

### Gradnja in testiranje vsebnika

```bash
# Zgradi Docker sliko
docker build -t flask-api:local ./src

# Zaženi vsebnik lokalno
docker run -p 8000:8000 flask-api:local

# Preizkusi vsebnik
curl http://localhost:8000/health
```

## Namestitev

### Popolna namestitev

```bash
# Namesti infrastrukturo in aplikacijo
azd up
```

### Namestitev samo kode

```bash
# Namesti samo programsko kodo (infrastruktura nespremenjena)
azd deploy api
```

### Posodobitev konfiguracije

```bash
# Posodobi okoljske spremenljivke
azd env set API_KEY "new-api-key"

# Znova uvedi z novo konfiguracijo
azd deploy api
```

## Spremljanje

### Pregled dnevnikov

```bash
# Pretok živih dnevnikov
azd logs api --follow

# Ogled zadnjih 100 vrstic
azd logs api --tail 100
```

### Spremljanje metrik

```bash
# Odpri nadzorno ploščo Azure Monitor
azd monitor --overview

# Ogled določenih metrik
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testiranje

### Preverjanje zdravja

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Pričakovani odgovor:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Ustvarjanje elementa

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Pridobivanje vseh elementov

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimizacija stroškov

Ta namestitev uporablja skaliranje na nič, zato plačate le, ko API obdeluje zahteve:

- **Stroški v mirovanju**: ~$0/mesec (skalirano na nič)
- **Stroški aktivnosti**: ~$0.000024/sekundo na repliko
- **Pričakovani mesečni stroški** (lahka uporaba): $5-15

### Dodatno zmanjšanje stroškov

```bash
# Zmanjšaj največje število replik za razvoj
azd env set MAX_REPLICAS 3

# Uporabi krajši čas neaktivnosti
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minut
```

## Odpravljanje težav

### Vsebnik se ne zažene

```bash
# Preveri dnevnike kontejnerja
azd logs api --tail 100

# Preveri, ali se Docker slika lokalno gradi
docker build -t test ./src
```

### API ni dostopen

```bash
# Preverite, ali je vhod zunanje narave
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Dolgi odzivni časi

```bash
# Preveri uporabo CPU/pomnilnika
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Povečaj vire, če je potrebno
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Čiščenje

```bash
# Izbriši vse vire
azd down --force --purge
```

## Naslednji koraki

### Razširite ta primer

1. **Dodajte bazo podatkov** - Integrirajte Azure Cosmos DB ali SQL Database
   ```bash
   # Dodajte modul Cosmos DB v infra/main.bicep
   # Posodobite app.py s povezavo do baze podatkov
   ```

2. **Dodajte avtentikacijo** - Implementirajte Azure AD ali API ključe
   ```python
   # Dodajte vmesno programsko opremo za preverjanje pristnosti v app.py
   from functools import wraps
   ```

3. **Nastavite CI/CD** - GitHub Actions delovni tok
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Dodajte upravljano identiteto** - Zavarujte dostop do Azure storitev
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Sorodni primeri

- **[Aplikacija z bazo podatkov](../../../../../examples/database-app)** - Popoln primer z SQL Database
- **[Mikrostoritve](../../../../../examples/container-app/microservices)** - Arhitektura z več storitvami
- **[Glavni vodič za Container Apps](../README.md)** - Vsi vzorci vsebnikov

### Učni viri

- 📚 [Tečaj za začetnike z AZD](../../../README.md) - Glavna stran tečaja
- 📚 [Vzorce za Container Apps](../README.md) - Več vzorcev namestitve
- 📚 [Galerija predlog AZD](https://azure.github.io/awesome-azd/) - Predloge skupnosti

## Dodatni viri

### Dokumentacija
- **[Flask dokumentacija](https://flask.palletsprojects.com/)** - Vodnik za Flask okvir
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Uradna dokumentacija Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referenca ukazov azd

### Vadnice
- **[Hiter začetek za Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Namestite svojo prvo aplikacijo
- **[Python na Azure](https://learn.microsoft.com/azure/developer/python/)** - Vodnik za razvoj v Pythonu
- **[Bicep jezik](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktura kot koda

### Orodja
- **[Azure Portal](https://portal.azure.com)** - Vizualno upravljanje virov
- **[VS Code Azure razširitev](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integracija z IDE

---

**🎉 Čestitke!** Namestili ste produkcijsko pripravljeno Flask API aplikacijo v Azure Container Apps s samodejnim skaliranjem in spremljanjem.

**Vprašanja?** [Odprite težavo](https://github.com/microsoft/AZD-for-beginners/issues) ali preverite [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje AI [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->