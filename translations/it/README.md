# AZD per Principianti: Un Percorso di Apprendimento Strutturato

![AZD-for-beginners](../../translated_images/it/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduzioni Automatiche (Sempre Aggiornate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](./README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferisci clonare localmente?**
>
> Questo repository include più di 50 traduzioni linguistiche che aumentano significativamente la dimensione del download. Per clonare senza traduzioni, usa il checkout sparso:
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
> Questo ti fornisce tutto il necessario per completare il corso con un download molto più veloce.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novità su azd Oggi

> 📌 **Revisione della versione AI CLI (04-11-2026):** La guida è stata verificata rispetto alla documentazione/sorgenti pubblicate di **`azd 1.37.2`**, **agents `1.0.0-beta.23`**, e **evaluations `1.0.0-beta.2`**. Usa `azd >= 1.37.0` per il flusso di lavoro combinato. Esegui `azd version` e [aggiorna il core CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) prima delle estensioni. Vedi [modifiche e correzioni della release](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Questa non è una validazione live del corso completo.

Azure Developer CLI supporta molti tipi di applicazioni, inclusi web app, API e agenti AI, tramite host, template ed estensioni supportati.

Ecco cosa significa per te:

- **Gli agenti AI sono ora carichi di lavoro azd di prima classe.** Puoi inizializzare, distribuire e gestire progetti di agenti AI utilizzando lo stesso flusso `azd init` → `azd up` che già conosci.
- **Un ciclo di vita degli agenti gestito da due estensioni.** Usa `azure.ai.agents` per inizializzare, invocare, ottimizzare e ritirare agenti. Installa **`azure.ai.evaluations`** separatamente per `azd ai eval init`, `generate`, e `run start`. Agenti beta.22 ha sostituito il flusso legacy di valutazione e modificato la configurazione di ottimizzazione; segui la [guida alla migrazione](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Più building block AI.** Nuove estensioni in anteprima—`azure.ai.skills` e `azure.ai.connections`—ti permettono di gestire competenze agenti riutilizzabili e connessioni Foundry direttamente con azd.
- **Integrazione Microsoft Foundry** porta il deployment dei modelli, l’hosting degli agenti e la configurazione dei servizi AI direttamente nell’ecosistema di template azd.
- **Miglioramenti nelle operazioni quotidiane di base.** Le versioni recenti hanno reso `azd init` idempotente (sicuro da rieseguire), hanno fatto sì che `azd auth login` cancelli automaticamente i token scaduti e hanno aggiunto un amichevole prompt di configurazione al primo avvio `azd tool`.
- **Il flusso di lavoro principale non è cambiato.** Che tu stia distribuendo un’app todo, un microservizio o una soluzione AI multi-agente, i comandi rimangono gli stessi.

> **Nota per gli utenti Aspire:** Microsoft ora si riferisce al prodotto semplicemente come **Aspire** (ex ".NET Aspire"). Il supporto azd per Aspire non è cambiato—solo il nome è stato aggiornato.

Se hai usato azd in passato, il supporto AI è un’estensione naturale—non uno strumento separato o un percorso avanzato. Se stai iniziando da zero, imparerai un flusso che funziona per tutto.

---

## 🚀 Cos’è Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** è uno strumento da riga di comando amichevole per sviluppatori che rende semplice distribuire applicazioni su Azure. Invece di creare manualmente e connettere dozzine di risorse Azure, puoi distribuire intere applicazioni con un singolo comando.

### La Magia di `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Il template fornisce la configurazione dell’applicazione e dell’infrastruttura. Il deployment riuscito richiede comunque servizi/modelli supportati, quota e permessi sufficienti, input corretti e verifica dell’applicazione distribuita. `azd up` non rende automaticamente un template sicuro, conforme o pronto per la produzione.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual è la Differenza?

Questa è la domanda più comune dei principianti. Ecco la risposta semplice:

| Caratteristica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scopo** | Gestire singole risorse Azure | Distribuire applicazioni complete |
| **Mentalità** | Focalizzata sull’infrastruttura | Focalizzata sull’applicazione |
| **Esempio** | `az webapp create --name myapp...` | `azd up` |
| **Curva di apprendimento** | Devi conoscere i servizi Azure | Devi conoscere la tua app |
| **Ideale per** | DevOps, Infrastruttura | Sviluppatori, Prototipi |

### Analogia Semplice

- **Azure CLI** è come avere tutti gli strumenti per costruire una casa - martelli, seghe, chiodi. Puoi costruire qualsiasi cosa, ma devi sapere costruzione.
- **Azure Developer CLI** è come assumere un appaltatore - descrivi cosa vuoi e lui si occupa della costruzione.

### Quando Usare Ognuno

| Scenario | Usa Questo |
|----------|----------|
| "Voglio distribuire rapidamente la mia web app" | `azd up` |
| "Ho bisogno di creare solo un account di archiviazione" | `az storage account create` |
| "Sto costruendo un’app AI completa" | `azd init --template azure-search-openai-demo` |
| "Ho bisogno di fare il debug di una risorsa Azure specifica" | `az resource show` |
| "Voglio distribuire nel mio ambiente di produzione configurato" | Rivedi configurazione, accesso, costi e limitazioni operative prima di `azd up --environment production` |

### Lavorano Insieme!

AZD e Azure CLI hanno autenticazione e configurazioni separate. Usa `azd auth login` per AZD, e `az login` quando un comando hook o diagnostico necessita esplicitamente di Azure CLI. Puoi usare entrambi:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trova Template in Awesome AZD

Non partire da zero! **Awesome AZD** è la raccolta della community di template pronti per il deploy:

| Risorsa | Descrizione |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Sfoglia più di 200 template con deployment con un clic |
| 🔗 [**Invia un Template**](https://github.com/Azure/awesome-azd/issues) | Contribuisci con il tuo template alla community |
| 🔗 [**Repository GitHub**](https://github.com/Azure/awesome-azd) | Dai una stella ed esplora il codice sorgente |

### Template AI Popolari da Awesome AZD

Scegli un template in una directory vuota a sé stante; i comandi qui sotto sono alternative. Il `.` finale inizializza quella directory.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Iniziare in 3 Passi

Prima di iniziare, assicurati che la tua macchina sia pronta per il template che vuoi distribuire:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se qualche controllo richiesto fallisce, risolvi prima quello e poi continua con l’avvio rapido.

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

### Passo 2: Autenticati per AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Se non sei sicuro di quale ti serve, segui il flusso completo in [Installazione & Configurazione](docs/chapter-01-foundation/installation.md#authentication-setup).

### Passo 3: Distribuisci la tua prima app

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Fatto!** La tua app è ora attiva su Azure.

### Pulizia (Non dimenticare!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Come Usare Questo Corso

Questo corso è pensato per un **apprendimento progressivo** - inizia da dove ti senti a tuo agio e procedi gradualmente:

| La tua esperienza | Inizia Qui |
|-----------------|------------|
| **Nuovo di Azure** | [Capitolo 1: Fondamenti](#-chapter-1-foundation--quick-start) |
| **Conosci Azure, nuovo ad AZD** | [Capitolo 1: Fondamenti](#-chapter-1-foundation--quick-start) |
| **Vuoi distribuire app AI** | [Capitolo 2: Sviluppo AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vuoi pratica interattiva** | [🎓 Laboratorio Interattivo](workshop/README.md) - laboratorio guidato di 3-4 ore |
| **Hai bisogno di pattern di produzione** | [Capitolo 8: Produzione & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configurazione Rapida

1. **Forka Questo Repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Ottieni Aiuto**: [Community Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Preferisci clonare localmente?**

> Questo repository include più di 50 traduzioni linguistiche che aumentano significativamente la dimensione del download. Per clonare senza traduzioni, usa il checkout sparso:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Questo ti offre tutto il necessario per completare il corso con un download molto più veloce.


## Panoramica del Corso

Padroneggia Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Focus speciale sul deployment di applicazioni AI con integrazione Microsoft Foundry.**

### Perché questo corso è essenziale per gli sviluppatori moderni

Gli sviluppatori che distribuiscono carichi di lavoro AI spesso hanno bisogno di guida su:
- Architetture AI multi-servizio complesse
- Best practice per il deployment AI in produzione  
- Integrazione e configurazione dei servizi Azure AI
- Ottimizzazione dei costi per carichi di lavoro AI
- Risoluzione dei problemi specifici per deployment AI

### Obiettivi di Apprendimento

Completando questo corso strutturato, tu:
- **Padroneggerai le basi di AZD**: Concetti fondamentali, installazione e configurazione
- **Distribuirai applicazioni AI**: Usa AZD con i servizi Microsoft Foundry
- **Implementerai Infrastructure as Code**: Gestisci risorse Azure con template Bicep
- **Risolverai problemi di deployment**: Risolvi problemi comuni e debugga
- **Ottimizzerai per la produzione**: Sicurezza, scalabilità, monitoraggio e gestione dei costi
- **Costruirai soluzioni Multi-Agent**: Distribuzione di architetture AI complesse

## Prima di Iniziare: Account, Accessi e Assunzioni

Prima di iniziare il Capitolo 1, assicurati di avere quanto segue. I passaggi di installazione più avanti assumono che queste basi siano già coperte.

- **Una sottoscrizione Azure**: Puoi usare una sottoscrizione esistente del lavoro o il tuo account personale, oppure creare una [prova gratuita](https://aka.ms/azurefreetrial) per iniziare.
- **Permessi per creare risorse Azure**: Per la maggior parte degli esercizi, dovresti avere almeno accesso **Contributor** sulla sottoscrizione o gruppo di risorse target. Alcuni capitoli possono assumere che tu possa creare gruppi di risorse, managed identity e assegnazioni RBAC.
- [**Un account GitHub**](https://github.com): Utile per fork del repository, tracciare i tuoi cambiamenti e usare GitHub Codespaces per il workshop.
- **Prerequisiti per i template**: Alcuni template necessitano di strumenti locali come Node.js, Python, Java o Docker. Esegui il validatore setup prima di iniziare per identificare strumenti mancanti in anticipo.
- **Familiarità base con il terminale**: Non serve essere esperto, ma dovresti sentirti a tuo agio eseguendo comandi come `git clone`, `azd auth login` e `azd up`.

> **Lavori in una sottoscrizione aziendale?**
> Se il tuo ambiente Azure è gestito da un amministratore, conferma in anticipo di poter distribuire risorse nella sottoscrizione o gruppo di risorse che prevedi di usare. In caso contrario, richiedi una sottoscrizione sandbox o accesso Contributor prima di iniziare.

> **Sei nuovo in Azure?**
> Inizia con la tua prova Azure personale o con una sottoscrizione pay-as-you-go su https://aka.ms/azurefreetrial così da poter completare gli esercizi senza attendere approvazioni a livello tenant.

## 🗺️ Mappa del Corso: Navigazione Rapida per Capitolo

Ogni capitolo ha un README dedicato con obiettivi di apprendimento, avvii rapidi ed esercizi:

| Capitolo | Argomento | Lezioni | Durata | Complessità |
|---------|----------|---------|--------|------------|
| **[Cap 1: Fondamenti](docs/chapter-01-foundation/README.md)** | Avvio | [Nozioni di base AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installazione](docs/chapter-01-foundation/installation.md) &#124; [Primo Progetto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap 2: Sviluppo AI](docs/chapter-02-ai-development/README.md)** | App AI-First | [Integrazione Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenti AI](docs/chapter-02-ai-development/agents.md) &#124; [Deployment Modelli](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ore | ⭐⭐ |
| **[Cap 3: Configurazione](docs/chapter-03-configuration/README.md)** | Autenticazione & Sicurezza | [Configurazione](docs/chapter-03-configuration/configuration.md) &#124; [Autenticazione & Sicurezza](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap 4: Infrastruttura](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Guida al Deployment](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ore | ⭐⭐⭐ |
| **[Cap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluzioni AI Multi-Agent | [Scenario Retail](examples/retail-scenario.md) &#124; [Pattern di Coordinamento](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[Cap 6: Pre-Deploy](docs/chapter-06-pre-deployment/README.md)** | Pianificazione & Validazione | [Controlli Preliminari](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Pianificazione Capacità](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selezione SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ora | ⭐⭐ |
| **[Cap 7: Risoluzione Problemi](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Problemi Comuni](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ore | ⭐⭐ |
| **[Cap 8: Produzione](docs/chapter-08-production/README.md)** | Pattern Enterprise | [Pratiche di Produzione](docs/chapter-08-production/production-ai-practices.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratorio Pratico | [Introduzione](workshop/docs/instructions/0-Introduction.md) &#124; [Selezione](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Smontaggio](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusione](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ore | ⭐⭐ |

**Durata Totale del Corso:** ~10-14 ore | **Progressione delle Competenze:** Principiante → Pronto per la Produzione

---

## 📚 Capitoli di Apprendimento

*Seleziona il tuo percorso in base al livello di esperienza e obiettivi*

### 🚀 Capitolo 1: Fondamenti e Avvio Rapido
**Prerequisiti**: Sottoscrizione Azure, conoscenze base linea di comando  
**Durata**: 30-45 minuti  
**Complessità**: ⭐

#### Cosa Imparerai
- Comprendere le basi di Azure Developer CLI
- Installare AZD sulla tua piattaforma
- Il tuo primo deployment di successo

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Cos'è Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Teoria**: [Nozioni di base AZD](docs/chapter-01-foundation/azd-basics.md) - Concetti e terminologia chiave
- **⚙️ Setup**: [Installazione & Setup](docs/chapter-01-foundation/installation.md) - Guide specifiche per piattaforma
- **🛠️ Pratica**: [Il tuo primo progetto](docs/chapter-01-foundation/first-project.md) - Tutorial passo a passo
- **📋 Riferimento rapido**: [Cheat Sheet dei Comandi](resources/cheat-sheet.md)

#### Esercizi Pratici
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Risultato del Capitolo**: Effettuare con successo il deployment di una semplice applicazione web su Azure usando AZD

**✅ Validazione del Successo:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Tempo richiesto:** 30-45 minuti  
**📈 Livello di competenza dopo:** Puoi distribuire applicazioni basiche in autonomia

---

### 🤖 Capitolo 2: Sviluppo AI-First (Raccomandato per sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Integrazione Microsoft Foundry con AZD
- Distribuzione di applicazioni AI-powered
- Comprendere le configurazioni dei servizi AI

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Integrazione Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenti AI**: [Guida Agenti AI](docs/chapter-02-ai-development/agents.md) - Distribuisci agenti intelligenti con AZD
- **📖 Pattern**: [Deployment Modelli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuisci e gestisci modelli AI
- **🛠️ Workshop**: [Laboratorio Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Prendi pronti per AZD le tue soluzioni AI
- **🎥 Guida Interattiva**: [Materiali Workshop](workshop/README.md) - Apprendimento via browser con MkDocs * ambiente DevContainer
- **📋 Template**: [Template Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Esempi**: [Esempi Deployment AZD](examples/README.md)

#### Esercizi Pratici
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Risultato del Capitolo**: Distribuire e configurare un'applicazione chat AI-powered con capacità RAG

**✅ Validazione del Successo:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo .
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Tempo richiesto:** 1-2 ore  
**📈 Livello di competenza dopo:** Puoi distribuire applicazioni di apprendimento AI e identificare requisiti aggiuntivi per la preparazione alla produzione
**💰 Consapevolezza dei costi:** Comprendi costi di sviluppo di $80-150/mese, costi di produzione di $300-3500/mese

#### 💰 Considerazioni sui costi per i deployment AI

**Ambiente di sviluppo (stimato $80-150/mese):**
- Modelli Microsoft Foundry (Pay-as-you-go): $0-50/mese (in base a uso token)
- AI Search (livello base): $75/mese
- Container Apps (consumo): $0-20/mese
- Storage (standard): $1-5/mese

**Ambiente di produzione (stimato $300-3,500+/mese):**
- Modelli Microsoft Foundry (PTU per performance costante): $3,000+/mese OPPURE Pay-as-you-go con alto volume
- AI Search (livello standard): $250/mese
- Container Apps (dedicati): $50-100/mese
- Application Insights: $5-50/mese
- Storage (premium): $10-50/mese

**💡 Suggerimenti per ottimizzazione dei costi:**
- Verifica prezzi di inferenza modello e crediti specifici account; Azure OpenAI non include un plafond mensile universale gratuito di 50.000 token
- Esegui `azd down` per eliminare risorse quando non più necessarie, dopo aver rivisto l'ambiente scelto
- Inizia con fatturazione a consumo, passa a PTU solo per produzione
- Usa `azd provision --preview` per ispezionare l'infrastruttura pianificata, poi calcola il prezzo con Azure Pricing Calculator
- Abilita auto-scaling: paghi solo per l'utilizzo effettivo

**Monitoraggio costi:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolo 3: Configurazione & Autenticazione
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 45-60 minuti  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Configurazione e gestione dell'ambiente
- Best practice di autenticazione e sicurezza
- Nomenclatura e organizzazione risorse

#### Risorse di Apprendimento
- **📖 Configurazione**: [Guida alla Configurazione](docs/chapter-03-configuration/configuration.md) - Setup ambiente
- **🔐 Sicurezza**: [Pattern autenticazione e managed identity](docs/chapter-03-configuration/authsecurity.md) - Pattern di autenticazione
- **📝 Esempi**: [Esempio App Database](examples/database-app/README.md) - Esempi AZD per database

#### Esercizi Pratici
- Configura più ambienti (dev, staging, prod)
- Imposta autenticazione managed identity
- Implementa configurazioni specifiche per ambiente

**💡 Risultato del Capitolo**: Gestire più ambienti con autenticazione e sicurezza corrette

---

### 🏗️ Capitolo 4: Infrastructure as Code & Deployment
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐⭐

#### Cosa Imparerai
- Pattern avanzati di deployment
- Infrastructure as Code con Bicep
- Strategie di provisioning risorse

#### Risorse di Apprendimento
- **📖 Deployment**: [Guida al Deployment](docs/chapter-04-infrastructure/deployment-guide.md) - Workflow completi
- **🏗️ Provisioning**: [Provisioning Risorse](docs/chapter-04-infrastructure/provisioning.md) - Gestione risorse Azure
- **📝 Esempi**: [Esempio Container App](../../examples/container-app) - Deployment containerizzati

#### Esercizi Pratici
- Crea template Bicep personalizzati
- Distribuisci applicazioni multi-servizio
- Implementa strategie di deployment blue-green

**💡 Risultato del Capitolo**: Distribuire applicazioni multi-servizio complesse utilizzando template infrastrutturali personalizzati

---

### 🎯 Capitolo 5: Soluzioni AI Multi-Agent (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Pattern di architettura multi-agent
- Orchestrazione e coordinamento agenti
- Deployment AI pronto per la produzione

#### Risorse di Apprendimento
- **🤖 Design in evidenza**: [Soluzione AI Multi-Agent Retail](examples/retail-scenario.md) - Blueprints architetturali, non un'applicazione completa
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Struttura dell'infrastruttura; revisione dei prerequisiti e componenti dell'applicazione mancanti
- **📖 Architettura**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pattern

#### Esercizi Pratici
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del Capitolo**: Comprendere il design multi-agente e identificare il lavoro di implementazione, validazione e operativo necessario oltre una struttura infrastrutturale

---

### 🔍 Capitolo 6: Validazione e Pianificazione Pre-Distribuzione
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 ora  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Pianificazione della capacità e validazione delle risorse
- Strategie di selezione SKU
- Controlli pre-volo e automazione

#### Risorse di Apprendimento
- **📊 Pianificazione**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validazione risorse
- **💰 Selezione**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Scelte economiche
- **✅ Validazione**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Script automatizzati

#### Esercizi Pratici
- Eseguire script di validazione della capacità
- Ottimizzare le selezioni SKU per i costi
- Implementare controlli automatizzati pre-distribuzione

**💡 Risultato del Capitolo**: Validare e ottimizzare le distribuzioni prima dell'esecuzione

---

### 🚨 Capitolo 7: Risoluzione Problemi e Debugging
**Prerequisiti**: Qualsiasi capitolo di distribuzione completato  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Approcci sistematici per il debugging
- Problemi comuni e soluzioni
- Risoluzione problemi specifica per AI

#### Risorse di Apprendimento
- **🔧 Problemi comuni**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Strategie passo-passo
- **🤖 Problemi AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi di servizi AI

#### Esercizi Pratici
- Diagnosticare fallimenti di distribuzione
- Risolvere problemi di autenticazione
- Debuggare connettività ai servizi AI

**💡 Risultato del Capitolo**: Diagnosticare e risolvere autonomamente i problemi comuni di distribuzione

---

### 🏢 Capitolo 8: Pattern di Produzione e Aziendali
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Strategie di distribuzione in produzione
- Pattern di sicurezza aziendale
- Monitoraggio e ottimizzazione dei costi

#### Risorse di Apprendimento
- **🏭 Produzione**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Pattern aziendali
- **📝 Esempi**: [Microservices Example](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoraggio

#### Esercizi Pratici
- Implementare pattern di sicurezza aziendale
- Impostare un monitoraggio completo
- Distribuire in produzione con governance adeguata

**💡 Risultato del Capitolo**: Distribuire applicazioni pronte per l'azienda con piena capacità produttiva

---

## 🎓 Panoramica del Workshop: Esperienza di Apprendimento Pratica

> **⚠️ STATO DEL WORKSHOP: Sviluppo Attivo**  
> I materiali del workshop sono attualmente in fase di sviluppo e perfezionamento. I moduli principali sono funzionanti, ma alcune sezioni avanzate sono incomplete. Stiamo lavorando attivamente per completare tutti i contenuti. [Segui i progressi →](workshop/README.md)

### Materiali Interattivi del Workshop
**Apprendimento pratico completo con strumenti basati su browser ed esercizi guidati**

I materiali del workshop offrono un’esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra. Il workshop è progettato sia per apprendimento autonomo sia per sessioni con istruttore.

#### 🛠️ Caratteristiche del Workshop
- **Interfaccia Basata su Browser**: Workshop completo alimentato da MkDocs con funzionalità di ricerca, copia e temi
- **Integrazione GitHub Codespaces**: Configurazione dell'ambiente di sviluppo con un clic
- **Percorso di Apprendimento Strutturato**: 8 moduli con esercizi guidati (3-4 ore totali)
- **Metodologia Progressiva**: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Smantellamento → Conclusione
- **Ambiente DevContainer Interattivo**: Strumenti e dipendenze preconfigurati

#### 📚 Struttura dei Moduli del Workshop
Il workshop segue una **metodologia progressiva in 8 moduli** che ti conduce dalla scoperta alla padronanza del deployment:

| Modulo | Argomento | Cosa Farai | Durata |
|--------|----------|------------|--------|
| **0. Introduzione** | Panoramica del Workshop | Comprendere obiettivi di apprendimento, prerequisiti e struttura del workshop | 15 min |
| **1. Selezione** | Scoperta Template | Esplorare template AZD e selezionare il template AI giusto per il tuo scenario | 20 min |
| **2. Validazione** | Deploy & Verifica | Distribuire il template con `azd up` e validare il funzionamento dell'infrastruttura | 30 min |
| **3. Decostruzione** | Comprendere la Struttura | Usare GitHub Copilot per esplorare l'architettura dei template, file Bicep e organizzazione del codice | 30 min |
| **4. Configurazione** | Approfondimento azure.yaml | Padroneggiare la configurazione `azure.yaml`, i lifecycle hooks e le variabili d'ambiente | 30 min |
| **5. Personalizzazione** | Rendilo Tuo | Abilitare AI Search, tracing, valutazione e personalizzare per il tuo scenario | 45 min |
| **6. Smantellamento** | Pulizia | Disporre in sicurezza le risorse con `azd down --purge` | 15 min |
| **7. Conclusione** | Passi Successivi | Revisionare i risultati, i concetti chiave e proseguire il percorso di apprendimento | 15 min |

**Flusso del Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Iniziare con il Workshop
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Obiettivi di Apprendimento del Workshop
Completando il workshop, i partecipanti saranno in grado di:
- **Distribuire Applicazioni AI in Produzione**: Usare AZD con i servizi Microsoft Foundry
- **Padroneggiare Architetture Multi-Agente**: Implementare soluzioni AI con agenti coordinati
- **Applicare Best Practice di Sicurezza**: Configurare autenticazione e controllo accessi
- **Ottimizzare per la Scala**: Progettare distribuzioni performanti e cost-effective
- **Risoluzione Problemi di Distribuzione**: Risolvere autonomamente problemi comuni

#### 📖 Risorse del Workshop
- **🎥 Guida Interattiva**: [Workshop Materials](workshop/README.md) - Ambiente di apprendimento basato su browser
- **📋 Istruzioni Modulo per Modulo**:
  - [0. Introduzione](workshop/docs/instructions/0-Introduction.md) - Panoramica e obiettivi del workshop
  - [1. Selezione](workshop/docs/instructions/1-Select-AI-Template.md) - Trovare e selezionare template AI
  - [2. Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuire e verificare i template
  - [3. Decostruzione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Esplorare l'architettura dei template
  - [4. Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) - Padroneggiare azure.yaml
  - [5. Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizzare per il tuo scenario
  - [6. Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Pulizia risorse
  - [7. Conclusione](workshop/docs/instructions/7-Wrap-up.md) - Revisione e passi successivi
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Esercizi orientati all'AI
- **💡 Avvio Rapido**: [Workshop Setup Guide](workshop/README.md#browser-based-guide) - Configurazione ambiente

**Perfetto per**: formazione aziendale, corsi universitari, apprendimento autonomo e bootcamp per sviluppatori.

---

## 📖 Approfondimento: Capacità di AZD

Oltre le basi, AZD offre potenti funzionalità per distribuzioni in produzione:

- **Distribuzioni basate su template** - Usa template predefiniti per pattern comuni di applicazioni
- **Infrastructure as Code** - Gestisci risorse Azure con Bicep o Terraform  
- **Workflow integrati** - Provisioning, distribuzione e monitoraggio applicazioni senza soluzione di continuità
- **Ottimizzato per sviluppatori** - Migliora produttività ed esperienza degli sviluppatori

### **AZD + Microsoft Foundry: Perfetto per le Distribuzioni AI**

**Perché AZD per Soluzioni AI?** AZD affronta le principali sfide degli sviluppatori AI:

- **Template pronti per AI** - Template pre-configurati per modelli Microsoft Foundry, servizi Azure AI e carichi ML
- **Distribuzioni AI sicure** - Pattern di sicurezza integrati per servizi AI, chiavi API e endpoint modello  
- **Pattern AI per produzione** - Best practice per distribuzioni AI scalabili e cost-effective
- **Workflow AI end-to-end** - Dallo sviluppo del modello al deployment con monitoraggio adeguato
- **Ottimizzazione costi** - Strategie intelligenti di allocazione e scalabilità per carichi AI
- **Integrazione Microsoft Foundry** - Connessione fluida al catalogo modelli e endpoint Microsoft Foundry

---

## 🎯 Libreria di Template & Esempi

### In evidenza: Template Microsoft Foundry
**Inizia qui se distribuisci applicazioni AI!**

> **Nota:** Questi template mostrano vari pattern AI. Alcuni sono Azure Samples esterni, altri implementazioni locali.

| Template | Capitolo | Complessità | Servizi | Tipo |
|----------|---------|------------|----------|------|
| [**Iniziare con AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Esterno |
| [**Iniziare con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Esterno |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (default) + Storage | Esterno |
| [**Quickstart OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Esterno |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Esterno |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Esterno |
| [**Soluzione Multi-Agente Retail**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura proposta e struttura infrastrutturale; implementazione applicativa richiesta | **Progetto locale** |

### In evidenza: Scenari di Apprendimento Completi
**Template di applicazioni pronte per produzione mappati ai capitoli di apprendimento**

| Template | Capitolo Didattico | Complessità | Apprendimento Chiave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Pattern base di distribuzione AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Chat basata su agenti e test di valutazione specifici |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework e chiamata di funzione per agenti |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI aziendale |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Customer e Inventory |

### Apprendimento per Tipo di Esempio

> **📌 Esempi Locali vs. Esterni:**  
> **Esempi Locali** (in questo repo) = Controlla il README dell'esempio per stato implementazione e prerequisiti
> **Esempi Esterni** (Azure Samples) = Clona dai repository linkati

#### Esempi Locali (Pronti per l'Uso)
- [**Soluzione Multi-Agente Retail**](examples/retail-scenario.md) - Progetto architetturale con struttura infrastrutturale ARM
  - Ruoli proposti per agenti Customer e Inventory
  - Codice di monitoraggio, valutazione e applicazione da implementare e verificare
  - Solo il provisioning delle risorse non produce un'applicazione retail funzionante

#### Esempi Locali - Container Applications (Capitoli 2-5)
**Esempi completi di deployment containerizzati in questo repository:**
- [**Esempi Container App**](examples/container-app/README.md) - Guida completa alle distribuzioni containerizzate
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST base con scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Esempio di due servizi per apprendimento; produzione necessita di hardening aggiuntivo
  - Quick Start, produzione e pattern di deployment avanzati
  - Linee guida su monitoraggio, sicurezza e ottimizzazione costi

#### Esempi Esterni - Applicazioni Semplici (Capitoli 1-2)
**Clonare questi repository di Azure Samples per iniziare:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pattern base di deployment
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribuzione di contenuti statici
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Distribuzione API REST

#### Esempi Esterni - Integrazione Database (Capitoli 3-4)  
- [App Database - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modelli di connettività al database
- [Funzioni + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flusso di lavoro dati serverless

#### Esempi Esterni - Modelli Avanzati (Capitoli 4-8)
- [Microservizi Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architetture multi-servizio
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Elaborazione in background  
- [Pipeline ML Aziendale](https://github.com/Azure/mlops-v2) - Modelli di riferimento MLOps; non un modello AZD pronto all'uso

### Collezioni di Modelli Esterni
- [**Galleria Ufficiale di Modelli AZD**](https://azure.github.io/awesome-azd/) - Collezione curata di modelli ufficiali e della community
- [**Modelli Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione dei modelli Microsoft Learn
- [**Directory Esempi**](examples/README.md) - Esempi di apprendimento locali con spiegazioni dettagliate

---

## 📚 Risorse di Apprendimento & Riferimenti

### Riferimenti Rapidi
- [**Sommario dei Comandi**](resources/cheat-sheet.md) - Comandi azd essenziali organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia di Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida di Studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop Pratici
- [**Laboratorio Workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendi le tue soluzioni AI distribuibili con AZD (2-3 ore)
- [**Workshop Interattivo**](workshop/README.md) - Esercizi guidati in 8 moduli con MkDocs e GitHub Codespaces
  - Segue: Introduzione → Selezione → Validazione → Decomposizione → Configurazione → Personalizzazione → Smantellamento → Conclusione

### Risorse di Apprendimento Esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore Prezzi Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato Azure](https://status.azure.com/)

### Competenze Agente AI per il Tuo Editor
- [**Competenze Microsoft Azure su skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 competenze aperte per agente per Azure AI, Foundry, distribuzione, diagnostica, ottimizzazione costi e altro. Installale in GitHub Copilot, Cursor, Claude Code, o qualsiasi agente supportato:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guida Rapida alla Risoluzione dei Problemi

**Problemi comuni che incontrano i principianti e soluzioni immediate:**

<details>
<summary><strong>❌ "azd: comando non trovato"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Nessuna sottoscrizione trovata" o "Sottoscrizione non impostata"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "Quota insufficiente" o "Quota superata"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fallisce a metà processo</strong></summary>

```bash
# Option 1: Inspect the error and retry after correcting its cause
azd show
azd up --debug

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autenticazione fallita" o "Token scaduto"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Risorsa già esistente" o conflitti di denominazione</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Il deployment del modello sta impiegando troppo tempo</strong></summary>

**Tempi di attesa normali:**
- App web semplice: 5-10 minuti
- App con database: 10-15 minuti
- Applicazioni AI: 15-25 minuti (la provisioning di OpenAI è lenta)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permesso negato" o "Vietato"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Impossibile trovare l'URL dell'applicazione distribuita</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Risorse Complete per la Risoluzione dei Problemi

- **Guida ai Problemi Comuni:** [Soluzioni Dettagliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemi specifici AI:** [Risoluzione Problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guida al Debug:** [Debug passo dopo passo](docs/chapter-07-troubleshooting/debugging.md)
- **Ottieni Aiuto:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Completamento Corso & Certificazione

### Monitoraggio dei Progressi
Monitora il tuo progresso di apprendimento attraverso ogni capitolo:

- [ ] **Capitolo 1**: Fondamenti & Avvio Rapido ✅
- [ ] **Capitolo 2**: Sviluppo AI-First ✅  
- [ ] **Capitolo 3**: Configurazione & Autenticazione ✅
- [ ] **Capitolo 4**: Infrastructure as Code & Deployment ✅
- [ ] **Capitolo 5**: Soluzioni AI Multi-Agente ✅
- [ ] **Capitolo 6**: Validazione & Pianificazione Pre-Deployment ✅
- [ ] **Capitolo 7**: Risoluzione Problemi & Debug ✅
- [ ] **Capitolo 8**: Produzione & Modelli Aziendali ✅

### Verifica dell'Apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze:
1. **Esercizio Pratico**: Completa il deployment pratico del capitolo
2. **Controllo delle Conoscenze**: Rivedi la sezione FAQ del tuo capitolo
3. **Discussione nella Community**: Condividi la tua esperienza su Azure Discord
4. **Capitolo Successivo**: Passa al livello di complessità successivo

### Benefici del Completamento del Corso
Completando tutti i capitoli, avrai:
- **Esperienza in Produzione**: Applicazioni AI reali distribuite su Azure
- **Competenze Professionali**: Capacità di deployment pronte per l’azienda  
- **Riconoscimento nella Community**: Membro attivo della community di sviluppatori Azure
- **Avanzamento di Carriera**: Competenza richiesta in AZD e deployment AI

---

## 🤝 Community & Supporto

### Ottieni Aiuto & Supporto
- **Problemi Tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande di Apprendimento**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aiuto specifico AI**: Unisciti al [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentazione**: [Documentazione ufficiale Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti dalla Community di Microsoft Foundry Discord

**Argomenti discussi dalla community:**
- Distribuzioni multi-servizio, gestione delle credenziali e prontezza di produzione
- Modelli specifici per AI, guide alla risoluzione di problemi e best practice

**Unisciti alla nostra community per:**
- Condividere le tue esperienze AZD + AI e ricevere aiuto
- Accedere alle anteprime anticipate di nuovi modelli AI
- Contribuire alle best practice di deployment AI
- Influenzare lo sviluppo futuro di funzionalità AI + AZD

### Contribuire al Corso
Accogliamo con piacere i contributi! Leggi la nostra [Guida ai Contributi](CONTRIBUTING.md) per dettagli su:
- **Miglioramenti dei Contenuti**: Migliora capitoli ed esempi esistenti
- **Nuovi Esempi**: Aggiungi scenari e modelli reali  
- **Traduzione**: Aiuta a mantenere il supporto multilingue
- **Segnalazioni Bug**: Migliora accuratezza e chiarezza
- **Standard della Community**: Segui le nostre linee guida per una community inclusiva

---

## 📄 Informazioni sul Corso

### Licenza
Questo progetto è concesso sotto licenza MIT - vedi il file [LICENSE](../../LICENSE) per i dettagli.

### Risorse di Apprendimento Microsoft Correlate

Il nostro team produce altri corsi di apprendimento completi:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j per Principianti](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js per Principianti](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain per Principianti](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
[![AZD per Principianti](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI per Principianti](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP per Principianti](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agenti AI per Principianti](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Generative AI
[![Generative AI per Principianti](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Apprendimento Base
[![ML per Principianti](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science per Principianti](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI per Principianti](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity per Principianti](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Sviluppo Web per Principianti](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT per Principianti](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Sviluppo XR per Principianti](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Copilot
[![Copilot per Programmazione AI Affiancata](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot per C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Avventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigazione del Corso

**🚀 Pronto per Iniziare ad Apprendere?**

**Principianti**: Inizia con [Capitolo 1: Fondamenti & Avvio Rapido](#-chapter-1-foundation--quick-start)  
**Sviluppatori AI**: Vai a [Capitolo 2: Sviluppo AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Sviluppatori Esperti**: Inizia con [Capitolo 3: Configurazione & Autenticazione](#️-chapter-3-configuration--authentication)

**Passi Successivi**: [Inizia Capitolo 1 - Basi AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->