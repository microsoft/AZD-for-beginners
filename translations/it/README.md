# AZD Per Principianti: Un Percorso di Apprendimento Strutturato

![AZD per principianti](../../translated_images/it/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduzioni Automatiche (Sempre Aggiornate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabo](../ar/README.md) | [Bengalese](../bn/README.md) | [Bulgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Cinese (semplificato)](../zh-CN/README.md) | [Cinese (tradizionale, Hong Kong)](../zh-HK/README.md) | [Cinese (tradizionale, Macao)](../zh-MO/README.md) | [Cinese (tradizionale, Taiwan)](../zh-TW/README.md) | [Croato](../hr/README.md) | [Ceco](../cs/README.md) | [Danese](../da/README.md) | [Olandese](../nl/README.md) | [Estone](../et/README.md) | [Finlandese](../fi/README.md) | [Francese](../fr/README.md) | [Tedesco](../de/README.md) | [Greco](../el/README.md) | [Ebraico](../he/README.md) | [Hindi](../hi/README.md) | [Ungherese](../hu/README.md) | [Indonesiano](../id/README.md) | [Italiano](./README.md) | [Giapponese](../ja/README.md) | [Kannada](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malese](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalese](../ne/README.md) | [Pidgin nigeriano](../pcm/README.md) | [Norvegese](../no/README.md) | [Persiano (Farsi)](../fa/README.md) | [Polacco](../pl/README.md) | [Portoghese (Brasile)](../pt-BR/README.md) | [Portoghese (Portogallo)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumeno](../ro/README.md) | [Russo](../ru/README.md) | [Serbo (Cirillico)](../sr/README.md) | [Slovacco](../sk/README.md) | [Sloveno](../sl/README.md) | [Spagnolo](../es/README.md) | [Swahili](../sw/README.md) | [Svedese](../sv/README.md) | [Tagalog (Filippino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailandese](../th/README.md) | [Turco](../tr/README.md) | [Ucraino](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Preferisci clonare localmente?**
>
> Questo repository include oltre 50 traduzioni che aumentano significativamente la dimensione del download. Per clonare senza le traduzioni, usa il sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Questo ti dà tutto il necessario per completare il corso con un download molto più veloce.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Che cos'è Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** è uno strumento da riga di comando pensato per gli sviluppatori che semplifica il deploy delle applicazioni su Azure. Invece di creare e collegare manualmente decine di risorse Azure, puoi distribuire intere applicazioni con un solo comando.

### La magia di `azd up`

```bash
# Questo singolo comando fa tutto:
# ✅ Crea tutte le risorse di Azure
# ✅ Configura rete e sicurezza
# ✅ Compila il codice della tua applicazione
# ✅ Esegue il deploy su Azure
# ✅ Ti fornisce un URL funzionante
azd up
```

**Questo è tutto!** Niente clic nel Portale di Azure, nessun complesso template ARM da imparare prima, nessuna configurazione manuale - solo applicazioni funzionanti su Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual è la differenza?

Questa è la domanda più comune che si pongono i principianti. Ecco la risposta semplice:

| Caratteristica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|----------------|----------------------|--------------------------------|
| **Scopo** | Gestire singole risorse Azure | Distribuire applicazioni complete |
| **Mentalità** | Incentrato sull'infrastruttura | Incentrato sull'applicazione |
| **Esempio** | `az webapp create --name myapp...` | `azd up` |
| **Curva di apprendimento** | È necessario conoscere i servizi Azure | Basta conoscere la tua app |
| **Ideale per** | DevOps, infrastrutture | Sviluppatori, prototipazione |

### Semplice Analogia

- **Azure CLI** è come avere tutti gli strumenti per costruire una casa - martelli, seghe, chiodi. Puoi costruire qualsiasi cosa, ma devi conoscere l'edilizia.
- **Azure Developer CLI** è come assumere un appaltatore - descrivi cosa vuoi e loro si occupano della costruzione.

### Quando usare ciascuno

| Scenario | Usa questo |
|----------|------------|
| "Voglio distribuire rapidamente la mia web app" | `azd up` |
| "Ho bisogno di creare solo un account di archiviazione" | `az storage account create` |
| "Sto costruendo un'applicazione AI completa" | `azd init --template azure-search-openai-demo` |
| "Devo eseguire il debug di una risorsa Azure specifica" | `az resource show` |
| "Voglio una distribuzione pronta per la produzione in pochi minuti" | `azd up --environment production` |

### Funzionano insieme!

AZD utilizza Azure CLI sotto il cofano. Puoi usare entrambi:
```bash
# Distribuisci la tua app con AZD
azd up

# Poi affina le risorse specifiche con Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trova template in Awesome AZD

Non partire da zero! **Awesome AZD** è la raccolta della community di template pronti per il deployment:

| Risorsa | Descrizione |
|---------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Sfoglia oltre 200 template con deploy con un clic |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Contribuisci con il tuo template alla community |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Dai una stella ed esplora il codice sorgente |

### Template AI popolari da Awesome AZD

```bash
# Chat RAG con Azure OpenAI + Ricerca AI
azd init --template azure-search-openai-demo

# Applicazione di Chat AI Rapida
azd init --template openai-chat-app-quickstart

# Agenti AI con Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Inizia in 3 passaggi

### Passaggio 1: Installa AZD (2 minuti)

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

### Passaggio 2: Accedi ad Azure

```bash
azd auth login
```

### Passaggio 3: Distribuisci la tua prima app

```bash
# Inizializza da un modello
azd init --template todo-nodejs-mongo

# Distribuisci su Azure (crea tutto!)
azd up
```

**🎉 Questo è tutto!** La tua app è ora attiva su Azure.

### Pulizia (Non dimenticare!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Come usare questo corso

Questo corso è progettato per un apprendimento **progressivo** - inizia dove ti senti a tuo agio e progredisci passo dopo passo:

| La tua esperienza | Inizia qui |
|-------------------|------------|
| **Nuovo ad Azure** | [Cap. 1: Fondamenti](../..) |
| **Conosci Azure, nuovo ad AZD** | [Cap. 1: Fondamenti](../..) |
| **Vuoi distribuire applicazioni AI** | [Cap. 2: Sviluppo AI](../..) |
| **Vuoi esercitarti** | [🎓 Workshop interattivo](workshop/README.md) - laboratorio guidato di 3-4 ore |
| **Hai bisogno di pattern per la produzione** | [Cap. 8: Produzione & Enterprise](../..) |

### Configurazione rapida

1. **Fai il fork di questo repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Ottieni aiuto**: [Comunità Discord di Azure](https://discord.com/invite/ByRwuEEgH4)

> **Preferisci clonare localmente?**
>
> Questo repository include oltre 50 traduzioni che aumentano significativamente la dimensione del download. Per clonare senza le traduzioni, usa il sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Questo ti dà tutto il necessario per completare il corso con un download molto più veloce.


## Panoramica del corso

Padroneggia Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Focus speciale sul deployment di applicazioni AI con integrazione Microsoft Foundry.**

### Perché questo corso è essenziale per gli sviluppatori moderni

Basato sugli insight della community Discord di Microsoft Foundry, **il 45% degli sviluppatori vuole usare AZD per carichi di lavoro AI** ma incontra sfide con:
- Architetture AI multi-servizio complesse
- Best practice per il deployment di AI in produzione  
- Integrazione e configurazione dei servizi AI di Azure
- Ottimizzazione dei costi per i carichi di lavoro AI
- Risoluzione dei problemi specifici del deployment AI

### Obiettivi di apprendimento

Completando questo corso strutturato, sarai in grado di:
- **Padroneggiare i fondamenti di AZD**: concetti base, installazione e configurazione
- **Distribuire applicazioni AI**: usare AZD con i servizi Microsoft Foundry
- **Implementare Infrastruttura come codice**: gestire le risorse Azure con template Bicep
- **Risoluzione dei problemi di deployment**: risolvere problemi comuni e fare debug
- **Ottimizzare per la produzione**: sicurezza, scaling, monitoraggio e gestione dei costi
- **Costruire soluzioni multi-agente**: distribuire architetture AI complesse

## 🗺️ Mappa del corso: navigazione rapida per capitolo

Ogni capitolo ha un README dedicato con obiettivi di apprendimento, avvii rapidi ed esercizi:

| Capitolo | Argomento | Lezioni | Durata | Complessità |
|---------|-------|---------|----------|------------|
| **[Cap. 1: Fondamenti](docs/chapter-01-foundation/README.md)** | Introduzione | [Basi di AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installazione](docs/chapter-01-foundation/installation.md) &#124; [Primo progetto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap. 2: Sviluppo AI](docs/chapter-02-ai-development/README.md)** | Applicazioni incentrate sull'AI | [Integrazione Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenti AI](docs/chapter-02-ai-development/agents.md) &#124; [Distribuzione modelli AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Cap. 3: Configurazione](docs/chapter-03-configuration/README.md)** | Autenticazione & Sicurezza | [Configurazione](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap. 4: Infrastruttura](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Guida alla Distribuzione](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Cap. 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluzioni Agenti AI | [Scenario Retail](examples/retail-scenario.md) &#124; [Pattern di Coordinamento](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Cap. 6: Pre-Distribuzione](docs/chapter-06-pre-deployment/README.md)** | Pianificazione & Validazione | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Cap. 7: Risoluzione dei Problemi](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Problemi Comuni](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Cap. 8: Produzione](docs/chapter-08-production/README.md)** | Pattern Enterprise | [Pratiche di Produzione](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratorio Pratico | [Introduzione](workshop/docs/instructions/0-Introduction.md) &#124; [Selezione](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Decomposizione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusione](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Durata totale del corso:** ~10-14 hours | **Progresso delle competenze:** Beginner → Production-Ready

---

## 📚 Capitoli di Apprendimento

*Seleziona il tuo percorso di apprendimento in base al livello di esperienza e agli obiettivi*

### 🚀 Capitolo 1: Fondamenti e Avvio Rapido
**Prerequisiti**: sottoscrizione Azure, conoscenze di base della riga di comando  
**Durata**: 30-45 minuti  
**Complessità**: ⭐

#### Cosa imparerai
- Comprendere i fondamenti di Azure Developer CLI
- Installare AZD sulla tua piattaforma
- La tua prima distribuzione riuscita

#### Risorse di apprendimento
- **🎯 Inizia qui**: [Cos'è Azure Developer CLI?](../..)
- **📖 Teoria**: [Basi di AZD](docs/chapter-01-foundation/azd-basics.md) - Concetti e terminologia di base
- **⚙️ Configurazione**: [Installazione & Setup](docs/chapter-01-foundation/installation.md) - Guide specifiche per piattaforma
- **🛠️ Pratico**: [Il tuo primo progetto](docs/chapter-01-foundation/first-project.md) - Tutorial passo dopo passo
- **📋 Riferimento rapido**: [Scheda rapida dei comandi](resources/cheat-sheet.md)

#### Esercizi pratici
```bash
# Verifica rapida dell'installazione
azd version

# Distribuisci la tua prima applicazione
azd init --template todo-nodejs-mongo
azd up
```

**💡 Risultato del capitolo**: Distribuire con successo una semplice applicazione web su Azure usando AZD

**✅ Validazione del successo:**
```bash
# Dopo aver completato il Capitolo 1, dovresti essere in grado di:
azd version              # Mostra la versione installata
azd init --template todo-nodejs-mongo  # Inizializza il progetto
azd up                  # Effettua il deploy su Azure
azd show                # Mostra l'URL dell'app in esecuzione
# L'applicazione si apre nel browser e funziona
azd down --force --purge  # Pulisce le risorse
```

**📊 Tempo richiesto:** 30-45 minuti  
**📈 Livello di competenza dopo:** Può distribuire applicazioni di base in modo indipendente

**✅ Validazione del successo:**
```bash
# Al termine del Capitolo 1, dovresti essere in grado di:
azd version              # Mostra la versione installata
azd init --template todo-nodejs-mongo  # Inizializza il progetto
azd up                  # Distribuisce su Azure
azd show                # Mostra l'URL dell'app in esecuzione
# L'applicazione si apre nel browser e funziona
azd down --force --purge  # Elimina le risorse
```

**📊 Tempo richiesto:** 30-45 minuti  
**📈 Livello di competenza dopo:** Può distribuire applicazioni di base in modo indipendente

---

### 🤖 Capitolo 2: Sviluppo AI-First (Raccomandato per sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 hours  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Integrazione Microsoft Foundry con AZD
- Distribuzione di applicazioni potenziate dall'AI
- Comprendere le configurazioni dei servizi AI

#### Risorse di apprendimento
- **🎯 Inizia qui**: [Integrazione Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenti AI**: [Guida agli Agenti AI](docs/chapter-02-ai-development/agents.md) - Distribuisci agenti intelligenti con AZD
- **📖 Pattern**: [Distribuzione di modelli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuire e gestire modelli AI
- **🛠️ Laboratorio**: [Laboratorio AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendi le tue soluzioni AI pronte per AZD
- **🎥 Guida interattiva**: [Materiali del workshop](workshop/README.md) - Apprendimento basato su browser con MkDocs * DevContainer Environment
- **📋 Modelli**: [Modelli Microsoft Foundry](../..)
- **📝 Esempi**: [Esempi di deployment AZD](examples/README.md)

#### Esercizi pratici
```bash
# Distribuisci la tua prima applicazione di intelligenza artificiale
azd init --template azure-search-openai-demo
azd up

# Prova altri modelli di intelligenza artificiale
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Risultato del capitolo**: Distribuire e configurare un'applicazione di chat potenziata dall'AI con funzionalità RAG

**✅ Validazione del successo:**
```bash
# Dopo il Capitolo 2, dovresti essere in grado di:
azd init --template azure-search-openai-demo
azd up
# Testare l'interfaccia di chat dell'IA
# Porre domande e ottenere risposte fornite dall'IA con le fonti
# Verificare che l'integrazione della ricerca funzioni
azd monitor  # Verificare che Application Insights mostri la telemetria
azd down --force --purge
```

**📊 Tempo richiesto:** 1-2 hours  
**📈 Livello di competenza dopo:** In grado di distribuire e configurare applicazioni AI pronte per la produzione  
**💰 Consapevolezza dei costi:** Comprendere $80-150/month costi di sviluppo, $300-3500/month costi di produzione

#### 💰 Considerazioni sui costi per distribuzioni AI

**Ambiente di sviluppo (Stimato $80-150/month):**
- Azure OpenAI (Pay-as-you-go): $0-50/month (based on token usage)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Ambiente di produzione (Stimato $300-3,500+/month):**
- Azure OpenAI (PTU for consistent performance): $3,000+/month OR Pay-as-go with high volume
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Suggerimenti per ottimizzare i costi:**
- Usa **Free Tier** Azure OpenAI per apprendere (50,000 tokens/month included)
- Esegui `azd down` per deallocare le risorse quando non stai sviluppando attivamente
- Inizia con fatturazione basata sul consumo, passa a PTU solo per la produzione
- Usa `azd provision --preview` per stimare i costi prima della distribuzione
- Abilita l'auto-scaling: paga solo per l'utilizzo effettivo

**Monitoraggio dei costi:**
```bash
# Controlla i costi mensili stimati
azd provision --preview

# Monitora i costi effettivi nel Portale di Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolo 3: Configurazione & Autenticazione
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 45-60 minuti  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Configurazione e gestione degli ambienti
- Pratiche di autenticazione e sicurezza
- Naming e organizzazione delle risorse

#### Risorse di apprendimento
- **📖 Configurazione**: [Guida alla configurazione](docs/chapter-03-configuration/configuration.md) - Impostazione dell'ambiente
- **🔐 Sicurezza**: [Pattern di autenticazione e identity gestite](docs/chapter-03-configuration/authsecurity.md) - Pattern di autenticazione
- **📝 Esempi**: [Esempio applicazione Database](examples/database-app/README.md) - Esempi AZD per Database

#### Esercizi pratici
- Configurare più ambienti (dev, staging, prod)
- Impostare autenticazione con managed identity
- Implementare configurazioni specifiche per ambiente

**💡 Risultato del capitolo**: Gestire più ambienti con autenticazione e sicurezza adeguate

---

### 🏗️ Capitolo 4: Infrastructure as Code & Distribuzione
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 hours  
**Complessità**: ⭐⭐⭐

#### Cosa imparerai
- Pattern avanzati di distribuzione
- Infrastruttura come codice con Bicep
- Strategie di provisioning delle risorse

#### Risorse di apprendimento
- **📖 Distribuzione**: [Guida alla Distribuzione](docs/chapter-04-infrastructure/deployment-guide.md) - Workflow completi
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Gestione delle risorse Azure
- **📝 Esempi**: [Esempio Container App](../../examples/container-app) - Distribuzioni containerizzate

#### Esercizi pratici
- Creare template Bicep personalizzati
- Distribuire applicazioni multi-servizio
- Implementare strategie di deployment blue-green

**💡 Risultato del capitolo**: Distribuire applicazioni multi-servizio complesse utilizzando template infrastrutturali personalizzati

---

### 🎯 Capitolo 5: Soluzioni AI Multi-Agente (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 hours  
**Complessità**: ⭐⭐⭐⭐

#### Cosa imparerai
- Pattern di architettura multi-agente
- Orchestrazione e coordinamento degli agenti
- Distribuzioni AI pronte per la produzione

#### Risorse di apprendimento
- **🤖 Progetto in evidenza**: [Soluzione Multi-Agente Retail](examples/retail-scenario.md) - Implementazione completa
- **🛠️ ARM Templates**: [Pacchetto ARM Template](../../examples/retail-multiagent-arm-template) - Distribuzione con un clic
- **📖 Architettura**: [Pattern di coordinamento multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pattern

#### Esercizi pratici
```bash
# Distribuisci la soluzione multi-agente completa per il commercio al dettaglio
cd examples/retail-multiagent-arm-template
./deploy.sh

# Esplora le configurazioni degli agenti
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del capitolo**: Distribuire e gestire una soluzione AI multi-agente pronta per la produzione con agenti Customer e Inventory

---

### 🔍 Capitolo 6: Validazione & Pianificazione Pre-Distribuzione
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 hour  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Capacity planning e validazione delle risorse
- Strategie di selezione SKU
- Pre-flight checks e automazione

#### Risorse di apprendimento
- **📊 Pianificazione**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validazione delle risorse
- **💰 Selezione**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Scelte costo-efficaci
- **✅ Validazione**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Script automatizzati

#### Esercizi pratici
- Eseguire script di validazione della capacità
- Ottimizzare la selezione degli SKU per i costi
- Implementare controlli pre-distribuzione automatizzati

**💡 Risultato del capitolo**: Validare e ottimizzare le distribuzioni prima dell'esecuzione

---

### 🚨 Capitolo 7: Risoluzione dei Problemi & Debugging
**Prerequisiti**: Qualsiasi capitolo di distribuzione completato  
**Durata**: 1-1.5 hours  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Approcci sistematici al debugging
- Problemi comuni e soluzioni
- Risoluzione problemi specifici per AI

#### Risorse di apprendimento
- **🔧 Problemi comuni**: [Problemi Comuni](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al Debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategie passo dopo passo
- **🤖 Problemi AI**: [Risoluzione problemi specifici per AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi dei servizi AI

#### Esercizi pratici
- Diagnosticare fallimenti di distribuzione
- Risolvere problemi di autenticazione
- Debuggare la connettività dei servizi AI

**💡 Risultato del capitolo**: Diagnosticare e risolvere in modo indipendente i problemi comuni di distribuzione

---

### 🏢 Capitolo 8: Produzione & Pattern Enterprise
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 hours  
**Complessità**: ⭐⭐⭐⭐

#### Cosa imparerai
- Strategie di distribuzione in produzione
- Pattern di sicurezza enterprise
- Monitoraggio e ottimizzazione dei costi

#### Risorse di apprendimento
- **🏭 Produzione**: [Pratiche AI in Produzione](docs/chapter-08-production/production-ai-practices.md) - Pattern enterprise
- **📝 Esempi**: [Esempio Microservices](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: [Integrazione Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoraggio

#### Esercizi pratici
- Implementare pattern di sicurezza enterprise
- Impostare monitoraggio completo
- Distribuire in produzione con la governance corretta

**💡 Risultato del capitolo**: Distribuire applicazioni pronte per l'enterprise con capacità complete di produzione

---

## 🎓 Panoramica del Workshop: Esperienza di Apprendimento Pratica

> **⚠️ STATO DEL WORKSHOP: In sviluppo attivo**
> I materiali del workshop sono attualmente in fase di sviluppo e affinamento. I moduli principali sono funzionali, ma alcune sezioni avanzate sono incomplete. Stiamo lavorando attivamente per completare tutti i contenuti. [Segui i progressi →](workshop/README.md)

### Materiali del workshop interattivo
**Apprendimento pratico completo con strumenti basati sul browser ed esercizi guidati**

I nostri materiali del workshop offrono un'esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra. Il workshop è progettato sia per l'apprendimento autodidatta sia per le sessioni guidate da un istruttore.

#### 🛠️ Caratteristiche del workshop
- **Interfaccia basata sul browser**: Workshop completo basato su MkDocs con ricerca, copia e funzionalità di tema
- **Integrazione con GitHub Codespaces**: Configurazione dell'ambiente di sviluppo con un clic
- **Percorso di apprendimento strutturato**: esercizi guidati in 8 moduli (3-4 ore totali)
- **Metodologia progressiva**: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Smantellamento → Conclusione
- **Ambiente DevContainer interattivo**: Strumenti e dipendenze preconfigurati

#### 📚 Struttura dei moduli del workshop
Il workshop segue una **metodologia progressiva in 8 moduli** che ti porta dalla scoperta alla padronanza del deployment:

| Modulo | Argomento | Cosa farai | Durata |
|--------|-------|----------------|----------|
| **0. Introduzione** | Panoramica del workshop | Comprendere obiettivi di apprendimento, prerequisiti e struttura del workshop | 15 min |
| **1. Selezione** | Scoperta dei template | Esplorare i template AZD e selezionare il template AI più adatto al tuo scenario | 20 min |
| **2. Validazione** | Distribuzione e verifica | Distribuire il template con `azd up` e verificare che l'infrastruttura funzioni | 30 min |
| **3. Decostruzione** | Comprendere la struttura | Usare GitHub Copilot per esplorare l'architettura del template, i file Bicep e l'organizzazione del codice | 30 min |
| **4. Configurazione** | Approfondimento di azure.yaml | Padroneggiare la configurazione di `azure.yaml`, gli hook del ciclo di vita e le variabili d'ambiente | 30 min |
| **5. Personalizzazione** | Personalizzalo | Abilitare AI Search, tracing, valutazione e personalizzare per il tuo scenario | 45 min |
| **6. Smantellamento** | Pulizia | Deprovisionare in sicurezza le risorse con `azd down --purge` | 15 min |
| **7. Conclusione** | Prossimi passi | Rivedere i risultati, i concetti chiave e proseguire il percorso di apprendimento | 15 min |

**Flusso del workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Avvio del workshop
```bash
# Opzione 1: GitHub Codespaces (consigliata)
# Fai clic su "Code" → "Create codespace on main" nel repository

# Opzione 2: Sviluppo locale
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Segui le istruzioni di configurazione in workshop/README.md
```

#### 🎯 Risultati di apprendimento del workshop
Completando il workshop, i partecipanti:
- **Distribuire applicazioni AI di produzione**: Usare AZD con i servizi Microsoft Foundry
- **Padroneggiare le architetture multi-agente**: Implementare soluzioni coordinate con agenti AI
- **Implementare le migliori pratiche di sicurezza**: Configurare l'autenticazione e il controllo degli accessi
- **Ottimizzare per la scalabilità**: Progettare deployment performanti ed economicamente efficienti
- **Risoluzione dei problemi di deployment**: Risolvere autonomamente i problemi comuni

#### 📖 Risorse del workshop
- **🎥 Guida interattiva**: [Materiali del workshop](workshop/README.md) - Ambiente di apprendimento basato sul browser
- **📋 Istruzioni modulo per modulo**:
  - [0. Introduzione](workshop/docs/instructions/0-Introduction.md) - Panoramica del workshop e obiettivi
  - [1. Selezione](workshop/docs/instructions/1-Select-AI-Template.md) - Trova e seleziona template AI
  - [2. Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuire e verificare i template
  - [3. Decostruzione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Esplorare l'architettura del template
  - [4. Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) - Padroneggiare azure.yaml
  - [5. Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizzare per il tuo scenario
  - [6. Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ripulire le risorse
  - [7. Conclusione](workshop/docs/instructions/7-Wrap-up.md) - Revisione e prossimi passi
- **🛠️ AI Workshop Lab**: [Laboratorio AI del workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Esercizi focalizzati sull'AI
- **💡 Guida di avvio del workshop**: [Guida di avvio del workshop](workshop/README.md#quick-start) - Configurazione dell'ambiente

**Perfetto per**: formazione aziendale, corsi universitari, apprendimento autonomo e bootcamp per sviluppatori.

---

## 📖 Approfondimento: funzionalità di AZD

Oltre le basi, AZD offre potenti funzionalità per i deployment di produzione:

- **Deployment basati su template** - Utilizzare template predefiniti per pattern applicativi comuni
- **Infrastructure as Code** - Gestire le risorse Azure usando Bicep o Terraform  
- **Flussi di lavoro integrati** - Provisionare, distribuire e monitorare le applicazioni senza interruzioni
- **Orientato agli sviluppatori** - Ottimizzato per la produttività e l'esperienza degli sviluppatori

### **AZD + Microsoft Foundry: Perfetto per i deployment AI**

**Perché AZD per le soluzioni AI?** AZD affronta le principali sfide che gli sviluppatori AI incontrano:

- **Template pronti per AI** - Template preconfigurati per Azure OpenAI, Cognitive Services e carichi di lavoro ML
- **Deployment AI sicuri** - Pattern di sicurezza integrati per i servizi AI, le chiavi API e gli endpoint dei modelli  
- **Pattern AI per la produzione** - Migliori pratiche per deployment di applicazioni AI scalabili e a costo ottimizzato
- **Flussi di lavoro AI end-to-end** - Dallo sviluppo del modello al deployment in produzione con monitoraggio appropriato
- **Ottimizzazione dei costi** - Allocazione intelligente delle risorse e strategie di scaling per i carichi di lavoro AI
- **Integrazione con Microsoft Foundry** - Connessione senza soluzione di continuità al catalogo modelli e agli endpoint di Microsoft Foundry

---

## 🎯 Libreria di template ed esempi

### In primo piano: Template Microsoft Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

> **Nota:** Questi template dimostrano vari pattern AI. Alcuni sono Azure Samples esterni, altri sono implementazioni locali.

| Template | Capitolo | Complessità | Servizi | Tipo |
|----------|---------|------------|----------|------|
| [**Inizia con la chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Esterno |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Esterno |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Esterno |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Esterno |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Esterno |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Esterno |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Locale** |

### In primo piano: Scenari di apprendimento completi
**Template di applicazioni pronte per la produzione mappati ai capitoli di apprendimento**

| Template | Capitolo di apprendimento | Complessità | Apprendimento chiave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Pattern base di deployment AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework agent e function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI aziendale |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Customer e Inventory |

### Apprendimento per tipo di esempio

> **📌 Esempi locali vs esterni:**  
> **Esempi locali** (in questo repo) = Pronti all'uso immediatamente  
> **Esempi esterni** (Azure Samples) = Clonare dai repository collegati

#### Esempi locali (Pronti all'uso)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementazione completa pronta per la produzione con template ARM
  - Architettura multi-agente (Customer + Inventory agents)
  - Monitoraggio e valutazione completi
  - Deploy con un clic tramite template ARM

#### Esempi locali - Applicazioni container (Capitoli 2-5)
**Esempi completi di deployment container in questo repository:**
- [**Container App Examples**](examples/container-app/README.md) - Guida completa ai deployment containerizzati
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST di base con scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Deployment multi-servizio pronto per la produzione
  - Avvio rapido, produzione e pattern di deployment avanzati
  - Linee guida su monitoraggio, sicurezza e ottimizzazione dei costi

#### Esempi esterni - Applicazioni semplici (Capitoli 1-2)
**Clona questi repository Azure Samples per iniziare:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pattern di deployment di base
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribuzione di contenuti statici
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deploy di API REST

#### Esempi esterni - Integrazione con database (Capitoli 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pattern di connettività al database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow dati serverless

#### Esempi esterni - Pattern avanzati (Capitoli 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architetture multi-servizio
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Elaborazione in background  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Pattern ML pronti per la produzione

### Collezioni di template esterne
- [**Galleria ufficiale dei template AZD**](https://azure.github.io/awesome-azd/) - Collezione curata di template ufficiali e della community
- [**Template Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione dei template su Microsoft Learn
- [**Directory degli esempi**](examples/README.md) - Esempi locali di apprendimento con spiegazioni dettagliate

---

## 📚 Risorse di apprendimento e riferimenti

### Riferimenti rapidi
- [**Riepilogo comandi**](resources/cheat-sheet.md) - Comandi essenziali di azd organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida allo studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop pratici
- [**Laboratorio AI del workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendere le tue soluzioni AI distribuibili con AZD (2-3 ore)
- [**Workshop interattivo**](workshop/README.md) - Esercizi guidati in 8 moduli con MkDocs e GitHub Codespaces
  - Segue: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Smantellamento → Conclusione

### Risorse di apprendimento esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro di architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore prezzi Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato Azure](https://status.azure.com/)

---

## 🔧 Guida rapida alla risoluzione dei problemi

**Problemi comuni incontrati dai principianti e soluzioni immediate:**

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
<summary><strong>❌ "InsufficientQuota" o "Quota exceeded"</strong></summary>

```bash
# Prova una regione di Azure diversa
azd env set AZURE_LOCATION "westus2"
azd up

# Oppure usa SKU più piccoli durante lo sviluppo
# Modifica infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fallisce a metà</strong></summary>

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
<summary><strong>❌ "Authentication failed" o "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" o conflitti di denominazione</strong></summary>

```bash
# AZD genera nomi unici, ma in caso di conflitto:
azd down --force --purge

# Quindi riprovare con un ambiente nuovo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Distribuzione del template che impiega troppo tempo</strong></summary>

**Tempi di attesa normali:**
- Semplice web app: 5-10 minuti
- App con database: 10-15 minuti
- Applicazioni AI: 15-25 minuti (il provisioning di OpenAI è lento)

```bash
# Controlla l'avanzamento
azd show

# Se rimani bloccato per più di 30 minuti, controlla il Portale di Azure:
azd monitor
# Cerca distribuzioni non riuscite
```
</details>

<details>
<summary><strong>❌ "Permission denied" o "Forbidden"</strong></summary>

```bash
# Verifica il tuo ruolo in Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# È necessario almeno il ruolo "Contributor"
# Chiedi al tuo amministratore di Azure di concedere:
# - Contributor (per le risorse)
# - User Access Administrator (per le assegnazioni di ruoli)
```
</details>

<details>
<summary><strong>❌ Impossibile trovare l'URL dell'applicazione distribuita</strong></summary>

```bash
# Mostra tutti gli endpoint di servizio
azd show

# Oppure apri il portale di Azure
azd monitor

# Controlla un servizio specifico
azd env get-values
# Cerca le variabili *_URL
```
</details>

### 📚 Risorse complete per la risoluzione dei problemi

- **Guida ai problemi comuni:** [Soluzioni dettagliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemi specifici per l'AI:** [AI Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guida al debugging:** [Debugging passo dopo passo](docs/chapter-07-troubleshooting/debugging.md)
- **Ottieni aiuto:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Completamento del corso e certificazione

### Monitoraggio dei progressi
Monitora i tuoi progressi di apprendimento attraverso ogni capitolo:

- [ ] **Chapter 1**: Basi & Avvio rapido ✅
- [ ] **Chapter 2**: Sviluppo AI-first ✅  
- [ ] **Chapter 3**: Configurazione & Autenticazione ✅
- [ ] **Chapter 4**: Infrastruttura come codice & Distribuzione ✅
- [ ] **Chapter 5**: Soluzioni AI multi-agente ✅
- [ ] **Chapter 6**: Validazione e pianificazione pre-distribuzione ✅
- [ ] **Chapter 7**: Risoluzione dei problemi & Debugging ✅
- [ ] **Chapter 8**: Produzione & Modelli aziendali ✅

### Verifica dell'apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze tramite:
1. **Esercizio pratico**: Completa il deployment pratico del capitolo
2. **Verifica delle conoscenze**: Rivedi la sezione FAQ del tuo capitolo
3. **Discussione nella community**: Condividi la tua esperienza su Azure Discord
4. **Capitolo successivo**: Passa al livello di complessità successivo

### Benefici al completamento del corso
Al completamento di tutti i capitoli, avrai:
- **Esperienza in produzione**: Applicazioni AI reali distribuite su Azure
- **Competenze professionali**: Capacità di deployment pronte per l'azienda  
- **Riconoscimento nella community**: Membro attivo della community di sviluppatori Azure
- **Avanzamento di carriera**: Competenze richieste nella distribuzione AZD e AI

---

## 🤝 Community & Supporto

### Ottenere aiuto e supporto
- **Problemi tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande sull'apprendimento**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Assistenza specifica per l'AI**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentazione**: [Documentazione ufficiale di Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti della community da Microsoft Foundry Discord

**Risultati recenti del sondaggio dal canale #Azure:**
- **45%** degli sviluppatori desidera utilizzare AZD per carichi di lavoro AI
- **Principali sfide**: distribuzioni multi-servizio, gestione delle credenziali, readiness per la produzione  
- **Più richiesti**: template specifici per l'AI, guide alla risoluzione dei problemi, best practice

**Unisciti alla nostra community per:**
- Condividere le tue esperienze AZD + AI e ottenere aiuto
- Accedere alle anteprime dei nuovi template AI
- Contribuire alle migliori pratiche per la distribuzione AI
- Influenzare lo sviluppo futuro delle funzionalità AI + AZD

### Contribuire al corso
Accogliamo contributi! Leggi la nostra [Guida ai contributi](CONTRIBUTING.md) per dettagli su:
- **Miglioramenti dei contenuti**: Migliora i capitoli e gli esempi esistenti
- **Nuovi esempi**: Aggiungi scenari e template del mondo reale  
- **Traduzione**: Aiuta a mantenere il supporto multilingue
- **Segnalazione bug**: Migliora accuratezza e chiarezza
- **Standard della community**: Segui le nostre linee guida della community inclusive

---

## 📄 Informazioni sul corso

### Licenza
This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### Risorse correlate di Microsoft Learning

Il nostro team produce altri corsi di apprendimento completi:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j per principianti](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js per principianti](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain per principianti](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
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
 
### Core Learning
[![ML per principianti](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science per principianti](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI per principianti](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity per principianti](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev per principianti](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT per principianti](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Sviluppo XR per principianti](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot per programmazione in coppia con AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot per C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigazione del corso

**🚀 Pronto per iniziare a imparare?**

**Principianti**: Inizia con [Capitolo 1: Fondamenti e avvio rapido](../..)  
**Sviluppatori IA**: Vai a [Capitolo 2: Sviluppo incentrato sull'IA](../..)  
**Sviluppatori esperti**: Inizia con [Capitolo 3: Configurazione e autenticazione](../..)  

**Prossimi passi**: [Inizia Capitolo 1 - Nozioni di base di AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Dichiarazione di non responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica Co-op Translator (https://github.com/Azure/co-op-translator). Pur impegnandoci a garantire l'accuratezza, si segnala che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua d'origine deve essere considerato la fonte autorevole. Per informazioni critiche si consiglia una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo responsabilità per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->