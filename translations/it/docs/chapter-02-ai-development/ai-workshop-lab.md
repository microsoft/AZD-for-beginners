# Laboratorio Workshop AI: Rendere le Tue Soluzioni AI Distribuibili con AZD

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [Distribuzione Modelli AI](ai-model-deployment.md)
- **➡️ Successivo**: [Best Practice AI in Produzione](production-ai-practices.md)
- **🚀 Prossimo Capitolo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

## Panoramica del Workshop

Questo laboratorio pratico guida gli sviluppatori attraverso il processo di prendere un modello AI esistente e distribuirlo usando Azure Developer CLI (AZD). Imparerai i pattern essenziali per le distribuzioni AI in produzione usando i servizi Microsoft Foundry.

> **Nota di validazione (13-07-2026):** Questo workshop è stato verificato con `azd` `1.27.1`. Se la tua installazione locale è più vecchia, aggiorna AZD prima di iniziare affinché il flusso di autenticazione, modello e distribuzione corrisponda ai passaggi seguenti.

**Durata:** 2-3 ore  
**Livello:** Intermedio  
**Prerequisiti:** Conoscenze di base di Azure, familiarità con concetti AI/ML

## 🎓 Obiettivi di Apprendimento

Al termine di questo workshop, sarai in grado di:
- ✅ Convertire un'applicazione AI esistente per usare i modelli AZD
- ✅ Configurare i servizi Microsoft Foundry con AZD
- ✅ Implementare una gestione sicura delle credenziali per i servizi AI
- ✅ Distribuire applicazioni AI pronte per la produzione con monitoraggio
- ✅ Risolvere problemi comuni nelle distribuzioni AI

## Prerequisiti

### Strumenti Richiesti
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installato
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installato
- [Git](https://git-scm.com/) installato
- Editor di codice (consigliato VS Code)

### Risorse Azure
- Sottoscrizione Azure con accesso da collaboratore
- Accesso ai servizi Microsoft Foundry Models (o possibilità di richiedere accesso)
- Permessi per creare gruppi di risorse

### Prerequisiti di Conoscenza
- Comprensione base dei servizi Azure
- Familiarità con interfacce a riga di comando
- Concetti base AI/ML (API, modelli, prompt)

## Configurazione del Laboratorio

### Passo 1: Preparazione dell'Ambiente

1. **Verifica l'installazione degli strumenti:**
```bash
# Verifica l'installazione di AZD
azd version

# Verifica Azure CLI
az --version

# Accedi ad Azure per i workflow AZD
azd auth login

# Accedi ad Azure CLI solo se prevedi di eseguire comandi az durante la diagnostica
az login
```

Se lavori con più tenant o la sottoscrizione non viene rilevata automaticamente, riprova con `azd auth login --tenant-id <tenant-id>`.

2. **Clona il repository del workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulo 1: Comprendere la Struttura AZD per Applicazioni AI

### Anatomia di un Modello AZD AI

Esplora i file chiave in un modello AZD pronto per AI:

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
- Definizioni di servizi per componenti AI
- Mappature delle variabili d'ambiente
- Configurazioni host

2. **Rivedi l'infrastruttura main.bicep:**
```bash
cat infra/main.bicep
```

**Pattern AI chiave da identificare:**
- Provisioning servizio Microsoft Foundry Models
- Integrazione Azure AI Search
- Gestione sicura delle chiavi
- Configurazioni di sicurezza di rete

### **Punto di Discussione:** Perché Questi Pattern Sono Importanti per AI

- **Dipendenze dei Servizi**: Le app AI spesso necessitano di servizi coordinati multipli
- **Sicurezza**: Le chiavi API e gli endpoint devono essere gestiti in modo sicuro
- **Scalabilità**: I carichi AI hanno esigenze di scalabilità uniche
- **Gestione Costi**: I servizi AI possono essere costosi se non configurati correttamente

## Modulo 2: Distribuisci la Tua Prima Applicazione AI

### Passo 2.1: Inizializza l'Ambiente

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

### Passo 2.2: Distribuisci l'Infrastruttura e l'Applicazione

1. **Distribuisci con AZD:**
```bash
azd up
```

**Cosa succede durante `azd up`:**
- ✅ Provisiona il servizio Microsoft Foundry Models
- ✅ Crea il servizio Azure AI Search
- ✅ Imposta App Service per l'app web
- ✅ Configura networking e sicurezza
- ✅ Distribuisce il codice dell'applicazione
- ✅ Configura monitoraggio e logging

2. **Monitora il progresso della distribuzione** e annota le risorse create.

### Passo 2.3: Verifica la Tua Distribuzione

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
   - Naviga sull'applicazione web
   - Prova query di esempio
   - Verifica che le risposte AI funzionino

### **Esercizio di Laboratorio 2.1: Pratica di Risoluzione Problemi**

**Scenario**: La tua distribuzione è riuscita, ma l'AI non risponde.

**Problemi comuni da verificare:**
1. **Chiavi API OpenAI**: Verifica che siano impostate correttamente
2. **Disponibilità del modello**: Controlla se la tua regione supporta il modello
3. **Connettività di rete**: Assicurati che i servizi possano comunicare
4. **Permessi RBAC**: Verifica che l'app possa accedere a OpenAI

**Comandi di debugging:**
```bash
# Verifica le variabili di ambiente
azd env get-values

# Visualizza i log di distribuzione
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verifica lo stato della distribuzione di OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modulo 3: Personalizzare le Applicazioni AI per le Tue Esigenze

### Passo 3.1: Modifica la Configurazione AI

1. **Aggiorna il modello OpenAI:**
```bash
# Passa a un modello diverso (se disponibile nella tua regione)
azd env set AZURE_OPENAI_MODEL gpt-4.1

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

### Passo 3.2: Configurazioni Specifiche per Ambiente

**Best Practice**: Configurazioni differenti per sviluppo e produzione.

1. **Crea un ambiente di produzione:**
```bash
azd env new myai-production
```

2. **Imposta parametri specifici per la produzione:**
```bash
# La produzione utilizza solitamente SKU più elevati
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Abilita funzionalità di sicurezza aggiuntive
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Esercizio di Laboratorio 3.1: Ottimizzazione dei Costi**

**Sfida**: Configura il modello per uno sviluppo costo-efficiente.

**Compiti:**
1. Identifica quali SKU possono essere impostate al livello gratuito/base
2. Configura variabili d'ambiente per costi minimi
3. Distribuisci e confronta i costi con la configurazione di produzione

**Suggerimenti per la soluzione:**
- Usa il livello F0 (gratuito) per i Servizi Azure AI quando possibile
- Usa il livello Base per il Servizio di Ricerca in sviluppo
- Considera l'uso del piano a consumo per le Funzioni

## Modulo 4: Sicurezza e Best Practice in Produzione

### Passo 4.1: Gestione Sicura delle Credenziali

**Sfida attuale**: Molte app AI usano chiavi API hardcoded o archiviazione non sicura.

**Soluzione AZD**: Identità gestita + integrazione con Key Vault.

1. **Rivedi la configurazione di sicurezza nel tuo modello:**
```bash
# Cerca la configurazione di Key Vault e Identità Gestita
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifica che l'Identità Gestita funzioni:**
```bash
# Verifica se l'app web ha la configurazione dell'identità corretta
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Sicurezza di Rete

1. **Abilita endpoint privati** (se non già configurati):

Aggiungi al tuo modello bicep:
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

2. **Imposta monitoraggio specifico AI:**

Aggiungi metriche personalizzate per operazioni AI:
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

**Compito**: Rivedi la tua distribuzione per best practice di sicurezza.

**Lista di controllo:**
- [ ] Nessun segreto hardcoded nel codice o configurazione
- [ ] Usata Identità Gestita per autenticazione servizio a servizio
- [ ] Key Vault contiene configurazioni sensibili
- [ ] Accesso di rete correttamente ristretto
- [ ] Monitoraggio e logging abilitati

## Modulo 5: Conversione della Tua Applicazione AI

### Passo 5.1: Foglio di Valutazione

**Prima di convertire la tua app**, rispondi a queste domande:

1. **Architettura dell'Applicazione:**
   - Quali servizi AI utilizza la tua app?
   - Quali risorse di calcolo necessita?
   - Ha bisogno di un database?
   - Quali sono le dipendenze tra i servizi?

2. **Requisiti di Sicurezza:**
   - Quali dati sensibili gestisce la tua app?
   - Quali requisiti di conformità hai?
   - Hai bisogno di networking privato?

3. **Requisiti di Scalabilità:**
   - Qual è il carico previsto?
   - Hai bisogno di auto-scaling?
   - Ci sono requisiti regionali?

### Passo 5.2: Crea il Tuo Modello AZD

**Segui questo schema per convertire la tua app:**

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

3. **Crea i modelli di infrastruttura:**

**infra/main.bicep** - Modello principale:
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

### **Esercizio di Laboratorio 5.1: Sfida di Creazione Modello**

**Sfida**: Crea un modello AZD per un'app AI di elaborazione documenti.

**Requisiti:**
- Microsoft Foundry Models per analisi contenuto
- Document Intelligence per OCR
- Account di archiviazione per caricamento documenti
- Function App per logica di elaborazione
- App web per interfaccia utente

**Punti bonus:**
- Aggiungi gestione errori adeguata
- Includi stima dei costi
- Imposta dashboard di monitoraggio

## Modulo 6: Risoluzione di Problemi Comuni

### Problemi Comuni di Distribuzione

#### Problema 1: Quota del Servizio OpenAI Superata
**Sintomi:** Distribuzione fallisce con errore di quota
**Soluzioni:**
```bash
# Verifica le quote attuali
az cognitiveservices usage list --location eastus

# Richiedi un aumento della quota o prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modello Non Disponibile nella Regione
**Sintomi:** Risposte AI falliscono o errori nel deploy del modello
**Soluzioni:**
```bash
# Verifica la disponibilità del modello per regione
az cognitiveservices model list --location eastus

# Aggiorna al modello disponibile
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problema 3: Problemi di Permessi
**Sintomi:** Errori 403 Forbidden chiamando servizi AI
**Soluzioni:**
```bash
# Controlla le assegnazioni dei ruoli
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Aggiungi i ruoli mancanti
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemi di Prestazioni

#### Problema 4: Risposte AI Lente
**Passi per l'indagine:**
1. Controlla metriche di performance su Application Insights
2. Rivedi metriche servizio OpenAI nel portale Azure
3. Verifica connettività e latenza di rete

**Soluzioni:**
- Implementa caching per query comuni
- Usa modello OpenAI adeguato al tuo caso
- Considera repliche di lettura per scenari ad alto carico

### **Esercizio di Laboratorio 6.1: Sfida di Debug**

**Scenario**: La tua distribuzione è riuscita, ma l'applicazione restituisce errori 500.

**Compiti di debug:**
1. Controlla i log dell'applicazione
2. Verifica connettività del servizio
3. Testa l'autenticazione
4. Rivedi la configurazione

**Strumenti da usare:**
- `azd show` per panoramica distribuzione
- Portale Azure per log dettagliati dei servizi
- Application Insights per telemetria applicazione

## Modulo 7: Monitoraggio e Ottimizzazione

### Passo 7.1: Configura Monitoraggio Completo

1. **Crea dashboard personalizzate:**

Naviga nel portale Azure e crea una dashboard con:
- Conteggio richieste OpenAI e latenza
- Tassi di errori applicazione
- Utilizzo risorse
- Tracciamento costi

2. **Imposta avvisi:**
```bash
# Avviso per alto tasso di errore
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

2. **Implementa controlli di costo:**
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
- Implementa caching delle risposte
- Ottimizza i prompt per efficienza token
- Usa SKU di calcolo appropriate
- Imposta autoscaling adeguato

## Sfida Finale: Implementazione End-to-End

### Scenario della Sfida

Ti è stato chiesto di creare un chatbot per assistenza clienti AI-ready in produzione con questi requisiti:

**Requisiti Funzionali:**
- Interfaccia web per interazioni clienti
- Integrazione con Microsoft Foundry Models per risposte
- Capacità di ricerca documenti con Azure AI Search
- Integrazione con database clienti esistente
- Supporto multilingua

**Requisiti Non Funzionali:**
- Gestire 1000 utenti concorrenti
- SLA di uptime al 99.9%
- Conformità SOC 2
- Costo sotto $500/mese
- Distribuzione in più ambienti (dev, staging, prod)

### Passi di Implementazione

1. **Progetta l'architettura**
2. **Crea il modello AZD**
3. **Implementa misure di sicurezza**
4. **Configura monitoraggio e allarmi**
5. **Crea pipeline di distribuzione**
6. **Documenta la soluzione**

### Criteri di Valutazione

- ✅ **Funzionalità**: Soddisfa tutti i requisiti?
- ✅ **Sicurezza**: Sono implementate le best practice?
- ✅ **Scalabilità**: Riesce a gestire il carico?
- ✅ **Manutenibilità**: Il codice e l'infrastruttura sono ben organizzati?
- ✅ **Costo**: Rimane entro il budget?

## Risorse Aggiuntive

### Documentazione Microsoft
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentazione Servizio Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentazione Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Modelli di Esempio
- [App Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart App Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Risorse della Community
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificato di Completamento

Congratulazioni! Hai completato il Laboratorio AI Workshop. Ora dovresti essere in grado di:

- ✅ Convertire applicazioni AI esistenti in modelli AZD
- ✅ Distribuire applicazioni AI pronte per la produzione
- ✅ Implementare le migliori pratiche di sicurezza per i carichi di lavoro AI
- ✅ Monitorare e ottimizzare le prestazioni delle applicazioni AI
- ✅ Risolvere problemi comuni di distribuzione

### Passi Successivi
1. Applicare questi modelli ai tuoi progetti AI
2. Contribuire con modelli alla community
3. Unirti al Microsoft Foundry Discord per supporto continuo
4. Esplorare argomenti avanzati come le distribuzioni multi-regione

---

**Feedback sul Workshop**: Aiutaci a migliorare questo workshop condividendo la tua esperienza nel [canale #Azure del Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [Distribuzione Modelli AI](ai-model-deployment.md)
- **➡️ Successivo**: [Migliori Pratiche per AI in Produzione](production-ai-practices.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

**Hai Bisogno di Aiuto?** Unisciti alla nostra community per supporto e discussioni su AZD e distribuzioni AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->