# 1. Seleziona un modello

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Descrivere cosa sono i template AZD
    - [ ] Scoprire e usare i template AZD per l'AI
    - [ ] Iniziare con il template AI Agents
    - [ ] **Lab 1:** Avvio rapido AZD in Codespaces o in un dev container

---

## 1. Un'analogia del costruttore

Costruire un'applicazione AI moderna e pronta per l'impresa _da zero_ può essere scoraggiante. È un po' come costruire la tua nuova casa da solo, mattone dopo mattone. Sì, è fattibile! Ma non è il modo più efficace per ottenere il risultato desiderato!

Invece, spesso partiamo da un buon _progetto di design_ esistente e collaboriamo con un architetto per personalizzarlo in base alle nostre esigenze personali. Ed è esattamente l'approccio da adottare quando si costruiscono applicazioni intelligenti. Prima, trova una buona architettura di progetto che si adatti al tuo ambito di problema. Poi lavora con un solution architect per personalizzare e sviluppare la soluzione per il tuo scenario specifico.

Ma dove possiamo trovare questi progetti di design? E come troviamo un architetto disposto a insegnarci come personalizzare e distribuire questi progetti da soli? In questo workshop rispondiamo a queste domande presentandoti tre tecnologie:

1. [Azure Developer CLI](https://aka.ms/azd) - uno strumento open-source che accelera il percorso dello sviluppatore passando dallo sviluppo locale (build) alla distribuzione cloud (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - repository open-source standardizzati contenenti codice di esempio, infrastruttura e file di configurazione per distribuire un'architettura di soluzione AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - un agente di codifica basato sulla conoscenza di Azure, in grado di guidarci nella navigazione del codebase e nell'apportare modifiche usando il linguaggio naturale.

Con questi strumenti a disposizione, ora possiamo _scoprire_ il template giusto, _distribuirlo_ per verificarne il funzionamento e _personalizzarlo_ per adattarlo ai nostri scenari specifici. Immergiamoci e impariamo come funzionano.

---

## 2. Azure Developer CLI

La [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (o `azd`) è uno strumento da riga di comando open-source che può accelerare il tuo percorso da codice a cloud con una serie di comandi pensati per gli sviluppatori che funzionano in modo coerente nel tuo IDE (sviluppo) e negli ambienti CI/CD (devops).

Con `azd`, il tuo percorso di distribuzione può essere semplice come:

- `azd init` - Inizializza un nuovo progetto AI da un template AZD esistente.
- `azd up` - Provisiona l'infrastruttura e distribuisce la tua applicazione in un unico passaggio.
- `azd monitor` - Ottieni monitoraggio e diagnostica in tempo reale per la tua applicazione distribuita.
- `azd pipeline config` - Configura pipeline CI/CD per automatizzare la distribuzione su Azure.

**🎯 | ESERCIZIO**: <br/> Esplora lo strumento da riga di comando `azd` nel tuo attuale ambiente del workshop ora. Questo può essere GitHub Codespaces, un dev container o una copia locale con i prerequisiti installati. Inizia digitando questo comando per vedere cosa può fare lo strumento:

```bash title="" linenums="0"
azd help
```

![Flusso](../../../../../translated_images/it/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Il template AZD

Per permettere ad `azd` di fare tutto questo, deve conoscere l'infrastruttura da provisionare, le impostazioni di configurazione da applicare e l'applicazione da distribuire. Ed è qui che entrano in gioco gli [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

Gli AZD templates sono repository open-source che combinano codice di esempio con file di infrastruttura e configurazione necessari per distribuire l'architettura della soluzione.
Utilizzando un approccio _Infrastructure-as-Code_ (IaC), consentono che le definizioni delle risorse del template e le impostazioni di configurazione siano gestite con il controllo versione (proprio come il codice sorgente dell'app) - creando flussi di lavoro riutilizzabili e coerenti tra gli utilizzatori di quel progetto.

Quando crei o riutilizzi un template AZD per _il tuo_ scenario, considera queste domande:

1. Cosa stai costruendo? → Esiste un template che ha codice iniziale per quello scenario?
1. Come è progettata la tua soluzione? → Esiste un template che dispone delle risorse necessarie?
1. Come viene distribuita la tua soluzione? → Pensa a `azd deploy` con hook di pre/post-processing!
1. Come puoi ottimizzarla ulteriormente? → Pensa al monitoraggio integrato e alle pipeline di automazione!

**🎯 | ESERCIZIO**: <br/> 
Visita la galleria [Awesome AZD](https://azure.github.io/awesome-azd/) e usa i filtri per esplorare i 250+ template attualmente disponibili. Vedi se riesci a trovare uno che si allinei ai requisiti del _tuo_ scenario.

![Codice](../../../../../translated_images/it/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Template per applicazioni AI

Per le applicazioni alimentate dall'AI, Microsoft fornisce template specializzati che includono **Microsoft Foundry** e **Foundry Agents**. Questi template accelerano il tuo percorso verso la costruzione di applicazioni intelligenti e pronte per la produzione.

### Template Microsoft Foundry & Foundry Agents

Seleziona un template qui sotto da distribuire. Ogni template è disponibile su [Awesome AZD](https://azure.github.io/awesome-azd/) e può essere inizializzato con un singolo comando.

| Modello | Descrizione | Comando di distribuzione |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Applicazione di chat con Retrieval Augmented Generation usando Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Costruisci agenti AI con Foundry Agents per l'esecuzione autonoma di attività | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Coordina più Foundry Agents per flussi di lavoro complessi | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Estrai e analizza documenti con i modelli Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Crea chatbot intelligenti con integrazione Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Genera immagini usando DALL-E tramite Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Agenti AI che utilizzano Semantic Kernel con Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Sistemi multi-agente che utilizzano il framework AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Avvio rapido

1. **Sfoglia i template**: Visita [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) e filtra per `AI`, `Agents`, o `Microsoft Foundry`
2. **Seleziona il tuo template**: Scegline uno che corrisponda al tuo caso d'uso
3. **Inizializza**: Esegui il comando `azd init` per il template scelto
4. **Distribuisci**: Esegui `azd up` per provisionare e distribuire

**🎯 | ESERCIZIO**: <br/>
Seleziona uno dei template sopra in base al tuo scenario:

- **Stai costruendo un chatbot?** → Inizia con **AI Chat with RAG** o **Conversational AI Bot**
- **Hai bisogno di agenti autonomi?** → Prova **Foundry Agent Service Starter** o **Multi-Agent Orchestration**
- **Elaborazione di documenti?** → Usa **AI Document Intelligence**
- **Vuoi assistenza per il coding AI?** → Esplora **Semantic Kernel Agent** o **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Esplora altri template"
    La galleria [Awesome AZD](https://azure.github.io/awesome-azd/) contiene oltre 250 template. Usa i filtri per trovare template che corrispondono ai tuoi requisiti specifici per linguaggio, framework e servizi Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->