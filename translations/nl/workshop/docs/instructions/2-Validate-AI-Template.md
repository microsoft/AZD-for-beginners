<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7816c6ec50c694c331e7c6092371be4d",
  "translation_date": "2025-09-24T22:49:58+00:00",
  "source_file": "workshop/docs/instructions/2-Validate-AI-Template.md",
  "language_code": "nl"
}
-->
# 2. Valideer een Template

!!! tip "AAN HET EINDE VAN DEZE MODULE KUN JE"

    - [ ] De AI-oplossingsarchitectuur analyseren
    - [ ] Het AZD-implementatiewerkproces begrijpen
    - [ ] GitHub Copilot gebruiken om hulp te krijgen bij het gebruik van AZD
    - [ ] **Lab 2:** De AI Agents-template implementeren en valideren

---

## 1. Introductie

De [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) of `azd` is een open-source commandlinetool die de ontwikkelaarsworkflow vereenvoudigt bij het bouwen en implementeren van applicaties op Azure.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) zijn gestandaardiseerde repositories die voorbeeldapplicatiecode, _infrastructure as code_-assets en `azd`-configuratiebestanden bevatten voor een samenhangende oplossingsarchitectuur. Het inrichten van de infrastructuur wordt zo eenvoudig als een `azd provision`-commando, terwijl `azd up` je in staat stelt om zowel de infrastructuur in te richten **als** je applicatie in één keer te implementeren!

Hierdoor kan het starten van je applicatieontwikkelingsproces zo simpel zijn als het vinden van de juiste _AZD Starter-template_ die het dichtst bij je applicatie- en infrastructuurbehoeften komt, en vervolgens de repository aanpassen aan jouw scenariovereisten.

Voordat we beginnen, laten we ervoor zorgen dat je de Azure Developer CLI hebt geïnstalleerd.

1. Open een VS Code-terminal en typ dit commando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Je zou iets moeten zien zoals dit!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Je bent nu klaar om een template te selecteren en te implementeren met azd**

---

## 2. Template Selectie

Het Azure AI Foundry-platform wordt geleverd met een [set aanbevolen AZD-templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) die populaire oplossingsscenario's dekken zoals _multi-agent workflow-automatisering_ en _multi-modale contentverwerking_. Je kunt deze templates ook ontdekken door de Azure AI Foundry-portal te bezoeken.

1. Bezoek [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log in op de Azure AI Foundry-portal wanneer daarom wordt gevraagd - je ziet iets zoals dit.

![Pick](../../../../../translated_images/nl/01-pick-template.60d2d5fff5ebc374.png)

De **Basic**-opties zijn je startertemplates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) die een eenvoudige chatapplicatie _met je data_ implementeert op Azure Container Apps. Gebruik dit om een basis AI-chatbotscenario te verkennen.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) die ook een standaard AI-agent implementeert (met de Azure AI Agent Service). Gebruik dit om vertrouwd te raken met agent-gebaseerde AI-oplossingen die tools en modellen omvatten.

Bezoek de tweede link in een nieuw browsertabblad (of klik op `Open in GitHub` voor de bijbehorende kaart). Je zou de repository voor deze AZD-template moeten zien. Neem een minuut om de README te verkennen. De applicatiearchitectuur ziet er zo uit:

![Arch](../../../../../translated_images/nl/architecture.8cec470ec15c65c7.png)

---

## 3. Template Activering

Laten we proberen deze template te implementeren en ervoor zorgen dat deze geldig is. We volgen de richtlijnen in de [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)-sectie.

1. Klik op [deze link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - bevestig de standaardactie om `Create codespace` te selecteren
1. Dit opent een nieuw browsertabblad - wacht tot de GitHub Codespaces-sessie volledig is geladen
1. Open de VS Code-terminal in Codespaces - typ het volgende commando:

   ```bash title="" linenums="0"
   azd up
   ```

Voltooi de workflowstappen die hierdoor worden geactiveerd:

1. Je wordt gevraagd om in te loggen op Azure - volg de instructies om te authenticeren
1. Voer een unieke omgevingsnaam in - bijvoorbeeld, ik gebruikte `nitya-mshack-azd`
1. Dit zal een `.azure/`-map maken - je ziet een submap met de omgevingsnaam
1. Je wordt gevraagd om een abonnementsnaam te selecteren - kies de standaard
1. Je wordt gevraagd om een locatie - gebruik `East US 2`

Nu wacht je tot de inrichting is voltooid. **Dit duurt 10-15 minuten**

1. Wanneer dit is voltooid, toont je console een SUCCES-bericht zoals dit:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Je Azure Portal heeft nu een ingerichte resourcegroep met die omgevingsnaam:

      ![Infra](../../../../../translated_images/nl/02-provisioned-infra.46c706b14f56e0bf.png)

1. **Je bent nu klaar om de ingerichte infrastructuur en applicatie te valideren**.

---

## 4. Template Validatie

1. Bezoek de Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups)-pagina - log in wanneer daarom wordt gevraagd
1. Klik op de RG voor je omgevingsnaam - je ziet de bovenstaande pagina

      - klik op de Azure Container Apps-resource
      - klik op de Application Url in de _Essentials_-sectie (rechtsboven)

1. Je zou een gehoste applicatie-frontend UI moeten zien zoals dit:

   ![App](../../../../../translated_images/nl/03-test-application.471910da12c3038e.png)

1. Probeer een paar [voorbeeldvragen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) te stellen

      1. Vraag: ```Wat is de hoofdstad van Frankrijk?``` 
      1. Vraag: ```Wat is de beste tent onder $200 voor twee personen, en welke functies heeft deze?```

1. Je zou antwoorden moeten krijgen die vergelijkbaar zijn met wat hieronder wordt weergegeven. _Maar hoe werkt dit?_ 

      ![App](../../../../../translated_images/nl/03-test-question.521c1e863cbaddb6.png)

---

## 5. Agent Validatie

De Azure Container App implementeert een endpoint dat verbinding maakt met de AI-agent die is ingericht in het Azure AI Foundry-project voor deze template. Laten we eens kijken wat dat betekent.

1. Ga terug naar de Azure Portal _Overview_-pagina voor je resourcegroep

1. Klik op de `Azure AI Foundry`-resource in die lijst

1. Je zou dit moeten zien. Klik op de knop `Go to Azure AI Foundry Portal`. 
   ![Foundry](../../../../../translated_images/nl/04-view-foundry-project.fb94ca41803f28f3.png)

1. Je zou de Foundry Project-pagina voor je AI-applicatie moeten zien
   ![Project](../../../../../translated_images/nl/05-visit-foundry-portal.d734e98135892d7e.png)

1. Klik op `Agents` - je ziet de standaardagent die is ingericht in je project
   ![Agents](../../../../../translated_images/nl/06-visit-agents.bccb263f77b00a09.png)

1. Selecteer deze - en je ziet de agentdetails. Let op het volgende:

      - De agent gebruikt standaard File Search (altijd)
      - De agent `Knowledge` geeft aan dat er 32 bestanden zijn geüpload (voor file search)
      ![Agents](../../../../../translated_images/nl/07-view-agent-details.0e049f37f61eae62.png)

1. Zoek naar de optie `Data+indexes` in het linkermenu en klik voor details. 

      - Je zou de 32 databestanden moeten zien die zijn geüpload voor kennis.
      - Deze komen overeen met de 12 klantbestanden en 20 productbestanden onder `src/files` 
      ![Data](../../../../../translated_images/nl/08-visit-data-indexes.5a4cc1686fa0d19a.png)

**Je hebt de werking van de agent gevalideerd!** 

1. De antwoorden van de agent zijn gebaseerd op de kennis in die bestanden. 
1. Je kunt nu vragen stellen die betrekking hebben op die data en onderbouwde antwoorden krijgen.
1. Voorbeeld: `customer_info_10.json` beschrijft de 3 aankopen van "Amanda Perez"

Ga terug naar het browsertabblad met het Container App-endpoint en vraag: `Welke producten bezit Amanda Perez?`. Je zou iets moeten zien zoals dit:

![Data](../../../../../translated_images/nl/09-ask-in-aca.4102297fc465a4d5.png)

---

## 6. Agent Playground

Laten we wat meer inzicht krijgen in de mogelijkheden van Azure AI Foundry door de agent uit te proberen in de Agents Playground. 

1. Ga terug naar de `Agents`-pagina in Azure AI Foundry - selecteer de standaardagent
1. Klik op de optie `Try in Playground` - je zou een Playground UI moeten zien zoals deze
1. Stel dezelfde vraag: `Welke producten bezit Amanda Perez?`

    ![Data](../../../../../translated_images/nl/09-ask-in-playground.a1b93794f78fa676.png)

Je krijgt hetzelfde (of een vergelijkbaar) antwoord - maar je krijgt ook aanvullende informatie die je kunt gebruiken om de kwaliteit, kosten en prestaties van je agent-gebaseerde app te begrijpen. Bijvoorbeeld:

1. Merk op dat het antwoord data-bestanden citeert die worden gebruikt om het antwoord te "onderbouwen"
1. Beweeg je cursor over een van deze bestandslabels - komt de data overeen met je vraag en het weergegeven antwoord?

Je ziet ook een _stats_-rij onder het antwoord. 

1. Beweeg je cursor over een metric - bijvoorbeeld Veiligheid. Je ziet iets zoals dit
1. Komt de beoordeelde score overeen met je intuïtie over het veiligheidsniveau van het antwoord?

      ![Data](../../../../../translated_images/nl/10-view-run-info-meter.6cdb89a0eea5531f.png)

---x

## 7. Ingebouwde Observability

Observability gaat over het instrumenteren van je applicatie om data te genereren die kan worden gebruikt om de werking ervan te begrijpen, te debuggen en te optimaliseren. Om hier een gevoel voor te krijgen:

1. Klik op de knop `View Run Info` - je zou deze weergave moeten zien. Dit is een voorbeeld van [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in actie. _Je kunt deze weergave ook krijgen door op Thread Logs in het bovenste menu te klikken_.

   - Krijg een gevoel voor de uitvoeringsstappen en tools die door de agent worden gebruikt
   - Begrijp het totale aantal tokens (vs. gebruik van outputtokens) voor het antwoord
   - Begrijp de latentie en waar tijd wordt besteed aan de uitvoering

      ![Agent](../../../../../translated_images/nl/10-view-run-info.b20ebd75fef6a1cc.png)

1. Klik op het tabblad `Metadata` om aanvullende attributen voor de uitvoering te zien, die nuttige context kunnen bieden voor het debuggen van problemen later.   

      ![Agent](../../../../../translated_images/nl/11-view-run-info-metadata.7966986122c7c2df.png)


1. Klik op het tabblad `Evaluations` om automatische beoordelingen te zien van het agentantwoord. Deze omvatten veiligheidsbeoordelingen (bijv. Zelfbeschadiging) en agent-specifieke beoordelingen (bijv. Intentieresolutie, Taaknaleving).

      ![Agent](../../../../../translated_images/nl/12-view-run-info-evaluations.ef25e4577d70efeb.png)

1. Klik tot slot op het tabblad `Monitoring` in het zijmenu.

      - Selecteer het tabblad `Resource usage` op de weergegeven pagina - en bekijk de metrics.
      - Volg het gebruik van de applicatie in termen van kosten (tokens) en belasting (verzoeken).
      - Volg de latentie van de applicatie tot de eerste byte (inputverwerking) en de laatste byte (output).

      ![Agent](../../../../../translated_images/nl/13-monitoring-resources.5148015f7311807f.png)

---

## 8. Omgevingsvariabelen

Tot nu toe hebben we de implementatie in de browser doorlopen - en gevalideerd dat onze infrastructuur is ingericht en de applicatie operationeel is. Maar om met de applicatie _code-first_ te werken, moeten we onze lokale ontwikkelomgeving configureren met de relevante variabelen die nodig zijn om met deze resources te werken. Het gebruik van `azd` maakt dit eenvoudig.

1. De Azure Developer CLI [maakt gebruik van omgevingsvariabelen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) om configuratie-instellingen op te slaan en te beheren voor de applicatie-implementaties.

1. Omgevingsvariabelen worden opgeslagen in `.azure/<env-name>/.env` - dit beperkt ze tot de `env-name`-omgeving die tijdens de implementatie wordt gebruikt en helpt je om omgevingen te isoleren tussen verschillende implementatiedoelen in dezelfde repository.

1. Omgevingsvariabelen worden automatisch geladen door het `azd`-commando wanneer het een specifiek commando uitvoert (bijv. `azd up`). Merk op dat `azd` niet automatisch _OS-niveau_-omgevingsvariabelen leest (bijv. ingesteld in de shell) - gebruik in plaats daarvan `azd set env` en `azd get env` om informatie binnen scripts over te dragen.


Laten we een paar commando's proberen:

1. Haal alle omgevingsvariabelen op die zijn ingesteld voor `azd` in deze omgeving:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Je ziet iets zoals:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Haal een specifieke waarde op - bijvoorbeeld, ik wil weten of we de waarde `AZURE_AI_AGENT_MODEL_NAME` hebben ingesteld

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Je ziet iets zoals dit - het was niet standaard ingesteld!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Stel een nieuwe omgevingsvariabele in voor `azd`. Hier werken we de agentmodelnaam bij. _Opmerking: wijzigingen die worden aangebracht, worden onmiddellijk weergegeven in het bestand `.azure/<env-name>/.env`.

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

1. **Vernieuwen** Als je eerder infrastructuur hebt ingericht met een azd-template - kun je de status van je lokale omgevingsvariabelen _vernieuwen_ op basis van de huidige status van je Azure-implementatie met dit commando:
      ```bash title="" linenums="0"
      azd env refresh
      ```

      Dit is een krachtige manier om _omgeving variabelen_ te synchroniseren tussen twee of meer lokale ontwikkelomgevingen (bijvoorbeeld een team met meerdere ontwikkelaars) - waardoor de uitgerolde infrastructuur kan dienen als de bron van waarheid voor de status van omgeving variabelen. Teamleden hoeven simpelweg de variabelen te _verversen_ om weer in sync te komen.

---

## 9. Gefeliciteerd 🏆

Je hebt zojuist een end-to-end workflow voltooid waarin je:

- [X] Het AZD-template hebt geselecteerd dat je wilt gebruiken
- [X] Het template hebt gestart met GitHub Codespaces
- [X] Het template hebt uitgerold en gevalideerd dat het werkt

---

