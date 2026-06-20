# 2. Validate a Template

> Gevalideerd tegen `azd 1.25.6` in juni 2026.

!!! tip "AAN HET EINDE VAN DEZE MODULE ZULT U IN STAAT ZIJN OM"

    - [ ] Analyseer de AI Solution Architecture
    - [ ] Begrijp de AZD Deployment Workflow
    - [ ] Gebruik GitHub Copilot om hulp te krijgen bij het gebruik van AZD
    - [ ] **Lab 2:** Deploy & Valideer de AI Agents template

---


## 1. Introduction

De [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) of `azd` is een open-source commandoregeltool die de ontwikkelaarworkflow vereenvoudigt bij het bouwen en implementeren van applicaties naar Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) zijn gestandaardiseerde repositories die voorbeeldapplicatiecode, _infrastructure-as-code_ resources en `azd` configuratiebestanden bevatten voor een samenhangende oplossingarchitectuur. Het provisioneren van de infrastructuur wordt zo eenvoudig als een `azd provision`-commando - terwijl `azd up` je in staat stelt om infrastructuur te provisionen **en** je applicatie in één keer te deployen!

Als gevolg daarvan kan het opstarten van je applicatieontwikkelingsproces zo eenvoudig zijn als het vinden van het juiste _AZD Starter template_ dat het dichtst in de buurt komt van je applicatie- en infrastructuurbehoeften - en vervolgens de repository aanpassen om aan je scenariovereisten te voldoen.

Voordat we beginnen, laten we ervoor zorgen dat je de Azure Developer CLI hebt geïnstalleerd.

1. Open een VS Code-terminal en typ dit commando:

      ```bash title="" linenums="0"
      azd version
      ```

1. U zou zoiets moeten zien!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Je bent nu klaar om een template te selecteren en te deployen met azd**

---

## 2. Template Selection

Het Microsoft Foundry-platform wordt geleverd met een [set aanbevolen AZD-templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) die populaire oplossingsscenario's dekken zoals _multi-agent workflow automatisering_ en _multi-modale inhoudsverwerking_. Je kunt deze templates ook ontdekken door het Microsoft Foundry-portaal te bezoeken.

1. Bezoek [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log in op het Microsoft Foundry-portaal wanneer daarom wordt gevraagd - je ziet zoiets.

![Kies](../../../../../translated_images/nl/01-pick-template.60d2d5fff5ebc374.webp)


De **Basic** opties zijn je starter-sjablonen:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) die een basis chatapplicatie implementeert _met je data_ naar Azure Container Apps. Gebruik dit om een basis AI-chatbotscenario te verkennen.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) die ook een standaard AI Agent (met de Foundry Agents) implementeert. Gebruik dit om vertrouwd te raken met agentische AI-oplossingen die tools en modellen omvatten.

Bezoek de tweede link in een nieuw browsertabblad (of klik `Open in GitHub` voor de gerelateerde kaart). Je zou de repository voor dit AZD Template moeten zien. Neem een minuut om de README te verkennen. De applicatiearchitectuur ziet er als volgt uit:

![Architectuur](../../../../../translated_images/nl/architecture.8cec470ec15c65c7.webp)

---

## 3. Template Activation

Laten we proberen dit sjabloon te deployen en ervoor zorgen dat het geldig is. We volgen de richtlijnen in de [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) sectie.

1. Kies een werkomgeving voor de template-repository:

      - **GitHub Codespaces**: Klik [deze link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) en bevestig `Create codespace`
      - **Lokale clone of dev container**: Clone `Azure-Samples/get-started-with-ai-agents` en open het in VS Code

1. Wacht totdat de VS Code-terminal klaar is, typ dan het volgende commando:

   ```bash title="" linenums="0"
   azd up
   ```

Voltooi de workflowstappen die dit zal triggeren:

1. Je wordt gevraagd om in te loggen bij Azure - volg de instructies om te authenticeren
1. Voer een unieke omgevingnaam voor jezelf in - bijv., ik gebruikte `nitya-mshack-azd`
1. Dit zal een `.azure/` map aanmaken - je ziet een submap met de env-naam
1. Je wordt gevraagd een abonnementsnaam te selecteren - selecteer de standaard
1. Je wordt gevraagd om een locatie - gebruik `East US 2`

Wacht nu tot het provisioneren voltooid is. **Dit duurt 10-15 minuten**

1. Als het klaar is, toont je console een SUCCES-melding zoals deze:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Je Azure Portal zal nu een geprovisioneerde resource group hebben met die env-naam:

      ![Infra](../../../../../translated_images/nl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Je bent nu klaar om de gedeployde infrastructuur en applicatie te valideren**.

---

## 4. Template Validation

1. Bezoek de Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) pagina - log in wanneer daarom wordt gevraagd
1. Klik op de RG voor je omgevingsnaam - je ziet de pagina hierboven

      - klik op de Azure Container Apps-resource
      - klik op de Application Url in de _Essentials_ sectie (rechtsboven)

1. Je zou een gehoste applicatie front-end UI moeten zien zoals deze:

   ![App](../../../../../translated_images/nl/03-test-application.471910da12c3038e.webp)

1. Probeer een paar [voorbeeldvragen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Vraag: ```What is the capital of France?``` 
      1. Vraag: ```What's the best tent under $200 for two people, and what features does it include?```

1. Je zou antwoorden moeten krijgen die vergelijkbaar zijn met wat hieronder wordt getoond. _Maar hoe werkt dit?_

      ![App](../../../../../translated_images/nl/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agent Validation

De Azure Container App implementeert een endpoint dat verbinding maakt met de AI Agent die is geprovisioneerd in het Microsoft Foundry-project voor dit sjabloon. Laten we eens kijken wat dat betekent.

1. Keer terug naar de Azure Portal _Overview_ pagina voor je resource group

1. Klik op de `Microsoft Foundry` resource in die lijst

1. Je zou dit moeten zien. Klik op de knop `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/nl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Je zou de Foundry Project-pagina voor je AI-applicatie moeten zien
   ![Project](../../../../../translated_images/nl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik op `Agents` - je ziet de standaard Agent die in je project is geprovisioneerd
   ![Agents](../../../../../translated_images/nl/06-visit-agents.bccb263f77b00a09.webp)

1. Selecteer deze - en je ziet de Agent-details. Let op het volgende:

      - De agent gebruikt standaard File Search (altijd)
      - De agent `Knowledge` geeft aan dat er 32 bestanden zijn geüpload (voor file search)
      ![Agents](../../../../../translated_images/nl/07-view-agent-details.0e049f37f61eae62.webp)

1. Zoek de optie `Data+indexes` in het linkermenu en klik voor details. 

      - Je zou de 32 data bestanden geüpload voor kennis moeten zien.
      - Deze komen overeen met de 12 klantbestanden en 20 productbestanden onder `src/files` 
      ![Data](../../../../../translated_images/nl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Je hebt de Agent-operatie gevalideerd!** 

1. De agentantwoorden zijn gegrond in de kennis in die bestanden. 
1. Je kunt nu vragen stellen die gerelateerd zijn aan die data en gegronde antwoorden krijgen.
1. Voorbeeld: `customer_info_10.json` beschrijft de 3 aankopen gedaan door "Amanda Perez"

Keer terug naar het browsertabblad met het Container App-endpoint en vraag: `What products does Amanda Perez own?`. Je zou zoiets moeten zien:

![Data](../../../../../translated_images/nl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Laten we wat meer inzicht krijgen in de mogelijkheden van Microsoft Foundry, door de Agent uit te proberen in de Agents Playground. 

1. Keer terug naar de `Agents` pagina in Microsoft Foundry - selecteer de standaard agent
1. Klik op de optie `Try in Playground` - je zou een Playground UI zoals deze moeten krijgen
1. Stel dezelfde vraag: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/nl/09-ask-in-playground.a1b93794f78fa676.webp)

Je krijgt hetzelfde (of een soortgelijk) antwoord - maar je krijgt ook extra informatie die je kunt gebruiken om de kwaliteit, kosten en prestaties van je agentische app te begrijpen. Bijvoorbeeld:

1. Let op dat het antwoord databestanden citeert die zijn gebruikt om het antwoord te "gronden"
1. Zweef over een van deze bestandslabels - komt de data overeen met je query en getoond antwoord?

Je ziet ook een _stats_-rij onder het antwoord. 

1. Zweef over een metriek - bijv., Safety. Je ziet zoiets
1. Komt de beoordeelde beoordeling overeen met je intuïtie over het veiligheidsniveau van het antwoord?

      ![Data](../../../../../translated_images/nl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Observability gaat over het instrumenteren van je applicatie om data te genereren die kan worden gebruikt om de werking ervan te begrijpen, te debuggen en te optimaliseren. Om hier een gevoel bij te krijgen:

1. Klik op de knop `View Run Info` - je zou deze weergave moeten zien. Dit is een voorbeeld van [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in actie. _Je kunt deze weergave ook krijgen door `Thread Logs` in het topniveau-menu te klikken_.

   - Krijg een gevoel voor de stappen van de run en de tools die door de agent worden ingezet
   - Begrijp het totale tokenaantal (vs. output tokens gebruik) voor het antwoord
   - Begrijp de latency en waar tijd wordt besteed in de uitvoering

      ![Agent](../../../../../translated_images/nl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik op het `Metadata` tabblad om extra attributen voor de run te zien, die nuttige context kunnen bieden voor het debuggen van problemen later.   

      ![Agent](../../../../../translated_images/nl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik op het `Evaluations` tabblad om automatische beoordelingen op het agentantwoord te zien. Deze omvatten veiligheidsbeoordelingen (bijv., Self-harm) en agent-specifieke beoordelingen (bijv., Intent-resolutie, Taaknaleving).

      ![Agent](../../../../../translated_images/nl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Last but not least, klik op het `Monitoring` tabblad in het zijmenu.

      - Selecteer het tabblad `Resource usage` op de getoonde pagina - en bekijk de statistieken.
      - Volg het applicatiegebruik in termen van kosten (tokens) en belasting (requests).
      - Volg applicatielatency naar de eerste byte (inputverwerking) en laatste byte (output).

      ![Agent](../../../../../translated_images/nl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

Tot nu toe hebben we de deployment in de browser doorlopen - en gevalideerd dat onze infrastructuur is geprovisioneerd en de applicatie operationeel is. Maar om met de applicatie _code-first_ te werken, moeten we onze lokale ontwikkelomgeving configureren met de relevante variabelen die nodig zijn om met deze resources te werken. Met `azd` wordt dit makkelijk gemaakt.

1. De Azure Developer CLI [gebruikt omgevingsvariabelen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) om configuratie-instellingen voor de applicatiedeployments op te slaan en te beheren.

1. Omgevingsvariabelen worden opgeslagen in `.azure/<env-name>/.env` - dit scopeert ze naar de `env-name` omgeving die tijdens de deployment is gebruikt en helpt je om omgevingen te isoleren tussen verschillende deploymentdoelen in dezelfde repo.

1. Omgevingsvariabelen worden automatisch geladen door het `azd`-commando telkens wanneer het een specifiek commando uitvoert (bijv., `azd up`). Merk op dat `azd` niet automatisch _OS-level_ omgevingsvariabelen leest (bijv., ingesteld in de shell) - gebruik in plaats daarvan `azd set env` en `azd get env` om informatie over te dragen binnen scripts.


Laten we een paar commando's proberen:

1. Haal alle omgevingsvariabelen op die voor `azd` in deze omgeving zijn ingesteld:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Je ziet zoiets als:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Haal een specifieke waarde op - bijv., ik wil weten of we de waarde `AZURE_AI_AGENT_MODEL_NAME` hebben ingesteld

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Je ziet zoiets als dit - het was niet standaard ingesteld!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Stel een nieuwe omgevingsvariabele in voor `azd`. Hier werken we de agent modelnaam bij. _Opmerking: eventuele wijzigingen worden onmiddellijk weerspiegeld in het `.azure/<env-name>/.env` bestand._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nu zouden we de waarde ingesteld moeten vinden:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Merk op dat sommige resources persistent zijn (bijv., modeldeployments) en meer vereisen dan alleen een `azd up` om gedwongen opnieuw te deployen. Laten we proberen de oorspronkelijke deployment af te breken en opnieuw te deployen met gewijzigde env-vars.

1. **Refresh** Als je eerder infrastructuur hebt gedeployed met een azd-sjabloon - kun je de staat van je lokale omgevingsvariabelen vernieuwen op basis van de huidige staat van je Azure-deployment met dit commando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Dit is een krachtige manier om omgevingsvariabelen te _synchroniseren_ tussen twee of meer lokale ontwikkelomgevingen (bijv., een team met meerdere ontwikkelaars) - waardoor de gedeployde infrastructuur als de bron van waarheid dient voor de status van omgevingsvariabelen. Teamleden hoeven de variabelen alleen te _verversen_ om weer gesynchroniseerd te zijn.

---

## 9. Gefeliciteerd 🏆

Je hebt zojuist een end-to-end workflow voltooid waarin je:

- [X] Geselecteerd het AZD Template dat je wilt gebruiken
- [X] Geopend het template in een ondersteunde ontwikkelomgeving
- [X] Gedeployd het Template en bevestigd dat het werkt

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->