# Problemi Comuni e Soluzioni

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 7 - Risoluzione dei Problemi & Debugging
- **⬅️ Capitolo Precedente**: [Capitolo 6: Controlli Preliminari](../pre-deployment/preflight-checks.md)
- **➡️ Successivo**: [Guida al Debugging](debugging.md)
- **🚀 Capitolo Successivo**: [Capitolo 8: Modelli per Produzione & Enterprise](../microsoft-foundry/production-ai-practices.md)

## Introduzione

Questa guida completa alla risoluzione dei problemi copre le problematiche più frequenti riscontrate durante l'uso di Azure Developer CLI. Impara a diagnosticare, risolvere e affrontare problemi comuni relativi ad autenticazione, distribuzione, provisioning dell'infrastruttura e configurazione delle applicazioni. Ogni problema include sintomi dettagliati, cause principali e procedure passo-passo per la risoluzione.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare tecniche diagnostiche per problemi con Azure Developer CLI
- Comprendere i problemi comuni di autenticazione e permessi e le relative soluzioni
- Risolvere errori di distribuzione, provisioning dell'infrastruttura e configurazione
- Implementare strategie proattive di monitoraggio e debugging
- Applicare metodologie sistematiche per la risoluzione di problemi complessi
- Configurare correttamente logging e monitoraggio per prevenire problemi futuri

## Risultati di Apprendimento

Al termine, sarai in grado di:
- Diagnosticare problemi di Azure Developer CLI utilizzando strumenti diagnostici integrati
- Risolvere autonomamente problemi di autenticazione, sottoscrizione e permessi
- Affrontare efficacemente errori di distribuzione e provisioning dell'infrastruttura
- Debuggare problemi di configurazione delle applicazioni e problemi specifici dell'ambiente
- Implementare monitoraggio e avvisi per identificare proattivamente potenziali problemi
- Applicare le migliori pratiche per logging, debugging e flussi di lavoro per la risoluzione dei problemi

## Diagnostica Rapida

Prima di affrontare problemi specifici, esegui questi comandi per raccogliere informazioni diagnostiche:

```bash
# Controlla la versione e lo stato di azd
azd version
azd config list

# Verifica l'autenticazione di Azure
az account show
az account list

# Controlla l'ambiente corrente
azd env show
azd env get-values

# Abilita la registrazione di debug
export AZD_DEBUG=true
azd <command> --debug
```

## Problemi di Autenticazione

### Problema: "Impossibile ottenere il token di accesso"
**Sintomi:**
- `azd up` fallisce con errori di autenticazione
- I comandi restituiscono "non autorizzato" o "accesso negato"

**Soluzioni:**
```bash
# 1. Autenticarsi nuovamente con Azure CLI
az login
az account show

# 2. Cancellare le credenziali memorizzate nella cache
az account clear
az login

# 3. Utilizzare il flusso del codice dispositivo (per sistemi senza interfaccia grafica)
az login --use-device-code

# 4. Impostare un abbonamento esplicito
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Privilegi insufficienti" durante la distribuzione
**Sintomi:**
- La distribuzione fallisce con errori di permessi
- Impossibile creare alcune risorse Azure

**Soluzioni:**
```bash
# 1. Controlla le assegnazioni di ruolo di Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Assicurati di avere i ruoli richiesti
# - Collaboratore (per la creazione delle risorse)
# - Amministratore accesso utente (per le assegnazioni di ruolo)

# 3. Contatta l'amministratore di Azure per le autorizzazioni appropriate
```

### Problema: Problemi di autenticazione multi-tenant
**Soluzioni:**
```bash
# 1. Accedi con un tenant specifico
az login --tenant "your-tenant-id"

# 2. Imposta il tenant nella configurazione
azd config set auth.tenantId "your-tenant-id"

# 3. Cancella la cache del tenant se si cambiano tenant
az account clear
```

## 🏗️ Errori di Provisioning dell'Infrastruttura

### Problema: Conflitti nei nomi delle risorse
**Sintomi:**
- Errori "Il nome della risorsa esiste già"
- La distribuzione fallisce durante la creazione delle risorse

**Soluzioni:**
```bash
# 1. Usa nomi di risorse unici con token
# Nel tuo modello Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Cambia il nome dell'ambiente
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Pulisci le risorse esistenti
azd down --force --purge
```

### Problema: Posizione/Regione non disponibile
**Sintomi:**
- "La posizione 'xyz' non è disponibile per il tipo di risorsa"
- Alcuni SKU non disponibili nella regione selezionata

**Soluzioni:**
```bash
# 1. Controlla le posizioni disponibili per i tipi di risorse
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Usa le regioni comunemente disponibili
azd config set defaults.location eastus2
# o
azd env set AZURE_LOCATION eastus2

# 3. Controlla la disponibilità del servizio per regione
# Visita: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Errori di superamento delle quote
**Sintomi:**
- "Quota superata per il tipo di risorsa"
- "Numero massimo di risorse raggiunto"

**Soluzioni:**
```bash
# 1. Controlla l'utilizzo attuale della quota
az vm list-usage --location eastus2 -o table

# 2. Richiedi un aumento della quota tramite il portale Azure
# Vai a: Sottoscrizioni > Utilizzo + quote

# 3. Usa SKUs più piccoli per lo sviluppo
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Elimina le risorse inutilizzate
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Errori nei template Bicep
**Sintomi:**
- Fallimenti nella validazione del template
- Errori di sintassi nei file Bicep

**Soluzioni:**
```bash
# 1. Convalida la sintassi di Bicep
az bicep build --file infra/main.bicep

# 2. Usa il linter di Bicep
az bicep lint --file infra/main.bicep

# 3. Controlla la sintassi del file dei parametri
cat infra/main.parameters.json | jq '.'

# 4. Anteprima delle modifiche di distribuzione
azd provision --preview
```

## 🚀 Fallimenti di Distribuzione

### Problema: Fallimenti nella build
**Sintomi:**
- L'applicazione non riesce a essere costruita durante la distribuzione
- Errori nell'installazione dei pacchetti

**Soluzioni:**
```bash
# 1. Controlla i log di build
azd logs --service web
azd deploy --service web --debug

# 2. Testa la build localmente
cd src/web
npm install
npm run build

# 3. Controlla la compatibilità delle versioni di Node.js/Python
node --version  # Dovrebbe corrispondere alle impostazioni di azure.yaml
python --version

# 4. Cancella la cache di build
rm -rf node_modules package-lock.json
npm install

# 5. Controlla il Dockerfile se si utilizzano container
docker build -t test-image .
docker run --rm test-image
```

### Problema: Fallimenti nella distribuzione dei container
**Sintomi:**
- Le app container non si avviano
- Errori nel pull delle immagini

**Soluzioni:**
```bash
# 1. Testa la build di Docker localmente
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Controlla i log del container
azd logs --service api --follow

# 3. Verifica l'accesso al registro dei container
az acr login --name myregistry

# 4. Controlla la configurazione dell'app del container
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Fallimenti nella connessione al database
**Sintomi:**
- L'applicazione non riesce a connettersi al database
- Errori di timeout della connessione

**Soluzioni:**
```bash
# 1. Controlla le regole del firewall del database
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testa la connettività dall'applicazione
# Aggiungi temporaneamente alla tua app:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifica il formato della stringa di connessione
azd env get-values | grep DATABASE

# 4. Controlla lo stato del server del database
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemi di Configurazione

### Problema: Variabili d'ambiente non funzionanti
**Sintomi:**
- L'app non riesce a leggere i valori di configurazione
- Le variabili d'ambiente risultano vuote

**Soluzioni:**
```bash
# 1. Verificare che le variabili di ambiente siano impostate
azd env get-values
azd env get DATABASE_URL

# 2. Controllare i nomi delle variabili in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Riavviare l'applicazione
azd deploy --service web

# 4. Controllare la configurazione del servizio dell'app
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: Problemi con i certificati SSL/TLS
**Sintomi:**
- HTTPS non funziona
- Errori di validazione del certificato

**Soluzioni:**
```bash
# 1. Controlla lo stato del certificato SSL
az webapp config ssl list --resource-group myrg

# 2. Abilita solo HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Aggiungi un dominio personalizzato (se necessario)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problema: Problemi di configurazione CORS
**Sintomi:**
- Il frontend non riesce a chiamare l'API
- Richiesta cross-origin bloccata

**Soluzioni:**
```bash
# 1. Configurare CORS per App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Aggiornare l'API per gestire CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Verificare se in esecuzione sugli URL corretti
azd show
```

## 🌍 Problemi di Gestione dell'Ambiente

### Problema: Problemi nel cambio di ambiente
**Sintomi:**
- Viene utilizzato l'ambiente sbagliato
- La configurazione non cambia correttamente

**Soluzioni:**
```bash
# 1. Elenca tutti gli ambienti
azd env list

# 2. Seleziona esplicitamente l'ambiente
azd env select production

# 3. Verifica l'ambiente corrente
azd env show

# 4. Crea un nuovo ambiente se corrotto
azd env new production-new
azd env select production-new
```

### Problema: Corruzione dell'ambiente
**Sintomi:**
- L'ambiente mostra uno stato non valido
- Le risorse non corrispondono alla configurazione

**Soluzioni:**
```bash
# 1. Aggiorna lo stato dell'ambiente
azd env refresh

# 2. Reimposta la configurazione dell'ambiente
azd env new production-reset
# Copia le variabili d'ambiente richieste
azd env set DATABASE_URL "your-value"

# 3. Importa risorse esistenti (se possibile)
# Aggiorna manualmente .azure/production/config.json con gli ID delle risorse
```

## 🔍 Problemi di Prestazioni

### Problema: Tempi di distribuzione lenti
**Sintomi:**
- Le distribuzioni richiedono troppo tempo
- Timeout durante la distribuzione

**Soluzioni:**
```bash
# 1. Abilita il deployment parallelo
azd config set deploy.parallelism 5

# 2. Utilizza deployment incrementali
azd deploy --incremental

# 3. Ottimizza il processo di build
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Controlla le posizioni delle risorse (usa la stessa regione)
azd config set defaults.location eastus2
```

### Problema: Problemi di prestazioni dell'applicazione
**Sintomi:**
- Tempi di risposta lenti
- Alto utilizzo delle risorse

**Soluzioni:**
```bash
# 1. Aumenta le risorse
# Aggiorna SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Abilita il monitoraggio di Application Insights
azd monitor

# 3. Controlla i log dell'applicazione per i colli di bottiglia
azd logs --service api --follow

# 4. Implementa la cache
# Aggiungi la cache Redis alla tua infrastruttura
```

## 🛠️ Strumenti e Comandi per la Risoluzione dei Problemi

### Comandi di Debug
```bash
# Debugging completo
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Controlla informazioni di sistema
azd info

# Convalida configurazione
azd config validate

# Testa connettività
curl -v https://myapp.azurewebsites.net/health
```

### Analisi dei Log
```bash
# Log dell'applicazione
azd logs --service web --follow
azd logs --service api --since 1h

# Log delle risorse di Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Log dei container (per le Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigazione delle Risorse
```bash
# Elenca tutte le risorse
az resource list --resource-group myrg -o table

# Controlla lo stato delle risorse
az webapp show --name myapp --resource-group myrg --query state

# Diagnostica di rete
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Ottenere Ulteriore Aiuto

### Quando Escalare
- I problemi di autenticazione persistono dopo aver provato tutte le soluzioni
- Problemi di infrastruttura con i servizi Azure
- Problemi relativi a fatturazione o sottoscrizione
- Preoccupazioni o incidenti di sicurezza

### Canali di Supporto
```bash
# 1. Controlla lo stato del servizio Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Crea un ticket di supporto Azure
# Vai a: https://portal.azure.com -> Aiuto + supporto

# 3. Risorse della comunità
# - Stack Overflow: tag azure-developer-cli
# - Problemi su GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informazioni da Raccogliere
Prima di contattare il supporto, raccogli:
- Output di `azd version`
- Output di `azd info`
- Messaggi di errore (testo completo)
- Passaggi per riprodurre il problema
- Dettagli dell'ambiente (`azd env show`)
- Cronologia di quando il problema è iniziato

### Script per la Raccolta dei Log
```bash
#!/bin/bash
# raccogli-info-di-debug.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevenzione dei Problemi

### Checklist Pre-distribuzione
```bash
# 1. Convalida l'autenticazione
az account show

# 2. Controlla quote e limiti
az vm list-usage --location eastus2

# 3. Convalida i modelli
az bicep build --file infra/main.bicep

# 4. Testa prima localmente
npm run build
npm run test

# 5. Usa distribuzioni di prova
azd provision --preview
```

### Configurazione del Monitoraggio
```bash
# Abilita Application Insights
# Aggiungi a main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Configura avvisi
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Manutenzione Regolare
```bash
# Controlli sanitari settimanali
./scripts/health-check.sh

# Revisione dei costi mensile
az consumption usage list --billing-period-name 202401

# Revisione della sicurezza trimestrale
az security assessment list --resource-group myrg
```

## Risorse Correlate

- [Guida al Debugging](debugging.md) - Tecniche avanzate di debugging
- [Provisioning delle Risorse](../deployment/provisioning.md) - Risoluzione dei problemi di infrastruttura
- [Pianificazione della Capacità](../pre-deployment/capacity-planning.md) - Guida alla pianificazione delle risorse
- [Selezione degli SKU](../pre-deployment/sku-selection.md) - Raccomandazioni sui livelli di servizio

---

**Suggerimento**: Tieni questa guida tra i preferiti e consultala ogni volta che incontri problemi. La maggior parte dei problemi è già stata affrontata e ha soluzioni consolidate!

---

**Navigazione**
- **Lezione Precedente**: [Provisioning delle Risorse](../deployment/provisioning.md)
- **Lezione Successiva**: [Guida al Debugging](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->