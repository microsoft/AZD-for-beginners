<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-20T22:20:01+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "it"
}
-->
# Laboratorio AI Workshop: Rendere le tue soluzioni AI pronte per AZD

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [Distribuzione Modello AI](ai-model-deployment.md)
- **➡️ Successivo**: [Best Practices per AI in Produzione](production-ai-practices.md)
- **🚀 Prossimo Capitolo**: [Capitolo 3: Configurazione](../getting-started/configuration.md)

## Panoramica del Workshop

Questo laboratorio pratico guida gli sviluppatori attraverso il processo di utilizzo di un template AI esistente e la sua distribuzione utilizzando Azure Developer CLI (AZD). Imparerai i modelli essenziali per le distribuzioni AI in produzione utilizzando i servizi Microsoft Foundry.

**Durata:** 2-3 ore  
**Livello:** Intermedio  
**Prerequisiti:** Conoscenza di base di Azure, familiarità con i concetti di AI/ML

## 🎓 Obiettivi di Apprendimento

Alla fine di questo workshop, sarai in grado di:
- ✅ Convertire un'applicazione AI esistente per utilizzare i template AZD
- ✅ Configurare i servizi Microsoft Foundry con AZD
- ✅ Implementare una gestione sicura delle credenziali per i servizi AI
- ✅ Distribuire applicazioni AI pronte per la produzione con monitoraggio
- ✅ Risolvere problemi comuni di distribuzione AI

## Prerequisiti

### Strumenti Necessari
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installato
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installato
- [Git](https://git-scm.com/) installato
- Editor di codice (consigliato VS Code)

### Risorse Azure
- Sottoscrizione Azure con accesso come contributore
- Accesso ai servizi Azure OpenAI (o possibilità di richiedere l'accesso)
- Permessi per la creazione di gruppi di risorse

### Conoscenze Prerequisite
- Comprensione di base dei servizi Azure
- Familiarità con le interfacce a riga di comando
- Concetti base di AI/ML (API, modelli, prompt)

## Configurazione del Laboratorio

### Passaggio 1: Preparazione dell'Ambiente

1. **Verifica delle installazioni degli strumenti:**
```bash
# Controlla l'installazione di AZD
azd version

# Controlla Azure CLI
az --version

# Accedi ad Azure
az login
azd auth login
```

2. **Clona il repository del workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulo 1: Comprendere la Struttura AZD per le Applicazioni AI

### Anatomia di un Template AZD Pronto per AI

Esplora i file chiave in un template AZD pronto per AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Esercizio di Laboratorio 1.1: Esplora la Configurazione**

1. **Esamina il file azure.yaml:**
```bash
cat azure.yaml
```

**Cosa cercare:**
- Definizioni dei servizi per i componenti AI
- Mappature delle variabili d'ambiente
- Configurazioni dell'host

2. **Rivedi l'infrastruttura main.bicep:**
```bash
cat infra/main.bicep
```

**Modelli AI chiave da identificare:**
- Provisioning del servizio Azure OpenAI
- Integrazione con Cognitive Search
- Gestione sicura delle chiavi
- Configurazioni di sicurezza della rete

### **Punto di Discussione:** Perché Questi Modelli Sono Importanti per l'AI

- **Dipendenze dei Servizi**: Le app AI spesso richiedono più servizi coordinati
- **Sicurezza**: Le chiavi API e gli endpoint necessitano di una gestione sicura
- **Scalabilità**: I carichi di lavoro AI hanno requisiti di scalabilità unici
- **Gestione dei Costi**: I servizi AI possono essere costosi se non configurati correttamente

## Modulo 2: Distribuisci la Tua Prima Applicazione AI

### Passaggio 2.1: Inizializza l'Ambiente

1. **Crea un nuovo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Imposta i parametri richiesti:**
```bash
# Imposta la tua regione Azure preferita
azd env set AZURE_LOCATION eastus

# Facoltativo: Imposta un modello OpenAI specifico
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Passaggio 2.2: Distribuisci l'Infrastruttura e l'Applicazione

1. **Distribuisci con AZD:**
```bash
azd up
```

**Cosa accade durante `azd up`:**
- ✅ Provisiona il servizio Azure OpenAI
- ✅ Crea il servizio Cognitive Search
- ✅ Configura App Service per l'applicazione web
- ✅ Configura rete e sicurezza
- ✅ Distribuisce il codice dell'applicazione
- ✅ Configura monitoraggio e registrazione

2. **Monitora i progressi della distribuzione** e prendi nota delle risorse create.

### Passaggio 2.3: Verifica la Tua Distribuzione

1. **Controlla le risorse distribuite:**
```bash
azd show
```

2. **Apri l'applicazione distribuita:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testa la funzionalità AI:**
   - Naviga nell'applicazione web
   - Prova query di esempio
   - Verifica che le risposte AI funzionino

### **Esercizio di Laboratorio 2.1: Pratica di Risoluzione dei Problemi**

**Scenario**: La tua distribuzione è riuscita, ma l'AI non risponde.

**Problemi comuni da controllare:**
1. **Chiavi API OpenAI**: Verifica che siano impostate correttamente
2. **Disponibilità del modello**: Controlla se il tuo modello è supportato nella regione
3. **Connettività di rete**: Assicurati che i servizi possano comunicare
4. **Permessi RBAC**: Verifica che l'app possa accedere a OpenAI

**Comandi di debug:**
```bash
# Controlla le variabili d'ambiente
azd env get-values

# Visualizza i log di distribuzione
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Controlla lo stato della distribuzione di OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modulo 3: Personalizzare le Applicazioni AI per le Tue Esigenze

### Passaggio 3.1: Modifica la Configurazione AI

1. **Aggiorna il modello OpenAI:**
```bash
# Cambia a un modello diverso (se disponibile nella tua regione)
azd env set AZURE_OPENAI_MODEL gpt-4

# Ridistribuisci con la nuova configurazione
azd deploy
```

2. **Aggiungi servizi AI aggiuntivi:**

Modifica `infra/main.bicep` per aggiungere Document Intelligence:

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

### Passaggio 3.2: Configurazioni Specifiche per l'Ambiente

**Migliore Pratica**: Configurazioni diverse per sviluppo e produzione.

1. **Crea un ambiente di produzione:**
```bash
azd env new myai-production
```

2. **Imposta parametri specifici per la produzione:**
```bash
# La produzione utilizza tipicamente SKU più alti
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Abilita funzionalità di sicurezza aggiuntive
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Esercizio di Laboratorio 3.1: Ottimizzazione dei Costi**

**Sfida**: Configura il template per uno sviluppo a basso costo.

**Compiti:**
1. Identifica quali SKU possono essere impostati su livelli gratuiti/base
2. Configura le variabili d'ambiente per costi minimi
3. Distribuisci e confronta i costi con la configurazione di produzione

**Suggerimenti per la soluzione:**
- Usa il livello F0 (gratuito) per i Servizi Cognitivi quando possibile
- Usa il livello Base per il Servizio di Ricerca in sviluppo
- Considera l'uso del piano Consumption per le Funzioni

## Modulo 4: Sicurezza e Best Practices per la Produzione

### Passaggio 4.1: Gestione Sicura delle Credenziali

**Sfida attuale**: Molte app AI codificano le chiavi API o utilizzano archiviazioni non sicure.

**Soluzione AZD**: Integrazione Managed Identity + Key Vault.

1. **Rivedi la configurazione di sicurezza nel tuo template:**
```bash
# Cerca la configurazione di Key Vault e Identità Gestita
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifica che Managed Identity funzioni:**
```bash
# Verifica se l'app web ha la configurazione corretta dell'identità
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passaggio 4.2: Sicurezza della Rete

1. **Abilita endpoint privati** (se non già configurati):

Aggiungi al tuo template bicep:
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

### Passaggio 4.3: Monitoraggio e Osservabilità

1. **Configura Application Insights:**
```bash
# Gli Application Insights dovrebbero essere configurati automaticamente
# Controlla la configurazione:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Imposta un monitoraggio specifico per l'AI:**

Aggiungi metriche personalizzate per le operazioni AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Esercizio di Laboratorio 4.1: Audit di Sicurezza**

**Compito**: Rivedi la tua distribuzione per le migliori pratiche di sicurezza.

**Checklist:**
- [ ] Nessun segreto codificato nel codice o nella configurazione
- [ ] Managed Identity utilizzata per l'autenticazione tra servizi
- [ ] Key Vault archivia configurazioni sensibili
- [ ] L'accesso alla rete è correttamente limitato
- [ ] Monitoraggio e registrazione sono abilitati

## Modulo 5: Convertire la Tua Applicazione AI

### Passaggio 5.1: Foglio di Valutazione

**Prima di convertire la tua app**, rispondi a queste domande:

1. **Architettura dell'Applicazione:**
   - Quali servizi AI utilizza la tua app?
   - Di quali risorse di calcolo ha bisogno?
   - Richiede un database?
   - Quali sono le dipendenze tra i servizi?

2. **Requisiti di Sicurezza:**
   - Quali dati sensibili gestisce la tua app?
   - Quali requisiti di conformità hai?
   - Hai bisogno di una rete privata?

3. **Requisiti di Scalabilità:**
   - Qual è il carico previsto?
   - Hai bisogno di auto-scaling?
   - Ci sono requisiti regionali?

### Passaggio 5.2: Crea il Tuo Template AZD

**Segui questo modello per convertire la tua app:**

1. **Crea la struttura di base:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inizializza il modello AZD
azd init --template minimal
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

3. **Crea template di infrastruttura:**

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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Esercizio di Laboratorio 5.1: Sfida di Creazione del Template**

**Sfida**: Crea un template AZD per un'app AI di elaborazione documenti.

**Requisiti:**
- Azure OpenAI per l'analisi dei contenuti
- Document Intelligence per OCR
- Storage Account per il caricamento dei documenti
- Function App per la logica di elaborazione
- Web app per l'interfaccia utente

**Punti bonus:**
- Aggiungi una gestione corretta degli errori
- Includi una stima dei costi
- Configura dashboard di monitoraggio

## Modulo 6: Risoluzione dei Problemi Comuni

### Problemi Comuni di Distribuzione

#### Problema 1: Quota del Servizio OpenAI Superata
**Sintomi:** La distribuzione fallisce con errore di quota
**Soluzioni:**
```bash
# Controlla le quote attuali
az cognitiveservices usage list --location eastus

# Richiedi un aumento della quota o prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modello Non Disponibile nella Regione
**Sintomi:** Le risposte AI falliscono o errori di distribuzione del modello
**Soluzioni:**
```bash
# Controlla la disponibilità del modello per regione
az cognitiveservices model list --location eastus

# Aggiorna al modello disponibile
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problema 3: Problemi di Permessi
**Sintomi:** Errori 403 Forbidden durante le chiamate ai servizi AI
**Soluzioni:**
```bash
# Controlla assegnazioni di ruoli
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Aggiungi ruoli mancanti
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemi di Prestazioni

#### Problema 4: Risposte AI Lente
**Passaggi di indagine:**
1. Controlla Application Insights per metriche di prestazione
2. Rivedi le metriche del servizio OpenAI nel portale Azure
3. Verifica la connettività di rete e la latenza

**Soluzioni:**
- Implementa caching per query comuni
- Usa il modello OpenAI appropriato per il tuo caso d'uso
- Considera repliche di lettura per scenari ad alto carico

### **Esercizio di Laboratorio 6.1: Sfida di Debugging**

**Scenario**: La tua distribuzione è riuscita, ma l'applicazione restituisce errori 500.

**Compiti di debug:**
1. Controlla i log dell'applicazione
2. Verifica la connettività dei servizi
3. Testa l'autenticazione
4. Rivedi la configurazione

**Strumenti da usare:**
- `azd show` per una panoramica della distribuzione
- Portale Azure per log dettagliati dei servizi
- Application Insights per telemetria dell'applicazione

## Modulo 7: Monitoraggio e Ottimizzazione

### Passaggio 7.1: Configura un Monitoraggio Completo

1. **Crea dashboard personalizzate:**

Naviga nel portale Azure e crea una dashboard con:
- Conteggio richieste OpenAI e latenza
- Tassi di errore dell'applicazione
- Utilizzo delle risorse
- Monitoraggio dei costi

2. **Configura avvisi:**
```bash
# Avviso per alto tasso di errore
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Passaggio 7.2: Ottimizzazione dei Costi

1. **Analizza i costi attuali:**
```bash
# Usa Azure CLI per ottenere i dati sui costi
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementa controlli sui costi:**
- Configura avvisi di budget
- Usa politiche di autoscaling
- Implementa caching delle richieste
- Monitora l'uso dei token per OpenAI

### **Esercizio di Laboratorio 7.1: Ottimizzazione delle Prestazioni**

**Compito**: Ottimizza la tua applicazione AI per prestazioni e costi.

**Metriche da migliorare:**
- Riduci il tempo medio di risposta del 20%
- Riduci i costi mensili del 15%
- Mantieni un uptime del 99,9%

**Strategie da provare:**
- Implementa caching delle risposte
- Ottimizza i prompt per l'efficienza dei token
- Usa SKU di calcolo appropriati
- Configura un autoscaling adeguato

## Sfida Finale: Implementazione End-to-End

### Scenario della Sfida

Ti viene richiesto di creare un chatbot AI per il servizio clienti pronto per la produzione con questi requisiti:

**Requisiti Funzionali:**
- Interfaccia web per le interazioni con i clienti
- Integrazione con Azure OpenAI per le risposte
- Capacità di ricerca documentale utilizzando Cognitive Search
- Integrazione con il database clienti esistente
- Supporto multilingue

**Requisiti Non Funzionali:**
- Gestire 1000 utenti simultanei
- SLA di uptime del 99,9%
- Conformità SOC 2
- Costo inferiore a $500/mese
- Distribuzione in più ambienti (sviluppo, staging, produzione)

### Passaggi di Implementazione

1. **Progetta l'architettura**
2. **Crea il template AZD**
3. **Implementa misure di sicurezza**
4. **Configura monitoraggio e avvisi**
5. **Crea pipeline di distribuzione**
6. **Documenta la soluzione**

### Criteri di Valutazione

- ✅ **Funzionalità**: Soddisfa tutti i requisiti?
- ✅ **Sicurezza**: Sono implementate le migliori pratiche?
- ✅ **Scalabilità**: Può gestire il carico?
- ✅ **Manutenibilità**: Il codice e l'infrastruttura sono ben organizzati?
- ✅ **Costo**: Rimane entro il budget?

## Risorse Aggiuntive

### Documentazione Microsoft
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentazione Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentazione Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Template di Esempio
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Risorse della Community
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificato di Completamento
Congratulazioni! Hai completato il laboratorio del Workshop sull'AI. Ora dovresti essere in grado di:

- ✅ Convertire applicazioni AI esistenti in modelli AZD
- ✅ Distribuire applicazioni AI pronte per la produzione
- ✅ Implementare le migliori pratiche di sicurezza per i carichi di lavoro AI
- ✅ Monitorare e ottimizzare le prestazioni delle applicazioni AI
- ✅ Risolvere i problemi comuni di distribuzione

### Prossimi Passi
1. Applica questi modelli ai tuoi progetti AI
2. Contribuisci con modelli alla comunità
3. Unisciti al Discord di Microsoft Foundry per supporto continuo
4. Esplora argomenti avanzati come le distribuzioni multi-regione

---

**Feedback sul Workshop**: Aiutaci a migliorare questo workshop condividendo la tua esperienza nel [canale #Azure del Discord di Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [Distribuzione del Modello AI](ai-model-deployment.md)
- **➡️ Successivo**: [Migliori Pratiche per l'AI in Produzione](production-ai-practices.md)
- **🚀 Prossimo Capitolo**: [Capitolo 3: Configurazione](../getting-started/configuration.md)

**Hai Bisogno di Aiuto?** Unisciti alla nostra comunità per supporto e discussioni su AZD e distribuzioni AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->