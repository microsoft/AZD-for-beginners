<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:43:03+00:00",
  "source_file": "workshop/README.md",
  "language_code": "it"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop in costruzione 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Questo workshop è attualmente in fase di sviluppo attivo.</strong><br>
      Il contenuto potrebbe essere incompleto o soggetto a modifiche. Torna presto per gli aggiornamenti!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Ultimo aggiornamento: Ottobre 2025
      </span>
    </div>
  </div>
</div>

# Workshop AZD per sviluppatori AI

Benvenuto al workshop pratico per imparare Azure Developer CLI (AZD) con un focus sul deployment di applicazioni AI. Questo workshop ti aiuterà a comprendere l'utilizzo dei template AZD in 3 passaggi:

1. **Scoperta** - trova il template giusto per te.
1. **Deployment** - distribuisci e verifica che funzioni.
1. **Personalizzazione** - modifica e adatta il template alle tue esigenze!

Durante il workshop, ti verranno introdotti anche strumenti e flussi di lavoro essenziali per gli sviluppatori, per aiutarti a ottimizzare il tuo percorso di sviluppo end-to-end.

<br/>

## Guida basata su browser

Le lezioni del workshop sono in Markdown. Puoi navigarle direttamente su GitHub - oppure avviare un'anteprima basata su browser come mostrato nello screenshot qui sotto.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba0.it.png)

Per utilizzare questa opzione - fai un fork del repository nel tuo profilo e avvia GitHub Codespaces. Una volta attivo il terminale di VS Code, digita questo comando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

In pochi secondi vedrai un dialog pop-up. Seleziona l'opzione `Apri nel browser`. La guida basata su web si aprirà ora in una nuova scheda del browser. Alcuni vantaggi di questa anteprima:

1. **Ricerca integrata** - trova rapidamente parole chiave o lezioni.
1. **Icona copia** - passa il mouse sui blocchi di codice per vedere questa opzione.
1. **Cambio tema** - alterna tra temi scuri e chiari.
1. **Ottieni aiuto** - clicca sull'icona Discord nel footer per unirti!

<br/>

## Panoramica del workshop

**Durata:** 3-4 ore  
**Livello:** Principiante a Intermedio  
**Prerequisiti:** Familiarità con Azure, concetti AI, VS Code e strumenti da riga di comando.

Questo è un workshop pratico dove impari facendo. Una volta completati gli esercizi, ti consigliamo di rivedere il curriculum AZD per principianti per continuare il tuo percorso di apprendimento su sicurezza e produttività.

| Tempo | Modulo  | Obiettivo |
|:---|:---|:---|
| 15 min | [Introduzione](docs/instructions/0-Introduction.md) | Imposta il contesto, comprendi gli obiettivi |
| 30 min | [Seleziona il template AI](docs/instructions/1-Select-AI-Template.md) | Esplora le opzioni e scegli un punto di partenza | 
| 30 min | [Convalida il template AI](docs/instructions/2-Validate-AI-Template.md) | Distribuisci la soluzione predefinita su Azure |
| 30 min | [Analizza il template AI](docs/instructions/3-Deconstruct-AI-Template.md) | Esplora struttura e configurazione |
| 30 min | [Configura il template AI](docs/instructions/4-Configure-AI-Template.md) | Attiva e prova le funzionalità disponibili |
| 30 min | [Personalizza il template AI](docs/instructions/5-Customize-AI-Template.md) | Adatta il template alle tue esigenze |
| 30 min | [Smantella l'infrastruttura](docs/instructions/6-Teardown-Infrastructure.md) | Pulisci e rilascia le risorse |
| 15 min | [Conclusione e prossimi passi](docs/instructions/7-Wrap-up.md) | Risorse di apprendimento, sfida del workshop |

<br/>

## Cosa imparerai

Pensa al template AZD come a un sandbox di apprendimento per esplorare varie capacità e strumenti per lo sviluppo end-to-end su Azure AI Foundry. Alla fine del workshop, dovresti avere una comprensione intuitiva di vari strumenti e concetti in questo contesto.

| Concetto  | Obiettivo |
|:---|:---|
| **Azure Developer CLI** | Comprendere i comandi e i flussi di lavoro dello strumento |
| **Template AZD**| Comprendere la struttura del progetto e la configurazione |
| **Azure AI Agent**| Provisioning e distribuzione del progetto Azure AI Foundry |
| **Azure AI Search**| Abilitare l'ingegneria del contesto con gli agenti |
| **Osservabilità**| Esplorare tracciamento, monitoraggio e valutazioni |
| **Red Teaming**| Esplorare test avversari e mitigazioni |

<br/>

## Struttura del workshop

Il workshop è strutturato per guidarti in un percorso che va dalla scoperta del template, al deployment, all'analisi e alla personalizzazione - utilizzando il template ufficiale [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) come base.

### [Modulo 1: Seleziona il template AI](docs/instructions/1-Select-AI-Template.md) (30 min)

- Cosa sono i template AI?
- Dove posso trovare i template AI?
- Come posso iniziare a costruire agenti AI?
- **Lab**: Avvio rapido con GitHub Codespaces

### [Modulo 2: Convalida il template AI](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Qual è l'architettura del template AI?
- Qual è il flusso di lavoro di sviluppo AZD?
- Come posso ottenere aiuto con lo sviluppo AZD?
- **Lab**: Distribuisci e convalida il template degli agenti AI

### [Modulo 3: Analizza il template AI](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Esplora il tuo ambiente in `.azure/` 
- Esplora la configurazione delle risorse in `infra/` 
- Esplora la configurazione AZD in `azure.yaml`
- **Lab**: Modifica le variabili di ambiente e ridistribuisci

### [Modulo 4: Configura il template AI](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Esplora: Retrieval Augmented Generation
- Esplora: Valutazione degli agenti e Red Teaming
- Esplora: Tracciamento e monitoraggio
- **Lab**: Esplora agente AI + osservabilità 

### [Modulo 5: Personalizza il template AI](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definisci: PRD con requisiti di scenario
- Configura: Variabili di ambiente per AZD
- Implementa: Lifecycle Hooks per attività aggiuntive
- **Lab**: Personalizza il template per il mio scenario

### [Modulo 6: Smantella l'infrastruttura](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Riepilogo: Cosa sono i template AZD?
- Riepilogo: Perché usare Azure Developer CLI?
- Prossimi passi: Prova un template diverso!
- **Lab**: Deprovisioning dell'infrastruttura e pulizia

<br/>

## Sfida del workshop

Vuoi metterti alla prova e fare di più? Ecco alcune idee per progetti - oppure condividi le tue idee con noi!!

| Progetto | Descrizione |
|:---|:---|
|1. **Analizza un template AI complesso** | Usa il flusso di lavoro e gli strumenti che abbiamo illustrato e verifica se riesci a distribuire, convalidare e personalizzare un template di soluzione AI diverso. _Cosa hai imparato?_|
|2. **Personalizza con il tuo scenario**  | Prova a scrivere un PRD (Product Requirements Document) per uno scenario diverso. Poi usa GitHub Copilot nel tuo repository di template in modalità Agent Model - e chiedigli di generare un flusso di lavoro di personalizzazione per te. _Cosa hai imparato? Come potresti migliorare queste proposte?_|
| | |

## Hai feedback?

1. Pubblica un problema su questo repository - etichettalo come `Workshop` per comodità.
1. Unisciti al Discord di Azure AI Foundry - connettiti con i tuoi colleghi!


| | | 
|:---|:---|
| **📚 Home del corso**| [AZD per principianti](../README.md)|
| **📖 Documentazione** | [Introduzione ai template AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Template AI** | [Template Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Prossimi passi** | [Accetta la sfida](../../../workshop) |
| | |

<br/>

---

**Precedente:** [Guida alla risoluzione dei problemi AI](../docs/troubleshooting/ai-troubleshooting.md) | **Successivo:** Inizia con [Lab 1: Fondamenti AZD](../../../workshop/lab-1-azd-basics)

**Pronto per iniziare a costruire applicazioni AI con AZD?**

[Inizia Lab 1: Fondamenti AZD →](./lab-1-azd-basics/README.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.