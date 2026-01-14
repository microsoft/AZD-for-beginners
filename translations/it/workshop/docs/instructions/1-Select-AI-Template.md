<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "06d6207eff634aefcaa41739490a5324",
  "translation_date": "2025-09-24T14:55:34+00:00",
  "source_file": "workshop/docs/instructions/1-Select-AI-Template.md",
  "language_code": "it"
}
-->
# 1. Seleziona un Template

!!! tip "ALLA FINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Descrivere cosa sono i template AZD
    - [ ] Scoprire e utilizzare i template AZD per l'AI
    - [ ] Iniziare con il template AI Agents
    - [ ] **Lab 1:** AZD Quickstart con GitHub Codespaces

---

## 1. Un'Analogia del Costruttore

Costruire un'applicazione AI moderna e pronta per l'impresa _da zero_ può essere scoraggiante. È un po' come costruire la tua nuova casa da solo, mattone dopo mattone. Sì, si può fare! Ma non è il modo più efficace per ottenere il risultato desiderato!

Invece, spesso iniziamo con un _progetto di design_ esistente e lavoriamo con un architetto per personalizzarlo in base alle nostre esigenze personali. Ed è esattamente l'approccio da adottare quando si costruiscono applicazioni intelligenti. Prima, trova un'architettura di design che si adatti al tuo ambito di problema. Poi lavora con un architetto di soluzioni per personalizzare e sviluppare la soluzione per il tuo scenario specifico.

Ma dove possiamo trovare questi progetti di design? E come possiamo trovare un architetto disposto a insegnarci come personalizzare e distribuire questi progetti da soli? In questo workshop, rispondiamo a queste domande introducendoti a tre tecnologie:

1. [Azure Developer CLI](https://aka.ms/azd) - uno strumento open-source che accelera il percorso dello sviluppatore dal sviluppo locale (build) alla distribuzione nel cloud (ship).
1. [Azure AI Foundry Templates](https://ai.azure.com/templates) - repository open-source standardizzati contenenti codice di esempio, file di infrastruttura e configurazione per distribuire un'architettura di soluzione AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - un agente di codifica basato sulla conoscenza di Azure, che può guidarci nella navigazione del codice e apportare modifiche - utilizzando il linguaggio naturale.

Con questi strumenti a disposizione, possiamo ora _scoprire_ il template giusto, _distribuirlo_ per validare che funzioni e _personalizzarlo_ per adattarlo ai nostri scenari specifici. Immergiamoci e impariamo come funzionano.

---

## 2. Azure Developer CLI

L'[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (o `azd`) è uno strumento open-source da riga di comando che può accelerare il tuo percorso dal codice al cloud con una serie di comandi pensati per gli sviluppatori che funzionano in modo coerente tra il tuo ambiente IDE (sviluppo) e CI/CD (devops).

Con `azd`, il tuo percorso di distribuzione può essere semplice come:

- `azd init` - Inizializza un nuovo progetto AI da un template AZD esistente.
- `azd up` - Provisiona l'infrastruttura e distribuisci la tua applicazione in un solo passaggio.
- `azd monitor` - Ottieni monitoraggio e diagnostica in tempo reale per la tua applicazione distribuita.
- `azd pipeline config` - Configura pipeline CI/CD per automatizzare la distribuzione su Azure.

**🎯 | ESERCIZIO**: <br/> Esplora lo strumento da riga di comando `azd` nel tuo ambiente GitHub Codespaces ora. Inizia digitando questo comando per vedere cosa può fare lo strumento:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/azd-flow.19ea67c2f81eaa66.it.png)

---

## 3. Il Template AZD

Per permettere a `azd` di funzionare, deve sapere quale infrastruttura provisionare, quali impostazioni di configurazione applicare e quale applicazione distribuire. È qui che entrano in gioco i [template AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

I template AZD sono repository open-source che combinano codice di esempio con file di infrastruttura e configurazione necessari per distribuire l'architettura della soluzione.
Utilizzando un approccio _Infrastructure-as-Code_ (IaC), permettono che le definizioni delle risorse del template e le impostazioni di configurazione siano versionate (proprio come il codice sorgente dell'app) - creando flussi di lavoro riutilizzabili e coerenti tra gli utenti di quel progetto.

Quando crei o riutilizzi un template AZD per il _tuo_ scenario, considera queste domande:

1. Cosa stai costruendo? → Esiste un template che ha codice iniziale per quello scenario?
1. Come è architettata la tua soluzione? → Esiste un template che ha le risorse necessarie?
1. Come viene distribuita la tua soluzione? → Pensa a `azd deploy` con hook di pre/post-elaborazione!
1. Come puoi ottimizzarla ulteriormente? → Pensa a monitoraggio integrato e pipeline di automazione!

**🎯 | ESERCIZIO**: <br/> 
Visita la galleria [Awesome AZD](https://azure.github.io/awesome-azd/) e usa i filtri per esplorare i 250+ template attualmente disponibili. Vedi se riesci a trovarne uno che si allinea ai requisiti del _tuo_ scenario.

![Code](../../../../../translated_images/azd-code-to-cloud.2d9503d69d3400da.it.png)

---

## 4. Template per App AI

---

