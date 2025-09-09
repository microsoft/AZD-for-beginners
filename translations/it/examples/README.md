<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T20:01:29+00:00",
  "source_file": "examples/README.md",
  "language_code": "it"
}
-->
# Esempi - Template e Configurazioni Pratiche AZD

## Introduzione

Questa directory contiene esempi pratici, template e scenari reali per aiutarti a imparare Azure Developer CLI attraverso esercitazioni pratiche. Ogni esempio fornisce codice funzionante completo, template di infrastruttura e istruzioni dettagliate per diverse architetture applicative e modelli di distribuzione.

## Obiettivi di Apprendimento

Lavorando su questi esempi, potrai:
- Praticare i flussi di lavoro di Azure Developer CLI con scenari applicativi realistici
- Comprendere diverse architetture applicative e le loro implementazioni con azd
- Padroneggiare i modelli di Infrastructure as Code per vari servizi Azure
- Applicare strategie di gestione della configurazione e distribuzione specifiche per ambiente
- Implementare modelli di monitoraggio, sicurezza e scalabilità in contesti pratici
- Acquisire esperienza con il troubleshooting e il debugging di scenari di distribuzione reali

## Risultati di Apprendimento

Completando questi esempi, sarai in grado di:
- Distribuire con sicurezza diversi tipi di applicazioni utilizzando Azure Developer CLI
- Adattare i template forniti alle tue esigenze applicative
- Progettare e implementare modelli di infrastruttura personalizzati utilizzando Bicep
- Configurare applicazioni complesse multi-servizio con dipendenze adeguate
- Applicare le migliori pratiche di sicurezza, monitoraggio e prestazioni in scenari reali
- Risolvere problemi e ottimizzare le distribuzioni basandoti sull'esperienza pratica

## Struttura della Directory

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Esempi Rapidi

### Per Principianti
1. **[Simple Web App](../../../examples/simple-web-app)** - Distribuisci un'applicazione web Node.js di base
2. **[Static Website](../../../examples/static-website)** - Ospita un sito web statico su Azure Storage
3. **[Container App](../../../examples/container-app)** - Distribuisci un'applicazione containerizzata

### Per Utenti Intermedi
4. **[Database App](../../../examples/database-app)** - Applicazione web con database PostgreSQL
5. **[Serverless Function](../../../examples/serverless-function)** - Funzioni Azure con trigger HTTP
6. **[Microservices](../../../examples/microservices)** - Applicazione multi-servizio con API gateway

## 📋 Istruzioni per l'Uso

### Esecuzione degli Esempi in Locale

1. **Clona o Copia l'Esempio**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inizializza l'Ambiente AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configura l'Ambiente**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Distribuisci**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adattamento degli Esempi

Ogni esempio include:
- **README.md** - Istruzioni dettagliate per configurazione e personalizzazione
- **azure.yaml** - Configurazione AZD con commenti
- **infra/** - Template Bicep con spiegazioni sui parametri
- **src/** - Codice applicativo di esempio
- **scripts/** - Script di supporto per attività comuni

## 🎯 Obiettivi di Apprendimento

### Categorie di Esempi

#### **Distribuzioni di Base**
- Applicazioni a servizio singolo
- Modelli di infrastruttura semplici
- Gestione di configurazioni di base
- Configurazioni economiche per sviluppo

#### **Scenari Avanzati**
- Architetture multi-servizio
- Configurazioni di rete complesse
- Modelli di integrazione con database
- Implementazioni di sicurezza e conformità

#### **Modelli Pronti per la Produzione**
- Configurazioni ad alta disponibilità
- Monitoraggio e osservabilità
- Integrazione CI/CD
- Configurazioni per il recupero da disastri

## 📖 Descrizioni degli Esempi

### Simple Web App
**Tecnologie**: Node.js, App Service, Application Insights  
**Complessità**: Principiante  
**Concetti**: Distribuzione di base, variabili di ambiente, controlli di salute

### Static Website
**Tecnologie**: HTML/CSS/JS, Storage Account, CDN  
**Complessità**: Principiante  
**Concetti**: Hosting statico, integrazione CDN, domini personalizzati

### Container App
**Tecnologie**: Docker, Container Apps, Container Registry  
**Complessità**: Intermedio  
**Concetti**: Containerizzazione, scalabilità, configurazione ingress

### Database App
**Tecnologie**: Python Flask, PostgreSQL, App Service  
**Complessità**: Intermedio  
**Concetti**: Connessioni al database, gestione dei segreti, migrazioni

### Serverless Function
**Tecnologie**: Azure Functions, Cosmos DB, API Management  
**Complessità**: Intermedio  
**Concetti**: Architettura event-driven, bindings, gestione API

### Microservices
**Tecnologie**: Servizi multipli, Service Bus, API Gateway  
**Complessità**: Avanzato  
**Concetti**: Comunicazione tra servizi, code di messaggi, bilanciamento del carico

## 🛠 Esempi di Configurazione

La directory `configurations/` contiene componenti riutilizzabili:

### Configurazioni di Ambiente
- Impostazioni per ambiente di sviluppo
- Configurazioni per ambiente di staging
- Configurazioni pronte per la produzione
- Setup di distribuzione multi-regione

### Moduli Bicep
- Componenti di infrastruttura riutilizzabili
- Modelli di risorse comuni
- Template con sicurezza avanzata
- Configurazioni ottimizzate per i costi

### Script di Supporto
- Automazione del setup dell'ambiente
- Script per migrazioni di database
- Strumenti di validazione delle distribuzioni
- Utilità per il monitoraggio dei costi

## 🔧 Guida alla Personalizzazione

### Adattamento degli Esempi alle Tue Esigenze

1. **Revisione dei Prerequisiti**
   - Controlla i requisiti dei servizi Azure
   - Verifica i limiti della sottoscrizione
   - Comprendi le implicazioni sui costi

2. **Modifica della Configurazione**
   - Aggiorna le definizioni dei servizi in `azure.yaml`
   - Personalizza i template Bicep
   - Regola le variabili di ambiente

3. **Test Approfonditi**
   - Distribuisci prima nell'ambiente di sviluppo
   - Valida la funzionalità
   - Testa scalabilità e prestazioni

4. **Revisione della Sicurezza**
   - Controlla i controlli di accesso
   - Implementa la gestione dei segreti
   - Abilita monitoraggio e avvisi

## 📊 Tabella Comparativa

| Esempio | Servizi | Database | Autenticazione | Monitoraggio | Complessità |
|---------|----------|----------|----------------|--------------|-------------|
| Simple Web App | 1 | ❌ | Base | Base | ⭐ |
| Static Website | 1 | ❌ | ❌ | Base | ⭐ |
| Container App | 1 | ❌ | Base | Completo | ⭐⭐ |
| Database App | 2 | ✅ | Completo | Completo | ⭐⭐⭐ |
| Serverless Function | 3 | ✅ | Completo | Completo | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Completo | Completo | ⭐⭐⭐⭐ |

## 🎓 Percorso di Apprendimento

### Progressione Consigliata

1. **Inizia con Simple Web App**
   - Impara i concetti base di AZD
   - Comprendi il flusso di distribuzione
   - Pratica la gestione degli ambienti

2. **Prova Static Website**
   - Esplora diverse opzioni di hosting
   - Impara l'integrazione con CDN
   - Comprendi la configurazione DNS

3. **Passa a Container App**
   - Impara le basi della containerizzazione
   - Comprendi i concetti di scalabilità
   - Pratica con Docker

4. **Aggiungi l'Integrazione con Database**
   - Impara il provisioning del database
   - Comprendi le stringhe di connessione
   - Pratica la gestione dei segreti

5. **Esplora Serverless**
   - Comprendi l'architettura event-driven
   - Impara i trigger e i bindings
   - Pratica con le API

6. **Costruisci Microservices**
   - Impara la comunicazione tra servizi
   - Comprendi i sistemi distribuiti
   - Pratica distribuzioni complesse

## 🔍 Trovare l'Esempio Giusto

### Per Stack Tecnologico
- **Node.js**: Simple Web App, Microservices
- **Python**: Database App, Serverless Function
- **Siti Statici**: Static Website
- **Container**: Container App, Microservices
- **Database**: Database App, Serverless Function

### Per Modello Architetturale
- **Monolitico**: Simple Web App, Database App
- **Statico**: Static Website
- **Microservizi**: Esempio Microservices
- **Serverless**: Serverless Function
- **Ibrido**: Container App

### Per Livello di Complessità
- **Principiante**: Simple Web App, Static Website
- **Intermedio**: Container App, Database App, Serverless Function  
- **Avanzato**: Microservices

## 📚 Risorse Aggiuntive

### Link alla Documentazione
- [AZD Template Specification](https://aka.ms/azd/templates)
- [Documentazione Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Esempi della Comunità
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)

### Migliori Pratiche
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuire con Esempi

Hai un esempio utile da condividere? Accogliamo con piacere i contributi!

### Linee Guida per la Presentazione
1. Segui la struttura della directory stabilita
2. Includi un README.md completo
3. Aggiungi commenti ai file di configurazione
4. Testa accuratamente prima di inviare
5. Includi stime sui costi e prerequisiti

### Struttura del Template per gli Esempi
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Consiglio**: Inizia con l'esempio più semplice che corrisponde al tuo stack tecnologico, poi passa gradualmente a scenari più complessi. Ogni esempio si basa sui concetti dei precedenti!

**Prossimi Passi**: 
- Scegli un esempio che corrisponde al tuo livello di competenza
- Segui le istruzioni di configurazione nel README dell'esempio
- Sperimenta con le personalizzazioni
- Condividi le tue esperienze con la comunità

---

**Navigazione**
- **Lezione Precedente**: [Guida allo Studio](../resources/study-guide.md)
- **Torna a**: [README Principale](../README.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.