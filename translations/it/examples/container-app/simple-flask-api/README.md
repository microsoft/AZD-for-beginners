<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-20T23:26:20+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "it"
}
-->
# Semplice API Flask - Esempio di App Contenitore

**Percorso di apprendimento:** Principiante ⭐ | **Tempo:** 25-35 minuti | **Costo:** $0-15/mese

Un'API REST Python Flask completa e funzionante, distribuita su Azure Container Apps utilizzando Azure Developer CLI (azd). Questo esempio dimostra le basi della distribuzione di contenitori, auto-scaling e monitoraggio.

## 🎯 Cosa Imparerai

- Distribuire un'applicazione Python containerizzata su Azure
- Configurare l'auto-scaling con scale-to-zero
- Implementare sonde di salute e controlli di prontezza
- Monitorare i log e le metriche dell'applicazione
- Utilizzare Azure Developer CLI per una distribuzione rapida

## 📦 Cosa è Incluso

✅ **Applicazione Flask** - API REST completa con operazioni CRUD (`src/app.py`)  
✅ **Dockerfile** - Configurazione del contenitore pronta per la produzione  
✅ **Infrastruttura Bicep** - Ambiente Container Apps e distribuzione API  
✅ **Configurazione AZD** - Configurazione per distribuzione con un solo comando  
✅ **Sonde di Salute** - Controlli di liveness e readiness configurati  
✅ **Auto-scaling** - 0-10 repliche basate sul carico HTTP  

## Architettura

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

### Necessari
- **Azure Developer CLI (azd)** - [Guida all'installazione](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Abbonamento Azure** - [Account gratuito](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Installa Docker](https://www.docker.com/products/docker-desktop/) (per test locali)

### Verifica dei Prerequisiti

```bash
# Controlla la versione di azd (necessaria 1.5.0 o superiore)
azd version

# Verifica l'accesso ad Azure
azd auth login

# Controlla Docker (opzionale, per test locali)
docker --version
```

## ⏱️ Timeline di Distribuzione

| Fase | Durata | Cosa Succede |
|------|--------|--------------|
| Configurazione ambiente | 30 secondi | Creazione ambiente azd |
| Costruzione contenitore | 2-3 minuti | Docker build dell'app Flask |
| Provisioning infrastruttura | 3-5 minuti | Creazione di Container Apps, registro, monitoraggio |
| Distribuzione applicazione | 2-3 minuti | Push immagine e distribuzione su Container Apps |
| **Totale** | **8-12 minuti** | Distribuzione completa pronta |

## Avvio Rapido

```bash
# Naviga all'esempio
cd examples/container-app/simple-flask-api

# Inizializza l'ambiente (scegli un nome univoco)
azd env new myflaskapi

# Distribuisci tutto (infrastruttura + applicazione)
azd up
# Ti verrà chiesto di:
# 1. Selezionare la sottoscrizione Azure
# 2. Scegliere la posizione (es. eastus2)
# 3. Aspettare 8-12 minuti per la distribuzione

# Ottieni il tuo endpoint API
azd env get-values

# Testa l'API
curl $(azd env get-value API_ENDPOINT)/health
```

**Output Atteso:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verifica della Distribuzione

### Passo 1: Controlla lo Stato della Distribuzione

```bash
# Visualizza i servizi distribuiti
azd show

# L'output previsto mostra:
# - Servizio: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Stato: In esecuzione
```

### Passo 2: Testa gli Endpoint API

```bash
# Ottieni endpoint API
API_URL=$(azd env get-value API_ENDPOINT)

# Testa la salute
curl $API_URL/health

# Testa l'endpoint root
curl $API_URL/

# Crea un elemento
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Ottieni tutti gli elementi
curl $API_URL/api/items
```

**Criteri di Successo:**
- ✅ L'endpoint di salute restituisce HTTP 200
- ✅ L'endpoint root mostra informazioni sull'API
- ✅ POST crea un elemento e restituisce HTTP 201
- ✅ GET restituisce gli elementi creati

### Passo 3: Visualizza i Log

```bash
# Trasmetti i log in diretta
azd logs api --follow

# Dovresti vedere:
# - Messaggi di avvio di Gunicorn
# - Log delle richieste HTTP
# - Log delle informazioni dell'applicazione
```

## Struttura del Progetto

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

| Endpoint | Metodo | Descrizione |
|----------|--------|-------------|
| `/health` | GET | Controllo di salute |
| `/api/items` | GET | Elenca tutti gli elementi |
| `/api/items` | POST | Crea un nuovo elemento |
| `/api/items/{id}` | GET | Ottieni un elemento specifico |
| `/api/items/{id}` | PUT | Aggiorna un elemento |
| `/api/items/{id}` | DELETE | Elimina un elemento |

## Configurazione

### Variabili d'Ambiente

```bash
# Imposta configurazione personalizzata
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configurazione di Scaling

L'API si scala automaticamente in base al traffico HTTP:
- **Repliche Minime**: 0 (scala a zero quando inattiva)
- **Repliche Massime**: 10
- **Richieste Concorrenziali per Replica**: 50

## Sviluppo

### Esegui Localmente

```bash
# Installa le dipendenze
cd src
pip install -r requirements.txt

# Esegui l'app
python app.py

# Testa localmente
curl http://localhost:8000/health
```

### Costruisci e Testa il Contenitore

```bash
# Costruisci immagine Docker
docker build -t flask-api:local ./src

# Esegui il container localmente
docker run -p 8000:8000 flask-api:local

# Testa il container
curl http://localhost:8000/health
```

## Distribuzione

### Distribuzione Completa

```bash
# Distribuire infrastruttura e applicazione
azd up
```

### Distribuzione Solo Codice

```bash
# Distribuire solo il codice dell'applicazione (infrastruttura invariata)
azd deploy api
```

### Aggiorna Configurazione

```bash
# Aggiorna le variabili d'ambiente
azd env set API_KEY "new-api-key"

# Ridistribuisci con la nuova configurazione
azd deploy api
```

## Monitoraggio

### Visualizza Log

```bash
# Trasmetti i log in diretta
azd logs api --follow

# Visualizza le ultime 100 righe
azd logs api --tail 100
```

### Monitora Metriche

```bash
# Apri il dashboard di Azure Monitor
azd monitor --overview

# Visualizza metriche specifiche
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Test

### Controllo di Salute

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Risposta attesa:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Crea Elemento

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Ottieni Tutti gli Elementi

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Ottimizzazione dei Costi

Questa distribuzione utilizza scale-to-zero, quindi paghi solo quando l'API elabora richieste:

- **Costo inattivo**: ~$0/mese (scala a zero)
- **Costo attivo**: ~$0.000024/secondo per replica
- **Costo mensile previsto** (uso leggero): $5-15

### Riduci Ulteriormente i Costi

```bash
# Riduci il numero massimo di repliche per sviluppo
azd env set MAX_REPLICAS 3

# Usa un timeout di inattività più breve
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minuti
```

## Risoluzione dei Problemi

### Il Contenitore Non Si Avvia

```bash
# Controlla i log del container
azd logs api --tail 100

# Verifica che l'immagine Docker venga costruita localmente
docker build -t test ./src
```

### API Non Accessibile

```bash
# Verificare che l'ingresso sia esterno
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Tempi di Risposta Elevati

```bash
# Controlla l'utilizzo di CPU/Memoria
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

## Prossimi Passi

### Espandi Questo Esempio

1. **Aggiungi Database** - Integra Azure Cosmos DB o SQL Database  
   ```bash
   # Aggiungi il modulo Cosmos DB a infra/main.bicep
   # Aggiorna app.py con la connessione al database
   ```

2. **Aggiungi Autenticazione** - Implementa Azure AD o chiavi API  
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

4. **Aggiungi Identità Gestita** - Accesso sicuro ai servizi Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Esempi Correlati

- **[App Database](../../../../../examples/database-app)** - Esempio completo con SQL Database  
- **[Microservizi](../../../../../examples/container-app/microservices)** - Architettura multi-servizio  
- **[Guida Completa Container Apps](../README.md)** - Tutti i modelli di contenitori  

### Risorse di Apprendimento

- 📚 [Corso AZD per Principianti](../../../README.md) - Home del corso principale  
- 📚 [Modelli Container Apps](../README.md) - Altri modelli di distribuzione  
- 📚 [Galleria Template AZD](https://azure.github.io/awesome-azd/) - Template della community  

## Risorse Aggiuntive

### Documentazione
- **[Documentazione Flask](https://flask.palletsprojects.com/)** - Guida al framework Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentazione ufficiale Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Riferimento ai comandi azd  

### Tutorial
- **[Quickstart Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Distribuisci la tua prima app  
- **[Python su Azure](https://learn.microsoft.com/azure/developer/python/)** - Guida allo sviluppo Python  
- **[Linguaggio Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruttura come codice  

### Strumenti
- **[Portale Azure](https://portal.azure.com)** - Gestisci le risorse visivamente  
- **[Estensione Azure per VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrazione IDE  

---

**🎉 Congratulazioni!** Hai distribuito un'API Flask pronta per la produzione su Azure Container Apps con auto-scaling e monitoraggio.

**Domande?** [Apri un problema](https://github.com/microsoft/AZD-for-beginners/issues) o consulta le [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->