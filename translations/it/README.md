# AZD Per Principianti: Un Percorso di Apprendimento Strutturato

![AZD-per-principianti](../../translated_images/it/azdbeginners.5527441dd9f74068.webp) 

[![Osservatori GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Stelle GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord di Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduzioni automatiche (sempre aggiornate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabo](../ar/README.md) | [Bengalese](../bn/README.md) | [Bulgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Cinese (semplificato)](../zh-CN/README.md) | [Cinese (tradizionale, Hong Kong)](../zh-HK/README.md) | [Cinese (tradizionale, Macao)](../zh-MO/README.md) | [Cinese (tradizionale, Taiwan)](../zh-TW/README.md) | [Croato](../hr/README.md) | [Ceco](../cs/README.md) | [Danese](../da/README.md) | [Olandese](../nl/README.md) | [Estone](../et/README.md) | [Finlandese](../fi/README.md) | [Francese](../fr/README.md) | [Tedesco](../de/README.md) | [Greco](../el/README.md) | [Ebraico](../he/README.md) | [Hindi](../hi/README.md) | [Ungherese](../hu/README.md) | [Indonesiano](../id/README.md) | [Italiano](./README.md) | [Giapponese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malese](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Pidgin nigeriano](../pcm/README.md) | [Norvegese](../no/README.md) | [Persiano (Farsi)](../fa/README.md) | [Polacco](../pl/README.md) | [Portoghese (Brasile)](../pt-BR/README.md) | [Portoghese (Portogallo)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumeno](../ro/README.md) | [Russo](../ru/README.md) | [Serbo (Cirillico)](../sr/README.md) | [Slovacco](../sk/README.md) | [Sloveno](../sl/README.md) | [Spagnolo](../es/README.md) | [Swahili](../sw/README.md) | [Svedese](../sv/README.md) | [Tagalog (Filippino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailandese](../th/README.md) | [Turco](../tr/README.md) | [Ucraino](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Preferisci clonare localmente?**
>
> Questo repository include oltre 50 traduzioni che aumentano significativamente la dimensione del download. Per clonare senza le traduzioni, usa sparse checkout:
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

> 📌 Questo corso è stato validato con **`azd 1.25.6`** (giugno 2026). Esegui `azd version` per controllare la tua versione, e `azd upgrade` per ottenere l'ultima.

Azure Developer CLI è cresciuto oltre le tradizionali web app e API. Oggi, azd è lo strumento unico per distribuire **qualsiasi** applicazione su Azure—inclusive applicazioni potenti con AI e agenti intelligenti.

Ecco cosa significa per te:

- **Gli agenti AI sono ora workload azd di prima classe.** Puoi inizializzare, distribuire e gestire progetti di agenti AI usando lo stesso flusso di lavoro `azd init` → `azd up` che già conosci.
- **Un ciclo di vita completo degli agenti dalla CLI.** L'estensione `azure.ai.agents` ora copre l'intero percorso—`azd ai agent init` per scaffolding, `azd ai agent invoke` per testare (con output dei tempi di risposta), `azd ai agent eval generate` e `azd ai agent optimize` per misurare e migliorare la qualità, e `azd ai agent delete` per pulire.
- **Più blocchi di costruzione AI.** Nuove estensioni in preview—`azure.ai.skills` e `azure.ai.connections`—ti permettono di gestire skill riutilizzabili per agenti e connessioni Foundry direttamente con azd.
- **Integrazione con Microsoft Foundry** porta il deployment dei modelli, l'hosting degli agenti e la configurazione dei servizi AI direttamente nell'ecosistema dei template azd.
- **Operazioni quotidiane più fluide.** Le recenti release hanno reso `azd init` idempotente (sicuro da rieseguire), hanno fatto sì che `azd auth login` elimini automaticamente i token scaduti, e hanno aggiunto un comodo prompt di setup alla prima esecuzione di `azd tool`.
- **Il flusso di lavoro principale non è cambiato.** Che tu stia distribuendo una todo app, un microservizio o una soluzione AI multi-agente, i comandi sono gli stessi.

> **Nota per gli utenti Aspire:** Microsoft ora si riferisce al prodotto semplicemente come **Aspire** (precedentemente ".NET Aspire"). Il supporto Aspire in azd non è cambiato—è stato aggiornato solo il nome.

Se hai già usato azd, il supporto AI è un'estensione naturale—non uno strumento separato o un percorso avanzato. Se parti da zero, imparerai un flusso di lavoro che funziona per tutto.

---

## 🚀 Cos'è Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** è uno strumento da riga di comando pensato per gli sviluppatori che semplifica la distribuzione di applicazioni su Azure. Invece di creare e collegare manualmente dozzine di risorse Azure, puoi distribuire intere applicazioni con un solo comando.

### La magia di `azd up`

```bash
# Questo singolo comando fa tutto:
# ✅ Crea tutte le risorse Azure
# ✅ Configura rete e sicurezza
# ✅ Costruisce il codice della tua applicazione
# ✅ Distribuisce su Azure
# ✅ Ti fornisce un URL funzionante
azd up
```

**Ecco fatto!** Niente clic nell'Azure Portal, nessun complesso template ARM da imparare prima, nessuna configurazione manuale - solo applicazioni funzionanti su Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual è la differenza?

Questa è la domanda più comune che i principianti fanno. Ecco la risposta semplice:

| Caratteristica | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Scopo** | Gestire singole risorse Azure | Distribuire applicazioni complete |
| **Mentalità** | Focalizzato sull'infrastruttura | Focalizzato sull'applicazione |
| **Esempio** | `az webapp create --name myapp...` | `azd up` |
| **Curva di apprendimento** | Devi conoscere i servizi di Azure | Devi solo conoscere la tua app |
| **Ideale per** | DevOps, Infrastrutture | Sviluppatori, Prototipazione |

### Un'analogia semplice

- **Azure CLI** è come avere tutti gli strumenti per costruire una casa - martelli, seghe, chiodi. Puoi costruire qualsiasi cosa, ma devi conoscere l'edilizia.
- **Azure Developer CLI** è come assumere un appaltatore - descrivi ciò che vuoi, e loro si occupano della costruzione.

### Quando usare ciascuno

| Scenario | Usa Questo |
|----------|----------|
| "Voglio distribuire la mia web app rapidamente" | `azd up` |
| "Devo creare solo un account di archiviazione" | `az storage account create` |
| "Sto costruendo un'app AI completa" | `azd init --template azure-search-openai-demo` |
| "Devo fare il debug di una specifica risorsa Azure" | `az resource show` |
| "Voglio una distribuzione pronta per la produzione in pochi minuti" | `azd up --environment production` |

### Lavorano insieme!

AZD usa Azure CLI sotto il cofano. Puoi usare entrambi:
```bash
# Distribuisci la tua app con AZD
azd up

# Quindi perfeziona risorse specifiche con Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trova i template in Awesome AZD

Non partire da zero! **Awesome AZD** è la raccolta della community di template pronti per la distribuzione:

| Risorsa | Descrizione |
|----------|-------------|
| 🔗 [**Galleria Awesome AZD**](https://azure.github.io/awesome-azd/) | Sfoglia oltre 200 template con distribuzione con un clic |
| 🔗 [**Invia un modello**](https://github.com/Azure/awesome-azd/issues) | Contribuisci con il tuo template alla community |
| 🔗 [**Repository GitHub**](https://github.com/Azure/awesome-azd) | Metti una stella ed esplora il sorgente |

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

## 🎯 Iniziare in 3 passaggi

Prima di iniziare, assicurati che la tua macchina sia pronta per il template che vuoi distribuire:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se qualche controllo richiesto fallisce, risolvi prima quello e poi continua con il quick start.

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

### Passo 2: Autenticazione per AZD

```bash
# Facoltativo se prevedi di usare i comandi Azure CLI direttamente in questo corso
az login

# Richiesto per i flussi di lavoro AZD
azd auth login
```

Se non sei sicuro di quale ti serva, segui il flusso completo di setup in [Installazione & Configurazione](docs/chapter-01-foundation/installation.md#authentication-setup).

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

Questo corso è progettato per un apprendimento **progressivo** - inizia da dove ti senti a tuo agio e procedi gradualmente:

| La tua esperienza | Inizia qui |
|-----------------|------------|
| **Alle prime armi con Azure** | [Capitolo 1: Fondamenti](#-chapter-1-foundation--quick-start) |
| **Conosci Azure, nuovo ad AZD** | [Capitolo 1: Fondamenti](#-chapter-1-foundation--quick-start) |
| **Vuoi distribuire app AI** | [Capitolo 2: Sviluppo AI-First (consigliato per sviluppatori AI)](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vuoi esercitarti** | [🎓 Workshop interattivo](workshop/README.md) - laboratorio guidato di 3-4 ore |
| **Hai bisogno di pattern per la produzione** | [Capitolo 8: Produzione e aziendale](#-chapter-8-production--enterprise-patterns) |

### Configurazione rapida

1. **Fai il fork di questo repository**: [![Fork GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Ottieni aiuto**: [Community Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Preferisci clonare localmente?**
>
> Questo repository include oltre 50 traduzioni che aumentano significativamente la dimensione del download. Per clonare senza le traduzioni, usa sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Questo ti dà tutto il necessario per completare il corso con un download molto più veloce.


## Panoramica del corso

Padroneggia Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Particolare attenzione al deployment di applicazioni AI con integrazione Microsoft Foundry.**
### Perché questo corso è essenziale per gli sviluppatori moderni

Basato su approfondimenti dalla community Microsoft Foundry Discord, **il 45% degli sviluppatori vuole usare AZD per carichi di lavoro AI** ma incontra sfide con:
- Architetture AI complesse multi-servizio
- Best practice per il deployment AI in produzione  
- Integrazione e configurazione dei servizi Azure AI
- Ottimizzazione dei costi per i carichi di lavoro AI
- Risoluzione di problemi specifici per il deployment AI

### Obiettivi di apprendimento

Completando questo corso strutturato, tu:
- **Padroneggerai i fondamenti di AZD**: concetti principali, installazione e configurazione
- **Distribuirai applicazioni AI**: usa AZD con i servizi Microsoft Foundry
- **Implementerai Infrastructure as Code**: gestisci le risorse Azure con template Bicep
- **Risolvi i deployment**: risolvi problemi comuni e fai debug
- **Ottimizzerai per la produzione**: sicurezza, scaling, monitoraggio e gestione dei costi
- **Costruirai soluzioni Multi-Agent**: distribuisci architetture AI complesse

## Prima di iniziare: account, accessi e assunzioni

Prima di iniziare il Capitolo 1, assicurati di avere quanto segue a disposizione. I passaggi di installazione più avanti in questa guida presumono che queste basi siano già state gestite.

- **Una sottoscrizione Azure**: puoi usare una sottoscrizione esistente del lavoro o il tuo account personale, oppure creare una [free trial](https://aka.ms/azurefreetrial) per iniziare.
- **Permessi per creare risorse Azure**: per la maggior parte degli esercizi dovresti avere almeno accesso **Contributor** sulla sottoscrizione target o sul gruppo di risorse. Alcuni capitoli possono inoltre presupporre che tu possa creare gruppi di risorse, managed identities e assegnazioni RBAC.
- [**Un account GitHub**](https://github.com): utile per forkare il repository, tracciare le tue modifiche e usare GitHub Codespaces per il workshop.
- **Prerequisiti di runtime per i template**: alcuni template richiedono strumenti locali come Node.js, Python, Java o Docker. Esegui il validatore di setup prima di iniziare in modo da individuare presto gli strumenti mancanti.
- **Familiarità di base con il terminale**: non devi essere un esperto, ma dovresti sentirti a tuo agio nell'eseguire comandi come `git clone`, `azd auth login` e `azd up`.

> **Lavori in una sottoscrizione enterprise?**
> Se il tuo ambiente Azure è gestito da un amministratore, conferma in anticipo di poter distribuire risorse nella sottoscrizione o nel gruppo di risorse che intendi usare. In caso contrario, richiedi una sottoscrizione sandbox o accesso Contributor prima di iniziare.

> **Nuovo su Azure?**
> Inizia con la tua trial Azure o una sottoscrizione pay-as-you-go su https://aka.ms/azurefreetrial così potrai completare gli esercizi end-to-end senza attendere approvazioni a livello di tenant.

## 🗺️ Mappa del corso: navigazione rapida per capitolo

Ogni capitolo ha un README dedicato con obiettivi di apprendimento, quick start e esercizi:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Getting Started | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Durata totale del corso:** ~10-14 ore | **Progressione delle competenze:** Principiante → Pronto per la produzione

---

## 📚 Capitoli di apprendimento

*Seleziona il tuo percorso di apprendimento in base al livello di esperienza e agli obiettivi*

### 🚀 Capitolo 1: Fondamenta e Avvio Rapido
**Prerequisiti**: sottoscrizione Azure, conoscenze di base della riga di comando  
**Durata**: 30-45 minuti  
**Complessità**: ⭐

#### Cosa imparerai
- Comprendere i fondamenti di Azure Developer CLI
- Installare AZD sulla tua piattaforma
- Il tuo primo deployment riuscito

#### Risorse di apprendimento
- **🎯 Inizia qui**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Concetti core e terminologia
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Guide specifiche per piattaforma
- **🛠️ Pratico**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Tutorial passo-passo
- **📋 Riferimento rapido**: [Command Cheat Sheet](resources/cheat-sheet.md)

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
azd up                  # Esegue il deploy su Azure
azd show                # Mostra l'URL dell'app in esecuzione
# L'applicazione si apre nel browser e funziona
azd down --force --purge  # Pulisce le risorse
```

**📊 Tempo richiesto:** 30-45 minuti  
**📈 Livello di competenza dopo:** È in grado di distribuire applicazioni di base in autonomia
**📈 Livello di competenza dopo:** È in grado di distribuire applicazioni di base in autonomia

---

### 🤖 Capitolo 2: Sviluppo AI-First (Consigliato per sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 ore  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Integrazione Microsoft Foundry con AZD
- Distribuire applicazioni potenziate da AI
- Comprendere le configurazioni dei servizi AI

#### Risorse di apprendimento
- **🎯 Inizia qui**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Distribuire agenti intelligenti con AZD
- **📖 Pattern**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuire e gestire modelli AI
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendere le tue soluzioni AI pronte per AZD
- **🎥 Guida interattiva**: [Workshop Materials](workshop/README.md) - Apprendimento basato su browser con MkDocs * DevContainer Environment
- **📋 Template**: [Microsoft Foundry Templates](#risorse-del-workshop)
- **📝 Esempi**: [AZD Deployment Examples](examples/README.md)

#### Esercizi pratici
```bash
# Distribuisci la tua prima applicazione di intelligenza artificiale
azd init --template azure-search-openai-demo
azd up

# Prova altri modelli di intelligenza artificiale
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Risultato del capitolo**: Distribuire e configurare un'applicazione di chat potenziata da AI con funzionalità RAG

**✅ Validazione del successo:**
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

**📊 Tempo richiesto:** 1-2 ore  
**📈 Livello di competenza dopo:** È in grado di distribuire e configurare applicazioni AI pronte per la produzione  
**💰 Consapevolezza dei costi:** Comprende costi di sviluppo $80-150/mese, costi di produzione $300-3500/mese

#### 💰 Considerazioni sui costi per i deployment AI

**Ambiente di sviluppo (stimato $80-150/mese):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/mese (basato sull'uso di token)
- AI Search (livello Basic): $75/mese
- Container Apps (Consumption): $0-20/mese
- Storage (Standard): $1-5/mese

**Ambiente di produzione (stimato $300-3.500+/mese):**
- Microsoft Foundry Models (PTU per prestazioni costanti): $3.000+/mese OPPURE Pay-as-you-go con alto volume
- AI Search (livello Standard): $250/mese
- Container Apps (Dedicated): $50-100/mese
- Application Insights: $5-50/mese
- Storage (Premium): $10-50/mese

**💡 Consigli per l'ottimizzazione dei costi:**
- Usa i **Free Tier** Microsoft Foundry Models per l'apprendimento (Azure OpenAI 50.000 token/mese inclusi)
- Esegui `azd down` per deallocare risorse quando non stai sviluppando attivamente
- Inizia con fatturazione basata sul consumo, passa a PTU solo per la produzione
- Usa `azd provision --preview` per stimare i costi prima del deployment
- Abilita l'auto-scaling: paga solo per l'effettivo utilizzo

**Monitoraggio dei costi:**
```bash
# Controlla i costi mensili stimati
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
- Best practice di autenticazione e sicurezza
- Nomenclatura e organizzazione delle risorse

#### Risorse di apprendimento
- **📖 Configurazione**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Setup dell'ambiente
- **🔐 Sicurezza**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Pattern di autenticazione
- **📝 Esempi**: [Database App Example](examples/database-app/README.md) - Esempi AZD per database

#### Esercizi pratici
- Configurare più ambienti (dev, staging, prod)
- Configurare l'autenticazione con managed identity
- Implementare configurazioni specifiche per ambiente

**💡 Risultato del capitolo**: Gestire più ambienti con autenticazione e sicurezza adeguate

---

### 🏗️ Capitolo 4: Infrastructure as Code e Deployment
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐⭐

#### Cosa imparerai
- Pattern avanzati di deployment
- Infrastructure as Code con Bicep
- Strategie di provisioning delle risorse

#### Risorse di apprendimento
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Workflow completi
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Gestione delle risorse Azure
- **📝 Esempi**: [Container App Example](../../examples/container-app) - Deployment containerizzati

#### Esercizi pratici
- Creare template Bicep personalizzati
- Distribuire applicazioni multi-servizio
- Implementare strategie di deployment blue-green

**💡 Risultato del capitolo**: Distribuire applicazioni multi-servizio complesse usando template infrastrutturali personalizzati

---
### 🎯 Capitolo 5: Soluzioni AI Multi-Agente (Avanzate)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa imparerai
- Pattern di architettura multi-agente
- Orchestrazione e coordinamento degli agenti
- Distribuzioni AI pronte per la produzione

#### Risorse di apprendimento
- **🤖 Progetto in evidenza**: [Soluzione Retail Multi-Agente](examples/retail-scenario.md) - Implementazione completa
- **🛠️ Template ARM**: [Pacchetto Template ARM](../../examples/retail-multiagent-arm-template) - Distribuzione con un clic
- **📖 Architettura**: [Pattern di coordinamento multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modelli

#### Esercizi pratici
```bash
# Distribuire la soluzione multiagente completa per il commercio al dettaglio
cd examples/retail-multiagent-arm-template
./deploy.sh

# Esplorare le configurazioni degli agenti
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del capitolo**: Distribuire e gestire una soluzione AI multi-agente pronta per la produzione con agenti Customer e Inventory

---

### 🔍 Capitolo 6: Validazione e pianificazione pre-distribuzione
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 ora  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Pianificazione della capacità e validazione delle risorse
- Strategie di selezione degli SKU
- Controlli pre-distribuzione e automazione

#### Risorse di apprendimento
- **📊 Pianificazione**: [Pianificazione della capacità](docs/chapter-06-pre-deployment/capacity-planning.md) - Validazione delle risorse
- **💰 Selezione**: [Selezione degli SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Scelte costo-efficaci
- **✅ Validazione**: [Controlli pre-distribuzione](docs/chapter-06-pre-deployment/preflight-checks.md) - Script automatici

#### Esercizi pratici
- Eseguire script di validazione della capacità
- Ottimizzare la selezione degli SKU per i costi
- Implementare controlli pre-distribuzione automatizzati

**💡 Risultato del capitolo**: Validare e ottimizzare le distribuzioni prima dell'esecuzione

---

### 🚨 Capitolo 7: Risoluzione dei problemi e debug
**Prerequisiti**: Qualsiasi capitolo di distribuzione completato  
**Durata**: 1-1,5 ore  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Approcci sistematici al debug
- Problemi comuni e relative soluzioni
- Risoluzione dei problemi specifica per l'AI

#### Risorse di apprendimento
- **🔧 Problemi comuni**: [Problemi comuni](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debug**: [Guida al debug](docs/chapter-07-troubleshooting/debugging.md) - Strategie passo passo
- **🤖 Problemi AI**: [Risoluzione dei problemi specifica per l'AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi dei servizi AI

#### Esercizi pratici
- Diagnosticare guasti di distribuzione
- Risolvere problemi di autenticazione
- Eseguire il debug della connettività dei servizi AI

**💡 Risultato del capitolo**: Diagnosticare e risolvere in autonomia problemi comuni di distribuzione

---

### 🏢 Capitolo 8: Pattern di produzione e aziendali
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa imparerai
- Strategie di distribuzione in produzione
- Pattern di sicurezza aziendale
- Monitoraggio e ottimizzazione dei costi

#### Risorse di apprendimento
- **🏭 Produzione**: [Best practice AI per la produzione](docs/chapter-08-production/production-ai-practices.md) - Pattern aziendali
- **📝 Esempi**: [Esempio microservizi](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: [Integrazione Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoraggio

#### Esercizi pratici
- Implementare pattern di sicurezza aziendale
- Configurare un monitoraggio completo
- Distribuire in produzione con una governance adeguata

**💡 Risultato del capitolo**: Distribuire applicazioni pronte per l'uso aziendale con piena capacità di produzione

---

## 🎓 Panoramica del workshop: Esperienza di apprendimento pratica

> **⚠️ STATO DEL WORKSHOP: Sviluppo attivo**  
> I materiali del workshop sono attualmente in fase di sviluppo e affinamento. I moduli principali sono funzionali, ma alcune sezioni avanzate sono incomplete. Stiamo lavorando attivamente per completare tutti i contenuti. [Segui i progressi →](workshop/README.md)

### Materiali interattivi del workshop
**Apprendimento pratico completo con strumenti basati su browser ed esercizi guidati**

I materiali del workshop offrono un'esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra. Il workshop è progettato sia per l'apprendimento autodidatta sia per sessioni guidate da un istruttore.

#### 🛠️ Caratteristiche del workshop
- **Interfaccia basata su browser**: Workshop completo basato su MkDocs con funzionalità di ricerca, copia e temi
- **Integrazione GitHub Codespaces**: Configurazione dell'ambiente di sviluppo con un clic
- **Percorso di apprendimento strutturato**: Esercizi guidati in 8 moduli (3-4 ore totali)
- **Metodologia progressiva**: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Smantellamento → Conclusione
- **Ambiente DevContainer interattivo**: Strumenti e dipendenze preconfigurati

#### 📚 Struttura dei moduli del workshop
Il workshop segue una **metodologia progressiva in 8 moduli** che ti porta dalla scoperta alla padronanza della distribuzione:

| Modulo | Argomento | Cosa farai | Durata |
|--------|----------|------------|----------|
| **0. Introduzione** | Panoramica del workshop | Comprendere obiettivi di apprendimento, prerequisiti e struttura del workshop | 15 min |
| **1. Selezione** | Scoperta dei template | Esplorare i template AZD e selezionare il template AI giusto per il tuo scenario | 20 min |
| **2. Validazione** | Distribuire e verificare | Distribuire il template con `azd up` e verificare che l'infrastruttura funzioni | 30 min |
| **3. Decostruzione** | Comprendere la struttura | Usare GitHub Copilot per esplorare l'architettura del template, i file Bicep e l'organizzazione del codice | 30 min |
| **4. Configurazione** | Approfondimento di azure.yaml | Padroneggiare la configurazione di `azure.yaml`, i lifecycle hook e le variabili d'ambiente | 30 min |
| **5. Personalizzazione** | Rendilo tuo | Abilitare AI Search, tracing, valutazione e personalizzare per il tuo scenario | 45 min |
| **6. Smantellamento** | Pulizia | Deprovisionare in sicurezza le risorse con `azd down --purge` | 15 min |
| **7. Conclusione** | Passi successivi | Rivedere i risultati, i concetti chiave e proseguire il percorso di apprendimento | 15 min |

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

#### 🎯 Obiettivi di apprendimento del workshop
Completando il workshop, i partecipanti saranno in grado di:
- **Distribuire applicazioni AI in produzione**: Usare AZD con i servizi Microsoft Foundry
- **Padroneggiare architetture multi-agente**: Implementare soluzioni con agenti AI coordinati
- **Implementare le migliori pratiche di sicurezza**: Configurare autenticazione e controllo degli accessi
- **Ottimizzare per la scalabilità**: Progettare distribuzioni performanti e costo-efficaci
- **Risoluzione dei problemi di distribuzione**: Risolvere in autonomia problemi comuni

#### 📖 Risorse del workshop
- **🎥 Guida interattiva**: [Materiali del workshop](workshop/README.md) - Ambiente di apprendimento basato su browser
- **📋 Istruzioni modulo per modulo**:
  - [0. Introduzione](workshop/docs/instructions/0-Introduction.md) - Panoramica del workshop e obiettivi
  - [1. Selezione](workshop/docs/instructions/1-Select-AI-Template.md) - Trovare e selezionare template AI
  - [2. Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuire e verificare i template
  - [3. Decostruzione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Esplorare l'architettura del template
  - [4. Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) - Padroneggiare azure.yaml
  - [5. Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizzare per il tuo scenario
  - [6. Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Pulire le risorse
  - [7. Conclusione](workshop/docs/instructions/7-Wrap-up.md) - Rivedere e passi successivi
- **🛠️ Laboratorio AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Esercizi focalizzati sull'AI
- **💡 Avvio rapido**: [Guida di avvio del workshop](workshop/README.md#quick-start) - Configurazione dell'ambiente

**Ideale per**: Formazione aziendale, corsi universitari, apprendimento autodidatta e bootcamp per sviluppatori.

---

## 📖 Approfondimento: capacità di AZD

Oltre le basi, AZD offre funzionalità potenti per le distribuzioni in produzione:

- **Distribuzioni basate su template** - Usare template predefiniti per modelli applicativi comuni
- **Infrastructure as Code** - Gestire le risorse Azure usando Bicep o Terraform  
- **Flussi di lavoro integrati** - Provisioning, distribuzione e monitoraggio delle applicazioni senza interruzioni
- **Amichevole per gli sviluppatori** - Ottimizzato per la produttività e l'esperienza degli sviluppatori

### **AZD + Microsoft Foundry: Perfetto per le distribuzioni AI**

**Perché AZD per soluzioni AI?** AZD affronta le principali sfide che gli sviluppatori AI incontrano:

- **Template pronti per l'AI** - Template preconfigurati per Microsoft Foundry Models, Azure AI Services e carichi di lavoro ML
- **Distribuzioni AI sicure** - Pattern di sicurezza incorporati per servizi AI, chiavi API ed endpoint dei modelli  
- **Pattern AI per la produzione** - Best practice per distribuzioni di applicazioni AI scalabili e costo-efficaci
- **Workflow AI end-to-end** - Dallo sviluppo del modello alla distribuzione in produzione con monitoraggio adeguato
- **Ottimizzazione dei costi** - Assegnazione intelligente delle risorse e strategie di scalabilità per carichi di lavoro AI
- **Integrazione con Microsoft Foundry** - Connessione senza soluzione di continuità al catalogo dei modelli Microsoft Foundry e agli endpoint

---

## 🎯 Libreria di template ed esempi

### In evidenza: Template Microsoft Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

> **Nota:** Questi template dimostrano vari pattern AI. Alcuni sono Azure Samples esterni, altri sono implementazioni locali.

| Template | Capitolo | Complessità | Servizi | Tipo |
|----------|---------|------------|----------|------|
| [**Inizia con AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Esterno |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Esterno |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Esterno |
| [**Avvio rapido OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Esterno |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Esterno |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Esterno |
| [**Soluzione Retail Multi-Agente**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Locale** |

### In evidenza: Scenari di apprendimento completi
**Template di applicazioni pronti per la produzione mappati ai capitoli di apprendimento**

| Template | Capitolo di apprendimento | Complessità | Apprendimento chiave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Pattern base per la distribuzione AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework agent e chiamata di funzioni |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI aziendale |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Customer e Inventory |

### Imparare tramite esempi per tipo

> **📌 Esempi locali vs. esterni:**  
> **Esempi locali** (in questo repository) = Pronti all'uso immediato  
> **Esempi esterni** (Azure Samples) = Clonare dai repository collegati

#### Esempi locali (Pronti all'uso)
- [**Soluzione Retail Multi-Agente**](examples/retail-scenario.md) - Implementazione completa pronta per la produzione con template ARM
  - Architettura multi-agente (agenti Customer + Inventory)
  - Monitoraggio e valutazione completi
  - Distribuzione con un clic tramite template ARM

#### Esempi locali - Applicazioni container (Capitoli 2-5)
**Esempi completi di distribuzione container in questo repository:**
- [**Esempi di Container App**](examples/container-app/README.md) - Guida completa alle distribuzioni containerizzate
  - [API Flask semplice](../../examples/container-app/simple-flask-api) - API REST di base con scale-to-zero
  - [Architettura a microservizi](../../examples/container-app/microservices) - Distribuzione multi-servizio pronta per la produzione
  - Modelli di distribuzione Quick Start, Production e avanzati
  - Linee guida su monitoraggio, sicurezza e ottimizzazione dei costi

#### Esempi esterni - Applicazioni semplici (Capitoli 1-2)
**Clona questi repository di Azure Samples per iniziare:**
- [Semplice Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modelli di distribuzione di base
- [Sito statico - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribuzione di contenuti statici
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Distribuzione REST API

#### Esempi esterni - Integrazione con database (Capitoli 3-4)  
- [App Database - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pattern di connettività al database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flusso di lavoro serverless per i dati

#### Esempi esterni - Pattern avanzati (Capitoli 4-8)
- [Microservizi Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architetture multi-servizio
- [Job di Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Elaborazione in background  
- [Pipeline ML aziendale](https://github.com/Azure-Samples/mlops-v2) - Pattern ML pronti per la produzione

### Raccolte di template esterne
- [**Galleria ufficiale di template AZD**](https://azure.github.io/awesome-azd/) - Collezione curata di template ufficiali e della community
- [**Template Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione dei template su Microsoft Learn
- [**Directory degli esempi**](examples/README.md) - Esempi locali per l'apprendimento con spiegazioni dettagliate

---

## 📚 Risorse di apprendimento e riferimenti

### Riferimenti rapidi
- [**Scheda rapida dei comandi**](resources/cheat-sheet.md) - Comandi azd essenziali organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia di Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida allo studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop pratici
- [**Laboratorio Workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendi le tue soluzioni AI distribuibili con AZD (2-3 ore)
- [**Workshop interattivo**](workshop/README.md) - Esercizi guidati in 8 moduli con MkDocs e GitHub Codespaces
  - Segue: Introduzione → Selezione → Validazione → Decomposizione → Configurazione → Personalizzazione → Smantellamento → Conclusione

### Risorse di apprendimento esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore prezzi Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato di Azure](https://status.azure.com/)

### Competenze degli agenti AI per il tuo editor
- [**Competenze Microsoft Azure su skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 competenze agent open per Azure AI, Foundry, deployment, diagnostica, ottimizzazione dei costi e altro. Installale in GitHub Copilot, Cursor, Claude Code, o in qualsiasi agent supportato:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guida rapida alla risoluzione dei problemi

**Problemi comuni che affrontano i principianti e soluzioni immediate:**

<details>
<summary><strong>❌ "azd: comando non trovato"</strong></summary>

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
<summary><strong>❌ "Nessuna sottoscrizione trovata" o "Sottoscrizione non impostata"</strong></summary>

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
<summary><strong>❌ "Quota insufficiente" o "Quota superata"</strong></summary>

```bash
# Prova una regione Azure diversa
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
<summary><strong>❌ "Autenticazione fallita" o "Token scaduto"</strong></summary>

```bash
# Riautenticarsi per AZD
azd auth logout
azd auth login

# Opzionale: aggiorna anche l'Azure CLI se stai eseguendo comandi az
az logout
az login

# Verifica l'autenticazione
az account show
```
</details>

<details>
<summary><strong>❌ "Risorsa già esistente" o conflitti di nome</strong></summary>

```bash
# AZD genera nomi unici, ma in caso di conflitto:
azd down --force --purge

# Quindi riprovare con un ambiente nuovo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ "Il deployment del template impiega troppo tempo"</strong></summary>

**Tempi di attesa normali:**
- Semplice web app: 5-10 minuti
- App con database: 10-15 minuti
- Applicazioni AI: 15-25 minuti (il provisioning di OpenAI è lento)

```bash
# Controlla l'avanzamento
azd show

# Se bloccato per più di 30 minuti, controlla il Portale di Azure:
azd monitor --overview
# Cerca distribuzioni non riuscite
```
</details>

<details>
<summary><strong>❌ "Permesso negato" o "Vietato"</strong></summary>

```bash
# Controlla il tuo ruolo in Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Ti serve almeno il ruolo "Contributor"
# Chiedi al tuo amministratore Azure di assegnare:
# - Contributor (per le risorse)
# - User Access Administrator (per l'assegnazione dei ruoli)
```
</details>

<details>
<summary><strong>❌ Impossibile trovare l'URL dell'applicazione distribuita</strong></summary>

```bash
# Mostra tutti gli endpoint dei servizi
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
- **Problemi specifici per AI:** [Risoluzione problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guida al debug:** [Debug passo-passo](docs/chapter-07-troubleshooting/debugging.md)
- **Ottieni aiuto:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Completamento del corso e certificazione

### Monitoraggio del progresso
Tieni traccia del tuo progresso di apprendimento attraverso ogni capitolo:

- [ ] **Capitolo 1**: Fondamenti e Quick Start ✅
- [ ] **Capitolo 2**: Sviluppo AI-first ✅  
- [ ] **Capitolo 3**: Configurazione e Autenticazione ✅
- [ ] **Capitolo 4**: Infrastruttura come codice e distribuzione ✅
- [ ] **Capitolo 5**: Soluzioni AI multi-agente ✅
- [ ] **Capitolo 6**: Validazione e pianificazione pre-distribuzione ✅
- [ ] **Capitolo 7**: Risoluzione problemi e debugging ✅
- [ ] **Capitolo 8**: Pattern per produzione e aziendali ✅

### Verifica dell'apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze tramite:
1. **Esercizio pratico**: Completa il deployment pratico del capitolo
2. **Verifica delle conoscenze**: Rivedi la sezione FAQ del tuo capitolo
3. **Discussione nella community**: Condividi la tua esperienza su Azure Discord
4. **Capitolo successivo**: Passa al livello di complessità successivo

### Vantaggi al completamento del corso
Dopo aver completato tutti i capitoli, avrai:
- **Esperienza in produzione**: Distribuito applicazioni AI reali su Azure
- **Competenze professionali**: Capacità di deployment pronte per le aziende  
- **Riconoscimento nella community**: Membro attivo della community di sviluppatori Azure
- **Avanzamento di carriera**: Competenze AZD e di deployment AI richieste dal mercato

---

## 🤝 Community e supporto

### Ottieni aiuto e supporto
- **Problemi tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande sull'apprendimento**: [Community Microsoft Azure Discord](https://discord.gg/microsoft-azure) e [![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aiuto specifico per AI**: Unisciti al [![Discord di Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentazione**: [Documentazione ufficiale Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti della community dal Discord di Microsoft Foundry

**Risultati recenti del sondaggio dal canale #Azure:**
- **45%** degli sviluppatori vogliono usare AZD per carichi di lavoro AI
- **Principali sfide**: Distribuzioni multi-servizio, gestione delle credenziali, prontezza per la produzione  
- **Più richiesti**: Template specifici per AI, guide di risoluzione problemi, migliori pratiche

Unisciti alla nostra community per:
- Condividere le tue esperienze AZD + AI e ottenere aiuto
- Accedere alle anteprime iniziali dei nuovi template AI
- Contribuire alle migliori pratiche di deployment AI
- Influenzare lo sviluppo futuro delle funzionalità AI + AZD

### Contribuire al corso
Accettiamo contributi! Per favore leggi la nostra [Guida ai contributi](CONTRIBUTING.md) per dettagli su:
- **Miglioramenti dei contenuti**: Migliora i capitoli e gli esempi esistenti
- **Nuovi esempi**: Aggiungi scenari reali e template  
- **Traduzione**: Aiuta a mantenere il supporto multilingue
- **Segnalazioni di bug**: Migliora accuratezza e chiarezza
- **Standard della community**: Segui le nostre linee guida inclusive

---

## 📄 Informazioni sul corso

### Licenza
Questo progetto è rilasciato sotto la licenza MIT - vedi il file [LICENSE](../../LICENSE) per i dettagli.

### Risorse di apprendimento correlate di Microsoft

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
[![AI generativa per principianti](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI generativa (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![AI generativa (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![IA generativa (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Apprendimento principale
[![ML per principianti](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science per principianti](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA per principianti](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Sicurezza informatica per principianti](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Sviluppo Web per principianti](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT per principianti](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Sviluppo XR per principianti](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Copilot
[![Copilot per programmazione affiancata con IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot per C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Avventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigazione del corso

**🚀 Pronto per iniziare a imparare?**

**Principianti**: Iniziate con [Capitolo 1: Fondamenti e Avvio Rapido](#-chapter-1-foundation--quick-start)  
**Sviluppatori IA**: Vai a [Capitolo 2: Sviluppo incentrato sull'IA](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Sviluppatori esperti**: Iniziate con [Capitolo 3: Configurazione e Autenticazione](#️-chapter-3-configuration--authentication)

**Prossimi passi**: [Inizia il Capitolo 1 - Basi di AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->