# Semplice API Flask - Esempio di Container App

**Percorso di apprendimento:** Principiante ⭐ | **Tempo:** 25-35 minuti | **Costo:** $0-15/mese

Una API REST Python Flask completa e funzionante distribuita su Azure Container Apps usando Azure Developer CLI (azd). Questo esempio dimostra le basi della distribuzione di container, dell'auto-scaling e del monitoraggio.

## 🎯 Cosa imparerai

- Distribuire un'applicazione Python containerizzata su Azure
- Configurare l'auto-scaling con scale-to-zero
- Implementare probe di integrità e controlli di readiness
- Monitorare i log e le metriche dell'applicazione
- Usare Azure Developer CLI per una distribuzione rapida

## 📦 Cosa è incluso

✅ **Applicazione Flask** - API REST completa con operazioni CRUD (`src/app.py`)  
✅ **Dockerfile** - Configurazione del container pronta per la produzione  
✅ **Infrastruttura Bicep** - Ambiente Container Apps e distribuzione dell'API  
✅ **Configurazione AZD** - Setup per la distribuzione con un comando  
✅ **Probe di integrità** - Controlli di liveness e readiness configurati  
✅ **Auto-scaling** - 0-10 repliche basate sul carico HTTP  

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

## Prerequisiti

### Richiesto
- **Azure Developer CLI (azd)** - [Guida all'installazione](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Sottoscrizione Azure** - [Account gratuito](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Installa Docker](https://www.docker.com/products/docker-desktop/) (per test locali)

### Verifica dei prerequisiti

```bash
# Controlla la versione di azd (richiede la versione 1.5.0 o superiore)
azd version

# Verifica l'accesso ad Azure
azd auth login

# Controlla Docker (opzionale, per test locali)
docker --version
```

## ⏱️ Tempistica di distribuzione

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Avvio rapido

```bash
# Vai all'esempio
cd examples/container-app/simple-flask-api

# Inizializza l'ambiente (scegli un nome univoco)
azd env new myflaskapi

# Distribuisci tutto (infrastruttura + applicazione)
azd up
# Ti verrà chiesto di:
# 1. Selezionare la sottoscrizione Azure
# 2. Scegliere la posizione (es. eastus2)
# 3. Attendere 8-12 minuti per la distribuzione

# Ottieni il tuo endpoint API
azd env get-values

# Testa l'API
curl $(azd env get-value API_ENDPOINT)/health
```

**Output previsto:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verifica della distribuzione

### Passo 1: Controlla lo stato della distribuzione

```bash
# Visualizza i servizi distribuiti
azd show

# L'output previsto mostra:
# - Servizio: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Stato: In esecuzione
```

### Passo 2: Test degli endpoint API

```bash
# Ottieni endpoint API
API_URL=$(azd env get-value API_ENDPOINT)

# Verifica stato di salute
curl $API_URL/health

# Test dell'endpoint root
curl $API_URL/

# Crea un elemento
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Ottieni tutti gli elementi
curl $API_URL/api/items
```

**Criteri di successo:**
- ✅ L'endpoint di health restituisce HTTP 200
- ✅ L'endpoint root mostra informazioni sull'API
- ✅ POST crea un elemento e restituisce HTTP 201
- ✅ GET restituisce gli elementi creati

### Passo 3: Visualizza i log

```bash
# Trasmetti i log in tempo reale usando azd monitor
azd monitor --logs

# Oppure usa Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Dovresti vedere:
# - Messaggi di avvio di Gunicorn
# - Log delle richieste HTTP
# - Log informativi dell'applicazione
```

## Struttura del progetto

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

## Endpoint API

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Controllo di integrità |
| `/api/items` | GET | Elenca tutti gli elementi |
| `/api/items` | POST | Crea nuovo elemento |
| `/api/items/{id}` | GET | Ottieni elemento specifico |
| `/api/items/{id}` | PUT | Aggiorna elemento |
| `/api/items/{id}` | DELETE | Elimina elemento |

## Configurazione

### Variabili d'ambiente

```bash
# Imposta la configurazione personalizzata
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configurazione dello scaling

L'API scala automaticamente in base al traffico HTTP:
- **Repliche minime**: 0 (scalano a zero quando inattive)
- **Repliche massime**: 10
- **Richieste concorrenti per replica**: 50

## Sviluppo

### Esegui in locale

```bash
# Installa le dipendenze
cd src
pip install -r requirements.txt

# Esegui l'app
python app.py

# Testa localmente
curl http://localhost:8000/health
```

### Build e test del container

```bash
# Costruisci immagine Docker
docker build -t flask-api:local ./src

# Esegui il container localmente
docker run -p 8000:8000 flask-api:local

# Testa il container
curl http://localhost:8000/health
```

## Distribuzione

### Distribuzione completa

```bash
# Distribuire l'infrastruttura e l'applicazione
azd up
```

### Distribuzione solo codice

```bash
# Distribuire solo il codice dell'applicazione (infrastruttura invariata)
azd deploy api
```

### Aggiorna configurazione

```bash
# Aggiorna le variabili d'ambiente
azd env set API_KEY "new-api-key"

# Ridistribuisci con la nuova configurazione
azd deploy api
```

## Monitoraggio

### Visualizza log

```bash
# Trasmetti i log in tempo reale usando azd monitor
azd monitor --logs

# Oppure usa Azure CLI per Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Visualizza le ultime 100 righe
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitora metriche

```bash
# Apri la dashboard di Azure Monitor
azd monitor --overview

# Visualizza metriche specifiche
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Test

### Controllo di integrità

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Risposta prevista:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Crea elemento

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Ottieni tutti gli elementi

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Ottimizzazione dei costi

Questa distribuzione utilizza lo scale-to-zero, quindi paghi solo quando l'API sta elaborando richieste:

- **Costo a riposo**: ~$0/mese (scalato a zero)
- **Costo attivo**: ~$0.000024/secondo per replica
- **Costo mensile previsto** (uso leggero): $5-15

### Ridurre ulteriormente i costi

```bash
# Ridurre il numero massimo di repliche per l'ambiente di sviluppo
azd env set MAX_REPLICAS 3

# Usare un timeout di inattività più breve
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuti
```

## Risoluzione dei problemi

### Il container non si avvia

```bash
# Controlla i log del contenitore usando Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Verifica che l'immagine Docker venga costruita localmente
docker build -t test ./src
```

### API non accessibile

```bash
# Verificare che l'ingress sia esterno
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Tempi di risposta elevati

```bash
# Controlla l'utilizzo della CPU e della memoria
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Aumenta le risorse se necessario
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Pulizia

```bash
# Elimina tutte le risorse
azd down --force --purge
```

## Prossimi passi

### Espandi questo esempio

1. **Aggiungi database** - Integra Azure Cosmos DB o SQL Database
   ```bash
   # Aggiungi il modulo Cosmos DB a infra/main.bicep
   # Aggiorna app.py con la connessione al database
   ```

2. **Aggiungi autenticazione** - Implementa Azure AD o chiavi API
   ```python
   # Aggiungi il middleware di autenticazione a app.py
   from functools import wraps
   ```

3. **Configura CI/CD** - Workflow GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Aggiungi Managed Identity** - Proteggi l'accesso ai servizi Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Esempi correlati

- **[App Database](../../../../../examples/database-app)** - Esempio completo con SQL Database
- **[Microservizi](../../../../../examples/container-app/microservices)** - Architettura multi-servizio
- **[Guida principale Container Apps](../README.md)** - Tutti i pattern per i container

### Risorse di apprendimento

- 📚 [Corso AZD per principianti](../../../README.md) - Pagina principale del corso
- 📚 [Pattern Container Apps](../README.md) - Altri modelli di distribuzione
- 📚 [Galleria template AZD](https://azure.github.io/awesome-azd/) - Template della community

## Risorse aggiuntive

### Documentazione
- **[Documentazione Flask](https://flask.palletsprojects.com/)** - Guida al framework Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentazione ufficiale di Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Riferimento ai comandi azd

### Tutorial
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Distribuisci la tua prima app
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Guida allo sviluppo Python
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruttura come codice

### Strumenti
- **[Azure Portal](https://portal.azure.com)** - Gestisci le risorse visivamente
- **[Estensione Azure per VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrazione con l'IDE

---

**🎉 Congratulazioni!** Hai distribuito un'API Flask pronta per la produzione su Azure Container Apps con auto-scaling e monitoraggio.

**Domande?** [Apri un issue](https://github.com/microsoft/AZD-for-beginners/issues) o consulta le [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire l'accuratezza, si prega di tenere presente che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->