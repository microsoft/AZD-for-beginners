# Architettura a microservizi - Esempio Container App

⏱️ **Tempo stimato**: 25-35 minuti | 💰 **Costo stimato**: ~$50-100/month | ⭐ **Complessità**: Avanzato

Una **architettura a microservizi semplificata ma funzionale** distribuita su Azure Container Apps usando AZD CLI. Questo esempio dimostra la comunicazione servizio-a-servizio, l'orchestrazione dei container e il monitoraggio con un setup pratico a 2 servizi.

> **📚 Approccio di apprendimento**: Questo esempio inizia con un'architettura minima a 2 servizi (API Gateway + Backend Service) che puoi effettivamente distribuire e studiare. Dopo aver padroneggiato questa base, forniamo indicazioni per espandere verso un ecosistema completo di microservizi.

## Cosa imparerai

Completando questo esempio, imparerai a:
- Distribuire più container su Azure Container Apps
- Implementare la comunicazione servizio-a-servizio con networking interno
- Configurare scaling basato sull'ambiente e controlli di integrità
- Monitorare applicazioni distribuite con Application Insights
- Comprendere i pattern di deployment dei microservizi e le migliori pratiche
- Imparare l'espansione progressiva da architetture semplici a complesse

## Architettura

### Fase 1: Cosa stiamo costruendo (incluso in questo esempio)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Perché iniziare in modo semplice?**
- ✅ Distribuire e comprendere rapidamente (25-35 minuti)
- ✅ Apprendere i pattern principali dei microservizi senza complessità
- ✅ Codice funzionante che puoi modificare e con cui sperimentare
- ✅ Costo inferiore per l'apprendimento (~$50-100/mese vs $300-1400/mese)
- ✅ Costruire fiducia prima di aggiungere database e code di messaggi

**Analogia**: Pensa a questo come imparare a guidare. Inizi con un parcheggio vuoto (2 servizi), padroneggi le basi, poi passi al traffico cittadino (5+ servizi con database).

### Fase 2: Espansione futura (Architettura di riferimento)

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Vedi la sezione "Guida all'espansione" alla fine per istruzioni passo-passo.

## Funzionalità incluse

✅ **Scoperta dei servizi**: Scoperta automatica basata su DNS tra i container  
✅ **Bilanciamento del carico**: Bilanciamento del carico integrato tra le repliche  
✅ **Scalabilità automatica**: Scalabilità indipendente per servizio basata su richieste HTTP  
✅ **Monitoraggio della salute**: Probe di liveness e readiness per entrambi i servizi  
✅ **Logging distribuito**: Logging centralizzato con Application Insights  
✅ **Networking interno**: Comunicazione sicura servizio-a-servizio  
✅ **Orchestrazione dei container**: Distribuzione e scaling automatici  
✅ **Aggiornamenti senza interruzioni**: Aggiornamenti rolling con gestione delle revisioni  

## Prerequisiti

### Strumenti richiesti

Prima di iniziare, verifica di avere installati questi strumenti:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versione 1.0.0 o superiore)
   ```bash
   azd version
   # Output previsto: azd versione 1.0.0 o superiore
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versione 2.50.0 o superiore)
   ```bash
   az --version
   # Output previsto: azure-cli 2.50.0 o superiore
   ```

3. **[Docker](https://www.docker.com/get-started)** (per sviluppo/test locale - opzionale)
   ```bash
   docker --version
   # Output previsto: Docker versione 20.10 o superiore
   ```

### Requisiti Azure

- Una **sottoscrizione Azure** attiva ([crea un account gratuito](https://azure.microsoft.com/free/))
- Permessi per creare risorse nella tua sottoscrizione
- Ruolo **Contributor** sulla sottoscrizione o sul gruppo di risorse

### Conoscenze richieste

Questo è un esempio a **livello avanzato**. Dovresti avere:
- Completato l'[esempio Simple Flask API](../../../../../examples/container-app/simple-flask-api) 
- Comprensione di base dell'architettura a microservizi
- Familiarità con REST API e HTTP
- Comprensione dei concetti di container

**Nuovo a Container Apps?** Inizia prima con l'[esempio Simple Flask API](../../../../../examples/container-app/simple-flask-api) per apprendere le basi.

## Avvio rapido (Passo dopo passo)

### Passo 1: Clona e naviga

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Controllo di successo**: Verifica di vedere `azure.yaml`:
```bash
ls
# Previsto: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticati con Azure

```bash
azd auth login
```

Questo apre il tuo browser per l'autenticazione di Azure. Accedi con le tue credenziali Azure.

**✓ Controllo di successo**: Dovresti vedere:
```
Logged in to Azure.
```

### Passo 3: Inizializza l'ambiente

```bash
azd init
```

**Richieste che vedrai**:
- **Nome dell'ambiente**: Inserisci un nome breve (es., `microservices-dev`)
- **Sottoscrizione Azure**: Seleziona la tua sottoscrizione
- **Posizione Azure**: Scegli una regione (es., `eastus`, `westeurope`)

**✓ Controllo di successo**: Dovresti vedere:
```
SUCCESS: New project initialized!
```

### Passo 4: Distribuisci infrastruttura e servizi

```bash
azd up
```

**Cosa succede** (richiede 8-12 minuti):
1. Crea l'ambiente Container Apps
2. Crea Application Insights per il monitoraggio
3. Costruisce il container API Gateway (Node.js)
4. Costruisce il container del Product Service (Python)
5. Distribuisce entrambi i container su Azure
6. Configura networking e controlli di integrità
7. Configura monitoraggio e logging

**✓ Controllo di successo**: Dovresti vedere:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tempo**: 8-12 minuti

### Passo 5: Testa la distribuzione

```bash
# Ottieni l'endpoint del gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Verifica la salute dell'API Gateway
curl $GATEWAY_URL/health

# Output previsto:
# {"stato":"operativo","servizio":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Test del Product Service tramite il gateway**:
```bash
# Elenca i prodotti
curl $GATEWAY_URL/api/products

# Output previsto:
# [
#   {"id":1,"name":"Portatile","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Tastiera","price":79.99,"stock":150}
# ]
```

**✓ Controllo di successo**: Entrambi gli endpoint restituiscono dati JSON senza errori.

---

**🎉 Congratulazioni!** Hai distribuito un'architettura a microservizi su Azure!

## Struttura del progetto

Tutti i file di implementazione sono inclusi—questo è un esempio completo e funzionante:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Cosa fa ogni componente:**

**Infrastruttura (infra/)**:
- `main.bicep`: Orchestra tutte le risorse Azure e le loro dipendenze
- `core/container-apps-environment.bicep`: Crea l'ambiente Container Apps e l'Azure Container Registry
- `core/monitor.bicep`: Configura Application Insights per il logging distribuito
- `app/*.bicep`: Definizioni dei singoli container app con scaling e controlli di integrità

**API Gateway (src/api-gateway/)**:
- Servizio esposto al pubblico che indirizza le richieste ai servizi di backend
- Implementa logging, gestione degli errori e inoltro delle richieste
- Dimostra la comunicazione HTTP servizio-a-servizio

**Product Service (src/product-service/)**:
- Servizio interno con catalogo prodotti (in-memory per semplicità)
- REST API con controlli di integrità
- Esempio di pattern di microservizio backend

## Panoramica dei servizi

### API Gateway (Node.js/Express)

**Porta**: 8080  
**Accesso**: Pubblico (ingresso esterno)  
**Scopo**: Instrada le richieste in arrivo ai servizi di backend appropriati  

**Endpoint**:
- `GET /` - Informazioni sul servizio
- `GET /health` - Endpoint di controllo di integrità
- `GET /api/products` - Inoltra al Product Service (elenca tutti)
- `GET /api/products/:id` - Inoltra al Product Service (ottieni per ID)

**Caratteristiche principali**:
- Instradamento delle richieste con axios
- Logging centralizzato
- Gestione degli errori e dei timeout
- Scoperta dei servizi tramite variabili d'ambiente
- Integrazione con Application Insights

**Esempio di codice** (`src/api-gateway/app.js`):
```javascript
// Comunicazione interna del servizio
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Porta**: 8000  
**Accesso**: Solo interno (nessun ingresso esterno)  
**Scopo**: Gestisce il catalogo prodotti con dati in-memory  

**Endpoint**:
- `GET /` - Informazioni sul servizio
- `GET /health` - Endpoint di controllo di integrità
- `GET /products` - Elenca tutti i prodotti
- `GET /products/<id>` - Ottieni prodotto per ID

**Caratteristiche principali**:
- API RESTful con Flask
- Store dei prodotti in-memory (semplice, nessun database necessario)
- Monitoraggio della salute con probe
- Logging strutturato
- Integrazione con Application Insights

**Modello dati**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Perché solo interno?**
Il Product Service non è esposto pubblicamente. Tutte le richieste devono passare attraverso l'API Gateway, che fornisce:
- Sicurezza: punto di accesso controllato
- Flessibilità: può modificare il backend senza influire sui client
- Monitoraggio: logging delle richieste centralizzato

## Comprendere la comunicazione tra servizi

### Come i servizi comunicano tra loro

In questo esempio, l'API Gateway comunica con il Product Service utilizzando **chiamate HTTP interne**:

```javascript
// Gateway API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Effettua una richiesta HTTP interna
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Punti chiave**:

1. **Scoperta basata su DNS**: Container Apps fornisce automaticamente DNS per i servizi interni
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Semplificato come: `http://product-service` (Container Apps lo risolve)

2. **Nessuna esposizione pubblica**: il Product Service ha `external: false` in Bicep
   - Accessibile solo all'interno dell'ambiente Container Apps
   - Non raggiungibile da Internet

3. **Variabili d'ambiente**: gli URL dei servizi vengono iniettati al momento della distribuzione
   - Bicep passa l'FQDN interno al gateway
   - Nessun URL hardcoded nel codice dell'applicazione

**Analogia**: Pensa a questo come a stanze d'ufficio. L'API Gateway è la reception (esposta al pubblico), e il Product Service è una stanza d'ufficio (solo interna). I visitatori devono passare dalla reception per raggiungere qualsiasi ufficio.

## Opzioni di distribuzione

### Distribuzione completa (consigliata)

```bash
# Distribuire l'infrastruttura e entrambi i servizi
azd up
```

Questa distribuzione comprende:
1. Ambiente Container Apps
2. Application Insights
3. Container Registry
4. Container API Gateway
5. Container Product Service

**Tempo**: 8-12 minuti

### Distribuire un singolo servizio

```bash
# Distribuire solo un servizio (dopo l'azd up iniziale)
azd deploy api-gateway

# Oppure distribuire il servizio product
azd deploy product-service
```

**Caso d'uso**: Quando hai aggiornato il codice in un servizio e vuoi ridistribuire solo quel servizio.

### Aggiorna la configurazione

```bash
# Modifica i parametri di ridimensionamento
azd env set GATEWAY_MAX_REPLICAS 30

# Ridispiega con la nuova configurazione
azd up
```

## Configurazione

### Configurazione dello scaling

Entrambi i servizi sono configurati con autoscaling basato su HTTP nei loro file Bicep:

**API Gateway**:
- Repliche minime: 2 (almeno 2 sempre per disponibilità)
- Repliche massime: 20
- Trigger di scaling: 50 richieste concorrenti per replica

**Product Service**:
- Repliche minime: 1 (può scalare a zero se necessario)
- Repliche massime: 10
- Trigger di scaling: 100 richieste concorrenti per replica

**Personalizza lo scaling** (in `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Allocazione delle risorse

**API Gateway**:
- CPU: 1.0 vCPU
- Memoria: 2 GiB
- Motivo: Gestisce tutto il traffico esterno

**Product Service**:
- CPU: 0.5 vCPU
- Memoria: 1 GiB
- Motivo: Operazioni leggere in-memory

### Controlli di integrità

Entrambi i servizi includono probe di liveness e readiness:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Cosa significa**:
- **Liveness**: se il controllo di integrità fallisce, Container Apps riavvia il container
- **Readiness**: se non è pronto, Container Apps smette di instradare traffico a quella replica



## Monitoraggio e osservabilità

### Visualizzare i log dei servizi

```bash
# Visualizza i log usando azd monitor
azd monitor --logs

# Oppure usa Azure CLI per Container Apps specifiche:
# Esegui lo streaming dei log dall'API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Visualizza i log recenti del servizio prodotto
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Output previsto**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Query per Application Insights

Accedi ad Application Insights nel portale Azure, quindi esegui queste query:

**Trova richieste lente**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Traccia le chiamate servizio-a-servizio**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Tasso di errore per servizio**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volume delle richieste nel tempo**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Accedi alla dashboard di monitoraggio

```bash
# Ottieni i dettagli di Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Apri il monitoraggio del Portale di Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metriche in tempo reale

1. Vai su Application Insights nel portale Azure
2. Clicca su "Live Metrics"
3. Vedi richieste, errori e prestazioni in tempo reale
4. Testa eseguendo: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Esercizi pratici

[Nota: Vedi gli esercizi completi sopra nella sezione "Esercizi pratici" per esercizi dettagliati passo-passo che includono verifica della distribuzione, modifica dei dati, test dell'autoscaling, gestione degli errori e aggiunta di un terzo servizio.]

## Analisi dei costi

### Costi mensili stimati (per questo esempio a 2 servizi)

| Risorsa | Configurazione | Costo stimato |
|----------|--------------|----------------|
| API Gateway | 2-20 repliche, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 repliche, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Tier Basic | $5 |
| Application Insights | 1-2 GB/mese | $5-10 |
| Log Analytics | 1 GB/mese | $3 |
| **Totale** | | **$58-243/mese** |

**Ripartizione dei costi per utilizzo**:
- **Traffico leggero** (testing/apprendimento): ~$60/mese
- **Traffico moderato** (piccola produzione): ~$120/mese
- **Traffico elevato** (periodi di punta): ~$240/mese

### Suggerimenti per l'ottimizzazione dei costi

1. **Scalare a zero per lo sviluppo**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Usa il piano Consumption per Cosmos DB** (quando lo aggiungi):
   - Paga solo per ciò che usi
   - Nessun costo minimo

3. **Imposta il campionamento in Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Campiona il 50% delle richieste
   ```

4. **Pulisci le risorse quando non sono necessarie**:
   ```bash
   azd down
   ```

### Opzioni tier gratuite
Per apprendimento/test, considera:
- Usa i crediti gratuiti di Azure (primi 30 giorni)
- Mantieni il numero di repliche al minimo
- Elimina dopo il test (nessun addebito continuativo)

---

## Pulizia

Per evitare addebiti continuativi, elimina tutte le risorse:

```bash
azd down --force --purge
```

**Prompt di conferma**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Type `y` to confirm.

**Cosa viene eliminato**:
- Container Apps Environment
- Entrambe le Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verifica pulizia**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Dovrebbe restituire vuoto.

---

## Guida all'espansione: da 2 a 5+ servizi

Una volta che avrai padroneggiato questa architettura a 2 servizi, ecco come espandere:

### Fase 1: Aggiungere la persistenza del database (prossimo passo)

**Aggiungi Cosmos DB per il Product Service**:

1. Crea `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Aggiorna il servizio product per usare Cosmos DB invece dei dati in memoria

3. Costo aggiuntivo stimato: ~$25/mese (serverless)

### Fase 2: Aggiungi un terzo servizio (Gestione Ordini)

**Crea il Servizio Ordini**:

1. Nuova cartella: `src/order-service/` (Python/Node.js/C#)
2. Nuovo Bicep: `infra/app/order-service.bicep`
3. Aggiorna API Gateway per instradare `/api/orders`
4. Aggiungi Azure SQL Database per la persistenza degli ordini

**L'architettura diventa**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Aggiungi comunicazione asincrona (Service Bus)

**Implementa architettura basata su eventi**:

1. Aggiungi Azure Service Bus: `infra/core/servicebus.bicep`
2. Il Product Service pubblica eventi "ProductCreated"
3. L'Order Service si sottoscrive agli eventi dei prodotti
4. Aggiungi un Notification Service per elaborare gli eventi

**Modello**: Richiesta/Risposta (HTTP) + Basato su eventi (Service Bus)

### Fase 4: Aggiungi l'autenticazione utente

**Implementa il User Service**:

1. Crea `src/user-service/` (Go/Node.js)
2. Aggiungi Azure AD B2C o autenticazione JWT personalizzata
3. L'API Gateway convalida i token
4. I servizi verificano i permessi utente

### Fase 5: Preparazione alla produzione

**Aggiungi questi componenti**:
- Azure Front Door (bilanciamento del carico globale)
- Azure Key Vault (gestione segreti)
- Azure Monitor Workbooks (dashboard personalizzate)
- Pipeline CI/CD (GitHub Actions)
- Distribuzioni blue-green
- Identità gestite per tutti i servizi

**Costo dell'architettura di produzione completa**: ~$300-1,400/mese

---

## Per saperne di più

### Documentazione correlata
- [Documentazione Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guida all'architettura a microservizi](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights per il tracciamento distribuito](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Prossimi passi in questo corso
- ← Precedente: [API Flask semplice](../../../../../examples/container-app/simple-flask-api) - Esempio per principianti con un singolo container
- → Successivo: [Guida all'integrazione AI](../../../../../examples/docs/ai-foundry) - Aggiungi funzionalità AI
- 🏠 [Home del corso](../../README.md)

### Confronto: quando usare cosa

**App a contenitore singolo** (esempio API Flask semplice):
- ✅ Applicazioni semplici
- ✅ Architettura monolitica
- ✅ Rapida da distribuire
- ❌ Scalabilità limitata
- **Costo**: ~$15-50/mese

**Microservizi** (questo esempio):
- ✅ Applicazioni complesse
- ✅ Scalabilità indipendente per servizio
- ✅ Autonomia dei team (servizi diversi, team diversi)
- ❌ Più complesso da gestire
- **Costo**: ~$60-250/mese

**Kubernetes (AKS)**:
- ✅ Controllo e flessibilità massimi
- ✅ Portabilità multi-cloud
- ✅ Networking avanzato
- ❌ Richiede competenza su Kubernetes
- **Costo**: ~$150-500/mese minimo

**Raccomandazione**: Inizia con Container Apps (questo esempio), passa ad AKS solo se hai bisogno di funzionalità specifiche di Kubernetes.

---

## Domande frequenti

**Q: Why only 2 services instead of 5+?**  
A: Progressione didattica. Padroneggia i fondamenti (comunicazione tra servizi, monitoraggio, scaling) con un esempio semplice prima di aggiungere complessità. I pattern che impari qui si applicano ad architetture da 100 servizi.

**Q: Can I add more services myself?**  
A: Assolutamente! Segui la guida di espansione sopra. Ogni nuovo servizio segue lo stesso schema: crea la cartella src, crea il file Bicep, aggiorna azure.yaml, deploya.

**Q: Is this production-ready?**  
A: È una solida base. Per la produzione, aggiungi: identità gestite, Key Vault, database persistenti, pipeline CI/CD, avvisi di monitoraggio e strategia di backup.

**Q: Why not use Dapr or other service mesh?**  
A: Mantieni la soluzione semplice per l'apprendimento. Una volta che comprendi il networking nativo di Container Apps, puoi aggiungere Dapr per scenari avanzati.

**Q: How do I debug locally?**  
A: Esegui i servizi in locale con Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Can I use different programming languages?**  
A: Sì! Questo esempio mostra Node.js (gateway) + Python (product service). Puoi mescolare qualsiasi linguaggio che giri in container.

**Q: What if I don't have Azure credits?**  
A: Usa il livello gratuito di Azure (primi 30 giorni con account nuovi) o distribuisci per brevi periodi di test ed elimina immediatamente.

---

> **🎓 Sommario del percorso di apprendimento**: Hai imparato a distribuire un'architettura multi-servizio con scaling automatico, networking interno, monitoraggio centralizzato e pattern pronti per la produzione. Questa base ti prepara per sistemi distribuiti complessi e architetture a microservizi enterprise.

**📚 Navigazione del corso:**
- ← Precedente: [API Flask semplice](../../../../../examples/container-app/simple-flask-api)
- → Successivo: [Esempio di integrazione database](../../../../../examples/database-app)
- 🏠 [Home del corso](../../../README.md)
- 📖 [Best practices per Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Esclusione di responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica Co-op Translator (https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua madre deve essere considerato la fonte autorevole. Per informazioni critiche è consigliata una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->