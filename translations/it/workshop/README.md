<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Workshop AZD per sviluppatori AI
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Un workshop pratico per costruire applicazioni AI con Azure Developer CLI.</strong><br>
      Completa 7 moduli per padroneggiare i template AZD e i flussi di lavoro di distribuzione per l'AI.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Ultimo aggiornamento: Febbraio 2026
      </span>
    </div>
  </div>
</div>

# Workshop AZD per sviluppatori AI

Benvenuto al workshop pratico per apprendere Azure Developer CLI (AZD) con un focus sulla distribuzione di applicazioni AI. Questo workshop ti aiuta a ottenere una comprensione applicata dei template AZD in 3 passaggi:

1. **Scoperta** - trova il template che fa per te.
1. **Distribuzione** - distribuisci e verifica che funzioni
1. **Personalizzazione** - modifica e itera per renderlo tuo!

Nel corso di questo workshop, ti verranno inoltre presentati strumenti e flussi di lavoro fondamentali per sviluppatori, per aiutarti a snellire il tuo percorso di sviluppo end-to-end.

<br/>

## Guida basata sul browser

Le lezioni del workshop sono in Markdown. Puoi navigarle direttamente su GitHub - oppure avviare un'anteprima basata sul browser come mostrato nello screenshot qui sotto.

![Laboratorio](../../../translated_images/it/workshop.75906f133e6f8ba0.webp)

Per usare questa opzione - esegui il fork del repository sul tuo profilo e avvia GitHub Codespaces. Una volta attivo il terminale di VS Code, digita questo comando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

In pochi secondi vedrai apparire una finestra di dialogo. Seleziona l'opzione `Apri nel browser`. La guida web-based si aprirà ora in una nuova scheda del browser. Alcuni vantaggi di questa anteprima:

1. **Ricerca integrata** - trova parole chiave o lezioni rapidamente.
1. **Icona copia** - passa il mouse sui blocchi di codice per vedere questa opzione
1. **Interruttore tema** - passa tra temi scuro e chiaro
1. **Ottieni aiuto** - clicca l'icona Discord nel footer per partecipare!

<br/>

## Panoramica del workshop

**Durata:** 3-4 ore  
**Livello:** Principiante - Intermedio  
**Prerequisiti:** Familiarità con Azure, concetti di AI, VS Code e strumenti da riga di comando.

Questo è un workshop pratico in cui impari facendo. Una volta completati gli esercizi, ti consigliamo di rivedere il curriculum AZD For Beginners per continuare il tuo percorso di apprendimento su best practice di Sicurezza e Produttività.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | [Introduzione](docs/instructions/0-Introduction.md) | Inquadra il contesto, comprendi gli obiettivi |
| 30 mins | [Seleziona template AI](docs/instructions/1-Select-AI-Template.md) | Esplora le opzioni e scegli il template iniziale | 
| 30 mins | [Valida template AI](docs/instructions/2-Validate-AI-Template.md) | Distribuisci la soluzione predefinita su Azure |
| 30 mins | [Decomponi template AI](docs/instructions/3-Deconstruct-AI-Template.md) | Esplora struttura e configurazione |
| 30 mins | [Configura template AI](docs/instructions/4-Configure-AI-Template.md) | Attiva e prova le funzionalità disponibili |
| 30 mins | [Personalizza template AI](docs/instructions/5-Customize-AI-Template.md) | Adatta il template alle tue esigenze |
| 30 mins | [Smantella infrastruttura](docs/instructions/6-Teardown-Infrastructure.md) | Pulizia e rilascio delle risorse |
| 15 mins | [Conclusione e passi successivi](docs/instructions/7-Wrap-up.md) | Risorse di apprendimento, sfida del workshop |

<br/>

## Cosa imparerai

Considera il Template AZD come un sandbox di apprendimento per esplorare varie capacità e strumenti per lo sviluppo end-to-end su Microsoft Foundry. Al termine di questo workshop, dovresti avere una percezione intuitiva dei vari strumenti e concetti in questo contesto.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Comprendere i comandi e i flussi di lavoro dello strumento|
| **Template AZD**| Comprendere la struttura del progetto e la configurazione|
| **Azure AI Agent**| Provisioning e distribuzione di un progetto Microsoft Foundry  |
| **Azure AI Search**| Abilitare l'ingegneria del contesto con agenti |
| **Observability**| Esplora tracing, monitoraggio e valutazioni |
| **Red Teaming**| Esplora test adversariali e mitigazioni |

<br/>

## Struttura del workshop

Il workshop è strutturato per accompagnarti in un percorso dalla scoperta del template, alla distribuzione, alla decomposizione e alla personalizzazione - usando come base il template starter ufficiale [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents).

### [Modulo 1: Seleziona template AI](docs/instructions/1-Select-AI-Template.md) (30 mins)

- Cosa sono i template AI?
- Dove posso trovare i template AI?
- Come posso iniziare a costruire agenti AI?
- **Lab**: Avvio rapido con GitHub Codespaces

### [Modulo 2: Valida template AI](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Qual è l'architettura del template AI?
- Qual è il flusso di sviluppo AZD?
- Come posso ottenere aiuto per lo sviluppo con AZD?
- **Lab**: Distribuisci e valida il template AI Agents

### [Modulo 3: Decomponi template AI](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Esplora il tuo ambiente in `.azure/` 
- Esplora la configurazione delle risorse in `infra/` 
- Esplora la tua configurazione AZD in `azure.yaml`s
- **Lab**: Modifica le variabili d'ambiente e ridistribuisci

### [Modulo 4: Configura template AI](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Esplora: Retrieval Augmented Generation
- Esplora: Valutazione degli agenti & Red Teaming
- Esplora: Tracing & Monitoraggio
- **Lab**: Esplora l'agente AI + Osservabilità 

### [Modulo 5: Personalizza template AI](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Definisci: PRD con requisiti dello scenario
- Configura: variabili d'ambiente per AZD
- Implementa: Lifecycle Hooks per attività aggiuntive
- **Lab**: Personalizza il template per il mio scenario

### [Modulo 6: Smantella infrastruttura](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Riepilogo: Cosa sono i template AZD?
- Riepilogo: Perché usare Azure Developer CLI?
- Prossimi passi: Prova un template diverso!
- **Lab**: Deprovision dell'infrastruttura e pulizia

<br/>

## Sfida del workshop

Vuoi sfidarti a fare di più? Ecco alcuni suggerimenti di progetto - oppure condividi le tue idee con noi!!

| Project | Description |
|:---|:---|
|1. **Decomponi un template AI complesso** | Usa il flusso di lavoro e gli strumenti che abbiamo descritto e verifica se riesci a distribuire, convalidare e personalizzare un diverso template di soluzione AI. _Cosa hai imparato?_|
|2. **Personalizza con il tuo scenario**  | Prova a scrivere un PRD (Product Requirements Document) per uno scenario diverso. Poi usa GitHub Copilot nel tuo repo del template in Agent Model - e chiedigli di generare un workflow di personalizzazione per te. _Cosa hai imparato? Come potresti migliorare questi suggerimenti?_|
| | |

## Hai feedback?

1. Apri un issue su questo repository - etichettalo `Workshop` per comodità.
1. Unisciti al Discord di Microsoft Foundry - connettiti con i tuoi colleghi!


| | | 
|:---|:---|
| **📚 Home del corso**| [AZD For Beginners](../README.md)|
| **📖 Documentazione** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Template AI** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Prossimi passi** | [Inizia il workshop](../../../workshop) |
| | |

<br/>

---

**Navigazione:** [Main Course](../README.md) | [Introduzione](docs/instructions/0-Introduction.md) | [Modulo 1: Seleziona template](docs/instructions/1-Select-AI-Template.md)

**Pronto per iniziare a costruire applicazioni AI con AZD?**

[Inizia il workshop: Introduzione →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Dichiarazione di non responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si tenga presente che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella lingua di origine deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->