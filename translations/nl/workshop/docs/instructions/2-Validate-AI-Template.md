# 2. Valideer een sjabloon

!!! tip "AAN HET EINDE VAN DEZE MODULE ZULT U IN STAAT ZIJN OM"

    - [ ] Analyseer de AI-oplossingsarchitectuur
    - [ ] Begrijp de AZD-implementatieworkflow
    - [ ] Gebruik GitHub Copilot om hulp te krijgen bij het gebruik van AZD
    - [ ] **Lab 2:** Implementeer en valideer de AI Agents-sjabloon

---


## 1. Inleiding

De [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) of `azd` is een open-source opdrachtregeltool die de ontwikkelaarsworkflow stroomlijnt bij het bouwen en implementeren van applicaties naar Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) zijn gestandaardiseerde repositories die voorbeeldapplicatiecode, _infrastructure-as-code_-assets en `azd` configuratiebestanden bevatten voor een samenhangende oplossingsarchitectuur. Het provisionen van de infrastructuur wordt zo eenvoudig als een `azd provision`-opdracht - terwijl `azd up` je in staat stelt om infrastructuur te provisionen **en** je applicatie in één keer te implementeren!

Als gevolg hiervan kan het op gang brengen van je applicatieontwikkelingsproces zo eenvoudig zijn als het vinden van het juiste _AZD Starter template_ dat het beste aansluit bij je applicatie- en infrastructuurbehoeften - en vervolgens de repository aanpassen zodat deze voldoet aan je scenariovereisten.

Voordat we beginnen, laten we ervoor zorgen dat je de Azure Developer CLI hebt geïnstalleerd.

1. Open een VS Code-terminal en typ dit commando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Je zou iets dergelijks moeten zien!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Je bent nu klaar om een sjabloon te selecteren en te implementeren met azd**

---

## 2. Sjabloonselectie

Het Microsoft Foundry-platform wordt geleverd met een [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) die populaire oplossingsscenario's bestrijken zoals _multi-agent workflow automation_ en _multi-modal content processing_. Je kunt deze sjablonen ook ontdekken door het Microsoft Foundry-portaal te bezoeken.

1. Bezoek [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log in op het Microsoft Foundry-portaal wanneer daarom wordt gevraagd - je ziet iets als dit.

![Kies](../../../../../translated_images/nl/01-pick-template.60d2d5fff5ebc374.webp)


De **Basic**-opties zijn je starter-sjablonen:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) die een basis chatapplicatie _met jouw gegevens_ naar Azure Container Apps implementeert. Gebruik dit om een basis AI-chatbotscenario te verkennen.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) die ook een standaard AI Agent (met de Foundry Agents) implementeert. Gebruik dit om vertrouwd te raken met agentische AI-oplossingen die tools en modellen gebruiken.

Bezoek de tweede link in een nieuw browsertabblad (of klik `Open in GitHub` voor de betreffende kaart). Je zou de repository voor deze AZD-sjabloon moeten zien. Neem even de tijd om de README te verkennen. De applicatiearchitectuur ziet er zo uit:

![Architectuur](../../../../../translated_images/nl/architecture.8cec470ec15c65c7.webp)

---

## 3. Activering van het sjabloon

Laten we proberen dit sjabloon te implementeren en ervoor zorgen dat het geldig is. We volgen de richtlijnen in de [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) sectie.

1. Klik op [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - bevestig de standaardactie om `Create codespace` te kiezen
1. Dit opent een nieuw browsertabblad - wacht tot de GitHub Codespaces-sessie volledig is geladen
1. Open de VS Code-terminal in Codespaces - typ het volgende commando:

   ```bash title="" linenums="0"
   azd up
   ```

Voltooi de workflowstappen die hierdoor worden geactiveerd:

1. Je krijgt een verzoek om in te loggen bij Azure - volg de instructies om te authenticeren
1. Voer een unieke omgevingsnaam voor jezelf in - bijvoorbeeld gebruikte ik `nitya-mshack-azd`
1. Dit maakt een `.azure/` map aan - je ziet een submap met de omgevingsnaam
1. Je wordt gevraagd een abonnementsnaam te selecteren - kies de standaardwaarde
1. Je wordt gevraagd om een locatie - gebruik `East US 2`

Wacht nu tot de provisioning is voltooid. **Dit duurt 10-15 minuten**

1. Wanneer het klaar is, toont je console een SUCCES-bericht zoals dit:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Je Azure Portal heeft nu een geprovisioneerde resourcegroep met die omgevingsnaam:

      ![Geprovisioneerde infra](../../../../../translated_images/nl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Je bent nu klaar om de geïmplementeerde infrastructuur en applicatie te valideren**.

---

## 4. Sjabloonvalidatie

1. Bezoek de Azure Portal [Resourcegroepen](https://portal.azure.com/#browse/resourcegroups) pagina - log in wanneer daarom wordt gevraagd
1. Klik op de RG voor je omgevingsnaam - je ziet de bovenstaande pagina

      - klik op de Azure Container Apps-resource
      - klik op de Application Url in de _Essentials_ sectie (rechtsboven)

1. Je zou een gehoste front-end van de applicatie zoals deze moeten zien:

   ![Applicatie](../../../../../translated_images/nl/03-test-application.471910da12c3038e.webp)

1. Probeer een paar [voorbeeldvragen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) te stellen

      1. Ask: ```What is the capital of France?``` 
      1. Ask: ```What's the best tent under $200 for two people, and what features does it include?```

1. Je zou antwoorden moeten krijgen die lijken op wat hieronder wordt weergegeven. _Maar hoe werkt dit?_ 

      ![Voorbeeldvraag](../../../../../translated_images/nl/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agentvalidatie

De Azure Container App implementeert een endpoint dat verbinding maakt met de AI Agent die is geprovisioneerd in het Microsoft Foundry-project voor dit sjabloon. Laten we eens kijken wat dat betekent.

1. Ga terug naar de Azure Portal _Overview_-pagina voor je resourcegroep

1. Klik op de `Microsoft Foundry`-resource in die lijst

1. Je zou dit moeten zien. Klik op de knop `Go to Microsoft Foundry Portal`. 
   ![Foundry-portal](../../../../../translated_images/nl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Je zou de Foundry Project-pagina voor je AI-applicatie moeten zien
   ![Projectpagina](../../../../../translated_images/nl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik op `Agents` - je ziet de standaard Agent die in je project is geprovisioneerd
   ![Agents](../../../../../translated_images/nl/06-visit-agents.bccb263f77b00a09.webp)

1. Selecteer deze - je ziet de Agent-details. Merk het volgende op:

      - De agent gebruikt standaard File Search (altijd)
      - De agent `Knowledge` geeft aan dat er 32 bestanden zijn geüpload (voor file search)
      ![Agent-details](../../../../../translated_images/nl/07-view-agent-details.0e049f37f61eae62.webp)

1. Zoek naar de `Data+indexes` optie in het linkermenu en klik voor details. 

      - Je zou de 32 data bestanden moeten zien die voor kennis zijn geüpload.
      - Deze komen overeen met de 12 klantbestanden en 20 productbestanden onder `src/files` 
      ![Data-indexes](../../../../../translated_images/nl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Je hebt de werking van de Agent gevalideerd!** 

1. De antwoorden van de agent zijn gebaseerd op de kennis in die bestanden. 
1. Je kunt nu vragen stellen die betrekking hebben op die gegevens en gegronde antwoorden krijgen.
1. Voorbeeld: `customer_info_10.json` beschrijft de 3 aankopen gedaan door "Amanda Perez"

Ga terug naar het browsertabblad met het Container App-endpoint en stel: `What products does Amanda Perez own?`. Je zou iets als dit moeten zien:

![Vraag-in-ACA](../../../../../translated_images/nl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Laten we wat meer inzicht krijgen in de mogelijkheden van Microsoft Foundry door de Agent uit te proberen in de Agents Playground. 

1. Ga terug naar de `Agents`-pagina in Microsoft Foundry - selecteer de standaardagent
1. Klik op de optie `Try in Playground` - je zou een Playground-UI zoals deze moeten krijgen
1. Stel dezelfde vraag: `What products does Amanda Perez own?`

    ![Vraag-in-Playground](../../../../../translated_images/nl/09-ask-in-playground.a1b93794f78fa676.webp)

Je krijgt hetzelfde (of een vergelijkbaar) antwoord - maar je krijgt ook aanvullende informatie die je kunt gebruiken om de kwaliteit, kosten en prestaties van je agentische app te begrijpen. Bijvoorbeeld:

1. Let op dat het antwoord data-bestanden vermeldt die zijn gebruikt om het antwoord te 'gronden'
1. Zweef met de muis over een van deze bestandslabels - komt de data overeen met je vraag en het weergegeven antwoord?

Je ziet ook een _stats_-rij onder het antwoord. 

1. Zweef over een metriek - bijv. Safety. Je ziet iets zoals dit
1. Komt de beoordeelde rating overeen met je intuïtie over het veiligheidsniveau van het antwoord?

      ![Run-info-meter](../../../../../translated_images/nl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Ingebouwde observeerbaarheid

Observeerbaarheid gaat over het instrumenteren van je applicatie om gegevens te genereren die kunnen worden gebruikt om de werking te begrijpen, debuggen en optimaliseren. Om hier een gevoel bij te krijgen:

1. Klik op de `View Run Info` knop - je zou deze weergave moeten zien. Dit is een voorbeeld van [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in actie. _Je kunt deze weergave ook krijgen door Thread Logs in het top-level menu te klikken_.

   - Krijg een idee van de uitgevoerde stappen en de tools die door de agent worden gebruikt
   - Begrijp het totale aantal tokens (vs. gebruikte outputtokens) voor het antwoord
   - Begrijp de latentie en waar tijd wordt besteed tijdens de uitvoering

      ![Agent-run-info](../../../../../translated_images/nl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik op het tabblad `Metadata` om aanvullende attributen voor de run te zien, die nuttige context kunnen bieden voor het debuggen van problemen later.   

      ![Run-metadata](../../../../../translated_images/nl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik op het tabblad `Evaluations` om automatische beoordelingen van het agentantwoord te zien. Deze omvatten veiligheidsbeoordelingen (bijv. Self-harm) en agent-specifieke beoordelingen (bijv. Intent resolution, Task adherence).

      ![Evaluaties-run](../../../../../translated_images/nl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Last but not least, klik op het tabblad `Monitoring` in het zijmenu.

      - Selecteer het tabblad `Resource usage` op de weergegeven pagina - en bekijk de metrics.
      - Volg het applicatiegebruik in termen van kosten (tokens) en belasting (verzoeken).
      - Volg de applicatie-latentie tot de eerste byte (invoer verwerking) en laatste byte (uitvoer).

      ![Monitoring-resources](../../../../../translated_images/nl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Omgevingsvariabelen

Tot nu toe hebben we de implementatie in de browser doorlopen - en gevalideerd dat onze infrastructuur is geprovisioneerd en de applicatie operationeel is. Maar om met de applicatie _code-first_ te werken, moeten we onze lokale ontwikkelomgeving configureren met de relevante variabelen die nodig zijn om met deze resources te werken. Met `azd` gaat dat eenvoudig.

1. De Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) om configuratie-instellingen voor de applicatie-implementaties op te slaan en te beheren.

1. Omgevingsvariabelen worden opgeslagen in `.azure/<env-name>/.env` - dit scope't ze naar de `env-name` omgeving die tijdens de implementatie is gebruikt en helpt je om omgevingen te isoleren tussen verschillende implementatiedoelen in dezelfde repo.

1. Omgevingsvariabelen worden automatisch geladen door het `azd`-commando wanneer het een specifiek commando uitvoert (bijv. `azd up`). Merk op dat `azd` niet automatisch _OS-level_ omgevingsvariabelen leest (bijv. ingesteld in de shell) - gebruik in plaats daarvan `azd set env` en `azd get env` om informatie binnen scripts over te dragen.


Laten we een paar commando's uitproberen:

1. Haal alle omgevingsvariabelen op die voor `azd` zijn ingesteld in deze omgeving:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Je ziet iets als:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Haal een specifieke waarde op - bijv. ik wil weten of we de waarde `AZURE_AI_AGENT_MODEL_NAME` hebben ingesteld

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Je ziet zoiets - het was niet standaard ingesteld!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Stel een nieuwe omgevingsvariabele in voor `azd`. Hier werken we de agent modelnaam bij. _Opmerking: eventuele wijzigingen worden onmiddellijk weerspiegeld in het `.azure/<env-name>/.env` bestand.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nu zouden we moeten zien dat de waarde is ingesteld:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Merk op dat sommige resources persistent zijn (bijv. modelimplementaties) en meer vereisen dan alleen een `azd up` om de herimplementatie af te dwingen. Laten we proberen de oorspronkelijke implementatie af te breken en opnieuw te implementeren met gewijzigde omgevingsvariabelen.

1. **Vernieuwen** Als je eerder infrastructuur hebt uitgerold met een azd-sjabloon - je kunt de staat van je lokale omgevingsvariabelen _verversen_ op basis van de huidige staat van je Azure-implementatie met dit commando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Dit is een krachtige manier om omgevingsvariabelen te _synchroniseren_ tussen twee of meer lokale ontwikkelomgevingen (bijv. team met meerdere ontwikkelaars) - waardoor de uitgerolde infrastructuur als de ultieme waarheid voor de status van omgevingsvariabelen dient. Teamleden hoeven alleen de variabelen te _verversen_ om weer synchroon te raken.

---

## 9. Gefeliciteerd 🏆

Je hebt zojuist een end-to-end-workflow voltooid waarin je:

- [X] Geselecteerd het AZD Template dat je wilt gebruiken
- [X] Het Template gestart met GitHub Codespaces 
- [X] Het Template ingezet en gevalideerd dat het werkt

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, verzoeken we u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onjuistheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor cruciale informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->