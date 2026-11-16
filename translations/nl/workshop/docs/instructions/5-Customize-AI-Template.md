# 5. Pas een sjabloon aan

!!! tip "AAN HET EINDE VAN DEZE MODULE KUN JE"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stel een basislijn vast

Gebruik de geïnitialiseerde repository [Aan de slag met AI-agenten](https://github.com/Azure-Samples/get-started-with-ai-agents) uit de vorige modules. Noteer de template-revisie, AZD-versie, geselecteerde omgeving, model-implementatie en werkende voorbeeldvragen voordat je iets verandert.

De voorbeeldtoepassing implementeert een chatapplicatie ondersteund door een agent. Het wordt **niet** automatisch een retail systeem met twee agenten door alleen omgevingsvariabelen in te stellen of extra instructiebestanden op te slaan. Extra agenten, tool-handlers, routering, autorisatie en gegevens-toegang vereisen applicatiecode.

Bekijk de momenteel geïmplementeerde instructies en tools van de agent in Foundry. Test één feitelijke vraag, één ophaalvraag en één vraag die de voorbeeldgegevens niet kunnen beantwoorden. Verifieer citaties aan de hand van de daadwerkelijke brondocumenten in plaats van aan te nemen dat een vloeiende respons correct is.

## 5.2 Pas kennisopvraging aan

Het sjabloon ondersteunt op bestanden gebaseerde opvraging en optionele Azure AI Search-integratie. Volg de [huidige AI Search-gids](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) voor indexering en toolconfiguratie.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Het inschakelen van de service is slechts een deel van de opvraging. Voordat je je eigen gegevens uploadt:

1. Bevestig dat je toestemming hebt om de documenten te gebruiken en verwijder gevoelige informatie.
2. Selecteer een embeddingmodel dat in jouw regio wordt ondersteund en stel de compatibele versie, implementatietype en vectordimensies in.
3. Maak/de index op met het gedocumenteerde proces van de voorbeeldtoepassing.
4. Configureer de opvragingstool van de agent om die index te gebruiken.
5. Test opvraging, citaties, autorisatie en gedrag wanneer geen relevant document bestaat.

Schakel niet zomaar over van `text-embedding-3-small` naar een ander embeddingmodel zonder dimensies te controleren en vectoren indien nodig te herbouwen/herindexeren. Een naam zoals `retail-products` is geen geïmplementeerde catalogus of toegangscontrolebeleid.

## 5.3 Tracing en monitoring

Volg de [observability-gids van de voorbeeldtoepassing](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Zorg dat de vereiste Application Insights-resource en verbinding al bestaan; gebruik `azd up` bij het wijzigen van infrastructuurinstellingen.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Verstuur een testverzoek en inspecteer vervolgens de applicatielogs van de Container App en het tracing-overzicht van de agent in Foundry. Controleer latency, tool-aanroepen, fouten en correlatie tussen het verzoek en de trace. Ga er niet zomaar van uit dat telemetrie is verbonden alleen omdat de implementatie geslaagd is.

Laat `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` uitgeschakeld tenzij je expliciet toestemming, redactie, bewaartermijn en toegangscontroles hebt beoordeeld. Traces kunnen gevoelige tool-argumenten of documentinhoud bevatten zelfs wanneer gewone applicatielogs onschuldig lijken.

## 5.4 Agentevaluatie

Het evaluatie-entrypoint van de voorbeeldtoepassing is nu [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), niet een `evals/`-map. Gebruik vanaf de root van de voorbeeldtoepassing een Python-omgeving die aan de gedocumenteerde vereisten voldoet:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Voer eerst de [evaluatie-vereisten](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md) uit. De tests laden configuratie uit het geselecteerde `.azure/<environment>/.env`; bevestig dat de bedoelde omgeving is geselecteerd. Belangrijke inputs zijn:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, gebruikmakend van het formaat dat de huidige voorbeeldtoepassing vereist (de beoordeelde versie gebruikt `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, gebruikt als de judge-model implementatie

Bekijk de tests om evaluator-keuze, drempels, vereiste rollen en modelkosten te begrijpen. Een voltooide run is niet automatisch een geslaagde kwaliteitscontrole; inspecteer scores, mislukte/gefoute cases en de gekoppelde Foundry-resultaten.

### Separaat AZD-evaluaties extensie

De bovengenoemde Python-test is een **specifieke workflow voor de voorbeeldtoepassing**. De optionele `azure.ai.evaluations` extensie is een andere workflow met een eigen `evals/azure.eval.yaml`-configuratie:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Voor een volledige extensie-setup, zie [evaluatieworkflows en migratie](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Sinds agents extensie beta.22, gebruik niet de verwijderde `azd ai agent eval`-commando’s. Het installeren van de evaluatie-extensie converteert de Python-tests van de voorbeeldtoepassing niet en maakt ook geen evaluatieconfiguratie automatisch aan.

## 5.5 AI red teaming en continue evaluatie

De huidige voorbeeldtoepassing bevat [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Voltooi de vereisten en bekijk het bedoelde doel en kosten voordat je het uitvoert:

```bash
pytest tests/test_red_teaming.py -s
```

Gebruik een geautoriseerde testimplementatie en synthetische data. Bekijk de gegenereerde aanvallen en resultaten; deze scan toont niet aan dat een applicatie veilig of compliant is.

De [observability-gids](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) beschrijft ook continue evaluatie die bij container-start is geconfigureerd. Het evalueert echte gebruikersinteracties, geen gegenereerd testverkeer, en evaluator-ondersteuning varieert per regio. Geen interacties betekent geen evaluatiegevallen. Controleer de geïnstalleerde voorbeeldversie en evaluatorconfiguratie in plaats van aan te nemen dat elke implementatie dezelfde standaardinstellingen heeft.

Authenticatie is gescheiden van evaluatie. Volg de gedocumenteerde identiteit-/toegangsinstellingen van de voorbeeldtoepassing. Er is geen gedocumenteerde “basic auth fallback” om te vertrouwen op bescherming van een openbaar eindpunt.

## 5.6 Ontwerp-oefening: retailaanpassing

!!! warning "Ontwerp-oefening, geen voltooide implementatie"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Schrijf een kort plan over:

| Gebied | Beslissing en te verzamelen bewijsmateriaal |
|------|-------------------------------------|
| Agent verantwoordelijkheden | Begin met één agent, of motiveer aparte Shopper- en Loyalty-agenten en routeringslogica |
| Gegevens | Definieer een synthetische catalogus/beloningsdataset en eigenaarschap van updates |
| Tools | Implementeer eerst read-only handlers; specificeer autorisatie en validatie voor schrijfbewerkingen |
| Modellen | Kies beschikbare model-/versie-/SKU-combinaties en verifieer quota; vermijd het provisioneren van ongebruikte modellen |
| Opvraging | Definieer indexering, embeddingdimensies, citaties en toegangscontroles op documentniveau |
| Evaluatie | Voeg cases toe voor verwachte antwoorden, niet-ondersteunde vragen, toolgebruik en veiligheidsgevallen met expliciete drempels |
| Operaties | Definieer telemetrie, latency-/foutenbudgetten, kostlimieten en verantwoordelijkheden voor opschoning |

Opslaan van `custom-agents/shopper-agent-instructions.md` zorgt er niet voor dat de voorbeeldtoepassing deze laadt. Zoek de applicatiecode die de agent maakt/bijwerkt, verbind daar je beoordeelde instructies mee en verifieer de resulterende agentversie voordat je test. Instructies kunnen geen toegang verlenen tot gegevens of tools die je niet hebt geïmplementeerd.

Pas één wijziging per keer toe, implementeer de getroffen componenten opnieuw en herhaal je basislijnvragen en evaluaties. Houd een werkende revisie voor vergelijking. Voor architectuursuggesties, zie het [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), dat ook geen complete retailapplicatie is.

!!! quote "AAN HET EINDE VAN DEZE LABO MOET JE HEBBEN"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Ga verder naar [Infrastructuur afbreken](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->