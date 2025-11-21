<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-20T23:35:49+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "it"
}
-->
# Distribuire un Database Microsoft SQL e un'App Web con AZD

⏱️ **Tempo Stimato**: 20-30 minuti | 💰 **Costo Stimato**: ~15-25€/mese | ⭐ **Complessità**: Intermedia

Questo **esempio completo e funzionante** dimostra come utilizzare la [CLI per sviluppatori Azure (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) per distribuire un'applicazione web Python Flask con un database Microsoft SQL su Azure. Tutto il codice è incluso e testato—non sono richieste dipendenze esterne.

## Cosa Imparerai

Completando questo esempio, imparerai a:
- Distribuire un'applicazione multi-tier (app web + database) utilizzando l'infrastruttura come codice
- Configurare connessioni sicure al database senza codificare segreti
- Monitorare la salute dell'applicazione con Application Insights
- Gestire le risorse Azure in modo efficiente con la CLI AZD
- Seguire le migliori pratiche Azure per sicurezza, ottimizzazione dei costi e osservabilità

## Panoramica dello Scenario
- **App Web**: API REST Python Flask con connettività al database
- **Database**: Azure SQL Database con dati di esempio
- **Infrastruttura**: Provisioning tramite Bicep (template modulari e riutilizzabili)
- **Distribuzione**: Completamente automatizzata con comandi `azd`
- **Monitoraggio**: Application Insights per log e telemetria

## Prerequisiti

### Strumenti Necessari

Prima di iniziare, verifica di avere installato questi strumenti:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versione 2.50.0 o superiore)
   ```sh
   az --version
   # Output previsto: azure-cli 2.50.0 o superiore
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versione 1.0.0 o superiore)
   ```sh
   azd version
   # Output previsto: versione azd 1.0.0 o superiore
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (per lo sviluppo locale)
   ```sh
   python --version
   # Output previsto: Python 3.8 o superiore
   ```

4. **[Docker](https://www.docker.com/get-started)** (opzionale, per lo sviluppo containerizzato locale)
   ```sh
   docker --version
   # Output previsto: versione Docker 20.10 o superiore
   ```

### Requisiti Azure

- Un **abbonamento Azure** attivo ([crea un account gratuito](https://azure.microsoft.com/free/))
- Permessi per creare risorse nel tuo abbonamento
- Ruolo di **Proprietario** o **Collaboratore** sull'abbonamento o sul gruppo di risorse

### Conoscenze Prerequisite

Questo è un esempio di livello **intermedio**. Dovresti avere familiarità con:
- Operazioni di base da riga di comando
- Concetti fondamentali del cloud (risorse, gruppi di risorse)
- Nozioni di base su applicazioni web e database

**Nuovo su AZD?** Inizia con la [guida introduttiva](../../docs/getting-started/azd-basics.md).

## Architettura

Questo esempio distribuisce un'architettura a due livelli con un'applicazione web e un database SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Distribuzione delle Risorse:**
- **Gruppo di Risorse**: Contenitore per tutte le risorse
- **App Service Plan**: Hosting basato su Linux (tier B1 per efficienza dei costi)
- **App Web**: Runtime Python 3.11 con applicazione Flask
- **SQL Server**: Server di database gestito con TLS 1.2 minimo
- **SQL Database**: Tier Basic (2GB, adatto per sviluppo/test)
- **Application Insights**: Monitoraggio e logging
- **Log Analytics Workspace**: Archivio centralizzato dei log

**Analogia**: Pensa a questo come a un ristorante (app web) con un congelatore (database). I clienti ordinano dal menu (endpoint API), e la cucina (app Flask) recupera gli ingredienti (dati) dal congelatore. Il gestore del ristorante (Application Insights) tiene traccia di tutto ciò che accade.

## Struttura delle Cartelle

Tutti i file sono inclusi in questo esempio—non sono richieste dipendenze esterne:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Cosa Fa Ogni File:**
- **azure.yaml**: Indica ad AZD cosa distribuire e dove
- **infra/main.bicep**: Orchestration di tutte le risorse Azure
- **infra/resources/*.bicep**: Definizioni delle singole risorse (modulari per il riutilizzo)
- **src/web/app.py**: Applicazione Flask con logica del database
- **requirements.txt**: Dipendenze dei pacchetti Python
- **Dockerfile**: Istruzioni per la containerizzazione per la distribuzione

## Guida Rapida (Passo per Passo)

### Passo 1: Clona e Naviga

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Verifica del Successo**: Verifica di vedere `azure.yaml` e la cartella `infra/`:
```sh
ls
# Previsto: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticati con Azure

```sh
azd auth login
```

Questo apre il browser per l'autenticazione su Azure. Accedi con le tue credenziali Azure.

**✓ Verifica del Successo**: Dovresti vedere:
```
Logged in to Azure.
```

### Passo 3: Inizializza l'Ambiente

```sh
azd init
```

**Cosa succede**: AZD crea una configurazione locale per la tua distribuzione.

**Prompt che vedrai**:
- **Nome dell'ambiente**: Inserisci un nome breve (es. `dev`, `myapp`)
- **Abbonamento Azure**: Seleziona il tuo abbonamento dall'elenco
- **Posizione Azure**: Scegli una regione (es. `eastus`, `westeurope`)

**✓ Verifica del Successo**: Dovresti vedere:
```
SUCCESS: New project initialized!
```

### Passo 4: Provisioning delle Risorse Azure

```sh
azd provision
```

**Cosa succede**: AZD distribuisce tutta l'infrastruttura (richiede 5-8 minuti):
1. Crea il gruppo di risorse
2. Crea SQL Server e Database
3. Crea App Service Plan
4. Crea App Web
5. Crea Application Insights
6. Configura rete e sicurezza

**Ti verrà richiesto di inserire**:
- **Nome utente admin SQL**: Inserisci un nome utente (es. `sqladmin`)
- **Password admin SQL**: Inserisci una password sicura (salvala!)

**✓ Verifica del Successo**: Dovresti vedere:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 5-8 minuti

### Passo 5: Distribuisci l'Applicazione

```sh
azd deploy
```

**Cosa succede**: AZD costruisce e distribuisce la tua applicazione Flask:
1. Impacchetta l'applicazione Python
2. Costruisce il container Docker
3. Lo invia all'App Web di Azure
4. Inizializza il database con dati di esempio
5. Avvia l'applicazione

**✓ Verifica del Successo**: Dovresti vedere:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 3-5 minuti

### Passo 6: Apri l'Applicazione

```sh
azd browse
```

Questo apre la tua app web distribuita nel browser all'indirizzo `https://app-<unique-id>.azurewebsites.net`

**✓ Verifica del Successo**: Dovresti vedere un output JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Passo 7: Testa gli Endpoint API

**Controllo Salute** (verifica connessione al database):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Risposta Attesa**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Elenco Prodotti** (dati di esempio):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Risposta Attesa**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Ottieni un Singolo Prodotto**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Verifica del Successo**: Tutti gli endpoint restituiscono dati JSON senza errori.

---

**🎉 Congratulazioni!** Hai distribuito con successo un'applicazione web con un database su Azure utilizzando AZD.

## Approfondimento sulla Configurazione

### Variabili d'Ambiente

I segreti sono gestiti in modo sicuro tramite la configurazione di Azure App Service—**mai codificati nel codice sorgente**.

**Configurati Automaticamente da AZD**:
- `SQL_CONNECTION_STRING`: Connessione al database con credenziali criptate
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint di telemetria per il monitoraggio
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Abilita l'installazione automatica delle dipendenze

**Dove Sono Archiviati i Segreti**:
1. Durante `azd provision`, fornisci le credenziali SQL tramite prompt sicuri
2. AZD le archivia nel file `.azure/<env-name>/.env` locale (ignorato da Git)
3. AZD le inietta nella configurazione di Azure App Service (crittografate a riposo)
4. L'applicazione le legge tramite `os.getenv()` a runtime

### Sviluppo Locale

Per i test locali, crea un file `.env` dal campione:

```sh
cp .env.sample .env
# Modifica .env con la connessione al database locale
```

**Flusso di Lavoro per lo Sviluppo Locale**:
```sh
# Installa le dipendenze
cd src/web
pip install -r requirements.txt

# Imposta le variabili d'ambiente
export SQL_CONNECTION_STRING="your-local-connection-string"

# Esegui l'applicazione
python app.py
```

**Test locale**:
```sh
curl http://localhost:8000/health
# Atteso: {"status": "sano", "database": "connesso"}
```

### Infrastruttura come Codice

Tutte le risorse Azure sono definite nei **template Bicep** (cartella `infra/`):

- **Design Modulare**: Ogni tipo di risorsa ha il proprio file per il riutilizzo
- **Parametrizzato**: Personalizza SKU, regioni, convenzioni di denominazione
- **Migliori Pratiche**: Segue gli standard di denominazione e sicurezza di Azure
- **Versionato**: Le modifiche all'infrastruttura sono tracciate in Git

**Esempio di Personalizzazione**:
Per cambiare il tier del database, modifica `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Migliori Pratiche di Sicurezza

Questo esempio segue le migliori pratiche di sicurezza di Azure:

### 1. **Nessun Segreto nel Codice Sorgente**
- ✅ Credenziali archiviate nella configurazione di Azure App Service (crittografate)
- ✅ File `.env` esclusi da Git tramite `.gitignore`
- ✅ Segreti passati tramite parametri sicuri durante il provisioning

### 2. **Connessioni Criptate**
- ✅ TLS 1.2 minimo per SQL Server
- ✅ HTTPS obbligatorio per l'App Web
- ✅ Connessioni al database tramite canali criptati

### 3. **Sicurezza della Rete**
- ✅ Firewall SQL Server configurato per consentire solo i servizi Azure
- ✅ Accesso alla rete pubblica limitato (può essere ulteriormente bloccato con Endpoint Privati)
- ✅ FTPS disabilitato sull'App Web

### 4. **Autenticazione e Autorizzazione**
- ⚠️ **Attuale**: Autenticazione SQL (nome utente/password)
- ✅ **Raccomandazione per la Produzione**: Usa Azure Managed Identity per l'autenticazione senza password

**Per Aggiornare a Managed Identity** (per la produzione):
1. Abilita l'identità gestita sull'App Web
2. Concedi permessi SQL all'identità
3. Aggiorna la stringa di connessione per utilizzare l'identità gestita
4. Rimuovi l'autenticazione basata su password

### 5. **Audit e Conformità**
- ✅ Application Insights registra tutte le richieste e gli errori
- ✅ Audit del database SQL abilitato (può essere configurato per la conformità)
- ✅ Tutte le risorse sono etichettate per la governance

**Checklist di Sicurezza Prima della Produzione**:
- [ ] Abilita Azure Defender per SQL
- [ ] Configura Endpoint Privati per il Database SQL
- [ ] Abilita il Web Application Firewall (WAF)
- [ ] Implementa Azure Key Vault per la rotazione dei segreti
- [ ] Configura l'autenticazione Azure AD
- [ ] Abilita il logging diagnostico per tutte le risorse

## Ottimizzazione dei Costi

**Costi Mensili Stimati** (a novembre 2025):

| Risorsa | SKU/Tier | Costo Stimato |
|---------|----------|---------------|
| App Service Plan | B1 (Basic) | ~13€/mese |
| SQL Database | Basic (2GB) | ~5€/mese |
| Application Insights | Pay-as-you-go | ~2€/mese (basso traffico) |
| **Totale** | | **~20€/mese** |

**💡 Consigli per Risparmiare**:

1. **Usa il Tier Gratuito per Imparare**:
   - App Service: Tier F1 (gratuito, ore limitate)
   - SQL Database: Usa Azure SQL Database serverless
   - Application Insights: 5GB/mese di ingestione gratuita

2. **Arresta le Risorse Quando Non in Uso**:
   ```sh
   # Ferma l'app web (il database continua a essere addebitato)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Riavvia quando necessario
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Elimina Tutto Dopo i Test**:
   ```sh
   azd down
   ```
   Questo rimuove TUTTE le risorse e interrompe i costi.

4. **SKU per Sviluppo vs. Produzione**:
   - **Sviluppo**: Tier Basic (usato in questo esempio)
   - **Produzione**: Tier Standard/Premium con ridondanza

**Monitoraggio dei Costi**:
- Visualizza i costi in [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Configura avvisi sui costi per evitare sorprese
- Etichetta tutte le risorse con `azd-env-name` per il tracciamento

**Alternativa Gratuita**:
Per scopi di apprendimento, puoi modificare `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Nota**: Il tier gratuito ha limitazioni (60 min/giorno CPU, no always-on).

## Monitoraggio e Osservabilità

### Integrazione con Application Insights

Questo esempio include **Application Insights** per un monitoraggio completo:

**Cosa Viene Monitorato**:
- ✅ Richieste HTTP (latenza, codici di stato, endpoint)
- ✅ Errori e eccezioni dell'applicazione
- ✅ Logging personalizzato dall'app Flask
- ✅ Salute della connessione al database
- ✅ Metriche di performance (CPU, memoria)

**Accedi a Application Insights**:
1. Apri [Azure Portal](https://portal.azure.com)
2. Vai al tuo gruppo di risorse (`rg-<env-name>`)
3. Clicca sulla risorsa Application Insights (`appi-<unique-id>`)

**Query Utili** (Application Insights → Logs):

**Visualizza Tutte le Richieste**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Trova Errori**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Controlla l'Endpoint di Salute**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Audit del Database SQL

**L'audit del database SQL è abilitato** per tracciare:
- Modelli di accesso al database
- Tentativi di accesso falliti
- Modifiche allo schema
- Accesso ai dati (per conformità)

**Accedi ai Log di Audit**:
1. Azure Portal → SQL Database → Auditing
2. Visualizza i log nel Log Analytics workspace

### Monitoraggio in Tempo Reale

**Visualizza Metriche Live**:
1. Application Insights → Live Metrics
2. Visualizza richieste, errori e performance in tempo reale

**Configura Avvisi**:
Crea avvisi per eventi critici:
- Errori HTTP 500 > 5 in 5 minuti
- Fallimenti di connessione al database
- Tempi di risposta elevati (>2 secondi)

**Esempio di Creazione di Avviso**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Risoluzione dei Problemi

### Problemi Comuni e Soluzioni

#### 1. `azd provision` fallisce con "Location not available"

**Sintomo**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Soluzione**:
Scegli una regione Azure diversa o registra il provider di risorse:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Connessione SQL fallisce durante il deployment

**Sintomo**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Soluzione**:
- Verifica che il firewall del server SQL consenta i servizi Azure (configurato automaticamente)
- Controlla che la password dell'amministratore SQL sia stata inserita correttamente durante `azd provision`
- Assicurati che il server SQL sia completamente provisionato (può richiedere 2-3 minuti)

**Verifica della Connessione**:
```sh
# Dal portale Azure, vai su SQL Database → Editor di query
# Prova a connetterti con le tue credenziali
```

#### 3. L'app Web mostra "Errore Applicazione"

**Sintomo**:
Il browser mostra una pagina di errore generica.

**Soluzione**:
Controlla i log dell'applicazione:
```sh
# Visualizza i log recenti
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Cause comuni**:
- Variabili d'ambiente mancanti (controlla App Service → Configurazione)
- Installazione dei pacchetti Python fallita (controlla i log di deployment)
- Errore di inizializzazione del database (controlla la connettività SQL)

#### 4. `azd deploy` fallisce con "Errore di Build"

**Sintomo**:
```
Error: Failed to build project
```

**Soluzione**:
- Assicurati che `requirements.txt` non contenga errori di sintassi
- Controlla che Python 3.11 sia specificato in `infra/resources/web-app.bicep`
- Verifica che il Dockerfile abbia l'immagine base corretta

**Debug locale**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Non autorizzato" durante l'esecuzione di comandi AZD

**Sintomo**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Soluzione**:
Autenticati nuovamente con Azure:
```sh
azd auth login
az login
```

Verifica di avere i permessi corretti (ruolo Contributor) sulla sottoscrizione.

#### 6. Costi elevati del database

**Sintomo**:
Fattura Azure inaspettata.

**Soluzione**:
- Controlla se hai dimenticato di eseguire `azd down` dopo i test
- Verifica che il database SQL utilizzi il livello Basic (non Premium)
- Esamina i costi in Azure Cost Management
- Configura avvisi sui costi

### Ottenere Aiuto

**Visualizza tutte le variabili d'ambiente AZD**:
```sh
azd env get-values
```

**Controlla lo stato del deployment**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Accedi ai log dell'applicazione**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Hai bisogno di ulteriore aiuto?**
- [Guida alla Risoluzione dei Problemi AZD](../../docs/troubleshooting/common-issues.md)
- [Risoluzione dei Problemi di Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Risoluzione dei Problemi di Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Esercizi Pratici

### Esercizio 1: Verifica del Deployment (Principiante)

**Obiettivo**: Confermare che tutte le risorse siano state distribuite e che l'applicazione funzioni.

**Passaggi**:
1. Elenca tutte le risorse nel tuo gruppo di risorse:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Atteso**: 6-7 risorse (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testa tutti gli endpoint API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Atteso**: Tutti restituiscono JSON valido senza errori

3. Controlla Application Insights:
   - Vai su Application Insights nel Portale Azure
   - Vai su "Live Metrics"
   - Aggiorna il browser sull'app web
   **Atteso**: Vedi richieste in tempo reale

**Criteri di Successo**: Tutte le 6-7 risorse esistono, tutti gli endpoint restituiscono dati, Live Metrics mostra attività.

---

### Esercizio 2: Aggiungi un Nuovo Endpoint API (Intermedio)

**Obiettivo**: Estendere l'applicazione Flask con un nuovo endpoint.

**Codice Iniziale**: Endpoint attuali in `src/web/app.py`

**Passaggi**:
1. Modifica `src/web/app.py` e aggiungi un nuovo endpoint dopo la funzione `get_product()`:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Distribuisci l'applicazione aggiornata:
   ```sh
   azd deploy
   ```

3. Testa il nuovo endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Atteso**: Restituisce prodotti che corrispondono a "laptop"

**Criteri di Successo**: Il nuovo endpoint funziona, restituisce risultati filtrati, appare nei log di Application Insights.

---

### Esercizio 3: Aggiungi Monitoraggio e Avvisi (Avanzato)

**Obiettivo**: Configurare il monitoraggio proattivo con avvisi.

**Passaggi**:
1. Crea un avviso per errori HTTP 500:
   ```sh
   # Ottieni l'ID della risorsa di Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Crea avviso
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Attiva l'avviso causando errori:
   ```sh
   # Richiedi un prodotto inesistente
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Controlla se l'avviso è stato attivato:
   - Portale Azure → Avvisi → Regole di Avviso
   - Controlla la tua email (se configurata)

**Criteri di Successo**: La regola di avviso è creata, si attiva sugli errori, le notifiche vengono ricevute.

---

### Esercizio 4: Modifiche allo Schema del Database (Avanzato)

**Obiettivo**: Aggiungere una nuova tabella e modificare l'applicazione per utilizzarla.

**Passaggi**:
1. Connettiti al database SQL tramite l'Editor di Query del Portale Azure

2. Crea una nuova tabella `categories`:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Aggiorna `src/web/app.py` per includere le informazioni sulle categorie nelle risposte

4. Distribuisci e testa

**Criteri di Successo**: La nuova tabella esiste, i prodotti mostrano le informazioni sulle categorie, l'applicazione funziona ancora.

---

### Esercizio 5: Implementa la Cache (Esperto)

**Obiettivo**: Aggiungere Azure Redis Cache per migliorare le prestazioni.

**Passaggi**:
1. Aggiungi Redis Cache a `infra/main.bicep`
2. Aggiorna `src/web/app.py` per memorizzare in cache le query sui prodotti
3. Misura il miglioramento delle prestazioni con Application Insights
4. Confronta i tempi di risposta prima/dopo la cache

**Criteri di Successo**: Redis è distribuito, la cache funziona, i tempi di risposta migliorano di >50%.

**Suggerimento**: Inizia con la [documentazione di Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Pulizia

Per evitare costi continui, elimina tutte le risorse al termine:

```sh
azd down
```

**Prompt di conferma**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Digita `y` per confermare.

**✓ Verifica del Successo**: 
- Tutte le risorse sono eliminate dal Portale Azure
- Nessun costo continuo
- La cartella locale `.azure/<env-name>` può essere eliminata

**Alternativa** (mantieni l'infrastruttura, elimina i dati):
```sh
# Elimina solo il gruppo di risorse (mantieni la configurazione AZD)
az group delete --name rg-<env-name> --yes
```
## Per Saperne di Più

### Documentazione Correlata
- [Documentazione di Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentazione di Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Documentazione di Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Documentazione di Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Riferimento al Linguaggio Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Prossimi Passi in Questo Corso
- **[Esempio di Container Apps](../../../../examples/container-app)**: Distribuisci microservizi con Azure Container Apps
- **[Guida all'Integrazione AI](../../../../docs/ai-foundry)**: Aggiungi funzionalità AI alla tua app
- **[Best Practice di Deployment](../../docs/deployment/deployment-guide.md)**: Modelli di distribuzione in produzione

### Argomenti Avanzati
- **Identità Gestita**: Rimuovi le password e utilizza l'autenticazione Azure AD
- **Endpoint Privati**: Proteggi le connessioni al database all'interno di una rete virtuale
- **Integrazione CI/CD**: Automatizza i deployment con GitHub Actions o Azure DevOps
- **Multi-Ambiente**: Configura ambienti di sviluppo, staging e produzione
- **Migrazioni del Database**: Usa Alembic o Entity Framework per la gestione delle versioni dello schema

### Confronto con Altri Approcci

**AZD vs. Modelli ARM**:
- ✅ AZD: Astrazione di livello superiore, comandi più semplici
- ⚠️ ARM: Più verboso, controllo più granulare

**AZD vs. Terraform**:
- ✅ AZD: Nativo di Azure, integrato con i servizi Azure
- ⚠️ Terraform: Supporto multi-cloud, ecosistema più ampio

**AZD vs. Portale Azure**:
- ✅ AZD: Ripetibile, controllato tramite versionamento, automatizzabile
- ⚠️ Portale: Clic manuali, difficile da riprodurre

**Pensa a AZD come**: Docker Compose per Azure—configurazione semplificata per distribuzioni complesse.

---

## Domande Frequenti

**D: Posso usare un linguaggio di programmazione diverso?**  
R: Sì! Sostituisci `src/web/` con Node.js, C#, Go o qualsiasi linguaggio. Aggiorna `azure.yaml` e Bicep di conseguenza.

**D: Come posso aggiungere più database?**  
R: Aggiungi un altro modulo SQL Database in `infra/main.bicep` o utilizza PostgreSQL/MySQL dai servizi di database Azure.

**D: Posso usare questo per la produzione?**  
R: Questo è un punto di partenza. Per la produzione, aggiungi: identità gestita, endpoint privati, ridondanza, strategia di backup, WAF e monitoraggio avanzato.

**D: E se volessi usare container invece del deployment del codice?**  
R: Consulta l'[Esempio di Container Apps](../../../../examples/container-app) che utilizza container Docker ovunque.

**D: Come mi connetto al database dalla mia macchina locale?**  
R: Aggiungi il tuo IP al firewall del server SQL:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**D: Posso usare un database esistente invece di crearne uno nuovo?**  
R: Sì, modifica `infra/main.bicep` per fare riferimento a un server SQL esistente e aggiorna i parametri della stringa di connessione.

---

> **Nota:** Questo esempio dimostra le best practice per distribuire un'app web con un database utilizzando AZD. Include codice funzionante, documentazione completa ed esercizi pratici per rafforzare l'apprendimento. Per distribuzioni in produzione, rivedi i requisiti di sicurezza, scalabilità, conformità e costi specifici per la tua organizzazione.

**📚 Navigazione del Corso:**
- ← Precedente: [Esempio di Container Apps](../../../../examples/container-app)
- → Successivo: [Guida all'Integrazione AI](../../../../docs/ai-foundry)
- 🏠 [Home del Corso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->