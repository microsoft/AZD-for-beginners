# AZD per principianti: un percorso di apprendimento strutturato

![AZD-for-beginners](../../translated_images/it/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traduzioni automatizzate (Sempre aggiornate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabo](../ar/README.md) | [Bengalese](../bn/README.md) | [Bulgaro](../bg/README.md) | [Birmano (Myanmar)](../my/README.md) | [Cinese (semplificato)](../zh-CN/README.md) | [Cinese (tradizionale, Hong Kong)](../zh-HK/README.md) | [Cinese (tradizionale, Macao)](../zh-MO/README.md) | [Cinese (tradizionale, Taiwan)](../zh-TW/README.md) | [Croato](../hr/README.md) | [Ceco](../cs/README.md) | [Danese](../da/README.md) | [Olandese](../nl/README.md) | [Estone](../et/README.md) | [Finlandese](../fi/README.md) | [Francese](../fr/README.md) | [Tedesco](../de/README.md) | [Greco](../el/README.md) | [Ebraico](../he/README.md) | [Hindi](../hi/README.md) | [Ungherese](../hu/README.md) | [Indonesiano](../id/README.md) | [Italiano](./README.md) | [Giapponese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coreano](../ko/README.md) | [Lituano](../lt/README.md) | [Malese](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalese](../ne/README.md) | [Pidgin Nigeriano](../pcm/README.md) | [Norvegese](../no/README.md) | [Persiano (Farsi)](../fa/README.md) | [Polacco](../pl/README.md) | [Portoghese (Brasile)](../pt-BR/README.md) | [Portoghese (Portogallo)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumeno](../ro/README.md) | [Russo](../ru/README.md) | [Serbo (Cirillico)](../sr/README.md) | [Slovacco](../sk/README.md) | [Sloveno](../sl/README.md) | [Spagnolo](../es/README.md) | [Swahili](../sw/README.md) | [Svedese](../sv/README.md) | [Tagalog (Filippino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailandese](../th/README.md) | [Turco](../tr/README.md) | [Ucraino](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamita](../vi/README.md)

> **Preferisci clonare in locale?**
>
> Questo repository include oltre 50 traduzioni che aumentano significativamente la dimensione del download. Per clonare senza le traduzioni, usa il checkout sparso:
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
> Questo ti dà tutto ciò di cui hai bisogno per completare il corso con un download molto più veloce.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Novità di oggi in azd

> 📌 Questo corso è stato validato con **`azd 1.27.1`** (luglio 2026). Esegui `azd version` per controllare la tua versione e `azd upgrade` per aggiornare all'ultima versione.

Azure Developer CLI è cresciuto oltre le tradizionali app web e API. Oggi, azd è lo strumento unico per distribuire **qualsiasi** applicazione su Azure, comprese applicazioni AI e agenti intelligenti.

Ecco cosa significa per te:

- **Gli agenti AI sono ora workload di prima classe su azd.** Puoi inizializzare, distribuire e gestire progetti agenti AI utilizzando lo stesso flusso `azd init` → `azd up` che già conosci.
- **Un ciclo di vita completo dell’agente dalla CLI.** L’estensione `azure.ai.agents` ora copre l’intero percorso—`azd ai agent init` per creare lo scheletro, `azd ai agent invoke` per testare (con output di tempi di risposta), `azd ai agent eval generate` e `azd ai agent optimize` per misurare e migliorare la qualità, e `azd ai agent delete` per pulire.
- **Più blocchi costitutivi AI.** Nuove estensioni in anteprima—`azure.ai.skills` e `azure.ai.connections`—ti permettono di gestire abilità agenti riutilizzabili e connessioni Foundry direttamente con azd.
- **Integrazione con Microsoft Foundry** porta il deployment di modelli, l’hosting degli agenti e la configurazione dei servizi AI direttamente nell’ecosistema dei template azd.
- **Operazioni di base più fluide.** Le release recenti hanno reso `azd init` idempotente (sicuro da rieseguire), fatto sì che `azd auth login` elimini automaticamente i token scaduti, e aggiunto un prompt amichevole di configurazione iniziale per `azd tool`.
- **Il flusso principale non è cambiato.** Che tu stia distribuendo un’app todo, un microservizio o una soluzione AI multi-agente, i comandi sono gli stessi.

> **Nota per gli utenti Aspire:** Microsoft ora si riferisce al prodotto semplicemente come **Aspire** (precedentemente ".NET Aspire"). Il supporto di azd a Aspire resta invariato—solo il nome è stato aggiornato.

Se hai già usato azd, il supporto AI è un’estensione naturale—non uno strumento separato o un percorso avanzato. Se inizi da zero, imparerai un solo flusso che funziona per tutto.

---

## 🚀 Cos’è Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** è uno strumento da linea di comando amichevole per sviluppatori che semplifica il deployment di applicazioni su Azure. Invece di creare e collegare manualmente decine di risorse Azure, puoi distribuire intere applicazioni con un solo comando.

### La magia di `azd up`

```bash
# Questo unico comando fa tutto:
# ✅ Crea tutte le risorse Azure
# ✅ Configura rete e sicurezza
# ✅ Compila il codice della tua applicazione
# ✅ Distribuisce su Azure
# ✅ Ti fornisce un URL funzionante
azd up
```

**Ecco fatto!** Niente clic sul portale Azure, niente complicati template ARM da imparare prima, nessuna configurazione manuale - solo applicazioni funzionanti su Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Qual è la differenza?

Questa è la domanda più comune tra i principianti. Ecco la risposta semplice:

| Funzionalità | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|-------------|---------------------|--------------------------------|
| **Scopo** | Gestire singole risorse Azure | Distribuire applicazioni complete |
| **Mentalità** | Incentrata sull’infrastruttura | Incentrata sull’applicazione |
| **Esempio** | `az webapp create --name myapp...` | `azd up` |
| **Curva di apprendimento** | Devi conoscere i servizi Azure | Devi solo conoscere la tua app |
| **Ideale per** | DevOps, infrastruttura | Sviluppatori, prototipazione |

### Analogia semplice

- **Azure CLI** è come avere tutti gli strumenti per costruire una casa - martelli, seghe, chiodi. Puoi costruire qualsiasi cosa, ma devi conoscere l’edilizia.
- **Azure Developer CLI** è come assumere un appaltatore - descrivi ciò che vuoi e lui si occupa della costruzione.

### Quando utilizzare ciascuno

| Scenario | Usa questo |
|----------|-------------|
| "Voglio distribuire rapidamente la mia app web" | `azd up` |
| "Devo creare solo un account di archiviazione" | `az storage account create` |
| "Sto costruendo un’app AI completa" | `azd init --template azure-search-openai-demo` |
| "Devo fare il debug di una risorsa Azure specifica" | `az resource show` |
| "Voglio una distribuzione pronta per la produzione in pochi minuti" | `azd up --environment production` |

### Funzionano insieme!

AZD usa Azure CLI sotto il cofano. Puoi usare entrambi:
```bash
# Distribuisci la tua app con AZD
azd up

# Quindi regola specifiche risorse con Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trova template in Awesome AZD

Non partire da zero! **Awesome AZD** è la raccolta comunitaria di template pronti per la distribuzione:

| Risorsa | Descrizione |
|----------|--------------|
| 🔗 [**Galleria Awesome AZD**](https://azure.github.io/awesome-azd/) | Esplora oltre 200 template con deploy con un clic |
| 🔗 [**Invia un template**](https://github.com/Azure/awesome-azd/issues) | Contribuisci con il tuo template alla community |
| 🔗 [**Repository GitHub**](https://github.com/Azure/awesome-azd) | Metti una stella ed esplora il codice sorgente |

### Template AI popolari da Awesome AZD

```bash
# Chat RAG con modelli Microsoft Foundry + Ricerca AI
azd init --template azure-search-openai-demo

# Applicazione di chat AI veloce
azd init --template openai-chat-app-quickstart

# Agenti AI con agenti Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Inizia in 3 passaggi

Prima di iniziare, assicurati che la tua macchina sia pronta per il template che vuoi distribuire:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Se un controllo necessario fallisce, correggilo prima e poi continua con l’avvio rapido.

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

### Passaggio 2: Autenticati per AZD

```bash
# Facoltativo se prevedi di usare i comandi Azure CLI direttamente in questo corso
az login

# Necessario per i flussi di lavoro AZD
azd auth login
```

Se non sei sicuro di quale ti serve, segui il flusso completo in [Installazione e configurazione](docs/chapter-01-foundation/installation.md#authentication-setup).

### Passaggio 3: Distribuisci la tua prima app

```bash
# Inizializza da un modello
azd init --template todo-nodejs-mongo

# Distribuisci su Azure (crea tutto!)
azd up
```

**🎉 Ecco fatto!** La tua app è ora live su Azure.

### Pulizia (non dimenticare!)

```bash
# Rimuovere tutte le risorse al termine degli esperimenti
azd down --force --purge
```

---

## 📚 Come usare questo corso

Questo corso è progettato per un **apprendimento progressivo** - inizia da dove ti senti a tuo agio e avanza a poco a poco:

| La tua esperienza | Inizia qui |
|------------------|-------------|
| **Nuovo ad Azure** | [Capitolo 1: Fondamenta](#-chapter-1-foundation--quick-start) |
| **Conosci Azure, nuovo ad AZD** | [Capitolo 1: Fondamenta](#-chapter-1-foundation--quick-start) |
| **Vuoi distribuire app AI** | [Capitolo 2: Sviluppo AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vuoi esercitarti attivamente** | [🎓 Workshop interattivo](workshop/README.md) - laboratorio guidato di 3-4 ore |
| **Ti servono pattern per la produzione** | [Capitolo 8: Produzione & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Configurazione veloce

1. **Forka questo repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonalo**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Ottieni aiuto**: [Community Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Preferisci clonare in locale?**

> Questo repository include oltre 50 traduzioni che aumentano significativamente la dimensione del download. Per clonare senza le traduzioni, usa il checkout sparso:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Questo ti dà tutto ciò di cui hai bisogno per completare il corso con un download molto più veloce.


## Panoramica del corso

Padroneggia Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Particolare attenzione al deployment di applicazioni AI con integrazione Microsoft Foundry.**


### Perché questo corso è essenziale per gli sviluppatori moderni

Basato sui feedback della community Microsoft Foundry Discord, **il 45% degli sviluppatori vuole usare AZD per carichi di lavoro AI** ma incontra sfide con:
- Architetture AI multi-servizio complesse
- Best practice per il deployment AI in produzione  
- Integrazione e configurazione dei servizi Azure AI
- Ottimizzazione dei costi per i carichi di lavoro AI
- Risoluzione dei problemi specifici di deployment AI

### Obiettivi di apprendimento

Completando questo corso strutturato, sarai in grado di:
- **Padroneggiare le Basi di AZD**: Concetti chiave, installazione e configurazione
- **Distribuire Applicazioni AI**: Utilizzare AZD con i servizi Microsoft Foundry
- **Implementare Infrastructure as Code**: Gestire risorse Azure con template Bicep
- **Risoluzione Problemi di Deployment**: Risolvere problemi comuni e debug
- **Ottimizzare per la Produzione**: Sicurezza, scalabilità, monitoraggio e gestione dei costi
- **Costruire Soluzioni Multi-Agente**: Distribuire architetture AI complesse

## Prima di iniziare: account, accessi e premesse

Prima di iniziare il Capitolo 1, assicurati di avere quanto segue. I passaggi di installazione più avanti in questa guida presumono che queste basi siano già coperte.

- **Un abbonamento Azure**: puoi usare un abbonamento esistente del lavoro o il tuo personale, oppure creare una [prova gratuita](https://aka.ms/azurefreetrial) per iniziare.
- **Permessi per creare risorse Azure**: per la maggior parte degli esercizi, dovresti avere almeno accesso **Contributor** sull'abbonamento o sul gruppo di risorse target. Alcuni capitoli possono anche presumere che tu possa creare gruppi di risorse, managed identities e assegnazioni RBAC.
- [**Un account GitHub**](https://github.com): utile per forkare il repository, tracciare le tue modifiche e usare GitHub Codespaces per il workshop.
- **Prerequisiti per il runtime dei template**: alcuni template richiedono strumenti locali come Node.js, Python, Java o Docker. Esegui il validatore di setup prima di iniziare per non scoprire eventuali mancanze troppo tardi.
- **Familiarità base con il terminale**: non devi essere un esperto, ma devi sentirti a tuo agio con comandi tipo `git clone`, `azd auth login` e `azd up`.

> **Lavori in un abbonamento aziendale?**
> Se il tuo ambiente Azure è gestito da un amministratore, conferma in anticipo di poter distribuire risorse nell'abbonamento o gruppo di risorse che intendi usare. In caso contrario, richiedi un abbonamento sandbox o accesso Contributor prima di iniziare.

> **Sei nuovo di Azure?**
> Parti con la tua prova Azure o un abbonamento pay-as-you-go su https://aka.ms/azurefreetrial così potrai completare gli esercizi dall’inizio alla fine senza attendere approvazioni a livello tenant.

## 🗺️ Mappa del corso: navigazione rapida per capitolo

Ogni capitolo ha un README dedicato con obiettivi di apprendimento, quick start ed esercizi:

| Capitolo | Argomento | Lezioni | Durata | Complessità |
|---------|-------|---------|----------|------------|
| **[Ch 1: Fondamenti](docs/chapter-01-foundation/README.md)** | Primi passi | [Nozioni di base AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installazione](docs/chapter-01-foundation/installation.md) &#124; [Primo progetto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: Sviluppo AI](docs/chapter-02-ai-development/README.md)** | App AI-First | [Integrazione Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agent AI](docs/chapter-02-ai-development/agents.md) &#124; [Deployment modelli AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Ch 3: Configurazione](docs/chapter-03-configuration/README.md)** | Auth & Sicurezza | [Configurazione](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Sicurezza](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastruttura](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Guida al deployment](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 h | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Soluzioni AI Agent | [Scenario Retail](examples/retail-scenario.md) &#124; [Pattern di coordinamento](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Pianificazione & Validazione | [Check pre-volo](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Pianificazione capacità](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Selezione SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 h | ⭐⭐ |
| **[Ch 7: Risoluzione Problemi](docs/chapter-07-troubleshooting/README.md)** | Debug & Correzioni | [Problemi comuni](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 h | ⭐⭐ |
| **[Ch 8: Produzione](docs/chapter-08-production/README.md)** | Pattern aziendali | [Pratiche di produzione](docs/chapter-08-production/production-ai-practices.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Laboratorio pratico | [Introduzione](workshop/docs/instructions/0-Introduction.md) &#124; [Selezione](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Decomposizione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusione](workshop/docs/instructions/7-Wrap-up.md) | 3-4 h | ⭐⭐ |

**Durata totale del corso:** ~10-14 ore | **Progressione abilità:** Principiante → Pronto per produzione

---

## 📚 Capitoli di apprendimento

*Seleziona il tuo percorso di apprendimento in base al livello di esperienza e agli obiettivi*

### 🚀 Capitolo 1: Fondamenti & Avvio rapido
**Prerequisiti**: abbonamento Azure, conoscenza base della riga di comando  
**Durata**: 30-45 minuti  
**Complessità**: ⭐

#### Cosa imparerai
- Comprendere i fondamenti di Azure Developer CLI
- Installare AZD sulla tua piattaforma
- Il tuo primo deployment riuscito

#### Risorse didattiche
- **🎯 Inizia qui**: [Cos'è Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teoria**: [Nozioni di base AZD](docs/chapter-01-foundation/azd-basics.md) - Concetti fondamentali e terminologia
- **⚙️ Setup**: [Installazione & Setup](docs/chapter-01-foundation/installation.md) - Guide specifiche per piattaforma
- **🛠️ Pratica**: [Il tuo primo progetto](docs/chapter-01-foundation/first-project.md) - Tutorial passo-passo
- **📋 Riferimento rapido**: [Scheda comandi](resources/cheat-sheet.md)

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
azd up                  # Distribuisce su Azure
azd show                # Mostra l'URL dell'app in esecuzione
# L'applicazione si apre nel browser e funziona
azd down --force --purge  # Pulisce le risorse
```

**📊 Tempo stimato:** 30-45 minuti  
**📈 Livello di abilità dopo:** Può distribuire applicazioni di base in autonomia
**📈 Livello di abilità dopo:** Può distribuire applicazioni di base in autonomia

---

### 🤖 Capitolo 2: Sviluppo AI-First (Consigliato per sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 ore  
**Complessità**: ⭐⭐

#### Cosa imparerai
- Integrazione Microsoft Foundry con AZD
- Distribuire applicazioni alimentate da AI
- Comprendere le configurazioni dei servizi AI

#### Risorse didattiche
- **🎯 Inizia qui**: [Integrazione Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agenti AI**: [Guida Agenti AI](docs/chapter-02-ai-development/agents.md) - Distribuire agenti intelligenti con AZD
- **📖 Pattern**: [Deployment Modelli AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuire e gestire modelli AI
- **🛠️ Workshop**: [Lab Workshop AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendi le tue soluzioni AI pronte con AZD
- **🎥 Guida interattiva**: [Materiali Workshop](workshop/README.md) - Apprendimento via browser con MkDocs * Ambiente DevContainer
- **📋 Template**: [Template Microsoft Foundry](#risorse-del-workshop)
- **📝 Esempi**: [Esempi distribuzione AZD](examples/README.md)

#### Esercizi pratici
```bash
# Distribuisci la tua prima applicazione AI
azd init --template azure-search-openai-demo
azd up

# Prova template AI aggiuntivi
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Risultato del capitolo**: Distribuire e configurare un'applicazione chat AI con funzionalità RAG

**✅ Validazione del successo:**
```bash
# Dopo il Capitolo 2, dovresti essere in grado di:
azd init --template azure-search-openai-demo
azd up
# Testare l'interfaccia di chat AI
# Fare domande e ottenere risposte generate dall'AI con fonti
# Verificare che l'integrazione della ricerca funzioni
azd monitor  # Controllare che Application Insights mostri la telemetria
azd down --force --purge
```

**📊 Tempo stimato:** 1-2 ore  
**📈 Livello di abilità dopo:** Può distribuire e configurare applicazioni AI pronte per la produzione  
**💰 Consapevolezza dei costi:** Comprendere costi di sviluppo $80-150/mese, costi produzione $300-3500/mese

#### 💰 Considerazioni sui costi per i deployment AI

**Ambiente di sviluppo (stimato $80-150/mese):**
- Modelli Microsoft Foundry (Pay-as-you-go): $0-50/mese (in base all’uso di token)
- AI Search (livello base): $75/mese
- Container Apps (consumo): $0-20/mese
- Storage (standard): $1-5/mese

**Ambiente di produzione (stimato $300-3.500+/mese):**
- Modelli Microsoft Foundry (PTU per prestazioni costanti): $3.000+/mese OPPURE Pay-as-you-go con elevato volume
- AI Search (livello standard): $250/mese
- Container Apps (dedicati): $50-100/mese
- Application Insights: $5-50/mese
- Storage (premium): $10-50/mese

**💡 Consigli per l’ottimizzazione costi:**
- Usa i Modelli Microsoft Foundry di **livello gratuito** per l’apprendimento (Azure OpenAI include 50.000 token/mese)
- Esegui `azd down` per deallocare risorse quando non stai sviluppando attivamente
- Parti con fatturazione a consumo, passa a PTU solo per la produzione
- Usa `azd provision --preview` per stimare i costi prima del deployment
- Abilita lo scaling automatico: paghi solo ciò che usi realmente

**Monitoraggio dei costi:**
```bash
# Verifica i costi mensili stimati
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
- Best practice di autenticazione e sicurezza
- Naming e organizzazione delle risorse

#### Risorse didattiche
- **📖 Configurazione**: [Guida alla configurazione](docs/chapter-03-configuration/configuration.md) - Setup ambiente
- **🔐 Sicurezza**: [Pattern di autenticazione e managed identity](docs/chapter-03-configuration/authsecurity.md) - Pattern di autenticazione
- **📝 Esempi**: [Esempio app Database](examples/database-app/README.md) - Esempi AZD Database

#### Esercizi pratici
- Configura ambienti multipli (dev, staging, prod)
- Imposta autenticazione con managed identity
- Implementa configurazioni specifiche per ambiente

**💡 Risultato del capitolo**: Gestire più ambienti con adeguata autenticazione e sicurezza

---

### 🏗️ Capitolo 4: Infrastructure as Code & Deployment
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐⭐

#### Cosa imparerai
- Pattern di deployment avanzati
- Infrastructure as Code con Bicep
- Strategie di provisioning risorse

#### Risorse didattiche
- **📖 Deployment**: [Guida al deployment](docs/chapter-04-infrastructure/deployment-guide.md) - Workflow completi
- **🏗️ Provisioning**: [Provisioning risorse](docs/chapter-04-infrastructure/provisioning.md) - Gestione risorse Azure
- **📝 Esempi**: [Esempio Container App](../../examples/container-app) - Deploy containerizzati

#### Esercizi pratici
- Crea template Bicep personalizzati
- Distribuisci applicazioni multi-servizio
- Implementa strategie di deployment blue-green

**💡 Risultato del capitolo**: Distribuire applicazioni multi-servizio complesse usando template di infrastruttura personalizzati

---


### 🎯 Capitolo 5: Soluzioni AI Multi-Agente (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Pattern di architettura multi-agente
- Orchestrazione e coordinamento degli agenti
- Distribuzioni AI pronte per la produzione

#### Risorse di Apprendimento
- **🤖 Progetto in Evidenza**: [Soluzione Multi-Agente per il Retail](examples/retail-scenario.md) - Implementazione completa
- **🛠️ Modelli ARM**: [Pacchetto Modelli ARM](../../examples/retail-multiagent-arm-template) - Distribuzione con un clic
- **📖 Architettura**: [Pattern di coordinamento multi-agente](docs/chapter-06-pre-deployment/coordination-patterns.md) - Pattern

#### Esercizi Pratici
```bash
# Distribuire la soluzione multi-agente completa per il retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Esplorare le configurazioni degli agenti
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del Capitolo**: Distribuire e gestire una soluzione AI multi-agente pronta per la produzione con agenti Customer e Inventory

---

### 🔍 Capitolo 6: Validazione & Pianificazione Pre-Distribuzione
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 ora  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Pianificazione della capacità e validazione delle risorse
- Strategie di selezione SKU
- Verifiche pre-volo e automazione

#### Risorse di Apprendimento
- **📊 Pianificazione**: [Pianificazione della Capacità](docs/chapter-06-pre-deployment/capacity-planning.md) - Validazione risorse
- **💰 Selezione**: [Selezione SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Scelte economiche
- **✅ Validazione**: [Verifiche Pre-Volò](docs/chapter-06-pre-deployment/preflight-checks.md) - Script automatizzati

#### Esercizi Pratici
- Eseguire script di validazione della capacità
- Ottimizzare le selezioni SKU per i costi
- Implementare verifiche automatizzate pre-distribuzione

**💡 Risultato del Capitolo**: Validare e ottimizzare le distribuzioni prima dell’esecuzione

---

### 🚨 Capitolo 7: Risoluzione Problemi & Debugging
**Prerequisiti**: Qualsiasi capitolo di distribuzione completato  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Approcci sistematici al debugging
- Problemi comuni e soluzioni
- Risoluzione problemi specifica per AI

#### Risorse di Apprendimento
- **🔧 Problemi Comuni**: [Problemi Comuni](docs/chapter-07-troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al Debugging](docs/chapter-07-troubleshooting/debugging.md) - Strategie passo-passo
- **🤖 Problemi AI**: [Risoluzione Problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi di servizi AI

#### Esercizi Pratici
- Diagnosticare fallimenti di distribuzione
- Risolvere problemi di autenticazione
- Debuggare connettività servizi AI

**💡 Risultato del Capitolo**: Diagnosticare e risolvere autonomamente problemi comuni di distribuzione

---

### 🏢 Capitolo 8: Pattern Produttivi & Aziendali
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Strategie di distribuzione in produzione
- Pattern di sicurezza aziendale
- Monitoraggio e ottimizzazione dei costi

#### Risorse di Apprendimento
- **🏭 Produzione**: [Best Practices AI in Produzione](docs/chapter-08-production/production-ai-practices.md) - Pattern aziendali
- **📝 Esempi**: [Esempio Microservizi](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: [Integrazione Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoraggio

#### Esercizi Pratici
- Implementare pattern di sicurezza aziendale
- Configurare monitoraggio completo
- Distribuire in produzione con governance adeguata

**💡 Risultato del Capitolo**: Distribuire applicazioni enterprise pronte per la produzione con tutte le capacità necessarie

---

## 🎓 Panoramica del Workshop: Esperienza di Apprendimento Pratica

> **⚠️ STATO DEL WORKSHOP: Sviluppo Attivo**  
> I materiali del workshop sono attualmente in sviluppo e raffinamento. I moduli principali sono funzionali, ma alcune sezioni avanzate sono incomplete. Stiamo lavorando attivamente al completamento di tutti i contenuti. [Segui i progressi →](workshop/README.md)

### Materiali Interattivi del Workshop
**Apprendimento pratico completo con strumenti basati su browser ed esercizi guidati**

I materiali del workshop forniscono un’esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra. Il workshop è progettato sia per apprendimento autonomo che per sessioni guidate da istruttore.

#### 🛠️ Caratteristiche del Workshop
- **Interfaccia Browser-Based**: Workshop completo alimentato da MkDocs con funzioni di ricerca, copia e temi
- **Integrazione GitHub Codespaces**: Configurazione dell’ambiente di sviluppo con un clic
- **Percorso di Apprendimento Strutturato**: 8 moduli di esercizi guidati (3-4 ore totali)
- **Metodologia Progressiva**: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Smantellamento → Conclusione
- **Ambiente DevContainer Interattivo**: Strumenti e dipendenze preconfigurati

#### 📚 Struttura dei Moduli del Workshop
Il workshop segue una **metodologia progressiva in 8 moduli** che ti guida dalla scoperta alla padronanza della distribuzione:

| Modulo | Argomento | Cosa Farai | Durata |
|--------|----------|------------|--------|
| **0. Introduzione** | Panoramica Workshop | Comprendere obiettivi di apprendimento, prerequisiti e struttura del workshop | 15 min |
| **1. Selezione** | Scoperta Template | Esplora i template AZD e scegli il template AI corretto per il tuo scenario | 20 min |
| **2. Validazione** | Distribuisci & Verifica | Distribuisci il template con `azd up` e valida che l’infrastruttura funzioni | 30 min |
| **3. Decostruzione** | Comprendere la Struttura | Usa GitHub Copilot per esplorare l’architettura del template, i file Bicep e l’organizzazione del codice | 30 min |
| **4. Configurazione** | Approfondimento su azure.yaml | Padroneggia la configurazione di `azure.yaml`, i lifecycle hooks e variabili d’ambiente | 30 min |
| **5. Personalizzazione** | Rendilo Tuo | Abilita AI Search, tracing, valutazione e personalizza per il tuo scenario | 45 min |
| **6. Smantellamento** | Pulizia | Deprovisiona risorse in sicurezza con `azd down --purge` | 15 min |
| **7. Conclusione** | Passi Successivi | Rivedi i risultati, i concetti chiave e continua il tuo percorso di apprendimento | 15 min |

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
# Opzione 1: GitHub Codespaces (Consigliato)
# Clicca su "Code" → "Create codespace on main" nel repository

# Opzione 2: Sviluppo locale
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Segui le istruzioni di setup in workshop/README.md
```

#### 🎯 Risultati di Apprendimento del Workshop
Completando il workshop, i partecipanti:
- **Distribuiranno Applicazioni AI in Produzione**: Usando AZD con i servizi Microsoft Foundry
- **Padronanza delle Architetture Multi-Agente**: Implementare soluzioni AI con agenti coordinati
- **Implementeranno Best Practices di Sicurezza**: Configurare autenticazione e controllo accessi
- **Ottimizzeranno per la Scalabilità**: Progettare distribuzioni performanti e convenienti
- **Risoluzione Problemi in Autonomia**: Risolvere problemi comuni di distribuzione

#### 📖 Risorse del Workshop
- **🎥 Guida Interattiva**: [Materiali del Workshop](workshop/README.md) - Ambiente di apprendimento basato su browser
- **📋 Istruzioni Modulo per Modulo**:
  - [0. Introduzione](workshop/docs/instructions/0-Introduction.md) - Panoramica e obiettivi workshop
  - [1. Selezione](workshop/docs/instructions/1-Select-AI-Template.md) - Trovare e selezionare template AI
  - [2. Validazione](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuire e verificare template
  - [3. Decostruzione](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Esplorare architettura template
  - [4. Configurazione](workshop/docs/instructions/4-Configure-AI-Template.md) - Padroneggiare azure.yaml
  - [5. Personalizzazione](workshop/docs/instructions/5-Customize-AI-Template.md) - Personalizzare per lo scenario
  - [6. Smantellamento](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Pulizia risorse
  - [7. Conclusione](workshop/docs/instructions/7-Wrap-up.md) - Revisione e prossimi passi
- **🛠️ Laboratorio AI Workshop**: [Laboratorio AI Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) - Esercizi focalizzati su AI
- **💡 Rapido Avvio**: [Guida Setup Workshop](workshop/README.md#quick-start) - Configurazione ambiente

**Perfetto per**: Formazione aziendale, corsi universitari, apprendimento autonomo e bootcamp per sviluppatori.

---

## 📖 Approfondimento: Capacità AZD

Oltre alle basi, AZD fornisce funzionalità potenti per le distribuzioni in produzione:

- **Distribuzioni basate su template** - Usa modelli predefiniti per pattern comuni di applicazioni
- **Infrastructure as Code** - Gestisci risorse Azure usando Bicep o Terraform  
- **Workflow integrati** - Provisiona, distribuisci e monitora applicazioni senza interruzioni
- **Ottimizzato per sviluppatori** - Ottimizzato per produttività ed esperienza sviluppatore

### **AZD + Microsoft Foundry: Perfetto per distribuzioni AI**

**Perché AZD per soluzioni AI?** AZD affronta le principali sfide degli sviluppatori AI:

- **Template Pronti per AI** - Template preconfigurati per Microsoft Foundry Models, Azure AI Services e carichi ML
- **Distribuzioni AI Sicure** - Pattern di sicurezza integrati per servizi AI, chiavi API e endpoint modello  
- **Pattern AI di Produzione** - Best practices per distribuzioni AI scalabili ed economiche
- **Workflow AI End-to-End** - Dallo sviluppo modello alla distribuzione in produzione con monitoraggio adeguato
- **Ottimizzazione dei Costi** - Allocazione intelligente e strategie di scalabilità per carichi AI
- **Integrazione Microsoft Foundry** - Connessione fluida al catalogo modelli e endpoint Microsoft Foundry

---

## 🎯 Libreria Template & Esempi

### In Evidenza: Template Microsoft Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

> **Nota:** Questi template mostrano vari pattern AI. Alcuni sono Azure Samples esterni, altri implementazioni locali.

| Template | Capitolo | Complessità | Servizi | Tipo |
|----------|----------|------------|---------|------|
| [**Inizia con AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Esterno |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Esterno |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Esterno |
| [**Quickstart OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Esterno |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Esterno |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Esterno |
| [**Soluzione Multi-Agente per Retail**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Locale** |

### In Evidenza: Scenari di Apprendimento Completi
**Template di applicazioni pronte per la produzione mappate ai capitoli di apprendimento**

| Template | Capitolo di Apprendimento | Complessità | Apprendimento Chiave |
|----------|-------------------------|------------|--------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Pattern base di distribuzione AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework agenti e chiamate funzione |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI aziendale |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Customer e Inventory |

### Apprendimento per Tipo di Esempio

> **📌 Esempi Locali vs Esterni:**  
> **Esempi Locali** (in questo repo) = Pronti all’uso immediato  
> **Esempi Esterni** (Azure Samples) = Clona dai repository collegati

#### Esempi Locali (Pronti all’uso)
- [**Soluzione Multi-Agente per Retail**](examples/retail-scenario.md) - Implementazione completa pronta per la produzione con modelli ARM
  - Architettura multi-agente (agenti Customer + Inventory)
  - Monitoraggio e valutazione comprensivi
  - Distribuzione con un clic tramite modello ARM

#### Esempi Locali - Applicazioni Container (Capitoli 2-5)
**Esempi completi di distribuzione container in questo repository:**

- [**Esempi di Container App**](examples/container-app/README.md) - Guida completa ai deployment containerizzati
  - [API Flask Semplice](../../examples/container-app/simple-flask-api) - API REST di base con scale-to-zero
  - [Architettura Microservizi](../../examples/container-app/microservices) - Deployment multi-servizio pronto per la produzione
  - Schemi di deployment Quick Start, Produzione e Avanzati
  - Linee guida per monitoraggio, sicurezza e ottimizzazione dei costi

#### Esempi Esterni - Applicazioni Semplici (Capitoli 1-2)
**Clona questi repository di esempi Azure per iniziare:**
- [Semplice Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Schemi di deployment base
- [Sito Statico - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment di contenuti statici
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment API REST

#### Esempi Esterni - Integrazione Database (Capitoli 3-4)  
- [App Database - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Schemi di connettività database
- [Funzioni + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flusso dati serverless

#### Esempi Esterni - Schemi Avanzati (Capitoli 4-8)
- [Microservizi Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architetture multi-servizio
- [Job per Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Elaborazione in background  
- [Pipeline ML Enterprise](https://github.com/Azure-Samples/mlops-v2) - Schemi ML pronti per la produzione

### Collezioni di Template Esterni
- [**Galleria Ufficiale Template AZD**](https://azure.github.io/awesome-azd/) - Collezione curata di template ufficiali e community
- [**Template Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione template Microsoft Learn
- [**Directory Esempi**](examples/README.md) - Esempi di apprendimento locale con spiegazioni dettagliate

---

## 📚 Risorse di Apprendimento & Riferimenti

### Riferimenti Rapidi
- [**Cheat Sheet comandi**](resources/cheat-sheet.md) - Comandi azd essenziali organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida di Studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop Pratici
- [**Lab Workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendi le tue soluzioni AI distribuibili con AZD (2-3 ore)
- [**Workshop Interattivo**](workshop/README.md) - 8 moduli guidati con MkDocs e GitHub Codespaces
  - Segue: Introduzione → Selezione → Validazione → Decostruzione → Configurazione → Personalizzazione → Chiusura → Riepilogo

### Risorse di Apprendimento Esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore Prezzi Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato Azure](https://status.azure.com/)

### Competenze AI Agent per il Tuo Editor
- [**Competenze Microsoft Azure su skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 competenze agenti aperti per Azure AI, Foundry, deployment, diagnostica, ottimizzazione costi e altro. Installale in GitHub Copilot, Cursor, Claude Code, o in qualsiasi agente supportato:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guida Rapida alla Risoluzione dei Problemi

**Problemi comuni affrontati dai principianti e soluzioni immediate:**

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

# Oppure usa SKU più piccoli in fase di sviluppo
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

# Opzione 2: Correggi solo l'infrastruttura
azd provision

# Opzione 3: Controlla lo stato dettagliato
azd show

# Opzione 4: Controlla i registri in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autenticazione fallita" o "Token scaduto"</strong></summary>

```bash
# Riautenticarsi per AZD
azd auth logout
azd auth login

# Facoltativo: aggiorna anche Azure CLI se stai eseguendo comandi az
az logout
az login

# Verifica l'autenticazione
az account show
```
</details>

<details>
<summary><strong>❌ "Risorsa già esistente" o conflitti di denominazione</strong></summary>

```bash
# AZD genera nomi unici, ma in caso di conflitto:
azd down --force --purge

# Quindi riprova con un nuovo ambiente
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Il deployment del template impiega troppo tempo</strong></summary>

**Tempi di attesa normali:**
- Semplice web app: 5-10 minuti
- App con database: 10-15 minuti
- Applicazioni AI: 15-25 minuti (il provisioning OpenAI è lento)

```bash
# Controlla i progressi
azd show

# Se bloccato >30 minuti, controlla il Portale Azure:
azd monitor --overview
# Cerca distribuzioni fallite
```
</details>

<details>
<summary><strong>❌ "Permesso negato" o "Proibito"</strong></summary>

```bash
# Verifica il tuo ruolo Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Hai bisogno almeno del ruolo "Collaboratore"
# Chiedi al tuo amministratore Azure di concedere:
# - Collaboratore (per le risorse)
# - Amministratore accesso utente (per le assegnazioni di ruolo)
```
</details>

<details>
<summary><strong>❌ Impossibile trovare URL dell'applicazione distribuita</strong></summary>

```bash
# Mostra tutti i punti di servizio
azd show

# O apri il Portale Azure
azd monitor

# Controlla servizio specifico
azd env get-values
# Cerca variabili *_URL
```
</details>

### 📚 Risorse complete di Risoluzione Problemi

- **Guida Problemi Comuni:** [Soluzioni dettagliate](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemi specifici AI:** [Risoluzione problemi AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guida al Debug:** [Debug passo-passo](docs/chapter-07-troubleshooting/debugging.md)
- **Ottieni aiuto:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Completamento Corso & Certificazione

### Monitoraggio del Progresso
Monitora i tuoi progressi di apprendimento attraverso ogni capitolo:

- [ ] **Capitolo 1**: Fondamenti & Quick Start ✅
- [ ] **Capitolo 2**: Sviluppo AI-First ✅  
- [ ] **Capitolo 3**: Configurazione & Autenticazione ✅
- [ ] **Capitolo 4**: Infrastructure as Code & Deployment ✅
- [ ] **Capitolo 5**: Soluzioni AI Multi-Agente ✅
- [ ] **Capitolo 6**: Validazione & Pianificazione Pre-Deployment ✅
- [ ] **Capitolo 7**: Risoluzione Problemi & Debugging ✅
- [ ] **Capitolo 8**: Schemi di Produzione & Enterprise ✅

### Verifica di Apprendimento
Dopo aver completato ciascun capitolo, verifica le tue conoscenze tramite:
1. **Esercizio Pratico**: Completa il deployment pratico del capitolo
2. **Verifica delle Conoscenze**: Rivedi la sezione FAQ per il tuo capitolo
3. **Discussione Comunitaria**: Condividi la tua esperienza in Azure Discord
4. **Capitolo Successivo**: Passa al livello di complessità successivo

### Vantaggi del Completamento del Corso
Al completamento di tutti i capitoli, avrai:
- **Esperienza di Produzione**: Applicazioni AI reali distribuite su Azure
- **Competenze Professionali**: Capacità di deployment pronte per l'impresa  
- **Riconoscimento Comunitario**: Membro attivo della community di sviluppatori Azure
- **Avanzamento di Carriera**: Expertise AZD e deployment AI richieste

---

## 🤝 Comunità & Supporto

### Ottieni Aiuto & Supporto
- **Problemi Tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande di Apprendimento**: [Comunità Microsoft Azure Discord](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aiuto Specifico AI**: Unisciti a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentazione**: [Documentazione ufficiale Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insight dalla Comunità su Microsoft Foundry Discord

**Risultati recenti del sondaggio dal canale #Azure:**
- **45%** degli sviluppatori vuole usare AZD per carichi di lavoro AI
- **Principali sfide**: Deployment multi-servizio, gestione credenziali, readiness di produzione  
- **Più richiesti**: Template specifici AI, guide di risoluzione, best practice

**Unisciti alla nostra comunità per:**
- Condividere le tue esperienze AZD + AI e ottenere aiuto
- Accedere a anteprime di nuovi template AI
- Contribuire alle best practice di deployment AI
- Influenzare lo sviluppo futuro di funzionalità AI + AZD

### Contribuire al Corso
Accogliamo contributi! Si prega di leggere la nostra [Guida ai Contributi](CONTRIBUTING.md) per dettagli su:
- **Miglioramenti dei contenuti**: Migliorare capitoli ed esempi esistenti
- **Nuovi Esempi**: Aggiungere scenari e template reali  
- **Traduzione**: Aiutare a mantenere il supporto multilingua
- **Segnalazioni bug**: Migliorare accuratezza e chiarezza
- **Standard Comunitari**: Seguire le nostre linee guida di comunità inclusive

---

## 📄 Informazioni sul Corso

### Licenza
Questo progetto è concesso in licenza sotto la Licenza MIT - vedi il file [LICENSE](../../LICENSE) per dettagli.

### Risorse di Apprendimento Microsoft Correlate

Il nostro team produce altri corsi di apprendimento completi:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j per Principianti](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js per Principianti](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain per Principianti](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD per Principianti](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI per Principianti](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP per Principianti](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents per Principianti](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Generative AI
[![Generative AI per Principianti](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Apprendimento Principale
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigazione del Corso

**🚀 Pronto per iniziare a imparare?**

**Principianti**: Inizia con [Capitolo 1: Fondazioni & Avvio Rapido](#-chapter-1-foundation--quick-start)  
**Sviluppatori AI**: Passa a [Capitolo 2: Sviluppo AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Sviluppatori Esperti**: Comincia con [Capitolo 3: Configurazione & Autenticazione](#️-chapter-3-configuration--authentication)

**Passi Successivi**: [Inizia Capitolo 1 - Nozioni di base AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->