# Laboratorio AI: Rendere le tue soluzioni AI distribuibili con AZD

**Navigazione Capitoli:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Successivo**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Capitolo Successivo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Panoramica del Workshop

Questo laboratorio pratico guida gli sviluppatori attraverso il processo di prendere un modello AI esistente e distribuirlo utilizzando Azure Developer CLI (AZD). Imparerai i modelli essenziali per distribuzioni AI in produzione utilizzando i servizi Microsoft Foundry.

> **Nota di validazione (2026-03-25):** Questo workshop è stato revisionato con `azd` `1.23.12`. Se la tua installazione locale è più vecchia, aggiorna AZD prima di iniziare in modo che l'autenticazione, il template e il flusso di distribuzione corrispondano ai passaggi seguenti.

**Durata:** 2-3 ore  
**Livello:** Intermedio  
**Prerequisiti:** Conoscenze di base di Azure, familiarità con concetti AI/ML

## 🎓 Obiettivi di Apprendimento

Al termine di questo workshop, sarai in grado di:
- ✅ Convertire un'applicazione AI esistente per usare i template AZD
- ✅ Configurare i servizi Microsoft Foundry con AZD
- ✅ Implementare la gestione sicura delle credenziali per i servizi AI
- ✅ Distribuire applicazioni AI pronte per la produzione con monitoraggio
- ✅ Risolvere i problemi comuni nelle distribuzioni AI

## Prerequisiti

### Strumenti Richiesti
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installato
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installato
- [Git](https://git-scm.com/) installato
- Editor di codice (consigliato VS Code)

### Risorse Azure
- Sottoscrizione Azure con accesso contributor
- Accesso ai servizi Microsoft Foundry Models (o possibilità di richiedere l'accesso)
- Permessi per creare gruppi di risorse

### Conoscenze Preliminari
- Comprensione di base dei servizi Azure
- Familiarità con interfacce a riga di comando
- Concetti base di AI/ML (API, modelli, prompt)

## Preparazione del Lab

### Passo 1: Preparazione dell'Ambiente

1. **Verificare le installazioni degli strumenti:**
```bash
# Verifica l'installazione di AZD
azd version

# Verifica Azure CLI
az --version

# Accedi ad Azure per i flussi di lavoro AZD
azd auth login

# Accedi all'Azure CLI solo se prevedi di eseguire comandi az durante la diagnostica
az login
```

Se lavori su più tenant o la tua sottoscrizione non viene rilevata automaticamente, riprova con `azd auth login --tenant-id <tenant-id>`.

2. **Clonare il repository del workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulo 1: Comprendere la Struttura AZD per le Applicazioni AI

### Anatomia di un Template AZD per AI

Esplora i file chiave in un template AZD pronto per l'AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
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
- Definizioni dei servizi per componenti AI
- Mappature delle variabili d'ambiente
- Configurazioni degli host

2. **Revisiona il main.bicep dell'infrastruttura:**
```bash
cat infra/main.bicep
```

**Pattern chiave per l'AI da identificare:**
- Provisioning del servizio Microsoft Foundry Models
- Integrazione con Azure AI Search
- Gestione sicura delle chiavi
- Configurazioni di sicurezza di rete

### **Punto di Discussione:** Perché questi pattern sono importanti per l'AI

- **Dipendenze dei servizi**: le app AI spesso richiedono più servizi coordinati
- **Sicurezza**: chiavi API ed endpoint necessitano di gestione sicura
- **Scalabilità**: i carichi di lavoro AI hanno requisiti di scalabilità unici
- **Gestione dei costi**: i servizi AI possono essere costosi se non configurati correttamente

## Modulo 2: Distribuire la tua Prima Applicazione AI

### Passo 2.1: Inizializzare l'Ambiente

1. **Crea un nuovo ambiente AZD:**
```bash
azd env new myai-workshop
```

2. **Imposta i parametri richiesti:**
```bash
# Imposta la tua regione Azure preferita
azd env set AZURE_LOCATION eastus

# Opzionale: Imposta un modello OpenAI specifico
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Passo 2.2: Distribuire l'Infrastruttura e l'Applicazione

1. **Distribuisci con AZD:**
```bash
azd up
```

**Cosa succede durante `azd up`:**
- ✅ Provisiona il servizio Microsoft Foundry Models
- ✅ Crea il servizio Azure AI Search
- ✅ Configura App Service per l'app web
- ✅ Configura rete e sicurezza
- ✅ Distribuisce il codice applicativo
- ✅ Imposta monitoraggio e logging

2. **Monitora l'avanzamento della distribuzione** e prendi nota delle risorse create.

### Passo 2.3: Verificare la Distribuzione

1. **Controlla le risorse distribuite:**
```bash
azd show
```

2. **Apri l'applicazione distribuita:**
```bash
azd show
```

Apri l'endpoint web mostrato nell'output di `azd show`.

3. **Testa la funzionalità AI:**
   - Naviga nell'applicazione web
   - Prova query di esempio
   - Verifica che le risposte AI funzionino

### **Esercizio di Laboratorio 2.1: Esercizio di Troubleshooting**

**Scenario**: La distribuzione è riuscita ma l'AI non risponde.

**Problemi comuni da verificare:**
1. **OpenAI API keys**: Verifica che siano impostate correttamente
2. **Disponibilità del modello**: Controlla se la tua regione supporta il modello
3. **Connettività di rete**: Assicurati che i servizi possano comunicare
4. **Permessi RBAC**: Verifica che l'app possa accedere a OpenAI

**Comandi di debug:**
```bash
# Controlla le variabili d'ambiente
azd env get-values

# Visualizza i log di distribuzione
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verifica lo stato della distribuzione OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modulo 3: Personalizzare le Applicazioni AI per le Tue Esigenze

### Passo 3.1: Modificare la Configurazione AI

1. **Aggiorna il modello OpenAI:**
```bash
# Passa a un modello diverso (se disponibile nella tua regione)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Ridispiega con la nuova configurazione
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

### Passo 3.2: Configurazioni Specifiche per Ambiente

**Buona Pratica**: Configurazioni diverse per sviluppo e produzione.

1. **Crea un ambiente di produzione:**
```bash
azd env new myai-production
```

2. **Imposta parametri specifici per la produzione:**
```bash
# In produzione si utilizzano tipicamente SKU di livello superiore
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Abilitare funzionalità di sicurezza aggiuntive
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Esercizio di Laboratorio 3.1: Ottimizzazione dei Costi**

**Sfida**: Configura il template per uno sviluppo a basso costo.

**Compiti:**
1. Identifica quali SKU possono essere impostati su livelli free/basic
2. Configura variabili d'ambiente per costi minimi
3. Distribuisci e confronta i costi con la configurazione di produzione

**Suggerimenti per la soluzione:**
- Usa il livello F0 (gratuito) per Azure AI Services quando possibile
- Usa il livello Basic per il Search Service in sviluppo
- Considera l'uso del piano Consumption per le Functions

## Modulo 4: Sicurezza e Best Practice per la Produzione

### Passo 4.1: Gestione Sicura delle Credenziali

**Sfida attuale**: Molte app AI inseriscono chiavi API nel codice o usano archiviazioni non sicure.

**Soluzione AZD**: Managed Identity + integrazione con Key Vault.

1. **Revisiona la configurazione di sicurezza nel tuo template:**
```bash
# Cerca la configurazione di Key Vault e dell'Identità gestita
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifica che la Managed Identity funzioni:**
```bash
# Verificare se l'app web ha la corretta configurazione dell'identità
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Sicurezza di Rete

1. **Abilita private endpoints** (se non già configurati):

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

### Passo 4.3: Monitoraggio e Osservabilità

1. **Configura Application Insights:**
```bash
# Application Insights dovrebbe essere configurato automaticamente
# Controlla la configurazione:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Imposta monitoraggio specifico per l'AI:**

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

**Compito**: Revisiona la tua distribuzione per le best practice di sicurezza.

**Checklist:**
- [ ] Nessun segreto hardcoded nel codice o nella configurazione
- [ ] Managed Identity utilizzata per l'autenticazione servizio-a-servizio
- [ ] Key Vault memorizza configurazioni sensibili
- [ ] L'accesso di rete è correttamente ristretto
- [ ] Monitoraggio e logging sono abilitati

## Modulo 5: Convertire la Tua Applicazione AI

### Passo 5.1: Scheda di Valutazione

**Prima di convertire la tua app**, rispondi a queste domande:

1. **Architettura dell'Applicazione:**
   - Quali servizi AI usa la tua app?
   - Quali risorse di calcolo richiede?
   - Richiede un database?
   - Quali sono le dipendenze tra i servizi?

2. **Requisiti di Sicurezza:**
   - Quali dati sensibili gestisce la tua app?
   - Quali requisiti di conformità hai?
   - Hai bisogno di rete privata?

3. **Requisiti di Scalabilità:**
   - Qual è il carico previsto?
   - Hai bisogno di auto-scaling?
   - Ci sono requisiti regionali?

### Passo 5.2: Crea il tuo Template AZD

**Segui questo schema per convertire la tua app:**

1. **Crea la struttura di base:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inizializza il template AZD
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

3. **Crea i template di infrastruttura:**

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

**Sfida**: Crea un template AZD per un'app AI di elaborazione documentale.

**Requisiti:**
- Microsoft Foundry Models per l'analisi dei contenuti
- Document Intelligence per OCR
- Storage Account per upload di documenti
- Function App per la logica di elaborazione
- Web app per l'interfaccia utente

**Punti bonus:**
- Aggiungi gestione degli errori adeguata
- Includi stima dei costi
- Imposta dashboard di monitoraggio

## Modulo 6: Risolvere Problemi Comuni

### Problemi Comuni di Distribuzione

#### Problema 1: Quota del Servizio OpenAI Superata
**Sintomi:** La distribuzione fallisce con errore di quota
**Soluzioni:**
```bash
# Controlla le quote correnti
az cognitiveservices usage list --location eastus

# Richiedi un aumento delle quote o prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modello Non Disponibile nella Regione
**Sintomi:** Le risposte AI falliscono o la distribuzione del modello genera errori
**Soluzioni:**
```bash
# Verificare la disponibilità del modello per regione
az cognitiveservices model list --location eastus

# Aggiornare al modello disponibile
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problema 3: Problemi di Permessi
**Sintomi:** Errori 403 Forbidden quando si chiamano i servizi AI
**Soluzioni:**
```bash
# Verificare le assegnazioni dei ruoli
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Aggiungere i ruoli mancanti
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemi di Prestazioni

#### Problema 4: Risposte AI Lente
**Passi di indagine:**
1. Controlla Application Insights per le metriche di prestazioni
2. Revisiona le metriche del servizio OpenAI nel portale Azure
3. Verifica connettività di rete e latenza

**Soluzioni:**
- Implementa caching per query comuni
- Usa il modello OpenAI appropriato per il tuo caso d'uso
- Considera repliche di lettura per scenari ad alto carico

### **Esercizio di Laboratorio 6.1: Sfida di Debugging**

**Scenario**: La distribuzione è riuscita, ma l'applicazione restituisce errori 500.

**Compiti di debugging:**
1. Controlla i log dell'applicazione
2. Verifica la connettività dei servizi
3. Testa l'autenticazione
4. Revisiona la configurazione

**Strumenti da usare:**
- `azd show` per panoramica della distribuzione
- Portale Azure per i log dettagliati dei servizi
- Application Insights per la telemetria dell'applicazione

## Modulo 7: Monitoraggio e Ottimizzazione

### Passo 7.1: Impostare un Monitoraggio Completo

1. **Crea dashboard personalizzate:**

Vai sul portale Azure e crea una dashboard con:
- Conteggio richieste OpenAI e latenza
- Tassi di errore dell'applicazione
- Utilizzo delle risorse
- Monitoraggio dei costi

2. **Imposta avvisi:**
```bash
# Avviso per elevato tasso di errori
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Passo 7.2: Ottimizzazione dei Costi

1. **Analizza i costi attuali:**
```bash
# Usa Azure CLI per ottenere i dati sui costi
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementa controlli dei costi:**
- Configura avvisi di budget
- Usa politiche di autoscaling
- Implementa caching delle richieste
- Monitora l'uso dei token per OpenAI

### **Esercizio di Laboratorio 7.1: Ottimizzazione delle Prestazioni**

**Compito**: Ottimizza la tua applicazione AI sia per prestazioni che per costi.

**Metriche da migliorare:**
- Ridurre il tempo medio di risposta del 20%
- Ridurre i costi mensili del 15%
- Mantenere il 99.9% di uptime

**Strategie da provare:**
- Implementare caching delle risposte
- Ottimizzare i prompt per l'efficienza dei token
- Usare SKU di calcolo appropriati
- Configurare un autoscaling adeguato

## Sfida Finale: Implementazione End-to-End

### Scenario della Sfida

Sei incaricato di creare un chatbot per il servizio clienti pronto per la produzione con questi requisiti:

**Requisiti Funzionali:**
- Interfaccia web per le interazioni con i clienti
- Integrazione con Microsoft Foundry Models per le risposte
- Capacità di ricerca documentale usando Azure AI Search
- Integrazione con il database clienti esistente
- Supporto multilingue

**Requisiti Non Funzionali:**
- Gestire 1000 utenti concorrenti
- SLA di uptime 99.9%
- Conformità SOC 2
- Costo inferiore a $500/mese
- Distribuire in più ambienti (dev, staging, prod)

### Passi di Implementazione

1. **Progettare l'architettura**
2. **Creare il template AZD**
3. **Implementare misure di sicurezza**
4. **Configurare monitoraggio e alerting**
5. **Creare pipeline di distribuzione**
6. **Documentare la soluzione**

### Criteri di Valutazione

- ✅ **Funzionalità**: Soddisfa tutti i requisiti?
- ✅ **Sicurezza**: Le best practice sono implementate?
- ✅ **Scalabilità**: Può gestire il carico?
- ✅ **Manutenibilità**: Codice e infrastruttura sono ben organizzati?
- ✅ **Costo**: Rimane entro il budget?

## Risorse Aggiuntive

### Documentazione Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Template di Esempio
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Risorse della community
- [Discord di Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub di Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificato di completamento

Congratulazioni! Hai completato il laboratorio del workshop sull'IA. Ora dovresti essere in grado di:

- ✅ Convertire applicazioni AI esistenti in template AZD
- ✅ Distribuire applicazioni AI pronte per la produzione
- ✅ Implementare le best practice di sicurezza per i carichi di lavoro AI
- ✅ Monitorare e ottimizzare le prestazioni delle applicazioni AI
- ✅ Risolvere i problemi comuni di distribuzione

### Prossimi Passi
1. Applica questi modelli ai tuoi progetti AI
2. Contribuisci con i template alla community
3. Unisciti al Discord di Microsoft Foundry per supporto continuo
4. Esplora argomenti avanzati come le distribuzioni multi-regione

---

**Feedback sul workshop**: Aiutaci a migliorare questo workshop condividendo la tua esperienza nel [Canale #Azure di Microsoft Foundry su Discord](https://discord.gg/microsoft-azure).

---

**Navigazione Capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo incentrato sull'IA
- **⬅️ Precedente**: [Distribuzione del modello AI](ai-model-deployment.md)
- **➡️ Successivo**: [Best practice per l'AI in produzione](production-ai-practices.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Unisciti alla nostra community per supporto e discussioni su AZD e sulle distribuzioni AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->