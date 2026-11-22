# 5. Pas een sjabloon aan

!!! tip "AAN HET EINDE VAN DEZE MODULE KUNT U"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stel een basislijn vast

Gebruik de geïnitialiseerde [Aan de slag met AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) repository van de vorige modules. Noteer de sjabloonrevisie, AZD-versie, geselecteerde omgeving, modelimplementatie en werkende voorbeeldvragen voordat u iets wijzigt.

De voorbeeldapplicatie implementeert een chattoepassing ondersteund door een agent. Het wordt **niet** een tweedelige agent retail systeem louter door omgevingsvariabelen in te stellen of extra instructiebestanden op te slaan. Extra agents, tool handlers, routering, autorisatie en gegevensaccess vereisen applicatiecode.

Inspecteer de momenteel geïmplementeerde agent's instructies en tools in Foundry. Test één feitelijke vraag, één zoekvraag en één vraag die de voorbeeldgegevens niet kunnen beantwoorden. Verifieer citaties aan de hand van de daadwerkelijke brondocumenten in plaats van aan te nemen dat een vloeiend antwoord correct is.

## 5.2 Pas kennisopvraging aan

Het sjabloon ondersteunt op bestanden gebaseerde opvraging en optionele Azure AI Search-integratie. Volg de [huidige AI Search gids](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) voor indexering en toolconfiguratie.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Het inschakelen van de service is slechts een onderdeel van de opvraging. Voordat u uw eigen gegevens uploadt:

1. Bevestig dat u toestemming hebt om de documenten te gebruiken en verwijder gevoelige informatie.
2. Selecteer een embed-model dat in uw regio wordt ondersteund en stel de compatibele versie, implementatietype en vectordimensies in.
3. Maak de index aan/vul deze met behulp van het gedocumenteerde proces van de voorbeeldapplicatie.
4. Configureer het opvragingstool van de agent om die index te gebruiken.
5. Test opvraging, citaties, autorisatie en gedrag wanneer er geen relevant document bestaat.

Schakel niet van `text-embedding-3-small` naar een ander embed-model zonder de dimensies te controleren en vectoren indien nodig opnieuw op te bouwen/herindexeren. Een naam zoals `retail-products` is geen geïmplementeerde catalogus of een toegangscontrolebeleid.

## 5.3 Tracing en monitoring

Volg de [observability gids van de voorbeeldapplicatie](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Zorg dat de vereiste Application Insights resource en verbinding al bestaan; gebruik `azd up` bij het wijzigen van infrastructuurinstellingen.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Verstuur een testverzoek, inspecteer daarna de applicatielogs van de Container App en de tracing-weergave van de agent in Foundry. Controleer latentie, toolaanroepen, fouten en correlatie tussen verzoek en trace. Neem niet zomaar aan dat telemetrie is verbonden alleen omdat de implementatie geslaagd is.

Laat `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` uitgeschakeld tenzij u expliciet instemming, redactie, bewaartermijnen en toegangscontroles hebt beoordeeld. Traces kunnen gevoelige toolargumenten of documentinhoud bevatten, zelf wanneer gewone applicatielogs onschuldig lijken.

## 5.4 Agent evaluatie

Het evaluatie-entrypoint van de voorbeeldapplicatie is nu [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), niet een `evals/` map. Gebruik vanaf de root van de voorbeeldapplicatie een Python-omgeving die aan de gedocumenteerde eisen voldoet:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Voltooi vóór het uitvoeren de [evaluatie-vereisten](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). De tests laden configuratie vanaf de geselecteerde `.azure/<environment>/.env`; bevestig dat de bedoelde omgeving is geselecteerd. Belangrijke invoeren zijn:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, in het formaat vereist door de huidige voorbeeldapplicatie (de beoordeelde versie gebruikt `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, gebruikt als de rechter-modelimplementatie

Inspecteer de tests om evaluatorkeuze, drempels, vereiste rollen en modelkosten te begrijpen. Een voltooide run is niet automatisch een geslaagde kwaliteitscontrole; bekijk scores, gefaalde/foutieve gevallen en de gekoppelde Foundry-resultaten.

### Separate AZD evaluaties extensie

De bovenstaande Python-test is een **voorbeeld-specifieke workflow**. De optionele `azure.ai.evaluations` extensie is een andere workflow, met een eigen `evals/azure.eval.yaml` configuratie. Deze wordt apart geïnstalleerd, niet opgenomen in de algemeen beschikbare `microsoft.foundry` 1.0 bundel:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Voor een complete extensie-installatie, zie [evaluatieworkflows en migratie](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Sinds agents extensie beta.22, gebruik niet de verwijderde `azd ai agent eval` commando's. Het installeren van de evaluatie-extensie converteert de Python-tests van de voorbeeldapplicatie niet automatisch of maakt een evaluatieconfiguratie aan.

Voor een aparte **GA hosted-agent oefening**, gebruik een lege map buiten de sample van deze workshop en volg de [Foundry local-to-cloud walkthrough](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Deze gebruikt AZD 1.37.0+, de `microsoft.foundry` bundel, Python 3.13+ en de huidige uv. U inspecteert `azure.yaml`, test lokaal met Agent Inspector, implementeert broncode voor een externe Foundry-build en genereert/beoordeelt een dataset en rubric voordat u `azd ai eval init --name quality` configureert. Vervang de tests van deze sample niet en neem niet aan dat het installeren van de bundel het hostingmodel verandert.

## 5.5 AI red teaming en continue evaluatie

De huidige voorbeeldapplicatie biedt [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Voltooi de vereisten en beoordeel het bedoelde doel en kosten voordat u begint:

```bash
pytest tests/test_red_teaming.py -s
```

Gebruik een geautoriseerde testimplementatie en synthetische gegevens. Bekijk de gegenereerde aanvallen en resultaten; deze scan bewijst niet dat een applicatie veilig of compliant is.

De [observability gids](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) beschrijft ook continue evaluatie die bij het opstarten van de container wordt geconfigureerd. Deze evalueert echte gebruikersinteracties, niet gegenereerd testverkeer, en evaluatorondersteuning varieert per regio. Geen interacties betekent geen evaluatie-items. Controleer de geïnstalleerde sample-versie en evaluatorconfiguratie in plaats van aan te nemen dat elke implementatie dezelfde standaardinstellingen heeft.

Authenticatie is gescheiden van evaluatie. Volg de gedocumenteerde identiteit-/toegangsinstellingen van de sample. Er is geen gedocumenteerde “basic auth fallback” om te vertrouwen voor de bescherming van een openbaar eindpunt.

## 5.6 Ontwerpoefening: retailaanpassing

!!! warning "Ontwerpoefening, geen voltooide implementatie"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Schrijf een kort plan met aandacht voor:

| Gebied | Beslissing en te verzamelen bewijs |
|------|-----------------------------|
| Agentverantwoordelijkheden | Begin met één agent, of rechtvaardig aparte Shopper en Loyalty agents plus routeringslogica |
| Gegevens | Definieer een synthetische catalogus/beloningen dataset en eigendom van updates |
| Tools | Implementeer eerst alleen-lezen handlers; specificeer autorisatie en validatie voor schrijfbewerkingen |
| Modellen | Kies beschikbare model/versie/SKU combinaties en controleer quota; voorkom provisionering van ongebruikte modellen |
| Opvraging | Definieer indexering, embed-dimensies, citaties en documentniveau toegangscontroles |
| Evaluatie | Voeg verwacht-antwoord, niet-ondersteunde-vraag, toolgebruik en veiligheidsgeval toe met expliciete drempels |
| Operaties | Definieer telemetrie, latentie/foutbudgetten, kostengrenzen en eigendom van opruiming |

Het opslaan van `custom-agents/shopper-agent-instructions.md` zorgt er niet voor dat de sample dit laadt. Zoek de applicatiecode die de agent aanmaakt/bijwerkt, verbind uw beoordeelde instructies daar en verifieer de resulterende agentversie voor testen. Instructies kunnen geen toegang verlenen tot data of tools die u niet hebt geïmplementeerd.

Pas één wijziging tegelijk toe, implementeer opnieuw de betrokken componenten, en voer weer uw basisvragen en evaluaties uit. Houd een werkende revisie voor vergelijking. Voor architectuurinspiratie, zie de [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), die ook geen volledige retailapplicatie is.

!!! quote "AAN HET EINDE VAN DIT LAB HEEFT U"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Ga verder met [Infrastructuur afbreken](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->