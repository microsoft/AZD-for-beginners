# Architettura Microservices - Esempio di App Container

⏱️ **Tempo Stimato**: 25-35 minuti | 💰 **Costo Stimato**: ~$50-100/mese | ⭐ **Complessità**: Avanzata

Una **architettura microservices semplificata ma funzionale** distribuita su Azure Container Apps utilizzando AZD CLI. Questo esempio dimostra la comunicazione tra servizi, l'orchestrazione dei container e il monitoraggio con una configurazione pratica a 2 servizi.

> **📚 Approccio di Apprendimento**: Questo esempio parte da un'architettura minima a 2 servizi (API Gateway + Backend Service) che puoi effettivamente distribuire e da cui imparare. Dopo aver padroneggiato questa base, forniamo indicazioni per espandere verso un ecosistema completo di microservices.

## Cosa Imparerai

Completando questo esempio, imparerai a:
- Distribuire più container su Azure Container Apps
- Implementare la comunicazione tra servizi con rete interna
- Configurare la scalabilità basata sull'ambiente e i controlli di integrità
- Monitorare applicazioni distribuite con Application Insights
- Comprendere i modelli di distribuzione dei microservices e le migliori pratiche
- Espandere progressivamente da architetture semplici a complesse

## Architettura

### Fase 1: Cosa Stiamo Costruendo (Incluso in Questo Esempio)

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

**Perché Iniziare Semplice?**
- ✅ Distribuisci e comprendi rapidamente (25-35 minuti)
- ✅ Impara i modelli principali dei microservices senza complessità
- ✅ Codice funzionante che puoi modificare e sperimentare
- ✅ Costi più bassi per l'apprendimento (~$50-100/mese contro $300-1400/mese)
- ✅ Acquisisci fiducia prima di aggiungere database e code di messaggi

**Analogia**: Pensalo come imparare a guidare. Inizi in un parcheggio vuoto (2 servizi), padroneggi le basi, poi progredisci al traffico cittadino (5+ servizi con database).

### Fase 2: Espansione Futura (Architettura di Riferimento)

Una volta padroneggiata l'architettura a 2 servizi, puoi espandere a:

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

Consulta la sezione "Guida all'Espansione" alla fine per istruzioni passo-passo.

## Funzionalità Incluse

✅ **Scoperta dei Servizi**: Scoperta automatica basata su DNS tra container  
✅ **Bilanciamento del Carico**: Bilanciamento del carico integrato tra repliche  
✅ **Auto-scalabilità**: Scalabilità indipendente per servizio basata su richieste HTTP  
✅ **Monitoraggio della Salute**: Prove di liveness e readiness per entrambi i servizi  
✅ **Logging Distribuito**: Logging centralizzato con Application Insights  
✅ **Rete Interna**: Comunicazione sicura tra servizi  
✅ **Orchestrazione dei Container**: Distribuzione e scalabilità automatica  
✅ **Aggiornamenti Senza Interruzioni**: Aggiornamenti rolling con gestione delle revisioni  

## Prerequisiti

### Strumenti Necessari

Prima di iniziare, verifica di avere installato questi strumenti:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versione 1.0.0 o superiore)  
   ```bash
   azd version
   # Output previsto: versione azd 1.0.0 o superiore
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versione 2.50.0 o superiore)  
   ```bash
   az --version
   # Output previsto: azure-cli 2.50.0 o superiore
   ```

3. **[Docker](https://www.docker.com/get-started)** (per sviluppo/test locale - opzionale)  
   ```bash
   docker --version
   # Output previsto: versione Docker 20.10 o superiore
   ```

### Requisiti Azure

- Un **abbonamento Azure** attivo ([crea un account gratuito](https://azure.microsoft.com/free/))
- Permessi per creare risorse nel tuo abbonamento
- Ruolo **Contributor** sull'abbonamento o sul gruppo di risorse

### Conoscenze Necessarie

Questo è un esempio di livello **avanzato**. Dovresti avere:
- Completato l'[esempio Simple Flask API](../../../../../examples/container-app/simple-flask-api) 
- Comprensione di base dell'architettura microservices
- Familiarità con REST API e HTTP
- Comprensione dei concetti di container

**Nuovo alle Container Apps?** Inizia con l'[esempio Simple Flask API](../../../../../examples/container-app/simple-flask-api) per imparare le basi.

## Avvio Rapido (Passo-Passo)

### Passo 1: Clona e Naviga

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Verifica Successo**: Controlla che sia visibile `azure.yaml`:
```bash
ls
# Previsto: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticati con Azure

```bash
azd auth login
```

Questo apre il browser per l'autenticazione su Azure. Accedi con le tue credenziali Azure.

**✓ Verifica Successo**: Dovresti vedere:
```
Logged in to Azure.
```

### Passo 3: Inizializza l'Ambiente

```bash
azd init
```

**Prompt che vedrai**:
- **Nome dell'ambiente**: Inserisci un nome breve (es. `microservices-dev`)
- **Abbonamento Azure**: Seleziona il tuo abbonamento
- **Posizione Azure**: Scegli una regione (es. `eastus`, `westeurope`)

**✓ Verifica Successo**: Dovresti vedere:
```
SUCCESS: New project initialized!
```

### Passo 4: Distribuisci Infrastruttura e Servizi

```bash
azd up
```

**Cosa succede** (richiede 8-12 minuti):
1. Crea l'ambiente Container Apps
2. Crea Application Insights per il monitoraggio
3. Costruisce il container API Gateway (Node.js)
4. Costruisce il container Product Service (Python)
5. Distribuisce entrambi i container su Azure
6. Configura rete e controlli di integrità
7. Configura monitoraggio e logging

**✓ Verifica Successo**: Dovresti vedere:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tempo**: 8-12 minuti

### Passo 5: Testa la Distribuzione

```bash
# Ottieni l'endpoint del gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testa la salute dell'API Gateway
curl $GATEWAY_URL/health

# Output previsto:
# {"status":"sano","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testa il servizio prodotti tramite il gateway**:
```bash
# Elenca prodotti
curl $GATEWAY_URL/api/products

# Output previsto:
# [
#   {"id":1,"nome":"Laptop","prezzo":999.99,"stock":50},
#   {"id":2,"nome":"Mouse","prezzo":29.99,"stock":200},
#   {"id":3,"nome":"Tastiera","prezzo":79.99,"stock":150}
# ]
```

**✓ Verifica Successo**: Entrambi gli endpoint restituiscono dati JSON senza errori.

---

**🎉 Congratulazioni!** Hai distribuito un'architettura microservices su Azure!

## Struttura del Progetto

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

**Cosa Fa Ogni Componente:**

**Infrastruttura (infra/)**:
- `main.bicep`: Orchestra tutte le risorse Azure e le loro dipendenze
- `core/container-apps-environment.bicep`: Crea l'ambiente Container Apps e Azure Container Registry
- `core/monitor.bicep`: Configura Application Insights per il logging distribuito
- `app/*.bicep`: Definizioni individuali dei container app con scalabilità e controlli di integrità

**API Gateway (src/api-gateway/)**:
- Servizio pubblico che instrada le richieste ai servizi backend
- Implementa logging, gestione degli errori e inoltro delle richieste
- Dimostra la comunicazione HTTP tra servizi

**Product Service (src/product-service/)**:
- Servizio interno con catalogo prodotti (in memoria per semplicità)
- REST API con controlli di integrità
- Esempio di pattern di microservice backend

## Panoramica dei Servizi

### API Gateway (Node.js/Express)

**Porta**: 8080  
**Accesso**: Pubblico (ingresso esterno)  
**Scopo**: Instrada le richieste in arrivo ai servizi backend appropriati  

**Endpoint**:
- `GET /` - Informazioni sul servizio
- `GET /health` - Endpoint di controllo della salute
- `GET /api/products` - Inoltra al servizio prodotti (elenca tutti)
- `GET /api/products/:id` - Inoltra al servizio prodotti (ottieni per ID)

**Caratteristiche Principali**:
- Instradamento delle richieste con axios
- Logging centralizzato
- Gestione degli errori e dei timeout
- Scoperta dei servizi tramite variabili d'ambiente
- Integrazione con Application Insights

**Evidenza del Codice** (`src/api-gateway/app.js`):
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
**Scopo**: Gestisce il catalogo prodotti con dati in memoria  

**Endpoint**:
- `GET /` - Informazioni sul servizio
- `GET /health` - Endpoint di controllo della salute
- `GET /products` - Elenca tutti i prodotti
- `GET /products/<id>` - Ottieni prodotto per ID

**Caratteristiche Principali**:
- API RESTful con Flask
- Archivio prodotti in memoria (semplice, senza database)
- Monitoraggio della salute con prove
- Logging strutturato
- Integrazione con Application Insights

**Modello Dati**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Perché Solo Interno?**
Il servizio prodotti non è esposto pubblicamente. Tutte le richieste devono passare attraverso l'API Gateway, che fornisce:
- Sicurezza: Punto di accesso controllato
- Flessibilità: Può cambiare il backend senza influenzare i client
- Monitoraggio: Logging centralizzato delle richieste

## Comprendere la Comunicazione tra Servizi

### Come i Servizi Comunicano tra Loro

In questo esempio, l'API Gateway comunica con il Product Service utilizzando **chiamate HTTP interne**:

```javascript
// Gateway API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Effettuare una richiesta HTTP interna
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Punti Chiave**:

1. **Scoperta Basata su DNS**: Container Apps fornisce automaticamente DNS per i servizi interni
   - FQDN del Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Semplificato come: `http://product-service` (Container Apps lo risolve)

2. **Nessuna Esposizione Pubblica**: Il Product Service ha `external: false` in Bicep
   - Accessibile solo all'interno dell'ambiente Container Apps
   - Non raggiungibile da internet

3. **Variabili d'Ambiente**: Gli URL dei servizi vengono iniettati al momento della distribuzione
   - Bicep passa il FQDN interno al gateway
   - Nessun URL hardcoded nel codice dell'applicazione

**Analogia**: Pensalo come stanze di ufficio. L'API Gateway è la reception (pubblica), e il Product Service è una stanza d'ufficio (solo interna). I visitatori devono passare attraverso la reception per raggiungere qualsiasi stanza.

## Opzioni di Distribuzione

### Distribuzione Completa (Consigliata)

```bash
# Distribuire l'infrastruttura e entrambi i servizi
azd up
```

Questa distribuisce:
1. Ambiente Container Apps
2. Application Insights
3. Container Registry
4. Container API Gateway
5. Container Product Service

**Tempo**: 8-12 minuti

### Distribuisci Servizio Individuale

```bash
# Distribuisci solo un servizio (dopo il primo azd up)
azd deploy api-gateway

# Oppure distribuisci il servizio prodotto
azd deploy product-service
```

**Caso d'Uso**: Quando hai aggiornato il codice in un servizio e vuoi ridistribuire solo quel servizio.

### Aggiorna Configurazione

```bash
# Cambia i parametri di scalabilità
azd env set GATEWAY_MAX_REPLICAS 30

# Ridistribuisci con la nuova configurazione
azd up
```

## Configurazione

### Configurazione della Scalabilità

Entrambi i servizi sono configurati con auto-scalabilità basata su HTTP nei loro file Bicep:

**API Gateway**:
- Min repliche: 2 (sempre almeno 2 per disponibilità)
- Max repliche: 20
- Trigger di scalabilità: 50 richieste concorrenti per replica

**Product Service**:
- Min repliche: 1 (può scalare a zero se necessario)
- Max repliche: 10
- Trigger di scalabilità: 100 richieste concorrenti per replica

**Personalizza Scalabilità** (in `infra/app/*.bicep`):
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

### Allocazione delle Risorse

**API Gateway**:
- CPU: 1.0 vCPU
- Memoria: 2 GiB
- Motivo: Gestisce tutto il traffico esterno

**Product Service**:
- CPU: 0.5 vCPU
- Memoria: 1 GiB
- Motivo: Operazioni leggere in memoria

### Controlli di Integrità

Entrambi i servizi includono prove di liveness e readiness:

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

**Cosa Significa**:
- **Liveness**: Se il controllo di salute fallisce, Container Apps riavvia il container
- **Readiness**: Se non pronto, Container Apps smette di instradare traffico a quella replica

## Monitoraggio e Osservabilità

### Visualizza i Log dei Servizi

```bash
# Trasmetti i log da API Gateway
azd logs api-gateway --follow

# Visualizza i log recenti del servizio prodotti
azd logs product-service --tail 100

# Visualizza tutti i log di entrambi i servizi
azd logs --follow
```

**Output Atteso**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Query Application Insights

Accedi a Application Insights nel portale Azure, poi esegui queste query:

**Trova Richieste Lente**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Traccia Chiamate tra Servizi**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Tasso di Errori per Servizio**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volume di Richieste nel Tempo**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Accedi al Dashboard di Monitoraggio

```bash
# Ottieni i dettagli di Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Apri il monitoraggio del portale Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metriche Live

1. Vai su Application Insights nel portale Azure
2. Clicca su "Metriche Live"
3. Visualizza richieste, errori e prestazioni in tempo reale
4. Testa eseguendo: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Esercizi Pratici

[Nota: Consulta gli esercizi completi sopra nella sezione "Esercizi Pratici" per esercizi dettagliati passo-passo, inclusi verifica della distribuzione, modifica dei dati, test di auto-scalabilità, gestione degli errori e aggiunta di un terzo servizio.]

## Analisi dei Costi

### Costi Mensili Stimati (Per Questo Esempio a 2 Servizi)

| Risorsa | Configurazione | Costo Stimato |
|----------|--------------|----------------|
| API Gateway | 2-20 repliche, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 repliche, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Tier base | $5 |
| Application Insights | 1-2 GB/mese | $5-10 |
| Log Analytics | 1 GB/mese | $3 |
| **Totale** | | **$58-243/mese** |

**Suddivisione dei Costi per Utilizzo**:
- **Traffico leggero** (test/apprendimento): ~$60/mese
- **Traffico moderato** (piccola produzione): ~$120/mese
- **Traffico elevato** (periodi intensi): ~$240/mese

### Consigli per l'Ottimizzazione dei Costi

1. **Scala a Zero per Sviluppo**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Usa il Piano di Consumo per Cosmos DB** (quando lo aggiungi):
   - Paga solo per ciò che usi
   - Nessun costo minimo

3. **Imposta il Campionamento di Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Campiona il 50% delle richieste
   ```

4. **Pulisci Quando Non Necessario**:
   ```bash
   azd down
   ```

### Opzioni di Livello Gratuito
Per apprendere/testare, considera:
- Usa i crediti gratuiti di Azure (primi 30 giorni)
- Mantieni il numero minimo di repliche
- Elimina dopo il test (nessun costo continuo)

---

## Pulizia

Per evitare costi continui, elimina tutte le risorse:

```bash
azd down --force --purge
```

**Prompt di Conferma**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Digita `y` per confermare.

**Cosa viene eliminato**:
- Ambiente Container Apps
- Entrambe le Container Apps (gateway e servizio prodotti)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verifica Pulizia**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Dovrebbe restituire vuoto.

---

## Guida all'Espansione: Da 2 a 5+ Servizi

Una volta padroneggiata questa architettura a 2 servizi, ecco come espandere:

### Fase 1: Aggiungi Persistenza del Database (Prossimo Passo)

**Aggiungi Cosmos DB per il Servizio Prodotti**:

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

2. Aggiorna il servizio prodotti per utilizzare Cosmos DB invece dei dati in memoria

3. Costo aggiuntivo stimato: ~25$/mese (serverless)

### Fase 2: Aggiungi un Terzo Servizio (Gestione Ordini)

**Crea il Servizio Ordini**:

1. Nuova cartella: `src/order-service/` (Python/Node.js/C#)
2. Nuovo Bicep: `infra/app/order-service.bicep`
3. Aggiorna l'API Gateway per instradare `/api/orders`
4. Aggiungi Azure SQL Database per la persistenza degli ordini

**L'architettura diventa**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Aggiungi Comunicazione Asincrona (Service Bus)

**Implementa Architettura Event-Driven**:

1. Aggiungi Azure Service Bus: `infra/core/servicebus.bicep`
2. Il Servizio Prodotti pubblica eventi "ProductCreated"
3. Il Servizio Ordini si sottoscrive agli eventi dei prodotti
4. Aggiungi un Servizio Notifiche per elaborare gli eventi

**Modello**: Richiesta/Risposta (HTTP) + Event-Driven (Service Bus)

### Fase 4: Aggiungi Autenticazione Utente

**Implementa il Servizio Utenti**:

1. Crea `src/user-service/` (Go/Node.js)
2. Aggiungi Azure AD B2C o autenticazione JWT personalizzata
3. L'API Gateway valida i token
4. I servizi verificano i permessi degli utenti

### Fase 5: Prontezza per la Produzione

**Aggiungi Questi Componenti**:
- Azure Front Door (bilanciamento del carico globale)
- Azure Key Vault (gestione dei segreti)
- Azure Monitor Workbooks (dashboard personalizzate)
- Pipeline CI/CD (GitHub Actions)
- Deployment Blue-Green
- Managed Identity per tutti i servizi

**Costo Architettura Completa in Produzione**: ~300-1.400$/mese

---

## Per Saperne di Più

### Documentazione Correlata
- [Documentazione Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guida all'Architettura Microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights per il Tracciamento Distribuito](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Prossimi Passi in Questo Corso
- ← Precedente: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Esempio base con un singolo container
- → Successivo: [Guida all'Integrazione AI](../../../../../examples/docs/ai-foundry) - Aggiungi funzionalità AI
- 🏠 [Home del Corso](../../README.md)

### Confronto: Quando Usare Cosa

**Single Container App** (Esempio Simple Flask API):
- ✅ Applicazioni semplici
- ✅ Architettura monolitica
- ✅ Rapido da distribuire
- ❌ Scalabilità limitata
- **Costo**: ~15-50$/mese

**Microservices** (Questo esempio):
- ✅ Applicazioni complesse
- ✅ Scalabilità indipendente per servizio
- ✅ Autonomia del team (servizi diversi, team diversi)
- ❌ Più complesso da gestire
- **Costo**: ~60-250$/mese

**Kubernetes (AKS)**:
- ✅ Massimo controllo e flessibilità
- ✅ Portabilità multi-cloud
- ✅ Networking avanzato
- ❌ Richiede competenze Kubernetes
- **Costo**: ~150-500$/mese minimo

**Raccomandazione**: Inizia con Container Apps (questo esempio), passa ad AKS solo se hai bisogno di funzionalità specifiche di Kubernetes.

---

## Domande Frequenti

**D: Perché solo 2 servizi invece di 5+?**  
R: Progressione educativa. Impara le basi (comunicazione tra servizi, monitoraggio, scalabilità) con un esempio semplice prima di aggiungere complessità. I modelli che impari qui si applicano anche ad architetture con 100 servizi.

**D: Posso aggiungere più servizi da solo?**  
R: Assolutamente! Segui la guida all'espansione sopra. Ogni nuovo servizio segue lo stesso schema: crea cartella src, crea file Bicep, aggiorna azure.yaml, distribuisci.

**D: È pronto per la produzione?**  
R: È una solida base. Per la produzione, aggiungi: managed identity, Key Vault, database persistenti, pipeline CI/CD, avvisi di monitoraggio e strategia di backup.

**D: Perché non usare Dapr o altri service mesh?**  
R: Mantienilo semplice per l'apprendimento. Una volta compresa la rete nativa di Container Apps, puoi aggiungere Dapr per scenari avanzati.

**D: Come faccio a fare debug in locale?**  
R: Esegui i servizi in locale con Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**D: Posso usare linguaggi di programmazione diversi?**  
R: Sì! Questo esempio mostra Node.js (gateway) + Python (servizio prodotti). Puoi mescolare qualsiasi linguaggio che funzioni nei container.

**D: Cosa fare se non ho crediti Azure?**  
R: Usa il livello gratuito di Azure (primi 30 giorni con nuovi account) o distribuisci per brevi periodi di test ed elimina immediatamente.

---

> **🎓 Riepilogo del Percorso di Apprendimento**: Hai imparato a distribuire un'architettura multi-servizio con scalabilità automatica, rete interna, monitoraggio centralizzato e modelli pronti per la produzione. Questa base ti prepara per sistemi distribuiti complessi e architetture microservices aziendali.

**📚 Navigazione del Corso:**
- ← Precedente: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Successivo: [Esempio di Integrazione Database](../../../../../examples/database-app)
- 🏠 [Home del Corso](../../README.md)
- 📖 [Best Practices per Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua madre dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->