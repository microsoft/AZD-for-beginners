# 1. Velg en mal

!!! tip "PÅ SLUTTEN AV DETTE MODULET VIL DU KUNNE"

    - [ ] Beskrive hva AZD-maler er
    - [ ] Oppdage og bruke AZD-maler for AI
    - [ ] Komme i gang med AI Agents-malen
    - [ ] **Lab 1:** AZD Hurtigstart i Codespaces eller en utviklingscontainer

---

## 1. En byggeanalog

Å bygge en moderne, virksomhetsklar AI-applikasjon _fra bunnen av_ kan være skremmende. Det er litt som å bygge ditt nye hjem alene, murstein for murstein. Ja, det kan gjøres! Men det er ikke den mest effektive måten å oppnå ønsket sluttresultat på!

I stedet begynner vi ofte med en eksisterende _designplan_, og jobber med en arkitekt for å tilpasse den etter våre personlige krav. Og det er akkurat den tilnærmingen man bør ta når man bygger intelligente applikasjoner. Først finner du en god designarkitektur som passer til ditt problemrom. Så jobber du med en løsningsarkitekt for å tilpasse og utvikle løsningen for ditt spesifikke scenario.

Men hvor kan vi finne disse designplanene? Og hvordan finner vi en arkitekt som er villig til å lære oss hvordan vi kan tilpasse og distribuere disse planene på egen hånd? I denne workshopen svarer vi på disse spørsmålene ved å introdusere deg for tre teknologier:

1. [Azure Developer CLI](https://aka.ms/azd) – et åpen kildekode-verktøy som akselererer utviklerreisen fra lokal utvikling (bygging) til skydistribusjon (levering).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) – standardiserte åpen kildekode-repositorier som inneholder eksempel-kode, infrastruktur og konfigurasjonsfiler for distribusjon av en AI-løsningsarkitektur.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) – en kodingagent basert på Azure-kunnskap, som kan veilede oss i å navigere i kodebasen og gjøre endringer – ved bruk av naturlig språk.

Med disse verktøyene i hånd kan vi nå _oppdage_ riktig mal, _distribuere_ den for å validere at den fungerer, og _tilpasse_ den til å passe våre spesifikke scenarier. La oss dykke inn og lære hvordan disse fungerer.


---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (eller `azd`) er et åpen kildekode-kommandoverktøy som kan akselerere reisen fra kode til sky med et sett utviklervennlige kommandoer som fungerer konsekvent på tvers av ditt IDE (utvikling) og CI/CD (devops) miljøer.

Med `azd` kan distribusjonsreisen være så enkel som:

- `azd init` – Initialiserer et nytt AI-prosjekt fra en eksisterende AZD-mal.
- `azd up` – Legger til infrastruktur og distribuerer applikasjonen din i ett steg.
- `azd monitor` – Få sanntids overvåking og diagnostikk for din distribuerte applikasjon.
- `azd pipeline config` – Sett opp CI/CD-pipelines for å automatisere distribusjon til Azure.

**🎯 | ØVELSE**: <br/> Utforsk `azd`-kommandoverktøyet i ditt nåværende workshop-miljø nå. Dette kan være GitHub Codespaces, en utviklingscontainer, eller en lokal klone med nødvendige forutsetninger installert. Start med å skrive denne kommandoen for å se hva verktøyet kan gjøre:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/no/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD-malen

For at `azd` skal få dette til, må den vite hvilken infrastruktur som skal legges til, hvilke konfigurasjonsinnstillinger som skal håndheves, og hvilken applikasjon som skal distribueres. Dette er hvor [AZD-maler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) kommer inn.

AZD-maler er åpen kildekode-repositorier som kombinerer eksempel-kode med infrastruktur- og konfigurasjonsfiler som kreves for å distribuere løsningsarkitekturen.
Ved å bruke en _Infrastructure-as-Code_ (IaC) tilnærming, tillater de at malens ressursdefinisjoner og konfigurasjonsinnstillinger er versjonskontrollert (akkurat som appens kildekode) – og skaper gjenbrukbare og konsistente arbeidsflyter på tvers av brukere av det prosjektet.

Når du lager eller gjenbruker en AZD-mal for _ditt_ scenario, bør du vurdere disse spørsmålene:

1. Hva bygger du? → Finnes det en mal som har startkode for det scenarioet?
1. Hvordan er løsningen din arkitektert? → Finnes det en mal som har nødvendige ressurser?
1. Hvordan distribueres løsningen din? → Tenk `azd deploy` med forhånds- og etterskript!
1. Hvordan kan du optimalisere den videre? → Tenk innebygd overvåking og automatiseringspipeliner!

**🎯 | ØVELSE**: <br/> 
Besøk [Awesome AZD](https://azure.github.io/awesome-azd/) galleriet og bruk filterne for å utforske de 250+ malene som er tilgjengelige nå. Se om du kan finne en som passer til _dine_ scenario-krav.

![Code](../../../../../translated_images/no/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI App-maler

For AI-drevne applikasjoner tilbyr Microsoft spesialiserte maler med **Microsoft Foundry** og **Foundry Agents**. Disse malene akselererer din vei til å bygge intelligente, produksjonsklare applikasjoner.

### Microsoft Foundry & Foundry Agents-maler

Velg en mal nedenfor for distribusjon. Hver mal er tilgjengelig på [Awesome AZD](https://azure.github.io/awesome-azd/) og kan initieres med én enkelt kommando.

| Mal | Beskrivelse | Distribusjonskommando |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Chat-applikasjon med Retrieval Augmented Generation ved bruk av Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Bygg AI-agenter med Foundry Agents for autonom oppgaveutførelse | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordiner flere Foundry Agents for komplekse arbeidsflyter | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Ekstraher og analyser dokumenter med Microsoft Foundry-modeller | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Bygg intelligente chatboter med Microsoft Foundry-integrasjon | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Generer bilder ved bruk av DALL-E via Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI-agenter med Semantic Kernel og Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Multi-agent systemer ved bruk av AutoGen-rammeverk | `azd init -t azure-samples/autogen-multi-agent` |

### Hurtigstart

1. **Bla gjennom maler**: Besøk [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) og filtrer på `AI`, `Agents` eller `Microsoft Foundry`
2. **Velg din mal**: Velg en som matcher brukstilfellet ditt
3. **Initialiser**: Kjør `azd init` kommandoen for din valgte mal
4. **Distribuer**: Kjør `azd up` for å provisionere og distribuere

**🎯 | ØVELSE**: <br/>
Velg en av malene over basert på ditt scenario:

- **Bygger du en chatbot?** → Start med **AI Chat with RAG** eller **Conversational AI Bot**
- **Trenger autonome agenter?** → Prøv **Foundry Agent Service Starter** eller **Multi-Agent Orchestration**
- **Behandler dokumenter?** → Bruk **AI Document Intelligence**
- **Vil ha AI-kodeassistanse?** → Utforsk **Semantic Kernel Agent** eller **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Utforsk flere maler"
    [Awesome AZD-galleriet](https://azure.github.io/awesome-azd/) inneholder 250+ maler. Bruk filtrene for å finne maler som matcher dine spesifikke krav til språk, rammeverk og Azure-tjenester.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalsproget bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår fra bruken av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->