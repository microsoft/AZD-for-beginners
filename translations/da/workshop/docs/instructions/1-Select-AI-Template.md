# 1. Vælg en skabelon

!!! tip "VED SLUTNINGEN AF DETTE MODUL VIL DU KUNNE"

    - [ ] Beskrive hvad AZD-skabeloner er
    - [ ] Opdage og bruge AZD-skabeloner til AI
    - [ ] Kom godt i gang med AI Agents-skabelonen
    - [ ] **Laboratorium 1:** AZD Quickstart i Codespaces eller en udviklercontainer

---

## 1. En bygningsanalog

At bygge en moderne, enterprise-klar AI-applikation _fra bunden_ kan være overvældende. Det er lidt ligesom at bygge dit nye hjem selv, mursten for mursten. Ja, det kan lade sig gøre! Men det er ikke den mest effektive måde at nå det ønskede slutresultat på!

I stedet starter vi ofte med et eksisterende _designblåttryk_, og arbejder sammen med en arkitekt for at tilpasse det til vores personlige krav. Og det er præcis den tilgang, man bør tage, når man bygger intelligente applikationer. Først skal du finde en god designarkitektur, der passer til dit problemområde. Derefter arbejder du med en løsningsarkitekt for at tilpasse og udvikle løsningen til dit specifikke scenarie.

Men hvor kan vi finde disse designblåttryk? Og hvordan finder vi en arkitekt, der er villig til at lære os, hvordan vi tilpasser og deployer disse blåttryk på egen hånd? I denne workshop besvarer vi disse spørgsmål ved at introducere dig for tre teknologier:

1. [Azure Developer CLI](https://aka.ms/azd) - et open-source værktøj, der accelererer udviklerens vej fra lokal udvikling (build) til cloud-deployment (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - standardiserede open-source repositories, der indeholder eksempelkode, infrastruktur og konfigurationsfiler til at deploye en AI-løsningsarkitektur.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - en kodeagent forankret i Azure-viden, som kan guide os i at navigere i kodebasen og foretage ændringer - ved brug af naturligt sprog.

Med disse værktøjer i hånden kan vi nu _opdage_ den rigtige skabelon, _deploye_ den for at validere, at den virker, og _tilpasse_ den, så den passer til vores specifikke scenarier. Lad os dykke ned og lære, hvordan de fungerer.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) er et open-source kommandolinjeværktøj, der kan fremskynde din kode-til-cloud rejse med et sæt udviklervenlige kommandoer, som fungerer konsekvent på tværs af dit IDE (udvikling) og CI/CD (devops) miljøer.

Med `azd` kan din deploy-rejse være så enkel som:

- `azd init` - Initialiserer et nyt AI-projekt fra en eksisterende AZD-skabelon.
- `azd up` - Provisionerer infrastruktur og deployer din applikation i ét trin.
- `azd monitor` - Få realtidsmonitorering og diagnostik for din deployede applikation.
- `azd pipeline config` - Opsæt CI/CD-pipelines til at automatisere deployment til Azure.

**🎯 | ØVELSE**: <br/> Udforsk `azd` kommandolinjeværktøjet i dit nuværende workshop-miljø nu. Dette kan være GitHub Codespaces, en udviklercontainer eller en lokal klon med de nødvendige forudsætninger installeret. Start med at skrive denne kommando for at se, hvad værktøjet kan gøre:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/da/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD-skabelonen

For at `azd` kan opnå dette, skal det vide, hvilken infrastruktur der skal provisioneres, hvilke konfigurationsindstillinger der skal håndhæves, og hvilken applikation der skal deployes. Her kommer [AZD-skabeloner](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) ind i billedet. 

AZD-skabeloner er open-source repositories, der kombinerer eksempelkode med infrastruktur- og konfigurationsfiler, som kræves for at deploye løsningsarkitekturen.
Ved at bruge en _Infrastructure-as-Code_ (IaC) tilgang tillader de, at skabelonens ressource-definitioner og konfigurationsindstillinger bliver versionsstyret (ligesom appkildekoden) - hvilket skaber genanvendelige og konsistente workflows på tværs af brugere af projektet.

Når du opretter eller genbruger en AZD-skabelon til _dit_ scenarie, overvej disse spørgsmål:

1. Hvad bygger du? → Findes der en skabelon, der har startkode til det scenarie?
1. Hvordan er din løsning arkitekteret? → Findes der en skabelon, der har de nødvendige ressourcer?
1. Hvordan deployes din løsning? → Tænk `azd deploy` med pre/post-processing hooks!
1. Hvordan kan du optimere den yderligere? → Tænk indbygget monitorering og automatiseringspipelines!

**🎯 | ØVELSE**: <br/> 
Besøg [Awesome AZD](https://azure.github.io/awesome-azd/) galleriet og brug filtrene til at udforske de 250+ skabeloner, der i øjeblikket er tilgængelige. Se om du kan finde en, der matcher _dine_ scenariekrav.

![Kode](../../../../../translated_images/da/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI-appskabeloner

For AI-drevne applikationer tilbyder Microsoft specialiserede skabeloner med **Microsoft Foundry** og **Foundry Agents**. Disse skabeloner fremskynder din vej til at bygge intelligente, produktionsklare applikationer.

### Microsoft Foundry & Foundry Agents-skabeloner

Vælg en skabelon nedenfor for at deploye. Hver skabelon er tilgængelig på [Awesome AZD](https://azure.github.io/awesome-azd/) og kan initialiseres med en enkelt kommando.

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Chat-applikation med Retrieval Augmented Generation ved brug af Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Byg AI-agenter med Foundry Agents til autonom opgaveudførelse | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordinér flere Foundry Agents til komplekse workflows | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Uddrag og analyser dokumenter med Microsoft Foundry-modeller | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Byg intelligente chatbots med Microsoft Foundry-integration | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Generér billeder ved hjælp af DALL-E via Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI-agenter ved brug af Semantic Kernel med Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Multi-agent systemer ved brug af AutoGen-rammeværket | `azd init -t azure-samples/autogen-multi-agent` |

### Hurtig start

1. **Gennemse skabeloner**: Besøg [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) og filtrer efter `AI`, `Agents` eller `Microsoft Foundry`
2. **Vælg din skabelon**: Vælg en, der matcher dit brugstilfælde
3. **Initialiser**: Kør `azd init`-kommandoen for din valgte skabelon
4. **Deploy**: Kør `azd up` for at provisionere og deploye

**🎯 | ØVELSE**: <br/>
Vælg en af skabelonerne ovenfor baseret på dit scenarie:

- **Bygger du en chatbot?** → Start med **AI Chat with RAG** eller **Conversational AI Bot**
- **Har du brug for autonome agenter?** → Prøv **Foundry Agent Service Starter** eller **Multi-Agent Orchestration**
- **Behandler du dokumenter?** → Brug **AI Document Intelligence**
- **Vil du have AI-kodeassistance?** → Udforsk **Semantic Kernel Agent** eller **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Udforsk flere skabeloner"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) indeholder 250+ skabeloner. Brug filtrene til at finde skabeloner, der matcher dine specifikke krav til sprog, framework og Azure-tjenester.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets originale sprog bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->