# Laboratorio AI: Rendere le tue soluzioni AI distribuibili con AZD

**Navigazione del Capitolo:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [Distribuzione del modello AI](ai-model-deployment.md)
- **➡️ Successivo**: [Best practice per AI in produzione](production-ai-practices.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

## Panoramica del Workshop

Questo laboratorio pratico guida gli sviluppatori attraverso il processo di prendere un template AI esistente e distribuirlo usando Azure Developer CLI (AZD). Imparerai pattern essenziali per distribuzioni AI in produzione utilizzando i servizi Microsoft Foundry.

**Durata:** 2-3 ore  
**Livello:** Intermedio  
**Prerequisiti:** Conoscenze base di Azure, familiarità con concetti AI/ML

## 🎓 Obiettivi di apprendimento

Al termine di questo workshop, sarai in grado di:
- ✅ Convertire un'applicazione AI esistente per usare i template AZD
- ✅ Configurare i servizi Microsoft Foundry con AZD
- ✅ Implementare una gestione sicura delle credenziali per i servizi AI
- ✅ Distribuire applicazioni AI pronte per la produzione con monitoraggio
- ✅ Risolvere problemi comuni di distribuzione AI

## Prerequisiti

### Strumenti richiesti
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installato
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installato
- [Git](https://git-scm.com/) installato
- Editor di codice (consigliato VS Code)

### Risorse Azure
- Sottoscrizione Azure con accesso contributore
- Accesso ai servizi Microsoft Foundry Models (o possibilità di richiedere accesso)
- Permessi per la creazione di resource group

### Conoscenze richieste
- Comprensione di base dei servizi Azure
- Familiarità con interfacce a riga di comando
- Concetti base di AI/ML (API, modelli, prompt)

## Configurazione del laboratorio

### Passo 1: Preparazione dell'ambiente

1. **Verifica l'installazione degli strumenti:**
```bash
# Verificare l'installazione di AZD
azd version

# Verificare l'installazione di Azure CLI
az --version

# Accedere ad Azure
az login
azd auth login
```

2. **Clona il repository del workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulo 1: Comprendere la struttura AZD per applicazioni AI

### Anatomia di un template AZD per AI

Esplora i file chiave in un template AZD pronto per l'AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Esercizio di laboratorio 1.1: Esplora la configurazione**

1. **Esamina il file azure.yaml:**
```bash
cat azure.yaml
```

**Cosa cercare:**
- Definizioni dei servizi per i componenti AI
- Mappature delle variabili d'ambiente
- Configurazioni di host

2. **Rivedi l'infrastruttura main.bicep:**
```bash
cat infra/main.bicep
```

**Pattern AI chiave da identificare:**
- Provisioning del servizio Microsoft Foundry Models
- Integrazione con Cognitive Search
- Gestione sicura delle chiavi
- Configurazioni di sicurezza di rete

### **Punto di discussione:** Perché questi pattern sono importanti per l'AI

- **Service Dependencies**: Le app AI spesso richiedono più servizi coordinati
- **Security**: Le chiavi API e gli endpoint necessitano di gestione sicura
- **Scalability**: I carichi di lavoro AI hanno requisiti di scaling unici
- **Cost Management**: I servizi AI possono essere costosi se non configurati correttamente

## Modulo 2: Distribuisci la tua prima applicazione AI

### Passo 2.1: Inizializza l'ambiente

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

### Passo 2.2: Distribuisci infrastruttura e applicazione

1. **Distribuisci con AZD:**
```bash
azd up
```

**Cosa accade durante `azd up`:**
- ✅ Provisiona il servizio Microsoft Foundry Models
- ✅ Crea il servizio Cognitive Search
- ✅ Configura App Service per l'app web
- ✅ Configura rete e sicurezza
- ✅ Distribuisce il codice dell'applicazione
- ✅ Configura monitoraggio e logging

2. **Monitora il progresso della distribuzione** e annota le risorse create.

### Passo 2.3: Verifica la tua distribuzione

1. **Controlla le risorse distribuite:**
```bash
azd show
```

2. **Apri l'applicazione distribuita:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testa la funzionalità AI:**
   - Naviga all'applicazione web
   - Prova query di esempio
   - Verifica che le risposte AI funzionino

### **Esercizio di laboratorio 2.1: Esercitazione di troubleshooting**

**Scenario**: La tua distribuzione è riuscita ma l'AI non risponde.

**Problemi comuni da verificare:**
1. **OpenAI API keys**: Verifica che siano impostate correttamente
2. **Model availability**: Controlla se il tuo regione supporta il modello
3. **Network connectivity**: Assicurati che i servizi possano comunicare
4. **RBAC permissions**: Verifica che l'app possa accedere a OpenAI

**Comandi di debug:**
```bash
# Controlla le variabili d'ambiente
azd env get-values

# Visualizza i log di distribuzione
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Controlla lo stato della distribuzione OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modulo 3: Personalizzare le applicazioni AI per le tue esigenze

### Passo 3.1: Modifica la configurazione AI

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

### Passo 3.2: Configurazioni specifiche per l'ambiente

**Buona pratica**: Configurazioni diverse per sviluppo e produzione.

1. **Crea un ambiente di produzione:**
```bash
azd env new myai-production
```

2. **Imposta i parametri specifici per la produzione:**
```bash
# In produzione si usano solitamente SKU di livello superiore
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Abilita funzionalità di sicurezza aggiuntive
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Esercizio di laboratorio 3.1: Ottimizzazione dei costi**

**Sfida**: Configura il template per uno sviluppo economico.

**Compiti:**
1. Identifica quali SKU possono essere impostati su tier free/basic
2. Configura variabili d'ambiente per costi minimi
3. Distribuisci e confronta i costi con la configurazione di produzione

**Suggerimenti per la soluzione:**
- Usa il tier F0 (free) per Cognitive Services quando possibile
- Usa il tier Basic per il servizio Search in sviluppo
- Considera l'uso del piano Consumption per le Functions

## Modulo 4: Sicurezza e best practice per la produzione

### Passo 4.1: Gestione sicura delle credenziali

**Sfida attuale**: Molte app AI inseriscono chiavi API nel codice o usano archiviazione non sicura.

**Soluzione AZD**: Managed Identity + integrazione con Key Vault.

1. **Rivedi la configurazione di sicurezza nel tuo template:**
```bash
# Cerca la configurazione di Key Vault e di Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifica che Managed Identity funzioni:**
```bash
# Verificare se l'app web ha la corretta configurazione dell'identità
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Passo 4.2: Sicurezza di rete

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

### Passo 4.3: Monitoraggio e osservabilità

1. **Configura Application Insights:**
```bash
# Application Insights dovrebbe essere configurato automaticamente
# Controlla la configurazione:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configura monitoraggio specifico per l'AI:**

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

### **Esercizio di laboratorio 4.1: Audit di sicurezza**

**Compito**: Rivedi la tua distribuzione per le migliori pratiche di sicurezza.

**Checklist:**
- [ ] Nessun segreto codificato nel codice o nella configurazione
- [ ] Managed Identity utilizzata per l'autenticazione servizio-a-servizio
- [ ] Key Vault memorizza configurazioni sensibili
- [ ] L'accesso alla rete è adeguatamente ristretto
- [ ] Monitoraggio e registrazione abilitati

## Modulo 5: Convertire la tua applicazione AI

### Passo 5.1: Scheda di valutazione

**Prima di convertire la tua app**, rispondi a queste domande:

1. **Architettura dell'applicazione:**
   - Quali servizi AI usa la tua app?
   - Quali risorse di calcolo necessita?
   - Richiede un database?
   - Quali sono le dipendenze tra i servizi?

2. **Requisiti di sicurezza:**
   - Quali dati sensibili gestisce la tua app?
   - Quali requisiti di conformità hai?
   - Hai bisogno di networking privato?

3. **Requisiti di scalabilità:**
   - Qual è il carico previsto?
   - Hai bisogno di auto-scaling?
   - Ci sono requisiti regionali?

### Passo 5.2: Crea il tuo template AZD

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

### **Esercizio di laboratorio 5.1: Sfida di creazione del template**

**Sfida**: Crea un template AZD per un'app AI di elaborazione documenti.

**Requisiti:**
- Microsoft Foundry Models per l'analisi dei contenuti
- Document Intelligence per OCR
- Storage Account per l'upload dei documenti
- Function App per la logica di elaborazione
- Web app per l'interfaccia utente

**Punti bonus:**
- Aggiungi una gestione degli errori adeguata
- Includi una stima dei costi
- Configura dashboard di monitoraggio

## Modulo 6: Risoluzione dei problemi comuni

### Problemi comuni di distribuzione

#### Problema 1: Quota del servizio OpenAI superata
**Sintomi:** La distribuzione fallisce con errore di quota  
**Soluzioni:**
```bash
# Controlla le quote correnti
az cognitiveservices usage list --location eastus

# Richiedi un aumento della quota o prova una regione diversa
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modello non disponibile nella regione
**Sintomi:** Le risposte AI falliscono o ci sono errori di distribuzione del modello  
**Soluzioni:**
```bash
# Verificare la disponibilità del modello per regione
az cognitiveservices model list --location eastus

# Aggiornare al modello disponibile
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problema 3: Problemi di autorizzazione
**Sintomi:** Errori 403 Forbidden quando si chiamano i servizi AI  
**Soluzioni:**
```bash
# Verifica le assegnazioni dei ruoli
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Aggiungi i ruoli mancanti
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problemi di prestazioni

#### Problema 4: Risposte AI lente
**Passi di indagine:**
1. Controlla Application Insights per le metriche di prestazioni
2. Rivedi le metriche del servizio OpenAI nel portale Azure
3. Verifica la connettività di rete e la latenza

**Soluzioni:**
- Implementa caching per query comuni
- Usa il modello OpenAI appropriato per il tuo caso d'uso
- Considera repliche di lettura per scenari ad alto carico

### **Esercizio di laboratorio 6.1: Sfida di debugging**

**Scenario**: La tua distribuzione è riuscita, ma l'applicazione restituisce errori 500.

**Compiti di debugging:**
1. Controlla i log dell'applicazione
2. Verifica la connettività dei servizi
3. Testa l'autenticazione
4. Rivedi la configurazione

**Strumenti da utilizzare:**
- `azd show` per panoramica della distribuzione
- Portale Azure per log dettagliati dei servizi
- Application Insights per la telemetria dell'applicazione

## Modulo 7: Monitoraggio e ottimizzazione

### Passo 7.1: Configura un monitoraggio completo

1. **Crea dashboard personalizzate:**

Vai al portale di Azure e crea una dashboard con:
- Conteggio e latenza delle richieste OpenAI
- Tassi di errore dell'applicazione
- Utilizzo delle risorse
- Monitoraggio dei costi

2. **Configura avvisi:**
```bash
# Avviso di un alto tasso di errori
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Passo 7.2: Ottimizzazione dei costi

1. **Analizza i costi attuali:**
```bash
# Usa Azure CLI per ottenere i dati sui costi
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementa controlli sui costi:**
- Configura avvisi di budget
- Usa politiche di autoscaling
- Implementa caching delle richieste
- Monitora l'utilizzo dei token per OpenAI

### **Esercizio di laboratorio 7.1: Ottimizzazione delle prestazioni**

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

## Sfida finale: Implementazione end-to-end

### Scenario della sfida

Il tuo compito è creare un chatbot per il servizio clienti pronto per la produzione alimentato da AI con questi requisiti:

**Requisiti funzionali:**
- Interfaccia web per le interazioni con i clienti
- Integrazione con Microsoft Foundry Models per le risposte
- Capacità di ricerca documentale usando Cognitive Search
- Integrazione con il database clienti esistente
- Supporto multilingue

**Requisiti non funzionali:**
- Gestire 1000 utenti concorrenti
- SLA di uptime del 99.9%
- Conformità SOC 2
- Costo inferiore a $500/mese
- Distribuire in più ambienti (dev, staging, prod)

### Passi di implementazione

1. Progetta l'architettura
2. Crea il template AZD
3. Implementa misure di sicurezza
4. Configura monitoraggio e alerting
5. Crea pipeline di deployment
6. Documenta la soluzione

### Criteri di valutazione

- ✅ **Funzionalità**: Soddisfa tutti i requisiti?
- ✅ **Sicurezza**: Sono implementate le best practice?
- ✅ **Scalabilità**: Può gestire il carico?
- ✅ **Manutenibilità**: Codice e infrastruttura sono ben organizzati?
- ✅ **Costo**: Rimane entro il budget?

## Risorse aggiuntive

### Documentazione Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Template di esempio
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Risorse della community
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificato di completamento

Congratulazioni! Hai completato il laboratorio AI. Ora dovresti essere in grado di:
- ✅ Convertire le applicazioni IA esistenti in template AZD
- ✅ Distribuire applicazioni IA pronte per la produzione
- ✅ Implementare le migliori pratiche di sicurezza per i carichi di lavoro IA
- ✅ Monitorare e ottimizzare le prestazioni delle applicazioni IA
- ✅ Risolvere i problemi comuni di distribuzione

### Prossimi passi
1. Applica questi modelli ai tuoi progetti IA
2. Contribuisci con i template alla comunità
3. Unisciti al Discord di Microsoft Foundry per supporto continuo
4. Esplora argomenti avanzati come le distribuzioni multi-regione

---

**Feedback sul workshop**: Aiutaci a migliorare questo workshop condividendo la tua esperienza nel [canale Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo incentrato sull'IA
- **⬅️ Precedente**: [Distribuzione del modello IA](ai-model-deployment.md)
- **➡️ Successivo**: [Migliori pratiche per l'IA in produzione](production-ai-practices.md)
- **🚀 Capitolo successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

**Hai bisogno di aiuto?** Unisciti alla nostra community per supporto e discussioni su AZD e distribuzioni IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->