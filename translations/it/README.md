<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T09:59:49+00:00",
  "source_file": "README.md",
  "language_code": "it"
}
-->
# AZD Per Principianti

![AZD-per-principianti](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.it.png) 

Segui questi passaggi per iniziare a utilizzare queste risorse:
1. **Fork del Repository**: Clicca [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clona il Repository**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Unisciti alle Comunità Discord di Azure e incontra esperti e altri sviluppatori**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Supporto Multilingue

#### Supportato tramite GitHub Action (Automatizzato e Sempre Aggiornato)

[Francese](../fr/README.md) | [Spagnolo](../es/README.md) | [Tedesco](../de/README.md) | [Russo](../ru/README.md) | [Arabo](../ar/README.md) | [Persiano (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Cinese (Semplificato)](../zh/README.md) | [Cinese (Tradizionale, Macao)](../mo/README.md) | [Cinese (Tradizionale, Hong Kong)](../hk/README.md) | [Cinese (Tradizionale, Taiwan)](../tw/README.md) | [Giapponese](../ja/README.md) | [Coreano](../ko/README.md) | [Hindi](../hi/README.md) | [Bengalese](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalese](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portoghese (Portogallo)](../pt/README.md) | [Portoghese (Brasile)](../br/README.md) | [Italiano](./README.md) | [Polacco](../pl/README.md) | [Turco](../tr/README.md) | [Greco](../el/README.md) | [Thailandese](../th/README.md) | [Svedese](../sv/README.md) | [Danese](../da/README.md) | [Norvegese](../no/README.md) | [Finlandese](../fi/README.md) | [Olandese](../nl/README.md) | [Ebraico](../he/README.md) | [Vietnamita](../vi/README.md) | [Indonesiano](../id/README.md) | [Malese](../ms/README.md) | [Tagalog (Filippino)](../tl/README.md) | [Swahili](../sw/README.md) | [Ungherese](../hu/README.md) | [Ceco](../cs/README.md) | [Slovacco](../sk/README.md) | [Rumeno](../ro/README.md) | [Bulgaro](../bg/README.md) | [Serbo (Cirillico)](../sr/README.md) | [Croato](../hr/README.md) | [Sloveno](../sl/README.md) | [Ucraino](../uk/README.md) | [Birmano (Myanmar)](../my/README.md)

**Se desideri supportare ulteriori lingue, l'elenco delle lingue supportate è disponibile [qui](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introduzione

Benvenuto nella guida completa per Azure Developer CLI (azd). Questo repository è progettato per aiutare sviluppatori di tutti i livelli, dagli studenti ai professionisti, a imparare e padroneggiare Azure Developer CLI per implementazioni cloud efficienti. Questa risorsa di apprendimento strutturata offre esperienza pratica con implementazioni cloud su Azure, risoluzione di problemi comuni e applicazione delle migliori pratiche per il successo delle implementazioni di template AZD.

## Obiettivi di Apprendimento

Lavorando attraverso questo repository, imparerai a:
- Padroneggiare i fondamenti e i concetti principali di Azure Developer CLI
- Implementare e fornire risorse Azure utilizzando Infrastructure as Code
- Sviluppare competenze per risolvere problemi comuni di implementazione AZD
- Comprendere la validazione pre-implementazione e la pianificazione della capacità
- Applicare le migliori pratiche di sicurezza e strategie di ottimizzazione dei costi
- Acquisire fiducia nell'implementazione di applicazioni pronte per la produzione su Azure

## Risultati di Apprendimento

Dopo aver completato questo corso, sarai in grado di:
- Installare, configurare e utilizzare con successo Azure Developer CLI
- Creare e implementare applicazioni utilizzando i template AZD
- Risolvere problemi di autenticazione, infrastruttura e implementazione
- Eseguire controlli pre-implementazione, inclusa la pianificazione della capacità e la selezione degli SKU
- Implementare le migliori pratiche di monitoraggio, sicurezza e gestione dei costi
- Integrare i flussi di lavoro AZD nelle pipeline CI/CD

## Indice

- [Cos'è Azure Developer CLI?](../..)
- [Guida Rapida](../..)
- [Documentazione](../..)
- [Esempi e Template](../..)
- [Risorse](../..)
- [Contributi](../..)

## Cos'è Azure Developer CLI?

Azure Developer CLI (azd) è un'interfaccia a riga di comando orientata agli sviluppatori che accelera il processo di creazione e implementazione di applicazioni su Azure. Offre:

- **Implementazioni basate su template** - Utilizza template pre-costruiti per modelli di applicazione comuni
- **Infrastructure as Code** - Gestisci le risorse Azure utilizzando Bicep o Terraform
- **Flussi di lavoro integrati** - Fornisci, implementa e monitora applicazioni senza interruzioni
- **Ottimizzato per gli sviluppatori** - Progettato per massimizzare la produttività e l'esperienza degli sviluppatori

## Guida Rapida

### Prerequisiti
- Abbonamento Azure
- Azure CLI installato
- Git (per clonare i template)

### Installazione
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### La tua Prima Implementazione
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## Documentazione

### Per Iniziare
- [**Fondamenti di AZD**](docs/getting-started/azd-basics.md) - Concetti e terminologia principali
- [**Installazione e Configurazione**](docs/getting-started/installation.md) - Guide di installazione specifiche per piattaforma
- [**Configurazione**](docs/getting-started/configuration.md) - Configurazione dell'ambiente e autenticazione
- [**Il tuo Primo Progetto**](docs/getting-started/first-project.md) - Tutorial passo-passo

### Implementazione e Provisioning
- [**Guida all'Implementazione**](docs/deployment/deployment-guide.md) - Flussi di lavoro completi di implementazione
- [**Provisioning delle Risorse**](docs/deployment/provisioning.md) - Gestione delle risorse Azure

### Controlli Pre-Implementazione
- [**Pianificazione della Capacità**](docs/pre-deployment/capacity-planning.md) - Validazione della capacità delle risorse Azure
- [**Selezione degli SKU**](docs/pre-deployment/sku-selection.md) - Scelta degli SKU Azure appropriati
- [**Controlli Pre-Implementazione**](docs/pre-deployment/preflight-checks.md) - Script di validazione automatizzati

### Risoluzione dei Problemi
- [**Problemi Comuni**](docs/troubleshooting/common-issues.md) - Problemi frequenti e soluzioni
- [**Guida al Debugging**](docs/troubleshooting/debugging.md) - Strategie di debugging passo-passo

## Esempi e Template
- [**Esempi**]([examples/README.md) - Esempi pratici, template e scenari reali per aiutarti a imparare Azure Developer CLI attraverso la pratica. Ogni esempio fornisce codice completo funzionante, template di infrastruttura e istruzioni dettagliate per diverse architetture di applicazione e modelli di implementazione.

### Laboratorio Pratico/Workshop
- [**AZD Per Principianti**](workshop/README.md) - Questo workshop si concentrerà sul template AZD "Get Started with AI Agents" e fornirà pratiche migliori per l'implementazione dei servizi Azure AI utilizzando AZD.

## Risorse

### Riferimenti Rapidi
- [**Comandi Essenziali**](resources/cheat-sheet.md) - Comandi azd fondamentali
- [**Glossario**](resources/glossary.md) - Terminologia di Azure e azd
- [**FAQ**](resources/faq.md) - Domande frequenti
- [**Guida di Studio**](resources/study-guide.md) - Obiettivi di apprendimento completi ed esercizi pratici

### Risorse Esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro Architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore Prezzi Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato Azure](https://status.azure.com/)

## Percorso di Apprendimento

### Per Studenti e Principianti
1. Inizia con [Fondamenti di AZD](docs/getting-started/azd-basics.md)
2. Segui la [Guida all'Installazione](docs/getting-started/installation.md)
3. Completa [Il tuo Primo Progetto](docs/getting-started/first-project.md)
4. Pratica con [Esempio di Applicazione Web Semplice](../../examples/simple-web-app)

### Per Sviluppatori
1. Rivedi la [Guida alla Configurazione](docs/getting-started/configuration.md)
2. Studia la [Guida all'Implementazione](docs/deployment/deployment-guide.md)
3. Lavora con [Esempio di Applicazione Database](../../examples/database-app)
4. Esplora [Esempio di Applicazione Container](../../examples/container-app)

### Per Ingegneri DevOps
1. Padroneggia il [Provisioning delle Risorse](docs/deployment/provisioning.md)
2. Implementa i [Controlli Pre-Implementazione](docs/pre-deployment/preflight-checks.md)
3. Pratica la [Pianificazione della Capacità](docs/pre-deployment/capacity-planning.md)
4. Approfondisci con [Esempio di Microservizi](../../examples/microservices)

## Contributi

Accogliamo con favore i contributi! Leggi la nostra [Guida ai Contributi](CONTRIBUTING.md) per dettagli su:
- Come inviare problemi e richieste di funzionalità
- Linee guida per il contributo al codice
- Miglioramenti alla documentazione
- Standard della comunità

## Supporto

- **Problemi**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Discussioni**: [Q&A e discussioni nella Comunità Discord di Microsoft Azure](https://discord.gg/microsoft-azure)
- **Email**: Per richieste private
- **Microsoft Learn**: [Documentazione ufficiale di Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## Licenza

Questo progetto è concesso sotto licenza MIT - consulta il file [LICENSE](../../LICENSE) per i dettagli.

## 🎒 Altri Corsi

Il nostro team produce altri corsi! Dai un'occhiata:

- [**NUOVO** Protocollo Model Context (MCP) Per Principianti](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Agenti AI per Principianti](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI per Principianti usando .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI per Principianti](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI per Principianti usando Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML per Principianti](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science per Principianti](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI per Principianti](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity per Principianti](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev per Principianti](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT per Principianti](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Sviluppo XR per Principianti](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Padroneggiare GitHub Copilot per la Programmazione Assistita da AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Padroneggiare GitHub Copilot per Sviluppatori C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Scegli la Tua Avventura con Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigazione**
- **Prossima Lezione**: [AZD Fondamenti](docs/getting-started/azd-basics.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.