<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-23T19:25:46+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "ro"
}
-->
# Simplu API Flask - Exemplu de Aplicație Container

**Cale de învățare:** Începător ⭐ | **Timp:** 25-35 minute | **Cost:** $0-15/lună

Un API REST complet și funcțional, construit cu Python Flask, implementat pe Azure Container Apps folosind Azure Developer CLI (azd). Acest exemplu demonstrează implementarea containerelor, auto-scalarea și elementele de bază ale monitorizării.

## 🎯 Ce Vei Învăța

- Implementarea unei aplicații Python containerizate pe Azure
- Configurarea auto-scalării cu scale-to-zero
- Implementarea sondelor de sănătate și verificărilor de disponibilitate
- Monitorizarea jurnalelor și metricilor aplicației
- Utilizarea Azure Developer CLI pentru implementare rapidă

## 📦 Ce Este Inclus

✅ **Aplicație Flask** - API REST complet cu operațiuni CRUD (`src/app.py`)  
✅ **Dockerfile** - Configurație de container pregătită pentru producție  
✅ **Infrastructură Bicep** - Mediu Container Apps și implementare API  
✅ **Configurație AZD** - Configurare pentru implementare cu o singură comandă  
✅ **Sonde de sănătate** - Verificări de disponibilitate și funcționare configurate  
✅ **Auto-scalare** - 0-10 replici bazate pe încărcarea HTTP  

## Arhitectură

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

## Cerințe Prealabile

### Necesare
- **Azure Developer CLI (azd)** - [Ghid de instalare](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Abonament Azure** - [Cont gratuit](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instalează Docker](https://www.docker.com/products/docker-desktop/) (pentru testare locală)

### Verifică Cerințele Prealabile

```bash
# Verificați versiunea azd (necesar 1.5.0 sau mai mare)
azd version

# Verificați autentificarea Azure
azd auth login

# Verificați Docker (opțional, pentru testare locală)
docker --version
```

## ⏱️ Cronologia Implementării

| Fază | Durată | Ce Se Întâmplă |
|------|--------|---------------||
| Configurare mediu | 30 secunde | Creare mediu azd |
| Construire container | 2-3 minute | Construire Docker pentru aplicația Flask |
| Provizionare infrastructură | 3-5 minute | Creare Container Apps, registru, monitorizare |
| Implementare aplicație | 2-3 minute | Împingere imagine și implementare pe Container Apps |
| **Total** | **8-12 minute** | Implementare completă gata |

## Început Rapid

```bash
# Navigați la exemplu
cd examples/container-app/simple-flask-api

# Inițializați mediul (alegeți un nume unic)
azd env new myflaskapi

# Implementați totul (infrastructură + aplicație)
azd up
# Vi se va solicita să:
# 1. Selectați abonamentul Azure
# 2. Alegeți locația (de exemplu, eastus2)
# 3. Așteptați 8-12 minute pentru implementare

# Obțineți punctul final al API-ului
azd env get-values

# Testați API-ul
curl $(azd env get-value API_ENDPOINT)/health
```

**Rezultat Așteptat:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verifică Implementarea

### Pasul 1: Verifică Starea Implementării

```bash
# Vizualizați serviciile implementate
azd show

# Ieșirea așteptată arată:
# - Serviciu: api
# - Punct de acces: https://ca-api-[env].xxx.azurecontainerapps.io
# - Stare: În funcțiune
```

### Pasul 2: Testează Punctele de Acces API

```bash
# Obține punctul final API
API_URL=$(azd env get-value API_ENDPOINT)

# Testează sănătatea
curl $API_URL/health

# Testează punctul final rădăcină
curl $API_URL/

# Creează un element
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Obține toate elementele
curl $API_URL/api/items
```

**Criterii de Succes:**
- ✅ Endpoint-ul de sănătate returnează HTTP 200
- ✅ Endpoint-ul rădăcină afișează informații despre API
- ✅ POST creează un element și returnează HTTP 201
- ✅ GET returnează elementele create

### Pasul 3: Vizualizează Jurnalele

```bash
# Transmite jurnale live
azd logs api --follow

# Ar trebui să vezi:
# - Mesaje de pornire Gunicorn
# - Jurnale de cereri HTTP
# - Jurnale de informații ale aplicației
```

## Structura Proiectului

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

## Puncte de Acces API

| Endpoint | Metodă | Descriere |
|----------|--------|-----------|
| `/health` | GET | Verificare sănătate |
| `/api/items` | GET | Listează toate elementele |
| `/api/items` | POST | Creează un element nou |
| `/api/items/{id}` | GET | Obține un element specific |
| `/api/items/{id}` | PUT | Actualizează un element |
| `/api/items/{id}` | DELETE | Șterge un element |

## Configurare

### Variabile de Mediu

```bash
# Setează configurația personalizată
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configurare Scalare

API-ul se scalează automat în funcție de traficul HTTP:
- **Minim Replici**: 0 (se scalează la zero când este inactiv)
- **Maxim Replici**: 10
- **Cereri Concurente per Replică**: 50

## Dezvoltare

### Rulează Local

```bash
# Instalați dependențele
cd src
pip install -r requirements.txt

# Rulați aplicația
python app.py

# Testați local
curl http://localhost:8000/health
```

### Construiește și Testează Containerul

```bash
# Construiește imaginea Docker
docker build -t flask-api:local ./src

# Rulează containerul local
docker run -p 8000:8000 flask-api:local

# Testează containerul
curl http://localhost:8000/health
```

## Implementare

### Implementare Completă

```bash
# Implementați infrastructura și aplicația
azd up
```

### Implementare Doar Cod

```bash
# Implementați doar codul aplicației (infrastructura neschimbată)
azd deploy api
```

### Actualizează Configurația

```bash
# Actualizați variabilele de mediu
azd env set API_KEY "new-api-key"

# Redistribuiți cu noua configurație
azd deploy api
```

## Monitorizare

### Vizualizează Jurnalele

```bash
# Transmite jurnale live
azd logs api --follow

# Vizualizează ultimele 100 de linii
azd logs api --tail 100
```

### Monitorizează Metricile

```bash
# Deschide tabloul de bord Azure Monitor
azd monitor --overview

# Vizualizează metrici specifice
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testare

### Verificare Sănătate

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Răspuns așteptat:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Creează Element

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Obține Toate Elementele

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimizare Costuri

Această implementare folosește scale-to-zero, astfel încât plătești doar când API-ul procesează cereri:

- **Cost inactiv**: ~$0/lună (scalat la zero)
- **Cost activ**: ~$0.000024/secundă per replică
- **Cost lunar estimat** (utilizare redusă): $5-15

### Reducerea Costurilor

```bash
# Reduceți numărul maxim de replici pentru dev
azd env set MAX_REPLICAS 3

# Utilizați un timp de așteptare mai scurt
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minute
```

## Depanare

### Containerul Nu Pornește

```bash
# Verificați jurnalele containerului
azd logs api --tail 100

# Verificați dacă imaginea Docker se construiește local
docker build -t test ./src
```

### API-ul Nu Este Accesibil

```bash
# Verificați dacă intrarea este externă
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Timpuri de Răspuns Mari

```bash
# Verifica utilizarea CPU/Memoriei
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Mărește resursele dacă este necesar
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Curățare

```bash
# Șterge toate resursele
azd down --force --purge
```

## Pași Următori

### Extinde Acest Exemplu

1. **Adaugă Bază de Date** - Integrează Azure Cosmos DB sau SQL Database
   ```bash
   # Adăugați modulul Cosmos DB în infra/main.bicep
   # Actualizați app.py cu conexiunea la baza de date
   ```

2. **Adaugă Autentificare** - Implementare Azure AD sau chei API
   ```python
   # Adăugați middleware de autentificare în app.py
   from functools import wraps
   ```

3. **Configurează CI/CD** - Flux de lucru GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Adaugă Identitate Gestionată** - Acces securizat la serviciile Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Exemple Asemănătoare

- **[Aplicație Bază de Date](../../../../../examples/database-app)** - Exemplu complet cu SQL Database
- **[Microservicii](../../../../../examples/container-app/microservices)** - Arhitectură multi-servicii
- **[Ghid Master Container Apps](../README.md)** - Toate modelele de containere

### Resurse de Învățare

- 📚 [Curs AZD pentru Începători](../../../README.md) - Curs principal
- 📚 [Modele Container Apps](../README.md) - Mai multe modele de implementare
- 📚 [Galerie Șabloane AZD](https://azure.github.io/awesome-azd/) - Șabloane comunitare

## Resurse Suplimentare

### Documentație
- **[Documentație Flask](https://flask.palletsprojects.com/)** - Ghidul framework-ului Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentație oficială Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referință comenzi azd

### Tutoriale
- **[Quickstart Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Implementează prima ta aplicație
- **[Python pe Azure](https://learn.microsoft.com/azure/developer/python/)** - Ghid de dezvoltare Python
- **[Limbaj Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructură ca cod

### Instrumente
- **[Portal Azure](https://portal.azure.com)** - Gestionează resursele vizual
- **[Extensie Azure pentru VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrare IDE

---

**🎉 Felicitări!** Ai implementat un API Flask pregătit pentru producție pe Azure Container Apps cu auto-scalare și monitorizare.

**Întrebări?** [Deschide o problemă](https://github.com/microsoft/AZD-for-beginners/issues) sau verifică [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->