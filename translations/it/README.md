# AZD Per Principianti: Un Percorso di Apprendimento Strutturato

![AZD per principianti](../../translated_images/it/azdbeginners.5527441dd9f74068.webp) 

[![Osservatori GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Stelle GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord di Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduzioni Automatiche (Sempre Aggiornate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabo](../ar/README.md) | [Bengalese](../bn/README.md) | [Bulgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Cinese (Semplificato)](../zh-CN/README.md) | [Cinese (Tradizionale, Hong Kong)](../zh-HK/README.md) | [Cinese (Tradizionale, Macao)](../zh-MO/README.md) | [Cinese (Tradizionale, Taiwan)](../zh-TW/README.md) | [Croato](../hr/README.md) | [Ceco](../cs/README.md) | [Danese](../da/README.md) | [Olandese](../nl/README.md) | [Estone](../et/README.md) | [Finlandese](../fi/README.md) | [Francese](../fr/README.md) | [Tedesco](../de/README.md) | [Greco](../el/README.md) | [Ebraico](../he/README.md) | [Hindi](../hi/README.md) | [Ungherese](../hu/README.md) | [Indonesiano](../id/README.md) | [Italiano](./README.md) | [Giapponese](../ja/README.md) | [Kannada](../kn/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malese](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalese](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norvegese](../no/README.md) | [Persiano (Farsi)](../fa/README.md) | [Polacco](../pl/README.md) | [Portoghese (Brasile)](../pt-BR/README.md) | [Portoghese (Portogallo)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumeno](../ro/README.md) | [Russo](../ru/README.md) | [Serbo (Cirillico)](../sr/README.md) | [Slovacco](../sk/README.md) | [Sloveno](../sl/README.md) | [Spagnolo](../es/README.md) | [Swahili](../sw/README.md) | [Svedese](../sv/README.md) | [Tagalog (Filippino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Tailandese](../th/README.md) | [Turco](../tr/README.md) | [Ucraino](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Preferisci clonare localmente?**
>
> Questo repository include oltre 50 traduzioni che aumentano significativamente la dimensione del download. Per clonare senza traduzioni, usa lo sparse checkout:
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

## 🆕 Novità di azd oggi

Azure Developer CLI è cresciuto oltre le tradizionali web app e API. Oggi, azd è lo strumento unico per distribuire qualsiasi applicazione su Azure — incluse applicazioni potenziate dall'AI e agenti intelligenti.

Ecco cosa significa per te:

- **Gli agenti AI sono ora workload di prima classe in azd.** Puoi inizializzare, distribuire e gestire progetti di agenti AI usando lo stesso flusso `azd init` → `azd up` che già conosci.
- **L'integrazione con Microsoft Foundry** porta il deployment dei modelli, l'hosting degli agenti e la configurazione dei servizi AI direttamente nell'ecosistema dei template azd.
- **Il flusso di lavoro core non è cambiato.** Che tu stia distribuendo una app todo, un microservizio o una soluzione AI multi-agente, i comandi sono gli stessi.

Se hai già usato azd prima, il supporto AI è un'estensione naturale — non uno strumento separato o un percorso avanzato. Se parti da zero, imparerai un unico flusso che funziona per tutto.

---

## 🚀 Cos'è Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** è uno strumento da riga di comando pensato per gli sviluppatori che rende semplice distribuire applicazioni su Azure. Invece di creare e collegare manualmente dozzine di risorse Azure, puoi distribuire intere applicazioni con un singolo comando.

### La magia di `azd up`

```bash
# Questo singolo comando fa tutto:
# ✅ Crea tutte le risorse Azure
# ✅ Configura la rete e la sicurezza
# ✅ Compila il codice della tua applicazione
# ✅ Distribuisce su Azure
# ✅ Ti fornisce un URL funzionante
azd up
```

**È tutto!** Nessun clic nel Portale di Azure, nessun complesso template ARM da imparare prima, nessuna configurazione manuale - solo applicazioni funzionanti su Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual è la differenza?

Questa è la domanda più comune che i principianti fanno. Ecco la risposta semplice:

| Caratteristica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scopo** | Gestire singole risorse di Azure | Distribuire applicazioni complete |
| **Mentalità** | Orientato all'infrastruttura | Orientato all'applicazione |
| **Esempio** | `az webapp create --name myapp...` | `azd up` |
| **Curva di apprendimento** | Richiede conoscenza dei servizi Azure | Basta conoscere la tua app |
| **Ideale per** | DevOps, Infrastruttura | Sviluppatori, Prototipazione |

### Analogia semplice

- **Azure CLI** è come avere tutti gli attrezzi per costruire una casa - martelli, seghe, chiodi. Puoi costruire qualsiasi cosa, ma devi conoscere l'edilizia.
- **Azure Developer CLI** è come assumere un imprenditore - descrivi ciò che vuoi, e lui si occupa della costruzione.

### Quando usare ciascuno

| Scenario | Usa questo |
|----------|----------|
| "Voglio distribuire rapidamente la mia web app" | `azd up` |
| "Ho bisogno di creare solo un account di archiviazione" | `az storage account create` |
| "Sto costruendo un'applicazione AI completa" | `azd init --template azure-search-openai-demo` |
| "Devo eseguire il debug di una risorsa Azure specifica" | `az resource show` |
| "Voglio una distribuzione pronta per la produzione in pochi minuti" | `azd up --environment production` |

### Funzionano insieme!

AZD usa Azure CLI sotto il cofano. Puoi usare entrambi:
```bash
# Distribuisci la tua app con AZD
azd up

# Quindi perfeziona risorse specifiche con Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trova template in Awesome AZD

Non partire da zero! **Awesome AZD** è la raccolta della community di template pronti per il deploy:

| Risorsa | Descrizione |
|----------|-------------|
| 🔗 [**Galleria Awesome AZD**](https://azure.github.io/awesome-azd/) | Sfoglia oltre 200 template con deploy con un clic |
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

**🎉 È tutto!** La tua app è ora attiva su Azure.

### Pulizia (Non dimenticare!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Come usare questo corso

Questo corso è progettato per un **apprendimento progressivo** - inizia dove ti senti a tuo agio e prosegui gradualmente:

| La tua esperienza | Inizia qui |
|-----------------|------------|
| **Nuovo in Azure** | [Capitolo 1: Fondamenti](#-chapter-1-foundation--quick-start) |
| **Conosci Azure, nuovo ad AZD** | [Capitolo 1: Fondamenti](#-chapter-1-foundation--quick-start) |
| **Vuoi distribuire app AI** | [Capitolo 2: Sviluppo AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vuoi esercitarti** | [🎓 Workshop Interattivo](workshop/README.md) - laboratorio guidato di 3-4 ore |
| **Hai bisogno di pattern per la produzione** | [Capitolo 8: Produzione & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configurazione rapida

1. **Crea un fork di questo repository**: [![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clona il repository**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Ottieni aiuto**: [Community Discord di Azure](https://discord.com/invite/ByRwuEEgH4)

> **Preferisci clonare localmente?**
>
> Questo repository include oltre 50 traduzioni che aumentano significativamente la dimensione del download. Per clonare senza traduzioni, usa lo sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Questo ti dà tutto il necessario per completare il corso con un download molto più veloce.


## Panoramica del corso

Padroneggia Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Particolare attenzione al deployment di applicazioni AI con integrazione Microsoft Foundry.**

### Perché questo corso è essenziale per gli sviluppatori moderni

Sulla base delle informazioni dalla community Microsoft Foundry Discord, **il 45% degli sviluppatori vuole usare AZD per carichi di lavoro AI** ma incontra difficoltà con:
- Architetture AI complesse multi-servizio
- Best practice per il deployment di AI in produzione  
- Integrazione e configurazione dei servizi AI di Azure
- Ottimizzazione dei costi per carichi di lavoro AI
- Risoluzione dei problemi specifici del deployment AI

### Obiettivi di apprendimento

Completando questo corso strutturato, potrai:
- **Padroneggiare i fondamenti di AZD**: Concetti core, installazione e configurazione
- **Distribuire applicazioni AI**: Usare AZD con i servizi Microsoft Foundry
- **Implementare Infrastructure as Code**: Gestire le risorse Azure con template Bicep
- **Risolvere problemi di deployment**: Risolvere problemi comuni e fare il debug
- **Ottimizzare per la produzione**: Sicurezza, scaling, monitoraggio e gestione dei costi
- **Costruire soluzioni multi-agente**: Distribuire architetture AI complesse

## 🗺️ Mappa del corso: navigazione rapida per capitolo

Ogni capitolo ha un README dedicato con obiettivi di apprendimento, avvii rapidi e esercizi:

| Capitolo | Argomento | Lezioni | Durata | Complessità |
|---------|-------|---------|----------|------------|
| **[Ch 1: Fondamenti](docs/chapter-01-foundation/README.md)** | Introduzione | [Basi di AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installazione](docs/chapter-01-foundation/installation.md) &#124; [Primo progetto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Capitolo 2: Sviluppo AI](docs/chapter-02-ai-development/README.md)** | Applicazioni AI-First | [Integrazione Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agenti AI](docs/chapter-02-ai-development/agents.md) &#124; [Distribuzione Modelli](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Laboratorio](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ore | ⭐⭐ |
| **[Capitolo 3: Configurazione](docs/chapter-03-configuration/README.md)** | Autenticazione & Sicurezza | [Configurazione](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Capitolo 4: Infrastruttura](docs/chapter-04-infrastructure/README.md)** | IaC & Distribuzione | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ore | ⭐⭐⭐ |
| **[Capitolo 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluzioni AI Agent | [Scenario Retail](examples/retail-scenario.md) &#124; [Pattern di Coordinamento](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[Capitolo 6: Pre-Distribuzione](docs/chapter-06-pre-deployment/README.md)** | Pianificazione & Validazione | [Controlli Preliminari](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Pianificazione della Capacità](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selezione SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ora | ⭐⭐ |
| **[Capitolo 7: Risoluzione problemi](docs/chapter-07-troubleshooting/README.md)** | Debug & Risoluzione | [Problemi Comuni](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ore | ⭐⭐ |
| **[Capitolo 8: Produzione](docs/chapter-08-production/README.md)** | Pattern Enterprise | [Pratiche di Produzione](docs/chapter-08-production/production-ai-practices.md) | 2-3 ore | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratorio pratico | [Introduzione](workshop/docs/instructions/0-Introduction.md) &#124; [Selezione](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Decostruzione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusione](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ore | ⭐⭐ |

**Durata totale del corso:** ~10-14 ore | **Progresso delle competenze:** Principiante → Pronto per la produzione

---

## 📚 Capitoli di apprendimento

*Seleziona il tuo percorso di apprendimento in base al livello di esperienza e agli obiettivi*

### 🚀 Capitolo 1: Fondamenti e Avvio rapido
**Prerequisiti**: Sottoscrizione Azure, conoscenze di base della riga di comando  
**Durata**: 30-45 minuti  
**Complessità**: ⭐

#### Cosa imparerai
- Comprendere i fondamenti di Azure Developer CLI
- Installare AZD sulla tua piattaforma
- La tua prima distribuzione riuscita

#### Risorse di apprendimento
- **🎯 Inizia qui**: [Che cos'è Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Nozioni di base AZD](docs/chapter-01-foundation/azd-basics.md) - Concetti fondamentali e terminologia
- **⚙️ Configurazione**: [Installazione & Configurazione](docs/chapter-01-foundation/installation.md) - Guide specifiche per piattaforma
- **🛠️ Pratica**: [Il tuo primo progetto](docs/chapter-01-foundation/first-project.md) - Tutorial passo-passo
- **📋 Riferimento rapido**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Esercizi pratici
```bash
# Verifica rapida dell'installazione
azd version

# Distribuisci la tua prima applicazione
azd init --template todo-nodejs-mongo
azd up
```

**💡 Risultato del capitolo**: Distribuire con successo una semplice applicazione web su Azure utilizzando AZD

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
**📈 Livello di competenza dopo:** Può distribuire applicazioni di base in modo indipendente
**📈 Livello di competenza dopo:** Può distribuire applicazioni di base in modo indipendente

---

### 🤖 Capitolo 2: Sviluppo AI-First (Consigliato per sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 ore  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Integrazione Microsoft Foundry con AZD
- Distribuire applicazioni potenziate dall'AI
- Comprendere le configurazioni dei servizi AI

#### Risorse di apprendimento
- **🎯 Inizia qui**: [Integrazione Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenti AI**: [Guida agli Agenti AI](docs/chapter-02-ai-development/agents.md) - Distribuire agenti intelligenti con AZD
- **📖 Modelli**: [Distribuzione Modelli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuire e gestire modelli AI
- **🛠️ Laboratorio**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendere le tue soluzioni AI pronte per AZD
- **🎥 Guida interattiva**: [Materiali del laboratorio](workshop/README.md) - Apprendimento basato su browser con MkDocs * DevContainer Environment
- **📋 Modelli**: [Microsoft Foundry Templates](#risorse-del-workshop)
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

**💡 Risultato del capitolo**: Distribuire e configurare un'app di chat potenziata dall'AI con capacità RAG

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

**📊 Investimento di tempo:** 1-2 ore  
**📈 Livello di competenza dopo:** Può distribuire e configurare applicazioni AI pronte per la produzione  
**💰 Consapevolezza dei costi:** Comprendere costi di sviluppo $80-150/mese, costi di produzione $300-3500/mese

#### 💰 Considerazioni sui costi per le distribuzioni AI

**Ambiente di sviluppo (Stimato $80-150/mese):**
- Modelli Microsoft Foundry (Pay-as-you-go): $0-50/mese (basato sull'uso dei token)
- AI Search (tier Basic): $75/mese
- Container Apps (Consumption): $0-20/mese
- Archiviazione (Standard): $1-5/mese

**Ambiente di produzione (Stimato $300-3,500+/mese):**
- Modelli Microsoft Foundry (PTU per prestazioni consistenti): $3,000+/mese O Pay-as-go con alto volume
- AI Search (tier Standard): $250/mese
- Container Apps (Dedicated): $50-100/mese
- Application Insights: $5-50/mese
- Archiviazione (Premium): $10-50/mese

**💡 Suggerimenti per l'ottimizzazione dei costi:**
- Usa **Free Tier** Microsoft Foundry Models per l'apprendimento (Azure OpenAI 50,000 tokens/month included)
- Esegui `azd down` per deallocare le risorse quando non stai sviluppando attivamente
- Inizia con la fatturazione basata sul consumo, esegui l'upgrade a PTU solo per la produzione
- Usa `azd provision --preview` per stimare i costi prima della distribuzione
- Abilita l'auto-scaling: paga solo per l'utilizzo effettivo

**Monitoraggio dei costi:**
```bash
# Controlla i costi mensili stimati
azd provision --preview

# Monitora i costi effettivi nel portale di Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolo 3: Configurazione & Autenticazione
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 45-60 minuti  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Configurazione e gestione degli ambienti
- Best practice per autenticazione e sicurezza
- Nomenclatura e organizzazione delle risorse

#### Risorse di apprendimento
- **📖 Configurazione**: [Guida alla configurazione](docs/chapter-03-configuration/configuration.md) - Preparazione dell'ambiente
- **🔐 Sicurezza**: [Pattern di autenticazione e managed identity](docs/chapter-03-configuration/authsecurity.md) - Pattern di autenticazione
- **📝 Esempi**: [Esempio App Database](examples/database-app/README.md) - Esempi AZD Database

#### Esercizi pratici
- Configurare ambienti multipli (dev, staging, prod)
- Impostare l'autenticazione con managed identity
- Implementare configurazioni specifiche per ambiente

**💡 Risultato del capitolo**: Gestire più ambienti con autenticazione e sicurezza adeguate

---

### 🏗️ Capitolo 4: Infrastructure as Code & Distribuzione
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐⭐

#### Cosa imparerai
- Pattern avanzati di distribuzione
- Infrastructure as Code con Bicep
- Strategie di provisioning delle risorse

#### Risorse di apprendimento
- **📖 Distribuzione**: [Guida alla distribuzione](docs/chapter-04-infrastructure/deployment-guide.md) - Flussi di lavoro completi
- **🏗️ Provisioning**: [Provisioning delle risorse](docs/chapter-04-infrastructure/provisioning.md) - Gestione delle risorse Azure
- **📝 Esempi**: [Esempio Container App](../../examples/container-app) - Distribuzioni containerizzate

#### Esercizi pratici
- Creare template Bicep personalizzati
- Distribuire applicazioni multi-servizio
- Implementare strategie di deployment blue-green

**💡 Risultato del capitolo**: Distribuire applicazioni multi-servizio complesse usando template infrastrutturali personalizzati

---

### 🎯 Capitolo 5: Soluzioni AI Multi-Agente (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa imparerai
- Pattern architetturali multi-agente
- Orchestrazione e coordinamento degli agenti
- Distribuzioni AI pronte per la produzione

#### Risorse di apprendimento
- **🤖 Progetto in evidenza**: [Soluzione Multi-Agente Retail](examples/retail-scenario.md) - Implementazione completa
- **🛠️ Pacchetto template ARM**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Distribuzione con un clic
- **📖 Architettura**: [Pattern di coordinamento multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pattern

#### Esercizi pratici
```bash
# Distribuire l'intera soluzione multiagente per il commercio al dettaglio
cd examples/retail-multiagent-arm-template
./deploy.sh

# Esplorare le configurazioni degli agenti
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del capitolo**: Distribuire e gestire una soluzione AI multi-agente pronta per la produzione con agenti Cliente e Inventario

---

### 🔍 Capitolo 6: Validazione e Pianificazione Pre-Distribuzione
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 ora  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Pianificazione della capacità e validazione delle risorse
- Strategie di selezione SKU
- Controlli preliminari e automazione

#### Risorse di apprendimento
- **📊 Pianificazione**: [Pianificazione della capacità](docs/chapter-06-pre-deployment/capacity-planning.md) - Validazione delle risorse
- **💰 Selezione**: [Selezione SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Scelte costo-efficaci
- **✅ Validazione**: [Controlli preliminari](docs/chapter-06-pre-deployment/preflight-checks.md) - Script automatizzati

#### Esercizi pratici
- Eseguire script di validazione della capacità
- Ottimizzare la selezione degli SKU per i costi
- Implementare controlli automatizzati pre-distribuzione

**💡 Risultato del capitolo**: Validare e ottimizzare le distribuzioni prima dell'esecuzione

---

### 🚨 Capitolo 7: Risoluzione dei problemi & Debugging
**Prerequisiti**: Qualsiasi capitolo di distribuzione completato  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Approcci sistematici al debugging
- Problemi comuni e soluzioni
- Risoluzione dei problemi specifici per l'AI

#### Risorse di apprendimento
- **🔧 Problemi comuni**: [Problemi comuni](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategie passo-passo
- **🤖 Problemi AI**: [Risoluzione problemi specifici per l'AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi dei servizi AI

#### Esercizi pratici
- Diagnosticare i fallimenti di distribuzione
- Risolvere problemi di autenticazione
- Debuggare la connettività dei servizi AI

**💡 Risultato del capitolo**: Diagnosticare e risolvere in modo indipendente i problemi comuni di distribuzione

---

### 🏢 Capitolo 8: Produzione & Pattern Enterprise
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa imparerai
- Strategie di distribuzione in produzione
- Pattern di sicurezza enterprise
- Monitoraggio e ottimizzazione dei costi

#### Risorse di apprendimento
- **🏭 Produzione**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Pattern aziendali
- **📝 Esempi**: [Esempio microservizi](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: [Integrazione Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoraggio

#### Esercizi pratici
- Implementare pattern di sicurezza aziendale
- Configurare un monitoraggio completo
- Distribuire in produzione con governance adeguata

**💡 Risultato del capitolo**: Distribuire applicazioni pronte per l'azienda con tutte le capacità di produzione

---

## 🎓 Panoramica del workshop: Esperienza di apprendimento pratica

> **⚠️ STATO DEL WORKSHOP: Sviluppo attivo**  
> I materiali del workshop sono attualmente in fase di sviluppo e perfezionamento. I moduli principali sono funzionanti, ma alcune sezioni avanzate sono incomplete. Stiamo lavorando attivamente per completare tutti i contenuti. [Monitora i progressi →](workshop/README.md)

### Materiali interattivi del workshop
**Apprendimento pratico completo con strumenti basati sul browser ed esercizi guidati**

I materiali del workshop forniscono un'esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra. Il workshop è progettato sia per l'apprendimento autonomo che per sessioni condotte da istruttori.

#### 🛠️ Caratteristiche del workshop
- **Interfaccia basata su browser**: Workshop completo basato su MkDocs con funzionalità di ricerca, copia e temi
- **Integrazione con GitHub Codespaces**: Configurazione dell'ambiente di sviluppo con un clic
- **Percorso di apprendimento strutturato**: Esercizi guidati in 8 moduli (3-4 ore totali)
- **Metodologia progressiva**: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Smantellamento → Riepilogo
- **Ambiente DevContainer interattivo**: Strumenti e dipendenze preconfigurati

#### 📚 Struttura dei moduli del workshop
Il workshop segue una **metodologia progressiva in 8 moduli** che ti porta dalla scoperta alla padronanza del deployment:

| Modulo | Argomento | Cosa farai | Durata |
|--------|-------|----------------|----------|
| **0. Introduzione** | Panoramica del workshop | Comprendere obiettivi di apprendimento, prerequisiti e struttura del workshop | 15 min |
| **1. Selezione** | Scoperta dei template | Esplora i template AZD e seleziona il template AI più adatto al tuo scenario | 20 min |
| **2. Validazione** | Deploy e verifica | Distribuisci il template con `azd up` e verifica che l'infrastruttura funzioni | 30 min |
| **3. Decostruzione** | Comprendere la struttura | Usa GitHub Copilot per esplorare l'architettura del template, i file Bicep e l'organizzazione del codice | 30 min |
| **4. Configurazione** | Approfondimento su azure.yaml | Padroneggia la configurazione di `azure.yaml`, gli hook del ciclo di vita e le variabili d'ambiente | 30 min |
| **5. Personalizzazione** | Rendilo tuo | Abilita AI Search, tracing, valutazione e personalizza per il tuo scenario | 45 min |
| **6. Smantellamento** | Pulizia | Rimuovi in modo sicuro le risorse con `azd down --purge` | 15 min |
| **7. Riepilogo** | Passi successivi | Rivedi i risultati, i concetti chiave e prosegui il tuo percorso di apprendimento | 15 min |

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
# Opzione 1: GitHub Codespaces (Consigliato)
# Fai clic su "Code" → "Crea codespace su main" nel repository

# Opzione 2: Sviluppo locale
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Segui le istruzioni di configurazione in workshop/README.md
```

#### 🎯 Risultati di apprendimento del workshop
Al completamento del workshop, i partecipanti:
- **Distribuire applicazioni AI in produzione**: Usare AZD con i servizi Microsoft Foundry
- **Padroneggiare architetture multi-agente**: Implementare soluzioni con agenti AI coordinati
- **Implementare le migliori pratiche di sicurezza**: Configurare autenticazione e controllo degli accessi
- **Ottimizzare per la scalabilità**: Progettare deployment performanti ed efficienti nei costi
- **Risoluzione dei problemi di deployment**: Risolvere autonomamente i problemi comuni

#### 📖 Risorse del workshop
- **🎥 Guida interattiva**: [Materiali del workshop](workshop/README.md) - Ambiente di apprendimento basato su browser
- **📋 Istruzioni modulo per modulo**:
  - [0. Introduzione](workshop/docs/instructions/0-Introduction.md) - Panoramica del workshop e obiettivi
  - [1. Selezione](workshop/docs/instructions/1-Select-AI-Template.md) - Trova e seleziona i template AI
  - [2. Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuisci e verifica i template
  - [3. Decostruzione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Esplora l'architettura del template
  - [4. Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) - Padroneggia azure.yaml
  - [5. Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizza per il tuo scenario
  - [6. Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Pulizia delle risorse
  - [7. Riepilogo](workshop/docs/instructions/7-Wrap-up.md) - Rivedi e passi successivi
- **🛠️ Laboratorio Workshop AI**: [Laboratorio Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Esercizi focalizzati sull'AI
- **💡 Avvio rapido**: [Guida all'installazione del workshop](workshop/README.md#quick-start) - Configurazione dell'ambiente

**Perfetto per**: Formazione aziendale, corsi universitari, apprendimento autonomo e bootcamp per sviluppatori.

---

## 📖 Approfondimento: capacità di AZD

Oltre le basi, AZD offre potenti funzionalità per i deployment in produzione:

- **Deployment basati su template** - Usa template predefiniti per modelli comuni delle applicazioni
- **Infrastruttura come codice** - Gestisci le risorse Azure usando Bicep o Terraform  
- **Flussi di lavoro integrati** - Provisioning, deployment e monitoraggio delle applicazioni in modo integrato
- **Orientato agli sviluppatori** - Ottimizzato per la produttività e l'esperienza degli sviluppatori

### **AZD + Microsoft Foundry: Perfetto per i deployment AI**

**Perché AZD per soluzioni AI?** AZD affronta le principali sfide che gli sviluppatori AI incontrano:

- **Template pronti per l'AI** - Template preconfigurati per Microsoft Foundry Models, Cognitive Services e carichi di lavoro ML
- **Deploy AI sicuri** - Pattern di sicurezza integrati per i servizi AI, le chiavi API e gli endpoint dei modelli  
- **Pattern AI per la produzione** - Best practice per deployment di applicazioni AI scalabili ed economicamente efficienti
- **Flussi di lavoro AI end-to-end** - Dallo sviluppo del modello al deployment in produzione con monitoraggio adeguato
- **Ottimizzazione dei costi** - Allocazione intelligente delle risorse e strategie di scaling per i carichi di lavoro AI
- **Integrazione con Microsoft Foundry** - Connessione fluida al catalogo modelli e agli endpoint di Microsoft Foundry

---

## 🎯 Libreria di template ed esempi

### In evidenza: template Microsoft Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

> **Nota:** Questi template mostrano vari pattern AI. Alcuni sono Azure Samples esterni, altri sono implementazioni locali.

| Template | Capitolo | Complessità | Servizi | Tipo |
|----------|---------|------------|----------|------|
| [**Inizia con chat AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Esterno |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Esterno |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Esterno |
| [**Avvio rapido App Chat OpenAI**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Esterno |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Esterno |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Esterno |
| [**Soluzione multi-agente Retail**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Locale** |

### In evidenza: scenari di apprendimento completi
**Template di applicazioni pronte per la produzione mappati ai capitoli di apprendimento**

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
> **Esempi esterni** (Azure Samples) = Clona dai repository collegati

#### Esempi locali (pronti all'uso)
- [**Soluzione multi-agente Retail**](examples/retail-scenario.md) - Implementazione completa pronta per la produzione con template ARM
  - Architettura multi-agente (agenti Customer + Inventory)
  - Monitoraggio e valutazione completi
  - Distribuzione con un clic tramite template ARM

#### Esempi locali - Applicazioni Container (Capitoli 2-5)
**Esempi completi di deployment containerizzati in questo repository:**
- [**Esempi Container App**](examples/container-app/README.md) - Guida completa ai deployment containerizzati
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST di base con scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Deployment multi-servizio pronto per la produzione
  - Modelli di deploy Quick Start, Production e Advanced
  - Guida su monitoraggio, sicurezza e ottimizzazione dei costi

#### Esempi esterni - Applicazioni semplici (Capitoli 1-2)
**Clona questi repository Azure Samples per iniziare:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pattern base di deployment
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment di contenuti statici
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment di API REST

#### Esempi esterni - Integrazione database (Capitoli 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pattern di connettività al database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flusso di dati serverless

#### Esempi esterni - Pattern avanzati (Capitoli 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architetture multi-servizio
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Elaborazione in background  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Pattern ML pronti per la produzione

### Collezioni di template esterne
- [**Galleria ufficiale dei template AZD**](https://azure.github.io/awesome-azd/) - Raccolta curata di template ufficiali e community
- [**Template della Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione dei template Microsoft Learn
- [**Directory Esempi**](examples/README.md) - Esempi di apprendimento locali con spiegazioni dettagliate

---

## 📚 Risorse di apprendimento e riferimenti

### Riferimenti rapidi
- [**Scheda comandi**](resources/cheat-sheet.md) - Comandi azd essenziali organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida di studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop pratici
- [**Laboratorio Workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendi le tue soluzioni AI distribuibili con AZD (2-3 ore)
- [**Workshop interattivo**](workshop/README.md) - Esercizi guidati in 8 moduli con MkDocs e GitHub Codespaces
  - Segue: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Smantellamento → Riepilogo

### Risorse di apprendimento esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore prezzi di Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato di Azure](https://status.azure.com/)

### Competenze agenti AI per il tuo editor
- [**Competenze Microsoft Azure su skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 competenze agent aperte per Azure AI, Foundry, deployment, diagnostica, ottimizzazione dei costi e altro. Installale in GitHub Copilot, Cursor, Claude Code, o in qualsiasi agente supportato:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guida rapida alla risoluzione dei problemi

**Problemi comuni che incontrano i principianti e soluzioni immediate:**

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

# Oppure usa SKU più piccoli durante lo sviluppo
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

# Opzione 2: Sistemare solo l'infrastruttura
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
# AZD genera nomi unici, ma in caso di conflitto:
azd down --force --purge

# Quindi riprovare con un ambiente nuovo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Distribuzione del template troppo lenta</strong></summary>

**Tempi di attesa normali:**
- App web semplice: 5-10 minuti
- App con database: 10-15 minuti
- Applicazioni AI: 15-25 minuti (Il provisioning di OpenAI è lento)

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
# Verifica il tuo ruolo Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Ti serve almeno il ruolo "Contributor"
# Chiedi al tuo amministratore Azure di concedere:
# - Contributor (per le risorse)
# - User Access Administrator (per le assegnazioni di ruoli)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Mostra tutti gli endpoint dei servizi
azd show

# Oppure apri il portale di Azure
azd monitor

# Verifica un servizio specifico
azd env get-values
# Cerca le variabili *_URL
```
</details>

### 📚 Risorse complete per la risoluzione dei problemi

- **Guida ai problemi comuni:** [Soluzioni dettagliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemi specifici per AI:** [Risoluzione problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guida al debug:** [Debug passo dopo passo](docs/chapter-07-troubleshooting/debugging.md)
- **Ottieni aiuto:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Completamento del corso e certificazione

### Monitoraggio del progresso
Monitora il tuo progresso di apprendimento attraverso ogni capitolo:

- [ ] **Capitolo 1**: Fondamenti e avvio rapido ✅
- [ ] **Capitolo 2**: Sviluppo incentrato sull'AI ✅  
- [ ] **Capitolo 3**: Configurazione e autenticazione ✅
- [ ] **Capitolo 4**: Infrastructure as Code e distribuzione ✅
- [ ] **Capitolo 5**: Soluzioni AI multi-agente ✅
- [ ] **Capitolo 6**: Validazione e pianificazione pre-distribuzione ✅
- [ ] **Capitolo 7**: Risoluzione dei problemi e debug ✅
- [ ] **Capitolo 8**: Pattern di produzione e aziendali ✅

### Verifica dell'apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze tramite:
1. **Esercizio pratico**: Completa il deployment pratico del capitolo
2. **Controllo delle conoscenze**: Rivedi la sezione FAQ del capitolo
3. **Discussione nella community**: Condividi la tua esperienza su Azure Discord
4. **Capitolo successivo**: Passa al livello di complessità successivo

### Vantaggi al completamento del corso
Al completamento di tutti i capitoli, avrai:
- **Esperienza in produzione**: Avrai distribuito vere applicazioni AI su Azure
- **Competenze professionali**: Capacità di deployment pronte per l'azienda  
- **Riconoscimento nella community**: Membro attivo della community di sviluppatori Azure
- **Avanzamento di carriera**: Competenze richieste in AZD e deployment AI

---

## 🤝 Community e supporto

### Ottieni aiuto e supporto
- **Problemi tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande sull'apprendimento**: [Community Discord di Microsoft Azure](https://discord.gg/microsoft-azure) e [![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aiuto specifico per l'AI**: Unisciti al [![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentazione**: [Documentazione ufficiale Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti della community dal Discord di Microsoft Foundry

**Risultati recenti del sondaggio dal canale #Azure:**
- **45%** degli sviluppatori vogliono utilizzare AZD per carichi di lavoro AI
- **Principali sfide**: Distribuzioni multi-servizio, gestione delle credenziali, preparazione alla produzione  
- **Più richieste**: template specifici per AI, guide di risoluzione problemi, best practice

Unisciti alla nostra community per:
- Condividere le tue esperienze AZD + AI e ottenere aiuto
- Accedere alle anteprime dei nuovi template AI
- Contribuire alle best practice per il deployment AI
- Influenzare lo sviluppo futuro delle funzionalità AI + AZD

### Contribuire al corso
Accogliamo contributi! Per dettagli leggi la nostra [Guida al contributo](CONTRIBUTING.md) su:
- **Miglioramenti dei contenuti**: Migliora capitoli ed esempi esistenti
- **Nuovi esempi**: Aggiungi scenari reali e template  
- **Traduzione**: Aiuta a mantenere il supporto multilingue
- **Segnalazione bug**: Migliora accuratezza e chiarezza
- **Standard della community**: Segui le nostre linee guida inclusive della community

---

## 📄 Informazioni sul corso

### Licenza
Questo progetto è rilasciato sotto la licenza MIT - vedi il file [LICENSE](../../LICENSE) per i dettagli.

### Risorse correlate di Microsoft Learning

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
[![Copilot per la programmazione in coppia con l'IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot per C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Avventura di Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigazione del corso

**🚀 Pronto per iniziare a imparare?**

**Principianti**: Inizia con [Capitolo 1: Fondamenti & Avvio rapido](#-chapter-1-foundation--quick-start)  
**Sviluppatori di IA**: Vai a [Capitolo 2: Sviluppo incentrato sull'IA](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Sviluppatori esperti**: Inizia con [Capitolo 3: Configurazione & Autenticazione](#️-chapter-3-configuration--authentication)

**Prossimi passi**: [Inizia il Capitolo 1 - Nozioni di base di AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur facendo del nostro meglio per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella lingua originale dovrebbe essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->