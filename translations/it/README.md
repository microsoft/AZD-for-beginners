# AZD per Principianti: Un Percorso di Apprendimento Strutturato

![AZD-per-principianti](../../translated_images/it/azdbeginners.5527441dd9f74068.webp) 

[![Osservatori GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Stelle GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord di Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduzioni Automatiche (Sempre Aggiornate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabo](../ar/README.md) | [Bengalese](../bn/README.md) | [Bulgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Cinese (Semplificato)](../zh-CN/README.md) | [Cinese (Tradizionale, Hong Kong)](../zh-HK/README.md) | [Cinese (Tradizionale, Macao)](../zh-MO/README.md) | [Cinese (Tradizionale, Taiwan)](../zh-TW/README.md) | [Croato](../hr/README.md) | [Ceco](../cs/README.md) | [Danese](../da/README.md) | [Olandese](../nl/README.md) | [Estone](../et/README.md) | [Finlandese](../fi/README.md) | [Francese](../fr/README.md) | [Tedesco](../de/README.md) | [Greco](../el/README.md) | [Ebraico](../he/README.md) | [Hindi](../hi/README.md) | [Ungherese](../hu/README.md) | [Indonesiano](../id/README.md) | [Italiano](./README.md) | [Giapponese](../ja/README.md) | [Kannada](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malese](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalese](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norvegese](../no/README.md) | [Persiano (Farsi)](../fa/README.md) | [Polacco](../pl/README.md) | [Portoghese (Brasile)](../pt-BR/README.md) | [Portoghese (Portogallo)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romeno](../ro/README.md) | [Russo](../ru/README.md) | [Serbo (Cirillico)](../sr/README.md) | [Slovacco](../sk/README.md) | [Sloveno](../sl/README.md) | [Spagnolo](../es/README.md) | [Swahili](../sw/README.md) | [Svedese](../sv/README.md) | [Tagalog (Filippino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandese](../th/README.md) | [Turco](../tr/README.md) | [Ucraino](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Preferisci clonare localmente?**

> Questo repository include oltre 50 traduzioni linguistiche che aumentano significativamente la dimensione del download. Per clonare senza traduzioni, usa sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Questo ti fornisce tutto il necessario per completare il corso con un download molto più veloce.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Che cos'è Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** è uno strumento da riga di comando orientato agli sviluppatori che semplifica la distribuzione delle applicazioni su Azure. Invece di creare e collegare manualmente dozzine di risorse Azure, puoi distribuire intere applicazioni con un singolo comando.

### La magia di `azd up`

```bash
# Questo singolo comando fa tutto:
# ✅ Crea tutte le risorse di Azure
# ✅ Configura la rete e la sicurezza
# ✅ Compila il codice della tua applicazione
# ✅ Effettua il deploy su Azure
# ✅ Ti fornisce un URL funzionante
azd up
```

**Questo è tutto!** Nessun clic nel Portale di Azure, niente template ARM complessi da imparare prima, nessuna configurazione manuale - solo applicazioni funzionanti su Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual è la differenza?

Questa è la domanda che i principianti fanno più spesso. Ecco la risposta semplice:

| Funzionalità | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scopo** | Gestire singole risorse di Azure | Distribuire applicazioni complete |
| **Mentalità** | Focalizzato sull'infrastruttura | Focalizzato sull'applicazione |
| **Esempio** | `az webapp create --name myapp...` | `azd up` |
| **Curva di apprendimento** | Richiede conoscenza dei servizi Azure | Conoscere solo la tua app |
| **Ideale per** | DevOps, Infrastruttura | Sviluppatori, Prototipazione |

### Semplice Analogia

- **Azure CLI** è come avere tutti gli strumenti per costruire una casa - martelli, seghe, chiodi. Puoi costruire qualsiasi cosa, ma devi conoscere l'edilizia.
- **Azure Developer CLI** è come assumere un appaltatore - descrivi quello che vuoi e loro si occupano della costruzione.

### Quando usare ciascuno

| Scenario | Usa |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Possono lavorare insieme!

AZD usa Azure CLI sotto il cofano. Puoi usare entrambi:
```bash
# Distribuisci la tua app con AZD
azd up

# Quindi perfeziona risorse specifiche con Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trova Template in Awesome AZD

Non partire da zero! **Awesome AZD** è la raccolta della community di modelli pronti per la distribuzione:

| Risorsa | Descrizione |
|----------|-------------|
| 🔗 [**Galleria Awesome AZD**](https://azure.github.io/awesome-azd/) | Sfoglia oltre 200 modelli con deploy con un clic |
| 🔗 [**Invia un template**](https://github.com/Azure/awesome-azd/issues) | Contribuisci con il tuo template alla community |
| 🔗 [**Repository GitHub**](https://github.com/Azure/awesome-azd) | Metti una stella ed esplora il codice sorgente |

### Template AI popolari da Awesome AZD

```bash
# Chat RAG con Azure OpenAI + Ricerca AI
azd init --template azure-search-openai-demo

# Applicazione di chat AI veloce
azd init --template openai-chat-app-quickstart

# Agenti AI con Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Come iniziare in 3 passaggi

### Passo 1: Installa AZD (2 minuti)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Passo 2: Accedi ad Azure

```bash
azd auth login
```

### Passo 3: Distribuisci la tua prima app

```bash
# Inizializza da un modello
azd init --template todo-nodejs-mongo

# Distribuisci su Azure (crea tutto!)
azd up
```

**🎉 Fatto!** La tua app è ora attiva su Azure.

### Pulizia (Non dimenticare!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Come usare questo corso

Questo corso è progettato per un **apprendimento progressivo** - parti da dove ti senti a tuo agio e procedi gradualmente:

| La tua esperienza | Inizia qui |
|-----------------|------------|
| **Nuovo su Azure** | [Capitolo 1: Fondamenti](../..) |
| **Conosci Azure, nuovo ad AZD** | [Capitolo 1: Fondamenti](../..) |
| **Vuoi distribuire app AI** | [Capitolo 2: Sviluppo incentrato sull'AI](../..) |
| **Vuoi esercitarti** | [🎓 Workshop Interattivo](workshop/README.md) - laboratorio guidato di 3-4 ore |
| **Hai bisogno di pattern per la produzione** | [Capitolo 8: Produzione & Enterprise](../..) |

### Configurazione rapida

1. **Crea un fork di questo repository**: [![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Ottieni aiuto**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Preferisci clonare localmente?**

> Questo repository include oltre 50 traduzioni linguistiche che aumentano significativamente la dimensione del download. Per clonare senza traduzioni, usa sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Questo ti fornisce tutto il necessario per completare il corso con un download molto più veloce.


## Panoramica del corso

Padroneggia Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Focus speciale sulla distribuzione di applicazioni AI con integrazione Microsoft Foundry.**

### Perché questo corso è essenziale per gli sviluppatori moderni

Basato sulle informazioni della community Discord di Microsoft Foundry, **il 45% degli sviluppatori vuole usare AZD per carichi di lavoro AI** ma incontra sfide con:
- Architetture AI complesse multi-servizio
- Best practice per la distribuzione AI in produzione  
- Integrazione e configurazione dei servizi Azure AI
- Ottimizzazione dei costi per carichi di lavoro AI
- Risoluzione dei problemi specifici di deployment AI

### Obiettivi di apprendimento

Completando questo corso strutturato, sarai in grado di:
- **Padroneggiare i fondamenti di AZD**: Concetti chiave, installazione e configurazione
- **Distribuire applicazioni AI**: Usa AZD con i servizi Microsoft Foundry
- **Implementare Infrastructure as Code**: Gestire le risorse Azure con template Bicep
- **Risoluzione dei problemi di deployment**: Risolvere problemi comuni e fare debug
- **Ottimizzare per la produzione**: Sicurezza, scaling, monitoraggio e gestione dei costi
- **Costruire soluzioni multi-agente**: Distribuire architetture AI complesse

## 🗺️ Mappa del corso: Navigazione rapida per capitolo

Ogni capitolo ha un README dedicato con obiettivi di apprendimento, quick start ed esercizi:

| Capitolo | Argomento | Lezioni | Durata | Complessità |
|---------|-------|---------|----------|------------|
| **[Cap. 1: Fondamenti](docs/chapter-01-foundation/README.md)** | Introduzione | [Nozioni di base su AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installazione](docs/chapter-01-foundation/installation.md) &#124; [Primo progetto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap. 2: Sviluppo AI](docs/chapter-02-ai-development/README.md)** | App AI-First | [Integrazione con Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenti AI](docs/chapter-02-ai-development/agents.md) &#124; [Distribuzione del modello](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Laboratorio](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ore | ⭐⭐ |
| **[Cap. 3: Configurazione](docs/chapter-03-configuration/README.md)** | Auth & Sicurezza | [Configurazione](docs/chapter-03-configuration/configuration.md) &#124; [Autenticazione e sicurezza](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap. 4: Infrastruttura](docs/chapter-04-infrastructure/README.md)** | IaC & Distribuzione | [Guida alla distribuzione](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ore | ⭐⭐⭐ |
| **[Cap. 5: Soluzioni Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluzioni con Agenti AI | [Scenario Retail](examples/retail-scenario.md) &#124; [Modelli di Coordinazione](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[Cap. 6: Pre-Distribuzione](docs/chapter-06-pre-deployment/README.md)** | Pianificazione e Validazione | [Controlli Pre-distribuzione](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Pianificazione della Capacità](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selezione SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ora | ⭐⭐ |
| **[Cap. 7: Risoluzione dei problemi](docs/chapter-07-troubleshooting/README.md)** | Debug e Correzione | [Problemi Comuni](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ore | ⭐⭐ |
| **[Cap. 8: Produzione](docs/chapter-08-production/README.md)** | Modelli Enterprise | [Pratiche di Produzione](docs/chapter-08-production/production-ai-practices.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[🎓 Laboratorio](workshop/README.md)** | Laboratorio Pratico | [Introduzione](workshop/docs/instructions/0-Introduction.md) &#124; [Selezione](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Decostruzione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Ripristino](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusione](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ore | ⭐⭐ |

**Durata totale del corso:** ~10-14 ore | **Progressione delle competenze:** Principiante → Pronto per la produzione

---

## 📚 Capitoli di apprendimento

*Seleziona il tuo percorso di apprendimento in base al livello di esperienza e agli obiettivi*

### 🚀 Capitolo 1: Fondamenti e Avvio Rapido
**Prerequisiti**: Sottoscrizione Azure, conoscenze di base della riga di comando  
**Durata**: 30-45 minuti  
**Complessità**: ⭐

#### Cosa imparerai
- Comprendere i fondamenti di Azure Developer CLI
- Installare AZD sulla tua piattaforma
- La tua prima distribuzione riuscita

#### Risorse di apprendimento
- **🎯 Inizia Qui**: [Che cos'è Azure Developer CLI?](../..)
- **📖 Teoria**: [Nozioni di base su AZD](docs/chapter-01-foundation/azd-basics.md) - Concetti e terminologia principali
- **⚙️ Configurazione**: [Installazione e configurazione](docs/chapter-01-foundation/installation.md) - Guide specifiche per piattaforma
- **🛠️ Pratica**: [Il tuo primo progetto](docs/chapter-01-foundation/first-project.md) - Tutorial passo passo
- **📋 Riferimento rapido**: [Foglio di riferimento comandi](resources/cheat-sheet.md)

#### Esercizi pratici
```bash
# Controllo rapido dell'installazione
azd version

# Distribuisci la tua prima applicazione
azd init --template todo-nodejs-mongo
azd up
```

**💡 Obiettivo del capitolo**: Distribuire con successo una semplice applicazione web su Azure usando AZD

**✅ Validazione del successo:**
```bash
# Dopo aver completato il Capitolo 1, dovresti essere in grado di:
azd version              # Mostra la versione installata
azd init --template todo-nodejs-mongo  # Inizializza il progetto
azd up                  # Distribuisce su Azure
azd show                # Mostra l'URL dell'app in esecuzione
# L'applicazione si apre nel browser e funziona
azd down --force --purge  # Pulisce le risorse
```

**📊 Investimento di tempo:** 30-45 minuti  
**📈 Livello di competenza dopo:** È in grado di distribuire applicazioni di base in modo indipendente

**✅ Validazione del successo:**
```bash
# Dopo aver completato il Capitolo 1, dovresti essere in grado di:
azd version              # Mostra la versione installata
azd init --template todo-nodejs-mongo  # Inizializza il progetto
azd up                  # Distribuisce su Azure
azd show                # Mostra l'URL dell'app in esecuzione
# L'applicazione si apre nel browser e funziona
azd down --force --purge  # Ripulisce le risorse
```

**📊 Investimento di tempo:** 30-45 minuti  
**📈 Livello di competenza dopo:** È in grado di distribuire applicazioni di base in modo indipendente

---

### 🤖 Capitolo 2: Sviluppo AI-First (Consigliato per sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 ore  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Integrazione di Microsoft Foundry con AZD
- Distribuzione di applicazioni basate su AI
- Comprendere le configurazioni dei servizi AI

#### Risorse di apprendimento
- **🎯 Inizia Qui**: [Integrazione Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenti AI**: [Guida agli agenti AI](docs/chapter-02-ai-development/agents.md) - Distribuisci agenti intelligenti con AZD
- **📖 Pattern**: [Distribuzione modelli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuire e gestire modelli AI
- **🛠️ Laboratorio**: [Laboratorio AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendere le tue soluzioni AI pronte per AZD
- **🎥 Guida interattiva**: [Materiali del workshop](workshop/README.md) - Apprendimento basato su browser con MkDocs * DevContainer Environment
- **📋 Modelli**: [Modelli Microsoft Foundry](../..)
- **📝 Esempi**: [Esempi di distribuzione AZD](examples/README.md)

#### Esercizi pratici
```bash
# Distribuisci la tua prima applicazione di intelligenza artificiale
azd init --template azure-search-openai-demo
azd up

# Prova altri modelli di intelligenza artificiale
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Obiettivo del capitolo**: Distribuire e configurare un'app di chat basata su AI con funzionalità RAG

**✅ Validazione del successo:**
```bash
# Dopo il Capitolo 2, dovresti essere in grado di:
azd init --template azure-search-openai-demo
azd up
# Testare l'interfaccia di chat dell'IA
# Porre domande e ottenere risposte generate dall'IA con le fonti
# Verificare che l'integrazione della ricerca funzioni
azd monitor  # Verificare che Application Insights mostri la telemetria
azd down --force --purge
```

**📊 Investimento di tempo:** 1-2 ore  
**📈 Livello di competenza dopo:** È in grado di distribuire e configurare applicazioni AI pronte per la produzione  
**💰 Consapevolezza dei costi:** Comprendere costi di sviluppo $80-150/mese, costi di produzione $300-3500/mese

#### 💰 Considerazioni sui costi per le distribuzioni AI

**Ambiente di sviluppo (Stimato $80-150/mese):**
- Azure OpenAI (a consumo): $0-50/mese (in base all'uso di token)
- AI Search (livello Basic): $75/mese
- Container Apps (consumo): $0-20/mese
- Storage (Standard): $1-5/mese

**Ambiente di produzione (Stimato $300-3.500+/mese):**
- Azure OpenAI (PTU per prestazioni consistenti): $3.000+/mese OPPURE a consumo con alto volume
- AI Search (livello Standard): $250/mese
- Container Apps (dedicato): $50-100/mese
- Application Insights: $5-50/mese
- Storage (Premium): $10-50/mese

**💡 Suggerimenti per l'ottimizzazione dei costi:**
- Usa il **Free Tier** di Azure OpenAI per apprendimento (50.000 token/mese inclusi)
- Esegui `azd down` per deallocare le risorse quando non stai sviluppando attivamente
- Inizia con la fatturazione a consumo, esegui l'upgrade a PTU solo per la produzione
- Usa `azd provision --preview` per stimare i costi prima della distribuzione
- Abilita l'auto-scaling: paga solo per l'uso effettivo

**Monitoraggio dei costi:**
```bash
# Verifica i costi mensili stimati
azd provision --preview

# Monitora i costi effettivi nel Portale di Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolo 3: Configurazione e Autenticazione
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 45-60 minuti  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Configurazione e gestione degli ambienti
- Autenticazione e best practice di sicurezza
- Nomenclatura e organizzazione delle risorse

#### Risorse di apprendimento
- **📖 Configurazione**: [Guida alla configurazione](docs/chapter-03-configuration/configuration.md) - Impostazione dell'ambiente
- **🔐 Sicurezza**: [Pattern di autenticazione e managed identity](docs/chapter-03-configuration/authsecurity.md) - Pattern di autenticazione
- **📝 Esempi**: [Esempio App Database](examples/database-app/README.md) - Esempi AZD per database

#### Esercizi pratici
- Configurare più ambienti (dev, staging, prod)
- Impostare l'autenticazione con managed identity
- Implementare configurazioni specifiche per ambiente

**💡 Obiettivo del capitolo**: Gestire più ambienti con autenticazione e sicurezza adeguate

---

### 🏗️ Capitolo 4: Infrastruttura come Codice e Distribuzione
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐⭐

#### Cosa imparerai
- Pattern di distribuzione avanzati
- Infrastruttura come codice con Bicep
- Strategie di provisioning delle risorse

#### Risorse di apprendimento
- **📖 Distribuzione**: [Guida alla distribuzione](docs/chapter-04-infrastructure/deployment-guide.md) - Flussi di lavoro completi
- **🏗️ Provisioning**: [Provisioning delle risorse](docs/chapter-04-infrastructure/provisioning.md) - Gestione delle risorse Azure
- **📝 Esempi**: [Esempio Container App](../../examples/container-app) - Distribuzioni containerizzate

#### Esercizi pratici
- Creare template Bicep personalizzati
- Distribuire applicazioni multi-servizio
- Implementare strategie di deployment blue-green

**💡 Obiettivo del capitolo**: Distribuire applicazioni multi-servizio complesse utilizzando template di infrastruttura personalizzati

---

### 🎯 Capitolo 5: Soluzioni AI Multi-Agente (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa imparerai
- Pattern architetturali multi-agente
- Orchestrazione e coordinazione degli agenti
- Distribuzioni AI pronte per la produzione

#### Risorse di apprendimento
- **🤖 Progetto in evidenza**: [Soluzione Multi-Agente per il Retail](examples/retail-scenario.md) - Implementazione completa
- **🛠️ Pacchetto ARM**: [Pacchetto template ARM](../../examples/retail-multiagent-arm-template) - Distribuzione con un clic
- **📖 Architettura**: [Pattern di coordinazione multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pattern

#### Esercizi pratici
```bash
# Distribuisci l'intera soluzione multi-agente per la vendita al dettaglio
cd examples/retail-multiagent-arm-template
./deploy.sh

# Esplora le configurazioni degli agenti
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Obiettivo del capitolo**: Distribuire e gestire una soluzione AI multi-agente pronta per la produzione con agenti Cliente e Inventario

---

### 🔍 Capitolo 6: Validazione e Pianificazione Pre-Distribuzione
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 ora  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Pianificazione della capacità e validazione delle risorse
- Strategie di selezione SKU
- Controlli pre-distribuzione e automazione

#### Risorse di apprendimento
- **📊 Pianificazione**: [Pianificazione della capacità](docs/chapter-06-pre-deployment/capacity-planning.md) - Validazione delle risorse
- **💰 Selezione**: [Selezione SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Scelte costo-efficaci
- **✅ Validazione**: [Controlli pre-distribuzione](docs/chapter-06-pre-deployment/preflight-checks.md) - Script automatizzati

#### Esercizi pratici
- Eseguire script di validazione della capacità
- Ottimizzare la selezione degli SKU per i costi
- Implementare controlli pre-distribuzione automatizzati

**💡 Obiettivo del capitolo**: Validare e ottimizzare le distribuzioni prima dell'esecuzione

---

### 🚨 Capitolo 7: Risoluzione dei problemi e Debugging
**Prerequisiti**: Qualsiasi capitolo di distribuzione completato  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Approcci sistematici al debugging
- Problemi comuni e soluzioni
- Risoluzione dei problemi specifici per l'AI

#### Risorse di apprendimento
- **🔧 Problemi comuni**: [Problemi Comuni](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategie passo passo
- **🤖 Problemi AI**: [Risoluzione problemi specifici per l'AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi dei servizi AI

#### Esercizi pratici
- Diagnosticare errori di distribuzione
- Risolvere problemi di autenticazione
- Debuggare la connettività dei servizi AI

**💡 Obiettivo del capitolo**: Diagnosticare e risolvere in autonomia i problemi comuni di distribuzione

---

### 🏢 Capitolo 8: Produzione e Modelli Enterprise
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa imparerai
- Strategie di distribuzione in produzione
- Pattern di sicurezza enterprise
- Monitoraggio e ottimizzazione dei costi

#### Risorse di apprendimento
- **🏭 Produzione**: [Best practice per AI in produzione](docs/chapter-08-production/production-ai-practices.md) - Modelli aziendali
- **📝 Esempi**: [Esempio microservizi](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: [Integrazione con Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoraggio

#### Esercizi pratici
- Implementare pattern di sicurezza enterprise
- Configurare un monitoraggio completo
- Distribuire in produzione con adeguata governance

**💡 Obiettivo del capitolo**: Distribuire applicazioni pronte per l'impresa con piena capacità di produzione

---

## 🎓 Panoramica del Workshop: Esperienza di apprendimento pratica

> **⚠️ STATO DEL WORKSHOP: In sviluppo attivo**  
> I materiali del workshop sono attualmente in fase di sviluppo e rifinitura. I moduli principali sono funzionali, ma alcune sezioni avanzate sono incomplete. Stiamo lavorando attivamente per completare tutti i contenuti. [Segui i progressi →](workshop/README.md)

### Materiali interattivi del workshop
**Apprendimento pratico completo con strumenti basati su browser ed esercizi guidati**
I nostri materiali del workshop offrono un'esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra. Il workshop è progettato sia per l'apprendimento autodidatta sia per sessioni condotte dall'istruttore.

#### 🛠️ Caratteristiche del workshop
- **Interfaccia basata su browser**: Workshop completo basato su MkDocs con funzionalità di ricerca, copia e temi
- **Integrazione GitHub Codespaces**: configurazione dell'ambiente di sviluppo con un clic
- **Percorso di apprendimento strutturato**: esercizi guidati in 8 moduli (3-4 ore totali)
- **Metodologia progressiva**: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Smontaggio → Conclusione
- **Ambiente DevContainer interattivo**: strumenti e dipendenze preconfigurati

#### 📚 Struttura dei moduli del workshop
Il workshop segue una metodologia progressiva in **8 moduli** che ti porta dalla scoperta alla padronanza del deployment:

| Modulo | Argomento | Cosa farai | Durata |
|--------|-------|----------------|----------|
| **0. Introduzione** | Panoramica del workshop | Comprendere obiettivi di apprendimento, prerequisiti e struttura del workshop | 15 min |
| **1. Selezione** | Scoperta dei template | Esplorare i template AZD e selezionare il template AI giusto per il tuo scenario | 20 min |
| **2. Validazione** | Distribuire e verificare | Distribuire il template con `azd up` e verificare che l'infrastruttura funzioni | 30 min |
| **3. Decostruzione** | Comprendere la struttura | Utilizzare GitHub Copilot per esplorare l'architettura del template, i file Bicep e l'organizzazione del codice | 30 min |
| **4. Configurazione** | Approfondimento di azure.yaml | Padroneggiare la configurazione di `azure.yaml`, gli hook del ciclo di vita e le variabili d'ambiente | 30 min |
| **5. Personalizzazione** | Rendilo tuo | Abilitare AI Search, tracing, valutazione e personalizzare per il tuo scenario | 45 min |
| **6. Smontaggio** | Pulizia | Deprovisionare in sicurezza le risorse con `azd down --purge` | 15 min |
| **7. Conclusione** | Passi successivi | Rivedere i risultati raggiunti, i concetti chiave e proseguire il percorso di apprendimento | 15 min |

**Flusso del workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Iniziare con il workshop
```bash
# Opzione 1: GitHub Codespaces (Consigliato)
# Clicca su "Code" → "Crea codespace sul ramo main" nel repository

# Opzione 2: Sviluppo locale
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Segui le istruzioni di configurazione in workshop/README.md
```

#### 🎯 Risultati di apprendimento del workshop
Completando il workshop, i partecipanti:
- **Distribuire applicazioni AI in produzione**: utilizzare AZD con i servizi Microsoft Foundry
- **Padroneggiare architetture multi-agente**: implementare soluzioni con agenti AI coordinati
- **Implementare le migliori pratiche di sicurezza**: configurare l'autenticazione e il controllo degli accessi
- **Ottimizzare per la scalabilità**: progettare deployment performanti e dal costo efficiente
- **Risolvere problemi di deployment**: affrontare autonomamente i problemi comuni

#### 📖 Risorse del workshop
- **🎥 Guida interattiva**: [Materiali del workshop](workshop/README.md) - Ambiente di apprendimento basato su browser
- **📋 Istruzioni modulo per modulo**:
  - [0. Introduzione](workshop/docs/instructions/0-Introduction.md) - Panoramica del workshop e obiettivi
  - [1. Selezione](workshop/docs/instructions/1-Select-AI-Template.md) - Trovare e selezionare template AI
  - [2. Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuire e verificare i template
  - [3. Decostruzione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Esplorare l'architettura del template
  - [4. Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) - Padroneggiare azure.yaml
  - [5. Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizzare per il tuo scenario
  - [6. Smontaggio](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Pulire le risorse
  - [7. Conclusione](workshop/docs/instructions/7-Wrap-up.md) - Revisione e prossimi passi
- **🛠️ Laboratorio Workshop AI**: [Laboratorio Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Esercizi focalizzati sull'AI
- **💡 Avvio rapido**: [Guida all'impostazione del workshop](workshop/README.md#quick-start) - Configurazione dell'ambiente

**Perfetto per**: formazione aziendale, corsi universitari, apprendimento autodidatta e bootcamp per sviluppatori.

---

## 📖 Approfondimento: Capacità di AZD

Oltre le basi, AZD offre funzionalità potenti per i deployment in produzione:

- **Distribuzioni basate su template** - Utilizzare template predefiniti per pattern applicativi comuni
- **Infrastructure as Code** - Gestire le risorse Azure usando Bicep o Terraform  
- **Flussi di lavoro integrati** - Provisionare, distribuire e monitorare le applicazioni in modo fluido
- **A misura di sviluppatore** - Ottimizzato per la produttività e l'esperienza dello sviluppatore

### **AZD + Microsoft Foundry: Perfetto per i deployment AI**

**Perché AZD per soluzioni AI?** AZD affronta le principali sfide che gli sviluppatori AI incontrano:

- **Template pronti per l'AI** - Template preconfigurati per Azure OpenAI, Cognitive Services e carichi ML
- **Deployment AI sicuri** - Pattern di sicurezza integrati per servizi AI, chiavi API e endpoint dei modelli  
- **Pattern AI per la produzione** - Best practice per deployment di applicazioni AI scalabili e a costi contenuti
- **Flussi di lavoro AI end-to-end** - Dallo sviluppo del modello al deployment in produzione con monitoraggio adeguato
- **Ottimizzazione dei costi** - Allocazione intelligente delle risorse e strategie di scalabilità per carichi AI
- **Integrazione con Microsoft Foundry** - Connessione senza soluzione di continuità al catalogo modelli e agli endpoint di Microsoft Foundry

---

## 🎯 Libreria di template ed esempi

### In evidenza: Template Microsoft Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

> **Nota:** Questi template dimostrano vari pattern AI. Alcuni sono Azure Samples esterni, altri sono implementazioni locali.

| Template | Capitolo | Complessità | Servizi | Tipo |
|----------|---------|------------|----------|------|
| [**Inizia con la chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Esterno |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Esterno |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Esterno |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Esterno |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Esterno |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Esterno |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Locale** |

### In evidenza: Scenari di apprendimento completi
**Template di applicazioni pronti per la produzione mappati ai capitoli di apprendimento**

| Template | Capitolo di apprendimento | Complessità | Apprendimento chiave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Pattern base di deployment AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework per agent e function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI enterprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Cliente e Inventario |

### Apprendimento per tipo di esempio

> **📌 Esempi locali vs. esterni:**  
> **Esempi locali** (in questo repo) = Pronti all'uso immediatamente  
> **Esempi esterni** (Azure Samples) = Clona dai repository linkati

#### Esempi locali (pronti all'uso)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementazione completa pronta per la produzione con template ARM
  - Architettura multi-agente (agenti Cliente + Inventario)
  - Monitoraggio e valutazione completi
  - Deploy con un clic tramite template ARM

#### Esempi locali - Applicazioni container (Capitoli 2-5)
**Esempi completi di deployment container in questo repository:**
- [**Esempi Container App**](examples/container-app/README.md) - Guida completa ai deployment containerizzati
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST di base con scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Deployment multi-servizio pronto per la produzione
  - Pattern di deployment Quick Start, Production e Advanced
  - Linee guida su monitoring, sicurezza e ottimizzazione dei costi

#### Esempi esterni - Applicazioni semplici (Capitoli 1-2)
**Clona questi repository Azure Samples per iniziare:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pattern di deployment di base
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribuzione di contenuti statici
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deploy di REST API

#### Esempi esterni - Integrazione database (Capitoli 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pattern di connettività al database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow serverless per dati

#### Esempi esterni - Pattern avanzati (Capitoli 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architetture multi-servizio
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Elaborazione in background  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Pattern ML pronti per la produzione

### Collezioni di template esterni
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Collezione curata di template ufficiali e della community
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione dei template su Microsoft Learn
- [**Examples Directory**](examples/README.md) - Esempi di apprendimento locali con spiegazioni dettagliate

---

## 📚 Risorse di apprendimento e riferimenti

### Riferimenti rapidi
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Comandi essenziali di azd organizzati per capitolo
- [**Glossary**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Study Guide**](resources/study-guide.md) - Esercizi pratici completi

### Workshop pratici
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendi le tue soluzioni AI distribuibili con AZD (2-3 ore)
- [**Interactive Workshop**](workshop/README.md) - Esercizi guidati in 8 moduli con MkDocs e GitHub Codespaces
  - Segue: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Smontaggio → Conclusione

### Risorse di apprendimento esterne
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Guida rapida alla risoluzione dei problemi

**Problemi comuni che i principianti affrontano e soluzioni immediate:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Installa prima AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifica l'installazione
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Elenca le sottoscrizioni disponibili
az account list --output table

# Imposta la sottoscrizione predefinita
az account set --subscription "<subscription-id-or-name>"

# Imposta per l'ambiente AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifica
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Prova una regione di Azure diversa
azd env set AZURE_LOCATION "westus2"
azd up

# Oppure usa SKU più piccoli in fase di sviluppo
# Modifica infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>
```bash
# Opzione 1: Pulisci e riprova
azd down --force --purge
azd up

# Opzione 2: Ripara solo l'infrastruttura
azd provision

# Opzione 3: Controlla lo stato dettagliato
azd show

# Opzione 4: Controlla i log in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autenticazione non riuscita" o "Token scaduto"</strong></summary>

```bash
# Riautenticare
az logout
az login

azd auth logout
azd auth login

# Verificare l'autenticazione
az account show
```
</details>

<details>
<summary><strong>❌ "Risorsa già esistente" o conflitti di denominazione</strong></summary>

```bash
# AZD genera nomi unici, ma in caso di conflitto:
azd down --force --purge

# Quindi riprova con un ambiente nuovo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Distribuzione del template che richiede troppo tempo</strong></summary>

**Tempi di attesa normali:**
- App web semplice: 5-10 minuti
- App con database: 10-15 minuti
- Applicazioni AI: 15-25 minuti (il provisioning di OpenAI è lento)

```bash
# Controlla lo stato di avanzamento
azd show

# Se bloccato per oltre 30 minuti, controlla il Portale di Azure:
azd monitor
# Cerca distribuzioni non riuscite
```
</details>

<details>
<summary><strong>❌ "Permesso negato" o "Vietato"</strong></summary>

```bash
# Controlla il tuo ruolo in Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Hai bisogno almeno del ruolo "Contributor"
# Chiedi al tuo amministratore Azure di concedere:
# - Contributor (per le risorse)
# - User Access Administrator (per le assegnazioni di ruolo)
```
</details>

<details>
<summary><strong>❌ Impossibile trovare l'URL dell'applicazione distribuita</strong></summary>

```bash
# Mostra tutti gli endpoint dei servizi
azd show

# Oppure apri il Portale di Azure
azd monitor

# Controlla il servizio specifico
azd env get-values
# Cerca le variabili *_URL
```
</details>

### 📚 Risorse complete per la risoluzione dei problemi

- **Guida ai problemi comuni:** [Soluzioni dettagliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemi specifici per l'AI:** [Risoluzione problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guida al debug:** [Debug passo-passo](docs/chapter-07-troubleshooting/debugging.md)
- **Ottieni aiuto:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Completamento del corso e certificazione

### Monitoraggio dei progressi
Monitora i tuoi progressi di apprendimento per ogni capitolo:

- [ ] **Capitolo 1**: Fondamenti e Avvio rapido ✅
- [ ] **Capitolo 2**: Sviluppo AI-First ✅  
- [ ] **Capitolo 3**: Configurazione e Autenticazione ✅
- [ ] **Capitolo 4**: Infrastruttura come codice e Distribuzione ✅
- [ ] **Capitolo 5**: Soluzioni AI multi-agente ✅
- [ ] **Capitolo 6**: Validazione e pianificazione pre-distribuzione ✅
- [ ] **Capitolo 7**: Risoluzione problemi e Debug ✅
- [ ] **Capitolo 8**: Produzione e modelli enterprise ✅

### Verifica dell'apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze tramite:
1. **Esercizio pratico**: Completa il deployment pratico del capitolo
2. **Verifica delle conoscenze**: Rivedi la sezione FAQ del tuo capitolo
3. **Discussione nella community**: Condividi la tua esperienza in Azure Discord
4. **Capitolo successivo**: Passa al livello di complessità successivo

### Benefici al completamento del corso
Al termine di tutti i capitoli, avrai:
- **Esperienza di produzione**: Distribuito applicazioni AI reali su Azure
- **Competenze professionali**: Capacità di deployment pronte per l'enterprise  
- **Riconoscimento nella community**: Membro attivo della community di sviluppatori Azure
- **Avanzamento di carriera**: Competenze richieste in AZD e deployment AI

---

## 🤝 Community e Supporto

### Ottieni aiuto e supporto
- **Problemi tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande sull'apprendimento**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) e [![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aiuto specifico per l'AI**: Unisciti al [![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentazione**: [Documentazione ufficiale di Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti della community dal Discord di Microsoft Foundry

**Risultati recenti del sondaggio dal canale #Azure:**
- **45%** degli sviluppatori vogliono usare AZD per carichi di lavoro AI
- **Principali sfide**: Distribuzioni multi-servizio, gestione delle credenziali, prontezza per la produzione  
- **Più richieste**: Template specifici per l'AI, guide di risoluzione problemi, best practice

**Unisciti alla nostra community per:**
- Condividi le tue esperienze AZD + AI e ottieni aiuto
- Accedi alle anteprime dei nuovi template AI
- Contribuisci alle best practice per il deployment AI
- Influenza lo sviluppo futuro delle funzionalità AI + AZD

### Contribuire al corso
Accogliamo contributi! Leggi la nostra [Guida alla contribuzione](CONTRIBUTING.md) per dettagli su:
- **Miglioramenti dei contenuti**: Migliora i capitoli e gli esempi esistenti
- **Nuovi esempi**: Aggiungi scenari reali e template  
- **Traduzione**: Aiuta a mantenere il supporto multilingue
- **Segnalazione bug**: Migliora accuratezza e chiarezza
- **Standard della community**: Segui le nostre linee guida inclusive della community

---

## 📄 Informazioni sul corso

### Licenza
Questo progetto è rilasciato sotto la Licenza MIT - vedi il file [LICENSE](../../LICENSE) per i dettagli.

### Risorse di apprendimento correlate di Microsoft

Il nostro team produce altri corsi di apprendimento completi:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j per principianti](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js per principianti](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain per principianti](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
[![AZD per principianti](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI per principianti](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP per principianti](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agenti AI per principianti](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI per principianti](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Apprendimento di base
[![ML per principianti](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science per principianti](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI per principianti](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity per principianti](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Sviluppo web per principianti](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT per principianti](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Sviluppo XR per principianti](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Copilot
[![Copilot per programmazione affiancata AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot per C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Avventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigazione del corso

**🚀 Pronto a iniziare?**

**Principianti**: Inizia con [Capitolo 1: Fondamenti e Avvio rapido](../..)
**Sviluppatori AI**: Vai a [Capitolo 2: Sviluppo AI-First](../..)  
**Sviluppatori esperti**: Inizia con [Capitolo 3: Configurazione e Autenticazione](../..)

**Passaggi successivi**: [Inizia il Capitolo 1 - Nozioni di base AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Dichiarazione di non responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione basato su IA Co-op Translator (https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua madre deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->