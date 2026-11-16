# Laboratorio Workshop AI: Rendere le tue Soluzioni AI Distribuibili con AZD

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [Deploy del Modello AI](ai-model-deployment.md)
- **➡️ Successivo**: [Best Practices per AI in Produzione](../chapter-08-production/production-ai-practices.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

## Panoramica del Workshop

Questo laboratorio pratico guida gli sviluppatori attraverso il processo di utilizzo di un template AI esistente e la sua distribuzione tramite Azure Developer CLI (AZD). Imparerai pattern essenziali per il deploy di AI in produzione utilizzando i servizi Microsoft Foundry.

> **Revisione rilascio (2026-11-04):** Le indicazioni sui comandi AZD e i nomi di configurazione degli esempi sono stati verificati contro il rilascio `azd` `1.37.2` e la configurazione corrente dell'esempio linkato. Si tratta di una revisione documentale, non di una validazione di deploy live. Il laboratorio RAG non richiede l'estensione agent; per valutazioni agent, usare l'estensione `azure.ai.evaluations` separata e il [workflow di valutazione attuale](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), non i comandi legacy per agent.

**Durata:** 2-3 ore  
**Livello:** Intermedio  
**Prerequisiti:** Conoscenza base di Azure, familiarità con concetti AI/ML

## 🎓 Obiettivi di Apprendimento

Al termine di questo workshop, potrai:
- ✅ Esplorare un template AI AZD esistente e pianificare la conversione della tua app
- ✅ Configurare i servizi Microsoft Foundry con AZD
- ✅ Implementare una gestione sicura delle credenziali per i servizi AI
- ✅ Distribuire un'applicazione di riferimento AI con monitoraggio
- ✅ Risolvere problemi comuni di deploy AI

## Prerequisiti

### Strumenti Richiesti
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installato
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installato
- [Git](https://git-scm.com/) installato
- Editor di codice (consigliato VS Code)

Questi blocchi di comando usano sintassi Bash (incluse continuazioni di linea e `grep`). Su Windows, usare Git Bash/WSL o convertirli in PowerShell. Installare anche linguaggio, package-manager e strumenti container elencati nella [configurazione ambiente locale dell'esempio](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Risorse Azure
- Sottoscrizione Azure con permessi di provisioning risorse e assegnazione ruoli (solo Contributor non può creare assegnazioni RBAC, usare amministratore ruolo autorizzato o equivalente documentato nell'esempio)
- Accesso ai servizi Microsoft Foundry Models (o possibilità di richiederlo)
- Permessi per creazione gruppi di risorse

### Prerequisiti di Conoscenza
- Comprensione base dei servizi Azure
- Familiarità con interfacce a riga di comando
- Concetti base AI/ML (API, modelli, prompt)

## Setup del Laboratorio

### Passo 1: Preparazione dell'Ambiente

1. **Verifica delle installazioni degli strumenti:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Se lavori su più tenant o la tua sottoscrizione non viene rilevata automaticamente, riprova con `azd auth login --tenant-id <tenant-id>`.

2. **Clona il repository del workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulo 1: Comprendere la Struttura AZD per Applicazioni AI

### Anatomia di un Template AI AZD

Esplora i file chiave in un template AZD pronto per AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

L'esempio clonato può cambiare; `.azure/` appare dopo l'inizializzazione dell'ambiente, non necessariamente in un clone fresco. Ispeziona effettivamente il checkout invece di creare directory mancanti per farlo corrispondere a questo schema.

### **Esercizio Lab 1.1: Esplora la Configurazione**

1. **Analizza il file azure.yaml:**
```bash
cat azure.yaml
```

**Cosa cercare:**
- Definizioni dei servizi per componenti AI
- Mappature delle variabili d'ambiente
- Configurazioni degli host

2. **Esamina l'infrastruttura main.bicep:**
```bash
cat infra/main.bicep
```

**Pattern AI chiave da identificare:**
- Provisioning servizio Microsoft Foundry Models
- Integrazione Azure AI Search
- Gestione sicura delle chiavi
- Configurazioni sicurezza di rete

### **Punto di Discussione:** Perché Questi Pattern Contano per l'AI

- **Dipendenze di Servizio**: Le app AI spesso richiedono servizi coordinati multipli
- **Sicurezza**: Le chiavi API e gli endpoint devono essere gestiti in modo sicuro
- **Scalabilità**: I carichi di lavoro AI hanno requisiti unici di scaling
- **Gestione Costi**: I servizi AI possono essere costosi se non configurati correttamente

## Modulo 2: Distribuisci la Tua Prima Applicazione AI

### Passo 2.1: Inizializza l'Ambiente

1. **Crea un nuovo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Imposta i parametri richiesti:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Passo 2.2: Distribuisci Infrastruttura e Applicazione

1. **Distribuisci con AZD:**
```bash
azd up
```

**Cosa succede durante `azd up`:**
- ✅ Provisiona servizio Microsoft Foundry Models
- ✅ Crea servizio Azure AI Search
- ✅ Configura Azure Container Apps per backend e frontend incluso (default sample attuale)
- ✅ Configura rete e sicurezza
- ✅ Distribuisce codice applicazione
- ✅ Imposta monitoraggio e logging

2. **Monitora il progresso del deploy** e prendi nota delle risorse create.

### Passo 2.3: Verifica il Tuo Deploy

1. **Controlla le risorse distribuite:**
```bash
azd show
```

2. **Apri l'applicazione distribuita:**
```bash
azd show
```

Apri l'endpoint web mostrato nell'output `azd show`.

3. **Testa la funzionalità AI:**
   - Naviga nell'app web
   - Prova query di esempio
   - Verifica che le risposte AI funzionino

### **Esercizio Lab 2.1: Pratica di Risoluzione Problemi**

**Scenario**: Il tuo deploy è riuscito ma l'AI non risponde.

**Problemi comuni da controllare:**
1. **Autenticazione**: Verifica identità gestita e assegnazioni ruoli; controlla le chiavi API solo se hai abilitato deliberatamente autenticazione basata su chiave
2. **Disponibilità modello**: Controlla se la tua regione supporta il modello
3. **Connettività rete**: Assicurati che i servizi possano comunicare
4. **Permessi RBAC**: Verifica che l'app possa accedere a OpenAI

**Comandi di debug:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modulo 3: Personalizzare Applicazioni AI per le Tue Esigenze

### Passo 3.1: Modifica Configurazione AI

1. **Aggiorna il modello OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Aggiungi servizi AI aggiuntivi:**

Modifica `infra/main.bicep` per aggiungere Document Intelligence:

Quanto segue è un frammento illustrativo, non un template completo. L'esempio potrebbe già fornire servizi di elaborazione documenti: ispeziona l'infrastruttura attuale prima di aggiungere risorse duplicate. Aggiunte personalizzate richiedono wiring di output, identità e configurazione applicativa.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Passo 3.2: Configurazioni Specifiche per Ambiente

**Best Practice**: Configurazioni differenti per sviluppo e produzione.

1. **Crea un ambiente di produzione:**
```bash
azd env new myai-production
```

2. **Imposta parametri specifici per produzione:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Questi nomi derivano dal [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) dell'esempio. `azd env set` memorizza un valore ma non rende efficace una variabile arbitraria: il template deve consumarla. Rivedi la [guida all'isolamento di rete](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) dell'esempio prima di disabilitare l'accesso pubblico, e usa `azd up` per applicare cambi infrastrutturali. Solo OpenAI SKU `S0` non determina la capacità del modello; anche tipo di deploy e capacità modello contano.

### **Esercizio Lab 3.1: Ottimizzazione dei Costi**

**Sfida**: Configura il template per uno sviluppo cost-effective.

**Compiti:**
1. Seleziona l'ambiente workshop usa e getta: `azd env select myai-workshop`.
2. Registra SKU Search e capacità modello attuali da `infra/main.parameters.json` e l'ambiente scelto.
3. Usa gli input supportati qui sotto, dopo aver confermato la quota modello/regione:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Verifica SKU Search e capacità di deploy nel portale e stima la differenza con il calcolatore prezzi. Non aspettarti aggiornamenti fatturazione immediati.

**Criteri di successo:** Search usa Basic, il deploy chat ha la capacità supportata richiesta e l'app risponde ancora a una domanda di esempio. La capacità `10` è un'allocazione limite di velocità, non uno sconto prezzo token. I cambi di tier Search possono essere limitati o richiedere ricreazione; non sperimentare su risorse di produzione. F0 è specifico del servizio e non è uno SKU modello Azure OpenAI.

## Modulo 4: Sicurezza e Best Practice in Produzione

### Passo 4.1: Gestione Sicura delle Credenziali

**Sfida attuale**: Molte app AI inseriscono chiavi API hardcoded o usano storage insicuro.

**Soluzione AZD**: Identità Gestita + integrazione Key Vault.

1. **Rivedi la configurazione di sicurezza nel tuo template:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifica che l'Identità Gestita funzioni:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Sicurezza di Rete

1. **Abilita endpoint privati** usando la configurazione di rete supportata dall'esempio (se non già configurata).

Per il tuo template, questo frammento illustrativo mostra la connessione endpoint OpenAI. Serve anche una VNet, configurazione DNS privata e connettività applicativa; non incollare invariato nel sample, che ha moduli di endpoint privati:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Passo 4.3: Monitoraggio e Osservabilità

1. **Configura Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Abilita l'integrazione Application Insights dell'esempio:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

L'instrumentazione dell'esempio emette telemetria; un'impostazione arbitraria `OPENAI_MONITOR_ENABLED` non abilita metriche AI. Controlla tracce per chiamate modello, latenza, errori e uso token, evita di registrare prompt o risposte sensibili.

### **Esercizio Lab 4.1: Audit di Sicurezza**

**Compito**: Rivedi il tuo deploy per le best practice di sicurezza.

**Lista di controllo:**
- [ ] Nessun segreto hardcoded nel codice o configurazione
- [ ] Usata Identità Gestita per autenticazione servizio a servizio
- [ ] Key Vault conserva configurazioni sensibili
- [ ] L'accesso di rete è correttamente limitato
- [ ] Monitoraggio e logging abilitati

## Modulo 5: Convertire la Tua Applicazione AI

### Passo 5.1: Foglio di Valutazione

**Prima di convertire la tua app**, rispondi a queste domande:

1. **Architettura Applicativa:**
   - Quali servizi AI usa la tua app?
   - Quali risorse di elaborazione necessita?
   - Richiede un database?
   - Quali sono le dipendenze tra servizi?

2. **Requisiti di Sicurezza:**
   - Quali dati sensibili gestisce la tua app?
   - Quali requisiti di conformità hai?
   - Hai bisogno di rete privata?

3. **Requisiti di Scalabilità:**
   - Qual è il carico previsto?
   - Hai bisogno di autoscaling?
   - Ci sono requisiti regionali?

### Passo 5.2: Crea il tuo Template AZD

**Segui questo pattern per convertire la tua app:**

**Solo struttura base:** Questa sezione non fornisce sorgente API/app web, infrastruttura host, deploy modello, identità/RBAC o un completo `main.parameters.json`. Il Bicep scoped a gruppo risorse illustra composizione moduli; un entry point AZD sottoscrizione-scoped tipico deve creare un gruppo risorse e invocarlo in tale ambito. Non aspettarti che `azd up` distribuisca un'app completa copiando solo questi frammenti. Per una baseline eseguibile continua ad usare il template RAG del Modulo 1.

1. **Crea la struttura di base:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Crea azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Crea template infrastruttura:**

**infra/main.bicep** - Template principale:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Modulo OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Esercizio Lab 5.1: Sfida Creazione Template**

**Sfida**: Crea un template AZD per un'app AI di elaborazione documenti.

**Requisiti:**
- Microsoft Foundry Models per analisi contenuti
- Document Intelligence per OCR
- Storage Account per upload documenti
- Function App per logica di elaborazione
- App web per interfaccia utente

**Punti bonus:**
- Aggiungi gestione errori adeguata
- Includi stima costi
- Imposta dashboard monitoraggio

## Modulo 6: Risoluzione Problemi Comuni

### Problemi Comuni in Deploy

#### Problema 1: Superamento Quota Servizio OpenAI
**Sintomi:** Deploy fallisce con errore quota
**Soluzioni:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modello Non Disponibile nella Regione
**Sintomi:** Risposte AI falliscono o errori deploy modello
**Soluzioni:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problema 3: Problemi di Permessi
**Sintomi:** Errori 403 Forbidden chiamando servizi AI
**Soluzioni:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemi di Prestazioni

#### Problema 4: Risposte AI Lente
**Passaggi investigativi:**
1. Controlla Application Insights per metriche di performance
2. Rivedi metriche servizio OpenAI nel portale Azure
3. Verifica connettività rete e latenza

**Soluzioni:**
- Implementa caching per query comuni
- Usa modello OpenAI appropriato per il tuo caso d’uso
- Scala repliche applicazione solo dopo aver verificato limiti RPM/TPM modello; i deploy Azure OpenAI non espongono una generica impostazione "replica di lettura" tipo database

### **Esercizio Lab 6.1: Sfida di Debugging**

**Scenario**: Il tuo deploy è riuscito, ma l'applicazione restituisce errori 500.

**Compiti di debugging:**
1. Controlla i log dell'applicazione
2. Verifica connettività servizio
3. Test di autenticazione
4. Revisione della configurazione

**Strumenti da utilizzare:**
- `azd show` per la panoramica del deployment
- Portale Azure per log di servizio dettagliati
- Application Insights per la telemetria dell'applicazione

## Modulo 7: Monitoraggio e Ottimizzazione

### Passo 7.1: Configurare un monitoraggio completo

1. **Crea dashboard personalizzate:**

Naviga nel portale Azure e crea un dashboard con:
- Numero di richieste OpenAI e latenza
- Tassi di errore dell'applicazione
- Utilizzo delle risorse
- Monitoraggio dei costi

2. **Configura gli alert:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Verifica che il componente emetta telemetria delle richieste e aggiungi un action group se sono necessarie notifiche. La metrica è un conteggio, non una percentuale di fallimento; un alert di tasso necessita di una query adeguata e di un denominatore.

### Passo 7.2: Ottimizzazione dei costi

1. **Analizza i costi attuali:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Sostituisci i segnaposto date. Il supporto API per il consumo varia in base al tipo di contratto di fatturazione; usa Cost Management nel portale se i dettagli di utilizzo non sono disponibili. I costi hanno un ritardo, non sono un oracolo di test in tempo reale.

2. **Implementa controlli dei costi:**
- Configura alert di budget
- Usa policy di autoscaling
- Implementa caching delle richieste
- Monitora l'uso dei token per OpenAI

### **Esercizio di laboratorio 7.1: Ottimizzazione delle prestazioni**

**Compito**: Ottimizza la tua applicazione AI sia in termini di prestazioni che di costo.

**Metriche da migliorare:**
- Ridurre il tempo medio di risposta del 20%
- Ridurre i costi mensili del 15%
- Definire un SLO di disponibilità al 99,9% e una finestra di misurazione (un laboratorio breve non può dimostrare disponibilità mensile)

**Strategie da provare:**
- Implementa caching di risposta
- Ottimizza i prompt per l'efficienza dei token
- Usa SKU di calcolo appropriati
- Configura l'autoscaling correttamente

## Sfida finale: Implementazione end-to-end

### Scenario della sfida

Questa è una **sfida opzionale di architettura/design**, non un esercizio eseguibile fornito né una certificazione di produzione. Proponi un chatbot per il servizio clienti basato su AI e documenta quali requisiti necessitano ulteriore implementazione e prove:

**Requisiti funzionali:**
- Interfaccia web per interazioni con i clienti
- Integrazione con Microsoft Foundry Models per risposte
- Capacità di ricerca documentale usando Azure AI Search
- Integrazione con database clienti esistenti
- Supporto multilingua

**Requisiti non funzionali:**
- Gestire 1000 utenti concorrenti
- SLA di uptime al 99,9%
- Conformità SOC 2
- Costo inferiore a 500$/mese
- Deploy in più ambienti (dev, staging, prod)

Questi sono vincoli ipotetici degli stakeholder, non risultati garantiti simultaneamente. Definisci il tasso di richieste, le dimensioni di input/output del prompt e la durata della sessione prima di stimare i costi; 1.000 utenti concorrenti non definisce un carico di lavoro né dimostra che un budget di 500$ sia fattibile. SOC 2 è un risultato di audit organizzativo, non un interruttore abilitato da un template AZD. Identifica compromessi e rifiuta vincoli non fattibili con prove.

### Passi di implementazione

1. **Progetta l'architettura**
2. **Crea il template AZD**
3. **Implementa misure di sicurezza**
4. **Configura monitoraggio e alert**
5. **Crea pipeline di deployment**
6. **Documenta la soluzione**

### Criteri di valutazione

- ✅ **Funzionalità**: Le capacità implementate sono dimostrate e sono espliciti i gap rimanenti?
- ✅ **Sicurezza**: Sono adottate le best practice?
- ✅ **Scalabilità**: Riesce a gestire il carico?
- ✅ **Manutenibilità**: Il codice e l'infrastruttura sono ben organizzati?
- ✅ **Costo**: Rimane entro il budget?

## Risorse aggiuntive

### Documentazione Microsoft
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentazione Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentazione Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Template di esempio
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Risorse della community
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Checkpoint di completamento

Congratulazioni! Hai completato il laboratorio AI Workshop. Ora dovresti essere in grado di:

- ✅ Spiegare come adattare un'app AI esistente a un template AZD
- ✅ Eseguire il deployment e testare un'app AI di riferimento
- ✅ Implementare best practice di sicurezza per carichi di lavoro AI
- ✅ Monitorare e ottimizzare le prestazioni di un'app AI
- ✅ Risolvere problemi comuni di deployment

**Pulizia:** Esegui `azd env list`, seleziona ogni ambiente usa e getta creato in questo laboratorio (`myai-workshop`, e se distribuito `myai-production`/`myai-quota-test`), ed esegui `azd down` in ciascuno. Rivedi il piano di cancellazione; cancellare solo la configurazione locale di un ambiente non elimina le risorse Azure. Evita `--purge` a meno che tu non comprenda la rimozione irreversibile di risorse soft-delete.

### Prossimi passi
1. Applica questi pattern ai tuoi progetti AI
2. Contribuisci con template alla community
3. Unisciti al Microsoft Foundry Discord per supporto continuo
4. Esplora argomenti avanzati come deployment multi-regione

---

**Feedback sul workshop**: Aiutaci a migliorare questo workshop condividendo la tua esperienza nel [canale #Azure di Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navigazione del Capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [Deployment di modelli AI](ai-model-deployment.md)
- **➡️ Successivo**: [Best Practice AI di produzione](../chapter-08-production/production-ai-practices.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Unisciti alla nostra community per supporto e discussioni su AZD e deployment AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->