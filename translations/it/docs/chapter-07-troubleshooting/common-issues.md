# Problemi comuni e soluzioni

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 7 - Risoluzione dei problemi e debugging
- **⬅️ Capitolo precedente**: [Capitolo 6: Controlli pre-distribuzione](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Successivo**: [Guida al debugging](debugging.md)
- **🚀 Capitolo successivo**: [Capitolo 8: Modelli di produzione e aziendali](../chapter-08-production/production-ai-practices.md)

## Introduzione

Questa guida completa alla risoluzione dei problemi copre i problemi più frequentemente incontrati durante l'uso di Azure Developer CLI. Impara a diagnosticare, risolvere e correggere problemi comuni relativi ad autenticazione, distribuzione, provisioning dell'infrastruttura e configurazione delle applicazioni. Ogni problema include sintomi dettagliati, cause principali e procedure di risoluzione passo-passo.

## Obiettivi di apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare tecniche diagnostiche per i problemi di Azure Developer CLI
- Comprendere i problemi comuni di autenticazione e permessi e le loro soluzioni
- Risolvere fallimenti di distribuzione, errori di provisioning dell'infrastruttura e problemi di configurazione
- Implementare strategie proattive di monitoraggio e debugging
- Applicare metodologie sistematiche di troubleshooting per problemi complessi
- Configurare logging e monitoraggio adeguati per prevenire problemi futuri

## Risultati di apprendimento

Al termine, sarai in grado di:
- Diagnosticare i problemi di Azure Developer CLI utilizzando strumenti diagnostici integrati
- Risolvere in modo autonomo problemi di autenticazione, abbonamento e permessi
- Risolvere efficacemente i fallimenti di distribuzione e gli errori di provisioning dell'infrastruttura
- Eseguire il debug di problemi di configurazione dell'applicazione e problemi specifici dell'ambiente
- Implementare monitoraggio e allerta per identificare proattivamente potenziali problemi
- Applicare le best practice per logging, debugging e flussi di lavoro di risoluzione dei problemi

## Diagnostica rapida

Prima di entrare nei problemi specifici, esegui questi comandi per raccogliere informazioni diagnostiche:

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

# Abilita il logging di debug
export AZD_DEBUG=true
azd <command> --debug
```

## Problemi di autenticazione

### Problema: "Failed to get access token"
**Sintomi:**
- `azd up` non riesce a causa di errori di autenticazione
- I comandi restituiscono "unauthorized" o "access denied"

**Soluzioni:**
```bash
# 1. Riautenticarsi con Azure CLI
az login
az account show

# 2. Cancella le credenziali memorizzate nella cache
az account clear
az login

# 3. Usa il flusso di codice dispositivo (per sistemi headless)
az login --use-device-code

# 4. Imposta una sottoscrizione esplicita
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problema: "Insufficient privileges" durante la distribuzione
**Sintomi:**
- La distribuzione fallisce con errori di autorizzazione
- Impossibile creare alcune risorse di Azure

**Soluzioni:**
```bash
# 1. Verifica le assegnazioni di ruolo in Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Assicurati di avere i ruoli richiesti
# - Contributor (per la creazione delle risorse)
# - User Access Administrator (per le assegnazioni di ruolo)

# 3. Contatta il tuo amministratore Azure per le autorizzazioni appropriate
```

### Problema: problemi di autenticazione multi-tenant
**Soluzioni:**
```bash
# 1. Accedi con un tenant specifico
az login --tenant "your-tenant-id"

# 2. Imposta il tenant nella configurazione
azd config set auth.tenantId "your-tenant-id"

# 3. Svuota la cache del tenant se si passa a un altro tenant
az account clear
```

## 🏗️ Errori di provisioning dell'infrastruttura

### Problema: Conflitti di nome delle risorse
**Sintomi:**
- Errori "The resource name already exists"
- La distribuzione fallisce durante la creazione delle risorse

**Soluzioni:**
```bash
# 1. Usa nomi di risorse unici con token
# Nel tuo template Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Modifica il nome dell'ambiente
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Ripulisci le risorse esistenti
azd down --force --purge
```

### Problema: Posizione/Regione non disponibile
**Sintomi:**
- "The location 'xyz' is not available for resource type"
- Alcuni SKUs non sono disponibili nella regione selezionata

**Soluzioni:**
```bash
# 1. Controlla le località disponibili per i tipi di risorse
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Usa le regioni comunemente disponibili
azd config set defaults.location eastus2
# o
azd env set AZURE_LOCATION eastus2

# 3. Verifica la disponibilità dei servizi per regione
# Visita: https://azure.microsoft.com/global-infrastructure/services/
```

### Problema: Errori di quota superata
**Sintomi:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Soluzioni:**
```bash
# 1. Verificare l'utilizzo attuale delle quote
az vm list-usage --location eastus2 -o table

# 2. Richiedere un aumento delle quote tramite il portale di Azure
# Vai a: Sottoscrizioni > Utilizzo + quote

# 3. Usare SKU più piccoli per lo sviluppo
# Nel file main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Rimuovere le risorse non utilizzate
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problema: Errori nei template Bicep
**Sintomi:**
- Fallimenti nella validazione del template
- Errori di sintassi nei file Bicep

**Soluzioni:**
```bash
# 1. Validare la sintassi di Bicep
az bicep build --file infra/main.bicep

# 2. Usare il linter di Bicep
az bicep lint --file infra/main.bicep

# 3. Controllare la sintassi del file di parametri
cat infra/main.parameters.json | jq '.'

# 4. Visualizzare in anteprima le modifiche alla distribuzione
azd provision --preview
```

## 🚀 Errori di distribuzione

### Problema: Errori di build
**Sintomi:**
- L'applicazione non si compila durante la distribuzione
- Errori nell'installazione dei pacchetti

**Soluzioni:**
```bash
# 1. Verifica l'output della build con il flag di debug
azd deploy --service web --debug

# 2. Visualizza lo stato del servizio distribuito
azd show

# 3. Testa la build localmente
cd src/web
npm install
npm run build

# 3. Controlla la compatibilità delle versioni di Node.js/Python
node --version  # Dovrebbe corrispondere alle impostazioni di azure.yaml
python --version

# 4. Pulisci la cache della build
rm -rf node_modules package-lock.json
npm install

# 5. Controlla il Dockerfile se usi i container
docker build -t test-image .
docker run --rm test-image
```

### Problema: Errori nella distribuzione dei container
**Sintomi:**
- Le app container non riescono ad avviarsi
- Errori nel pull delle immagini

**Soluzioni:**
```bash
# 1. Testare la build Docker localmente
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Verificare i log dei container tramite Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitorare l'applicazione tramite azd
azd monitor --logs

# 3. Verificare l'accesso al registro dei container
az acr login --name myregistry

# 4. Controllare la configurazione dell'applicazione container
az containerapp show --name my-app --resource-group my-rg
```

### Problema: Errori di connessione al database
**Sintomi:**
- L'app non riesce a connettersi al database
- Errori di timeout della connessione

**Soluzioni:**
```bash
# 1. Controlla le regole del firewall del database
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Verifica la connettività dall'applicazione
# Aggiungi temporaneamente alla tua app:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifica il formato della stringa di connessione
azd env get-values | grep DATABASE

# 4. Controlla lo stato del server del database
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problemi di configurazione

### Problema: Variabili d'ambiente non funzionanti
**Sintomi:**
- L'app non riesce a leggere i valori di configurazione
- Le variabili d'ambiente risultano vuote

**Soluzioni:**
```bash
# 1. Verificare che le variabili d'ambiente siano impostate
azd env get-values
azd env get DATABASE_URL

# 2. Controllare i nomi delle variabili in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Riavviare l'applicazione
azd deploy --service web

# 4. Controllare la configurazione dell'App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problema: Problemi con certificati SSL/TLS
**Sintomi:**
- HTTPS non funziona
- Errori di validazione del certificato

**Soluzioni:**
```bash
# 1. Verificare lo stato del certificato SSL
az webapp config ssl list --resource-group myrg

# 2. Abilitare solo HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Aggiungere un dominio personalizzato (se necessario)
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

# 2. Aggiornare l'API per gestire il CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Verificare se viene eseguito sugli URL corretti
azd show
```

## 🌍 Problemi di gestione degli ambienti

### Problema: Problemi nel cambio di ambiente
**Sintomi:**
- Viene utilizzato l'ambiente sbagliato
- La configurazione non viene cambiata correttamente

**Soluzioni:**
```bash
# 1. Elencare tutti gli ambienti
azd env list

# 2. Selezionare esplicitamente l'ambiente
azd env select production

# 3. Verificare l'ambiente corrente
azd env show

# 4. Creare un nuovo ambiente se corrotto
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

# 3. Importa le risorse esistenti (se possibile)
# Aggiorna manualmente .azure/production/config.json con gli ID delle risorse
```

## 🔍 Problemi di prestazioni

### Problema: Tempi di distribuzione lenti
**Sintomi:**
- Le distribuzioni richiedono troppo tempo
- Timeout durante la distribuzione

**Soluzioni:**
```bash
# 1. Distribuisci servizi specifici per iterare più velocemente
azd deploy --service web
azd deploy --service api

# 2. Usa il deployment solo del codice quando l'infrastruttura non è stata modificata
azd deploy  # Più veloce di azd up

# 3. Ottimizza il processo di build
# Nel file package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Verifica le posizioni delle risorse (usa la stessa regione)
azd config set defaults.location eastus2
```

### Problema: Problemi di prestazioni dell'applicazione
**Sintomi:**
- Tempi di risposta lenti
- Elevato utilizzo delle risorse

**Soluzioni:**
```bash
# 1. Aumentare le risorse
# Aggiornare lo SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Abilitare il monitoraggio di Application Insights
azd monitor --overview

# 3. Controllare i log dell'applicazione in Azure
az webapp log tail --name myapp --resource-group myrg
# o per Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementare la cache
# Aggiungere la cache Redis alla tua infrastruttura
```

## 🛠️ Strumenti e comandi per la risoluzione dei problemi

### Comandi di debug
```bash
# Debugging completo
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Verifica la versione di azd
azd version

# Visualizza la configurazione corrente
azd config list

# Verifica la connettività
curl -v https://myapp.azurewebsites.net/health
```

### Analisi dei log
```bash
# Log dell'applicazione tramite Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitora l'applicazione con azd
azd monitor --logs
azd monitor --live

# Log delle risorse di Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Log dei container (per Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigazione delle risorse
```bash
# Elenca tutte le risorse
az resource list --resource-group myrg -o table

# Controlla lo stato della risorsa
az webapp show --name myapp --resource-group myrg --query state

# Diagnostica di rete
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Ottenere ulteriore assistenza

### Quando escalare
- I problemi di autenticazione persistono dopo aver provato tutte le soluzioni
- Problemi di infrastruttura con i servizi Azure
- Problemi di fatturazione o relativi all'abbonamento
- Problemi o incidenti di sicurezza

### Canali di supporto
```bash
# 1. Verificare lo stato di Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Creare un ticket di supporto Azure
# Vai a: https://portal.azure.com -> Guida e supporto

# 3. Risorse della community
# - Stack Overflow: tag azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informazioni da raccogliere
Prima di contattare il supporto, raccogli:
- `azd version` output
- `azd config list` output
- `azd show` output (stato della distribuzione corrente)
- Messaggi di errore (testo completo)
- Passaggi per riprodurre il problema
- Dettagli dell'ambiente (`azd env show`)
- Cronologia di quando il problema è iniziato

### Script di raccolta log
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevenzione dei problemi

### Lista di controllo pre-distribuzione
```bash
# 1. Verificare l'autenticazione
az account show

# 2. Verificare le quote e i limiti
az vm list-usage --location eastus2

# 3. Verificare i template
az bicep build --file infra/main.bicep

# 4. Testare prima localmente
npm run build
npm run test

# 5. Usare distribuzioni di prova (dry-run)
azd provision --preview
```

### Configurazione del monitoraggio
```bash
# Abilita Application Insights
# Aggiungi a main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Configura gli avvisi
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Manutenzione regolare
```bash
# Controlli settimanali dello stato di salute
./scripts/health-check.sh

# Revisione mensile dei costi
az consumption usage list --billing-period-name 202401

# Revisione trimestrale della sicurezza
az security assessment list --resource-group myrg
```

## Risorse correlate

- [Guida al debugging](debugging.md) - Tecniche avanzate di debugging
- [Provisioning delle risorse](../chapter-04-infrastructure/provisioning.md) - Risoluzione dei problemi dell'infrastruttura
- [Pianificazione della capacità](../chapter-06-pre-deployment/capacity-planning.md) - Guida alla pianificazione delle risorse
- [Selezione degli SKU](../chapter-06-pre-deployment/sku-selection.md) - Raccomandazioni sui livelli di servizio

---

**Suggerimento**: Tieni questa guida nei preferiti e consultala ogni volta che incontri problemi. La maggior parte dei problemi è già stata riscontrata e ha soluzioni consolidate!

---

**Navigazione**
- **Lezione precedente**: [Provisioning delle risorse](../chapter-04-infrastructure/provisioning.md)
- **Lezione successiva**: [Guida al debugging](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Esclusione di responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su IA [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella lingua di origine deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->