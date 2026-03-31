# AZD per Principianti: Un percorso di apprendimento strutturato

![AZD per principianti](../../translated_images/it/azdbeginners.5527441dd9f74068.webp) 

[![Osservatori GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork su GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Stelle su GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord di Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduzioni automatiche (Sempre aggiornate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabo](../ar/README.md) | [Bengalese](../bn/README.md) | [Bulgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Cinese (Semplificato)](../zh-CN/README.md) | [Cinese (Tradizionale, Hong Kong)](../zh-HK/README.md) | [Cinese (Tradizionale, Macao)](../zh-MO/README.md) | [Cinese (Tradizionale, Taiwan)](../zh-TW/README.md) | [Croato](../hr/README.md) | [Ceco](../cs/README.md) | [Danese](../da/README.md) | [Olandese](../nl/README.md) | [Estone](../et/README.md) | [Finlandese](../fi/README.md) | [Francese](../fr/README.md) | [Tedesco](../de/README.md) | [Greco](../el/README.md) | [Ebraico](../he/README.md) | [Hindi](../hi/README.md) | [Ungherese](../hu/README.md) | [Indonesiano](../id/README.md) | [Italiano](./README.md) | [Giapponese](../ja/README.md) | [Kannada](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malese](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalese](../ne/README.md) | [Pidgin nigeriano](../pcm/README.md) | [Norvegese](../no/README.md) | [Persiano (Farsi)](../fa/README.md) | [Polacco](../pl/README.md) | [Portoghese (Brasile)](../pt-BR/README.md) | [Portoghese (Portogallo)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumeno](../ro/README.md) | [Russo](../ru/README.md) | [Serbo (Cirillico)](../sr/README.md) | [Slovacco](../sk/README.md) | [Sloveno](../sl/README.md) | [Spagnolo](../es/README.md) | [Swahili](../sw/README.md) | [Svedese](../sv/README.md) | [Tagalog (Filippino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailandese](../th/README.md) | [Turco](../tr/README.md) | [Ucraino](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Preferisci clonare localmente?**
>
> This repository includes 50+ language translations which significantly increases the download size. To clone without translations, use sparse checkout:
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
> This gives you everything you need to complete the course with a much faster download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novità di azd oggi

Azure Developer CLI è cresciuto oltre le tradizionali web app e API. Oggi, azd è lo strumento unico per distribuire **qualsiasi** applicazione su Azure—incluse applicazioni potenziate dall'AI e agenti intelligenti.

Ecco cosa significa per te:

- **Gli agenti AI sono ora workload di prima classe in azd.** Puoi inizializzare, distribuire e gestire progetti con agenti AI usando lo stesso flusso di lavoro `azd init` → `azd up` che già conosci.
- **L'integrazione con Microsoft Foundry** porta il deployment dei modelli, l'hosting degli agenti e la configurazione dei servizi AI direttamente nell'ecosistema dei template di azd.
- **Il flusso di lavoro principale non è cambiato.** Che tu stia distribuendo un'app todo, un microservizio o una soluzione AI multi-agente, i comandi sono gli stessi.

Se hai già usato azd, il supporto per l'AI è un'estensione naturale—non uno strumento separato o un percorso avanzato. Se parti da zero, imparerai un unico flusso di lavoro che funziona per tutto.

---

## 🚀 Che cos'è Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** è uno strumento da riga di comando pensato per sviluppatori che semplifica la distribuzione delle applicazioni su Azure. Invece di creare e collegare manualmente decine di risorse Azure, puoi distribuire intere applicazioni con un solo comando.

### La magia di `azd up`

```bash
# Questo singolo comando fa tutto:
# ✅ Crea tutte le risorse di Azure
# ✅ Configura networking e sicurezza
# ✅ Compila il codice della tua applicazione
# ✅ Distribuisce su Azure
# ✅ Ti fornisce un URL funzionante
azd up
```

**Ecco fatto!** Niente clic sul Portale Azure, niente template ARM complessi da imparare prima, niente configurazione manuale - solo applicazioni funzionanti su Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual è la differenza?

Questa è la domanda più comune che fanno i principianti. Ecco la risposta semplice:

| Caratteristica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scopo** | Gestire singole risorse Azure | Distribuire applicazioni complete |
| **Mentalità** | Focalizzato sull'infrastruttura | Focalizzato sull'applicazione |
| **Esempio** | `az webapp create --name myapp...` | `azd up` |
| **Curva di apprendimento** | Richiede conoscenza dei servizi Azure | Basta conoscere la tua app |
| **Ideale per** | DevOps, Infrastruttura | Sviluppatori, Prototipazione |

### Analogia semplice

- **Azure CLI** è come avere tutti gli strumenti per costruire una casa - martelli, seghe, chiodi. Puoi costruire qualsiasi cosa, ma devi conoscere l'edilizia.
- **Azure Developer CLI** è come assumere un appaltatore - descrivi quello che vuoi, e lui si occupa della costruzione.

### Quando usare ciascuno

| Scenario | Usa questo |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Lavorano insieme!

AZD usa Azure CLI sotto il cofano. Puoi usare entrambi:
```bash
# Distribuisci la tua app con AZD
azd up

# Quindi perfeziona risorse specifiche con Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trova template in Awesome AZD

Non partire da zero! **Awesome AZD** è la raccolta community di template pronti da distribuire:

| Risorsa | Descrizione |
|----------|-------------|
| 🔗 [**Galleria Awesome AZD**](https://azure.github.io/awesome-azd/) | Sfoglia oltre 200 template e distribuiscili con un clic |
| 🔗 [**Invia un template**](https://github.com/Azure/awesome-azd/issues) | Contribuisci con il tuo template alla community |
| 🔗 [**Repository GitHub**](https://github.com/Azure/awesome-azd) | Metti una stella ed esplora il codice sorgente |

### Template AI popolari da Awesome AZD

```bash
# Chat RAG con modelli Microsoft Foundry + ricerca AI
azd init --template azure-search-openai-demo

# Applicazione di chat AI veloce
azd init --template openai-chat-app-quickstart

# Agenti AI con agenti Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Inizia in 3 passi

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

Questo corso è progettato per un **apprendimento progressivo** - inizia da dove ti senti a tuo agio e procedi gradualmente:

| La tua esperienza | Inizia qui |
|-----------------|------------|
| **Nuovo ad Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Conosci Azure, nuovo ad AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Vuoi distribuire app AI** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vuoi fare pratica** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Hai bisogno di pattern per la produzione** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configurazione rapida

1. **Fai il fork di questo repository**: [![Fork su GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Ottieni aiuto**: [Community Discord di Azure](https://discord.com/invite/ByRwuEEgH4)

> **Preferisci clonare localmente?**

> This repository includes 50+ language translations which significantly increases the download size. To clone without translations, use sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Questo ti dà tutto ciò di cui hai bisogno per completare il corso con un download molto più veloce.


## Panoramica del corso

Padroneggia Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Focus speciale sul deployment di applicazioni AI con integrazione Microsoft Foundry.**

### Perché questo corso è essenziale per gli sviluppatori moderni

Sulla base delle intuizioni della community Discord di Microsoft Foundry, **il 45% degli sviluppatori vuole usare AZD per carichi di lavoro AI** ma incontra sfide con:
- Architetture AI multi-servizio complesse
- Best practice per il deployment AI in produzione  
- Integrazione e configurazione dei servizi AI di Azure
- Ottimizzazione dei costi per i carichi di lavoro AI
- Risoluzione dei problemi specifici del deployment AI

### Obiettivi di apprendimento

Completando questo corso strutturato, sarai in grado di:
- **Imparerai i fondamenti di AZD**: Concetti chiave, installazione e configurazione
- **Distribuire applicazioni AI**: Usa AZD con i servizi Microsoft Foundry
- **Implementare Infrastructure as Code**: Gestire le risorse Azure con template Bicep
- **Risolvere problemi di deployment**: Risolvere problemi comuni e fare il debug
- **Ottimizzare per la produzione**: Sicurezza, scalabilità, monitoraggio e gestione dei costi
- **Costruire soluzioni multi-agente**: Distribuire architetture AI complesse

## 🗺️ Mappa del corso: navigazione rapida per capitolo

Ogni capitolo ha un README dedicato con obiettivi di apprendimento, avvii rapidi ed esercizi:

| Capitolo | Argomento | Lezioni | Durata | Complessità |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Introduzione | [Nozioni di base AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installazione](docs/chapter-01-foundation/installation.md) &#124; [Primo progetto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Cap. 2: Sviluppo AI](docs/chapter-02-ai-development/README.md)** | Applicazioni AI-First | [Integrazione Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenti AI](docs/chapter-02-ai-development/agents.md) &#124; [Distribuzione Modelli](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Laboratorio](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ore | ⭐⭐ |
| **[Cap. 3: Configurazione](docs/chapter-03-configuration/README.md)** | Autenticazione & Sicurezza | [Configurazione](docs/chapter-03-configuration/configuration.md) &#124; [Autenticazione & Sicurezza](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Cap. 4: Infrastruttura](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Guida al Deployment](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ore | ⭐⭐⭐ |
| **[Cap. 5: Multi-Agente](docs/chapter-05-multi-agent/README.md)** | Soluzioni con Agenti AI | [Scenario Retail](examples/retail-scenario.md) &#124; [Modelli di Coordinamento](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[Cap. 6: Pre-distribuzione](docs/chapter-06-pre-deployment/README.md)** | Pianificazione & Validazione | [Controlli Preflight](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Pianificazione della Capacità](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selezione SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ora | ⭐⭐ |
| **[Cap. 7: Risoluzione dei problemi](docs/chapter-07-troubleshooting/README.md)** | Debug & Correzione | [Problemi Comuni](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ore | ⭐⭐ |
| **[Cap. 8: Produzione](docs/chapter-08-production/README.md)** | Modelli Enterprise | [Pratiche di Produzione](docs/chapter-08-production/production-ai-practices.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[🎓 Laboratorio](workshop/README.md)** | Laboratorio Pratico | [Introduzione](workshop/docs/instructions/0-Introduction.md) &#124; [Selezione](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Decomposizione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Smantellamento dell'Infrastruttura](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusione](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ore | ⭐⭐ |

**Durata Totale del Corso:** ~10-14 ore | **Progressione delle Competenze:** Principiante → Pronto per la Produzione

---

## 📚 Capitoli di Apprendimento

*Seleziona il tuo percorso di apprendimento in base al livello di esperienza e agli obiettivi*

### 🚀 Capitolo 1: Fondamenti e Avvio Rapido
**Prerequisiti**: sottoscrizione Azure, conoscenze di base della riga di comando  
**Durata**: 30-45 minuti  
**Complessità**: ⭐

#### Cosa Imparerai
- Comprendere i fondamenti di Azure Developer CLI
- Installare AZD sulla tua piattaforma
- La tua prima distribuzione riuscita

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Cos'è Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Fondamenti di AZD](docs/chapter-01-foundation/azd-basics.md) - Concetti chiave e terminologia
- **⚙️ Configurazione**: [Installazione & Configurazione](docs/chapter-01-foundation/installation.md) - Guide specifiche per piattaforma
- **🛠️ Pratico**: [Il tuo primo progetto](docs/chapter-01-foundation/first-project.md) - Tutorial passo-passo
- **📋 Riferimento Rapido**: [Foglio comandi](resources/cheat-sheet.md)

#### Esercizi Pratici
```bash
# Verifica rapida dell'installazione
azd version

# Distribuisci la tua prima applicazione
azd init --template todo-nodejs-mongo
azd up
```

**💡 Risultato del Capitolo**: Distribuire con successo una semplice applicazione web su Azure usando AZD

**✅ Validazione del Successo:**
```bash
# Dopo aver completato il Capitolo 1, dovresti essere in grado di:
azd version              # Mostra la versione installata
azd init --template todo-nodejs-mongo  # Inizializza il progetto
azd up                  # Distribuisce su Azure
azd show                # Mostra l'URL dell'app in esecuzione
# L'applicazione si apre nel browser e funziona
azd down --force --purge  # Pulisce le risorse
```

**📊 Tempo Richiesto:** 30-45 minuti  
**📈 Livello di Competenza Dopo:** Può distribuire applicazioni base in autonomia
**📈 Livello di Competenza Dopo:** Può distribuire applicazioni base in autonomia

---

### 🤖 Capitolo 2: Sviluppo AI-First (Consigliato per gli sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Integrazione di Microsoft Foundry con AZD
- Distribuire applicazioni abilitate all'AI
- Comprendere le configurazioni dei servizi AI

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Integrazione Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenti AI**: [Guida agli Agenti AI](docs/chapter-02-ai-development/agents.md) - Distribuire agenti intelligenti con AZD
- **📖 Pattern**: [Distribuzione Modelli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuire e gestire modelli AI
- **🛠️ Laboratorio**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendere le tue soluzioni AI pronte per AZD
- **🎥 Guida Interattiva**: [Workshop Materials](workshop/README.md) - Apprendimento basato su browser con MkDocs * DevContainer Environment
- **📋 Modelli**: [Microsoft Foundry Templates](#risorse-del-workshop)
- **📝 Esempi**: [Esempi di Deployment AZD](examples/README.md)

#### Esercizi Pratici
```bash
# Distribuisci la tua prima applicazione di IA
azd init --template azure-search-openai-demo
azd up

# Prova altri modelli di IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Risultato del Capitolo**: Distribuire e configurare un'applicazione di chat abilitata all'AI con funzionalità RAG

**✅ Validazione del Successo:**
```bash
# Dopo il Capitolo 2, dovresti essere in grado di:
azd init --template azure-search-openai-demo
azd up
# Testare l'interfaccia di chat dell'IA
# Fare domande e ottenere risposte generate dall'IA con le fonti
# Verificare che l'integrazione della ricerca funzioni
azd monitor  # Controllare che Application Insights mostri la telemetria
azd down --force --purge
```

**📊 Tempo Richiesto:** 1-2 ore  
**📈 Livello di Competenza Dopo:** Può distribuire e configurare applicazioni AI pronte per la produzione  
**💰 Consapevolezza dei Costi:** Comprendere i costi di sviluppo $80-150/mese, costi di produzione $300-3500/mese

#### 💰 Considerazioni sui Costi per le Distribuzioni AI

**Ambiente di Sviluppo (Stimato $80-150/mese):**
- Modelli Microsoft Foundry (Pay-as-you-go): $0-50/mese (basato sull'uso di token)
- AI Search (tier Basic): $75/mese
- Container Apps (Consumption): $0-20/mese
- Storage (Standard): $1-5/mese

**Ambiente di Produzione (Stimato $300-3,500+/mese):**
- Modelli Microsoft Foundry (PTU per prestazioni costanti): $3,000+/mese OR Pay-as-go with high volume
- AI Search (tier Standard): $250/mese
- Container Apps (Dedicated): $50-100/mese
- Application Insights: $5-50/mese
- Storage (Premium): $10-50/mese

**💡 Suggerimenti per l'Ottimizzazione dei Costi:**
- Usa i Modelli Microsoft Foundry **Free Tier** per l'apprendimento (Azure OpenAI 50,000 tokens/month included)
- Esegui `azd down` per deallocare le risorse quando non stai sviluppando attivamente
- Inizia con fatturazione basata sul consumo, aggiorna a PTU solo per la produzione
- Usa `azd provision --preview` per stimare i costi prima della distribuzione
- Abilita l'auto-scaling: paga solo per l'uso effettivo

**Monitoraggio dei Costi:**
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

#### Cosa Imparerai
- Configurazione e gestione degli ambienti
- Autenticazione e best practice di sicurezza
- Denominazione e organizzazione delle risorse

#### Risorse di Apprendimento
- **📖 Configurazione**: [Guida alla Configurazione](docs/chapter-03-configuration/configuration.md) - Impostazione dell'ambiente
- **🔐 Sicurezza**: [Pattern di autenticazione e managed identity](docs/chapter-03-configuration/authsecurity.md) - Pattern di autenticazione
- **📝 Esempi**: [Esempio App Database](examples/database-app/README.md) - Esempi AZD di Database

#### Esercizi Pratici
- Configura ambienti multipli (dev, staging, prod)
- Configura l'autenticazione con managed identity
- Implementa configurazioni specifiche per ambiente

**💡 Risultato del Capitolo**: Gestire ambienti multipli con autenticazione e sicurezza adeguate

---

### 🏗️ Capitolo 4: Infrastructure as Code e Deployment
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐⭐

#### Cosa Imparerai
- Pattern avanzati di deployment
- Infrastructure as Code con Bicep
- Strategie di provisioning delle risorse

#### Risorse di Apprendimento
- **📖 Deployment**: [Guida al Deployment](docs/chapter-04-infrastructure/deployment-guide.md) - Workflow completi
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Gestione delle risorse Azure
- **📝 Esempi**: [Esempio Container App](../../examples/container-app) - Distribuzioni containerizzate

#### Esercizi Pratici
- Crea template Bicep personalizzati
- Distribuisci applicazioni multi-servizio
- Implementa strategie di deployment blue-green

**💡 Risultato del Capitolo**: Distribuire applicazioni multi-servizio complesse usando template infrastrutturali personalizzati

---

### 🎯 Capitolo 5: Soluzioni AI Multi-Agente (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Pattern architetturali multi-agente
- Orchestrazione e coordinamento degli agenti
- Distribuzioni AI pronte per la produzione

#### Risorse di Apprendimento
- **🤖 Progetto in Evidenza**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Implementazione completa
- **🛠️ ARM Templates**: [Pacchetto ARM Template](../../examples/retail-multiagent-arm-template) - Deployment con un click
- **📖 Architettura**: [Pattern di coordinamento multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pattern

#### Esercizi Pratici
```bash
# Distribuire la soluzione multi-agente completa per il commercio al dettaglio
cd examples/retail-multiagent-arm-template
./deploy.sh

# Esplorare le configurazioni degli agenti
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del Capitolo**: Distribuire e gestire una soluzione AI multi-agente pronta per la produzione con agenti Cliente e Inventario

---

### 🔍 Capitolo 6: Validazione e Pianificazione Pre-Distribuzione
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 ora  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Pianificazione della capacità e validazione delle risorse
- Strategie di selezione SKU
- Controlli pre-deployment e automazione

#### Risorse di Apprendimento
- **📊 Pianificazione**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validazione delle risorse
- **💰 Selezione**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Scelte costo-efficaci
- **✅ Validazione**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Script automatizzati

#### Esercizi Pratici
- Esegui script di validazione della capacità
- Ottimizza la selezione degli SKU per i costi
- Implementa controlli pre-distribuzione automatizzati

**💡 Risultato del Capitolo**: Validare e ottimizzare le distribuzioni prima dell'esecuzione

---

### 🚨 Capitolo 7: Risoluzione dei Problemi e Debugging
**Prerequisiti**: Qualsiasi capitolo di distribuzione completato  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Approcci sistematici al debugging
- Problemi comuni e soluzioni
- Risoluzione dei problemi specifici per l'AI

#### Risorse di Apprendimento
- **🔧 Problemi Comuni**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al Debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategie passo-passo
- **🤖 Problemi AI**: [Risoluzione Problemi Specifici per AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi dei servizi AI

#### Esercizi Pratici
- Diagnosticare i fallimenti di distribuzione
- Risolvere problemi di autenticazione
- Debug della connettività dei servizi AI

**💡 Risultato del Capitolo**: Diagnosticare e risolvere in autonomia i problemi comuni di distribuzione

---

### 🏢 Capitolo 8: Produzione e Modelli Enterprise
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Strategie di deployment in produzione
- Pattern di sicurezza enterprise
- Monitoraggio e ottimizzazione dei costi

#### Risorse di Apprendimento
- **🏭 Produzione**: [Best practice per l'IA in produzione](docs/chapter-08-production/production-ai-practices.md) - Modelli aziendali
- **📝 Esempi**: [Esempio Microservizi](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: [Integrazione con Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoraggio

#### Esercizi pratici
- Implementare pattern di sicurezza aziendale
- Configurare un monitoraggio completo
- Distribuire in produzione con adeguata governance

**💡 Risultato del capitolo**: Distribuire applicazioni pronte per l'azienda con funzionalità complete per la produzione

---

## 🎓 Panoramica del workshop: Esperienza di apprendimento pratica

> **⚠️ STATO DEL WORKSHOP: In sviluppo attivo**  
> I materiali del workshop sono attualmente in fase di sviluppo e affinamento. I moduli principali sono funzionali, ma alcune sezioni avanzate sono incomplete. Stiamo lavorando attivamente per completare tutti i contenuti. [Monitora i progressi →](workshop/README.md)

### Materiali interattivi del workshop
**Apprendimento pratico completo con strumenti basati sul browser ed esercizi guidati**

I materiali del workshop forniscono un'esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra. Il workshop è progettato sia per l'apprendimento autodidatta sia per le sessioni guidate da un istruttore.

#### 🛠️ Caratteristiche del workshop
- **Interfaccia basata sul browser**: Workshop completo alimentato da MkDocs con funzionalità di ricerca, copia e temi
- **Integrazione con GitHub Codespaces**: Configurazione dell'ambiente di sviluppo con un clic
- **Percorso di apprendimento strutturato**: 8 moduli guidati (3-4 ore totali)
- **Metodologia progressiva**: Introduzione → Selezione → Validazione → Decomposizione → Configurazione → Personalizzazione → Smantellamento → Conclusione
- **Ambiente DevContainer interattivo**: Strumenti e dipendenze preconfigurati

#### 📚 Struttura dei moduli del workshop
Il workshop segue una **metodologia progressiva in 8 moduli** che ti porta dalla scoperta alla padronanza del deployment:

| Modulo | Argomento | Cosa farai | Durata |
|--------|-------|----------------|----------|
| **0. Introduzione** | Panoramica del workshop | Comprendere obiettivi di apprendimento, prerequisiti e struttura del workshop | 15 min |
| **1. Selezione** | Scoperta dei template | Esplorare i template AZD e selezionare il template AI più adatto al tuo scenario | 20 min |
| **2. Validazione** | Distribuire e verificare | Distribuire il template con `azd up` e verificare che l'infrastruttura funzioni | 30 min |
| **3. Decomposizione** | Comprendere la struttura | Usare GitHub Copilot per esplorare l'architettura del template, i file Bicep e l'organizzazione del codice | 30 min |
| **4. Configurazione** | Approfondimento di azure.yaml | Padroneggiare la configurazione `azure.yaml`, gli hook del ciclo di vita e le variabili d'ambiente | 30 min |
| **5. Personalizzazione** | Rendilo tuo | Abilitare AI Search, tracing, valutazione e personalizzare per il tuo scenario | 45 min |
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

#### 🚀 Come iniziare con il workshop
```bash
# Opzione 1: GitHub Codespaces (consigliato)
# Fai clic su "Code" → "Create codespace on main" nel repository

# Opzione 2: Sviluppo locale
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Segui le istruzioni di configurazione in workshop/README.md
```

#### 🎯 Risultati di apprendimento del workshop
Completando il workshop, i partecipanti:
- **Distribuire applicazioni AI in produzione**: Utilizzare AZD con i servizi Microsoft Foundry
- **Padroneggiare architetture multi-agente**: Implementare soluzioni con agenti AI coordinati
- **Implementare le migliori pratiche di sicurezza**: Configurare autenticazione e controllo degli accessi
- **Ottimizzare per la scalabilità**: Progettare deployment performanti e ottimizzati in termini di costi
- **Risoluzione dei problemi di deployment**: Risolvere autonomamente le problematiche comuni

#### 📖 Risorse del workshop
- **🎥 Guida interattiva**: [Materiali del workshop](workshop/README.md) - Ambiente di apprendimento basato sul browser
- **📋 Istruzioni modulo per modulo**:
  - [0. Introduzione](workshop/docs/instructions/0-Introduction.md) - Panoramica e obiettivi del workshop
  - [1. Selezione](workshop/docs/instructions/1-Select-AI-Template.md) - Trovare e selezionare template AI
  - [2. Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuire e verificare i template
  - [3. Decomposizione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Esplorare l'architettura del template
  - [4. Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) - Padroneggiare azure.yaml
  - [5. Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizzare per il tuo scenario
  - [6. Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Pulire le risorse
  - [7. Conclusione](workshop/docs/instructions/7-Wrap-up.md) - Revisione e passi successivi
- **🛠️ Laboratorio workshop AI**: [Laboratorio workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Esercizi focalizzati sull'IA
- **💡 Avvio rapido**: [Guida di configurazione del workshop](workshop/README.md#quick-start) - Configurazione dell'ambiente

**Perfetto per**: formazione aziendale, corsi universitari, apprendimento autodidatta e bootcamp per sviluppatori.

---

## 📖 Approfondimento: Capacità di AZD

Oltre le basi, AZD offre potenti funzionalità per i deployment di produzione:

- **Deployment basati su template** - Utilizzare template predefiniti per pattern applicativi comuni
- **Infrastruttura come codice** - Gestire risorse Azure usando Bicep o Terraform  
- **Workflow integrati** - Provisioning, deployment e monitoraggio delle applicazioni in modo trasparente
- **Orientato agli sviluppatori** - Ottimizzato per produttività ed esperienza degli sviluppatori

### **AZD + Microsoft Foundry: Perfetto per i deployment AI**

**Perché AZD per soluzioni AI?** AZD affronta le principali sfide degli sviluppatori AI:

- **Template pronti per l'IA** - Template preconfigurati per Microsoft Foundry Models, Cognitive Services e carichi ML
- **Deployment AI sicuri** - Pattern di sicurezza integrati per servizi AI, chiavi API e endpoint dei modelli  
- **Pattern AI per la produzione** - Best practice per deployment AI scalabili ed efficienti in termini di costi
- **Workflow AI end-to-end** - Dallo sviluppo del modello al deployment in produzione con monitoraggio adeguato
- **Ottimizzazione dei costi** - Allocazione intelligente delle risorse e strategie di scaling per carichi AI
- **Integrazione con Microsoft Foundry** - Connessione senza soluzione di continuità al catalogo modelli e agli endpoint di Microsoft Foundry

---

## 🎯 Libreria di template ed esempi

### In primo piano: Template Microsoft Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

> **Nota:** Questi template mostrano vari pattern AI. Alcuni sono Azure Samples esterni, altri sono implementazioni locali.

| Template | Capitolo | Complessità | Servizi | Tipo |
|----------|---------|------------|----------|------|
| [**Inizia con la chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Esterno |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Esterno |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Esterno |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Esterno |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Esterno |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Esterno |
| [**Soluzione Retail Multi-Agente**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Locale** |

### In primo piano: Scenari di apprendimento completi
**Template di applicazioni pronte per la produzione mappate ai capitoli di apprendimento**

| Template | Capitolo di apprendimento | Complessità | Apprendimento chiave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Pattern base di deployment AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework agent e function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI enterprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Customer e Inventory |

### Apprendimento per tipo di esempio

> **📌 Esempi locali vs esterni:**  
> **Esempi locali** (in questo repo) = Pronti all'uso immediatamente  
> **Esempi esterni** (Azure Samples) = Clonare dai repository collegati

#### Esempi locali (Pronti all'uso)
- [**Soluzione Retail Multi-Agente**](examples/retail-scenario.md) - Implementazione completa pronta per la produzione con template ARM
  - Architettura multi-agente (agenti Customer + Inventory)
  - Monitoraggio e valutazione completi
  - Deployment con un clic tramite template ARM

#### Esempi locali - Applicazioni container (Capitoli 2-5)
**Esempi completi di deployment container in questo repository:**
- [**Esempi Container App**](examples/container-app/README.md) - Guida completa ai deployment containerizzati
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST di base con scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Deployment multi-servizio pronto per la produzione
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoraggio, sicurezza e linee guida per l'ottimizzazione dei costi

#### Esempi esterni - Applicazioni semplici (Capitoli 1-2)
**Clona questi repository Azure Samples per iniziare:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pattern di deployment di base
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment di contenuti statici
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment di API REST

#### Esempi esterni - Integrazione database (Capitoli 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pattern di connettività al database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow dati serverless

#### Esempi esterni - Pattern avanzati (Capitoli 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architetture multi-servizio
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Elaborazione in background  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Pattern ML pronti per la produzione

### Collezioni di template esterne
- [**Galleria ufficiale dei template AZD**](https://azure.github.io/awesome-azd/) - Collezione curata di template ufficiali e della community
- [**Template Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione dei template Microsoft Learn
- [**Examples Directory**](examples/README.md) - Esempi di apprendimento locali con spiegazioni dettagliate

---

## 📚 Risorse di apprendimento e riferimenti

### Riferimenti rapidi
- [**Cheat sheet dei comandi**](resources/cheat-sheet.md) - Comandi essenziali di azd organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Domande frequenti organizzate per capitolo di apprendimento
- [**Guida di studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop pratici
- [**Laboratorio workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendere le tue soluzioni AI distribuibili con AZD (2-3 ore)
- [**Workshop interattivo**](workshop/README.md) - Esercizi guidati in 8 moduli con MkDocs e GitHub Codespaces
  - Segue: Introduzione → Selezione → Validazione → Decomposizione → Configurazione → Personalizzazione → Smantellamento → Conclusione

### Risorse di apprendimento esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro Architettura di Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore prezzi di Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato di Azure](https://status.azure.com/)

### Competenze degli agenti AI per il tuo editor
- [**Competenze Microsoft Azure su skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 agent skill aperti per Azure AI, Foundry, deployment, diagnostica, ottimizzazione dei costi e altro. Installali in GitHub Copilot, Cursor, Claude Code o in qualsiasi agente supportato:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guida rapida alla risoluzione dei problemi

**Problemi comuni che i principianti incontrano e soluzioni immediate:**

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
# Prova un'altra regione di Azure
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
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD genera nomi unici, ma se si verifica un conflitto:
azd down --force --purge

# Quindi riprovare con un ambiente nuovo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Il deployment del template richiede troppo tempo</strong></summary>

**Tempi di attesa normali:**
- Applicazione web semplice: 5-10 minuti
- Applicazione con database: 10-15 minuti
- Applicazioni AI: 15-25 minuti (OpenAI provisioning è lento)

```bash
# Controlla l'avanzamento
azd show

# Se bloccato per più di 30 minuti, controlla il Portale di Azure:
azd monitor
# Cerca distribuzioni non riuscite
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Controlla il tuo ruolo in Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# È necessario almeno il ruolo "Contributor"
# Chiedi al tuo amministratore Azure di concedere:
# - Contributor (per le risorse)
# - User Access Administrator (per le assegnazioni di ruolo)
```
</details>

<details>
<summary><strong>❌ Impossibile trovare l'URL dell'applicazione distribuita</strong></summary>

```bash
# Mostra tutti gli endpoint di servizio
azd show

# Oppure apri il Portale di Azure
azd monitor

# Controlla un servizio specifico
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
- [ ] **Capitolo 2**: Sviluppo incentrato sull'AI ✅  
- [ ] **Capitolo 3**: Configurazione e Autenticazione ✅
- [ ] **Capitolo 4**: Infrastruttura come codice e Distribuzione ✅
- [ ] **Capitolo 5**: Soluzioni AI multi-agente ✅
- [ ] **Capitolo 6**: Validazione e Pianificazione pre-distribuzione ✅
- [ ] **Capitolo 7**: Risoluzione dei problemi e Debugging ✅
- [ ] **Capitolo 8**: Pattern per produzione e imprese ✅

### Verifica dell'apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze tramite:
1. **Esercizio pratico**: Completa l'esercitazione pratica del capitolo
2. **Verifica delle conoscenze**: Rivedi la sezione FAQ del tuo capitolo
3. **Discussione nella community**: Condividi la tua esperienza su Azure Discord
4. **Capitolo successivo**: Passa al livello di complessità successivo

### Benefici al completamento del corso
Al completamento di tutti i capitoli, avrai:
- **Esperienza in produzione**: Hai distribuito applicazioni AI reali su Azure
- **Competenze professionali**: Capacità di deployment pronte per l'ambiente enterprise  
- **Riconoscimento nella community**: Membro attivo della community degli sviluppatori Azure
- **Avanzamento di carriera**: Expertise richieste in AZD e deployment AI

---

## 🤝 Community e Supporto

### Ottieni aiuto e supporto
- **Problemi tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande sull'apprendimento**: [Community Discord di Microsoft Azure](https://discord.gg/microsoft-azure) e [![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Assistenza specifica per l'AI**: Unisciti al [![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentazione**: [Documentazione ufficiale di Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti della community dal Discord di Microsoft Foundry

**Risultati recenti del sondaggio dal canale #Azure:**
- **45%** degli sviluppatori vogliono usare AZD per carichi di lavoro AI
- **Principali sfide**: distribuzioni multi-servizio, gestione delle credenziali, readiness per la produzione  
- **Più richiesti**: template specifici per l'AI, guide di risoluzione problemi, best practice

**Unisciti alla nostra community per:**
- Condividi le tue esperienze AZD + AI e ricevi aiuto
- Accedi alle anteprime iniziali dei nuovi template AI
- Contribuisci alle best practice per il deployment AI
- Influenza lo sviluppo futuro delle funzionalità AI + AZD

### Contribuire al corso
Accogliamo contributi! Leggi la nostra [Guida per i contributi](CONTRIBUTING.md) per dettagli su:
- **Miglioramenti dei contenuti**: Migliora i capitoli e gli esempi esistenti
- **Nuovi esempi**: Aggiungi scenari e template del mondo reale  
- **Traduzione**: Aiuta a mantenere il supporto multilingue
- **Segnalazioni di bug**: Migliora accuratezza e chiarezza
- **Standard della community**: Segui le nostre linee guida inclusive della community

---

## 📄 Informazioni sul corso

### Licenza
Questo progetto è rilasciato sotto la licenza MIT - vedere il file [LICENSE](../../LICENSE) per i dettagli.

### Risorse didattiche Microsoft correlate

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
[![Sviluppo Web per principianti](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT per principianti](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Sviluppo XR per principianti](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Copilot
[![Copilot per programmazione in coppia con l'IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot per C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Avventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigazione del corso

**🚀 Pronto per iniziare a imparare?**

**Principianti**: Iniziate con [Capitolo 1: Fondamenti e Avvio rapido](#-chapter-1-foundation--quick-start)  
**Sviluppatori AI**: Vai a [Capitolo 2: Sviluppo incentrato sull'IA](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Sviluppatori esperti**: Iniziate con [Capitolo 3: Configurazione e Autenticazione](#️-chapter-3-configuration--authentication)

**Prossimi passi**: [Inizia Capitolo 1 - Nozioni di base AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatizzate possono contenere errori o inesattezze. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->