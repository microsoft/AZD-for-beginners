# 1. Selecteer een sjabloon

!!! tip "AAN HET EINDE VAN DEZE MODULE ZULT U IN STAAT ZIJN OM"

    - [ ] Beschrijf wat AZD-sjablonen zijn
    - [ ] Ontdek en gebruik AZD-sjablonen voor AI
    - [ ] Aan de slag met het AI Agents-sjabloon
    - [ ] **Lab 1:** AZD Quickstart met GitHub Codespaces

---

## 1. Een bouwer-analogie

Het bouwen van een moderne, enterprise-klare AI-toepassing _vanaf nul_ kan ontmoedigend zijn. Het is een beetje alsof je je nieuwe huis zelf steen voor steen bouwt. Ja, het kan gedaan worden! Maar het is niet de meest effectieve manier om het gewenste eindresultaat te bereiken!

In plaats daarvan beginnen we vaak met een bestaande _ontwerpblauwdruk_ en werken we met een architect om deze aan te passen aan onze persoonlijke eisen. En dat is precies de aanpak die je moet nemen bij het bouwen van intelligente toepassingen. Zoek eerst een goed ontwerp dat past bij jouw probleemdomein. Werk vervolgens samen met een oplossingsarchitect om de oplossing voor jouw specifieke scenario aan te passen en te ontwikkelen.

Maar waar vinden we deze ontwerpblauwdrukken? En hoe vinden we een architect die bereid is ons te leren hoe we deze blauwdrukken zelf kunnen aanpassen en implementeren? In deze workshop beantwoorden we die vragen door je kennis te laten maken met drie technologieën:

1. [Azure Developer CLI](https://aka.ms/azd) - een open-source tool die het ontwikkeltraject versnelt, van lokale ontwikkeling (build) naar cloud-implementatie (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - gestandaardiseerde open-source repositories met voorbeeldcode, infrastructuur- en configuratiebestanden voor het uitrollen van een AI-oplossingsarchitectuur.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - een codeeragent gebaseerd op Azure-kennis, die ons kan begeleiden bij het navigeren door de codebase en het aanbrengen van wijzigingen - met natuurlijke taal.

Met deze tools kunnen we nu het juiste sjabloon _ontdekken_, het _implementeren_ om te valideren dat het werkt, en het _aanpassen_ om aan onze specifieke scenario's te voldoen. Laten we erin duiken en leren hoe ze werken.


---

## 2. Azure Developer CLI

De [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (of `azd`) is een open-source opdrachtregeltool die je code-naar-cloud traject kan versnellen met een set ontwikkelaarsvriendelijke commando's die consistent werken in je IDE (development) en CI/CD (devops) omgevingen.

Met `azd` kan je deploymenttraject zo simpel zijn als:

- `azd init` - Initialiseert een nieuw AI-project vanaf een bestaand AZD-sjabloon.
- `azd up` - Voorziet in infrastructuur en implementeert je applicatie in één stap.
- `azd monitor` - Krijg realtime monitoring en diagnostiek voor je geïmplementeerde applicatie.
- `azd pipeline config` - Stel CI/CD-pijplijnen in om implementatie naar Azure te automatiseren.

**🎯 | OEFENING**: <br/> Verken de `azd` opdrachtregeltool nu in je GitHub Codespaces-omgeving. Begin door dit commando te typen om te zien wat de tool kan doen:

```bash title="" linenums="0"
azd help
```

![Stroom](../../../../../translated_images/nl/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Het AZD-sjabloon

Om dit mogelijk te maken, moet `azd` weten welke infrastructuur er moet worden voorzien, welke configuratie-instellingen moeten worden afgedwongen en welke applicatie er moet worden uitgerold. Hier komen [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) bij kijken.

AZD-sjablonen zijn open-source repositories die voorbeeldcode combineren met infrastructuur- en configuratiebestanden die nodig zijn voor het uitrollen van de oplossingarchitectuur.
Door een _Infrastructure-as-Code_ (IaC) aanpak te gebruiken, maken ze het mogelijk om sjabloonresource-definities en configuratie-instellingen versiebeheerd te houden (net zoals de app-broncode) - waardoor herbruikbare en consistente workflows ontstaan voor gebruikers van dat project.

Wanneer je een AZD-sjabloon maakt of hergebruikt voor _jouw_ scenario, overweeg dan deze vragen:

1. Wat bouw je? → Is er een sjabloon dat startercode heeft voor dat scenario?
1. Hoe is je oplossing gearchitecteerd? → Is er een sjabloon dat de benodigde resources bevat?
1. Hoe wordt je oplossing uitgerold? → Denk aan `azd deploy` met pre/post-processing hooks!
1. Hoe kun je het verder optimaliseren? → Denk aan ingebouwde monitoring en automatiseringspijplijnen!

**🎯 | OEFENING**: <br/> 
Bezoek de [Awesome AZD](https://azure.github.io/awesome-azd/) galerij en gebruik de filters om de 250+ sjablonen te verkennen die momenteel beschikbaar zijn. Kijk of je er een kunt vinden die aansluit bij _jouw_ scenariovereisten.

![Code](../../../../../translated_images/nl/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI App Templates

Voor AI-gestuurde toepassingen biedt Microsoft gespecialiseerde sjablonen met **Microsoft Foundry** en **Foundry Agents**. Deze sjablonen versnellen je pad naar het bouwen van intelligente, productierijpe applicaties.

### Microsoft Foundry & Foundry Agents Templates

Selecteer hieronder een sjabloon om te implementeren. Elk sjabloon is beschikbaar op [Awesome AZD](https://azure.github.io/awesome-azd/) en kan met één enkel commando worden geïnitialiseerd.

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Chatapplicatie met Retrieval Augmented Generation (RAG) met Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Bouw AI-agents met Foundry Agents voor autonome taakuitvoering | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Coördineer meerdere Foundry Agents voor complexe workflows | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Extraheer en analyseer documenten met Microsoft Foundry-modellen | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Bouw intelligente chatbots met Microsoft Foundry-integratie | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Genereer afbeeldingen met DALL-E via Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI-agents die Semantic Kernel gebruiken met Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Multi-agent systemen met het AutoGen-framework | `azd init -t azure-samples/autogen-multi-agent` |

### Snelle start

1. **Blader door sjablonen**: Bezoek [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) en filter op `AI`, `Agents`, of `Microsoft Foundry`
2. **Selecteer je sjabloon**: Kies er een die past bij je use case
3. **Initialiseer**: Voer het `azd init` commando uit voor je gekozen sjabloon
4. **Implementeer**: Voer `azd up` uit om te voorzien en te implementeren

**🎯 | OEFENING**: <br/>
Selecteer één van de bovenstaande sjablonen op basis van je scenario:

- **Een chatbot bouwen?** → Begin met **AI Chat with RAG** of **Conversational AI Bot**
- **Autonome agents nodig?** → Probeer **Foundry Agent Service Starter** of **Multi-Agent Orchestration**
- **Documenten verwerken?** → Gebruik **AI Document Intelligence**
- **AI-ondersteuning bij coderen willen?** → Verken **Semantic Kernel Agent** of **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Ontdek meer sjablonen"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als gezaghebbende bron worden beschouwd. Voor cruciale informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->