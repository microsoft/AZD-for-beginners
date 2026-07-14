# 2. Valideer een Sjabloon

> Gevalideerd tegen `azd 1.27.1` in juli 2026.

!!! tip "AAN HET EIND VAN DEZE MODULE KUN JE"

    - [ ] De AI Oplossingsarchitectuur analyseren
    - [ ] De AZD Deployment Workflow begrijpen
    - [ ] GitHub Copilot gebruiken om hulp te krijgen bij AZD gebruik
    - [ ] **Lab 2:** Deploy & Valideer de AI Agents sjabloon

---


## 1. Introductie

De [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) of `azd` is een open-source commandoregeltool die de ontwikkelaar workflow vereenvoudigt bij het bouwen en deployen van applicaties naar Azure.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) zijn gestandaardiseerde repositories die voorbeeldapplicatiecode, _infrastructure-as-code_ assets en `azd` configuratiebestanden bevatten voor een samenhangende oplossingsarchitectuur. Het provisionen van de infrastructuur wordt zo eenvoudig als een `azd provision` commando – terwijl je met `azd up` infrastructuur kunt provisionen **en** je applicatie in één keer kunt deployen!

Hierdoor kan het opstarten van je applicatieontwikkelproces zo eenvoudig zijn als het vinden van het juiste _AZD Starter sjabloon_ dat het dichtst bij je applicatie- en infrastructuurbehoeften ligt – en vervolgens de repository aanpassen aan je scenariovereisten.

Voordat we beginnen, laten we zeker stellen dat je de Azure Developer CLI hebt geïnstalleerd.

1. Open een VS Code terminal en typ dit commando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Je zou iets moeten zien zoals dit!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Je bent nu klaar om een sjabloon te selecteren en te deployen met azd**

---

## 2. Sjabloonselectie

Het Microsoft Foundry platform wordt geleverd met een [set aanbevolen AZD sjablonen](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) die populaire oplossingsscenario's bestrijken zoals _multi-agent workflow automatisering_ en _multi-modale contentverwerking_. Je kunt deze sjablonen ook ontdekken door de Microsoft Foundry portal te bezoeken.

1. Bezoek [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log in op de Microsoft Foundry portal wanneer daarom gevraagd wordt - je ziet dan iets als dit.

![Pick](../../../../../translated_images/nl/01-pick-template.60d2d5fff5ebc374.webp)


De **Basic** opties zijn je start-sjablonen:

1. [ ] [Begin met AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) dat een basis chat-applicatie met jouw data naar Azure Container Apps deployed. Gebruik dit om een basis AI chatbot scenario te verkennen.
1. [X] [Begin met AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) dat ook een standaard AI Agent (met de Foundry Agents) deployed. Gebruik dit om vertrouwd te raken met agent-gebaseerde AI-oplossingen met tools en modellen.

Bezoek de tweede link in een nieuw browserscherm (of klik op `Open in GitHub` voor het gerelateerde kaartje). Je zou de repository voor dit AZD sjabloon moeten zien. Neem even de tijd om de README te verkennen. De architectuur van de applicatie ziet eruit als volgt:

![Arch](../../../../../translated_images/nl/architecture.8cec470ec15c65c7.webp)

---

## 3. Sjabloon Activering

Laten we proberen dit sjabloon te deployen en zeker stellen dat het valide is. We volgen de richtlijnen in de sectie [Aan de slag](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Kies een werkomgeving voor de sjabloonrepository:

      - **GitHub Codespaces**: Klik [op deze link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) en bevestig `Create codespace`
      - **Lokale clone of dev container**: Clone `Azure-Samples/get-started-with-ai-agents` en open het in VS Code

1. Wacht tot de VS Code terminal klaar is, typ vervolgens de volgende opdracht:

   ```bash title="" linenums="0"
   azd up
   ```

Voltooi de workflow stappen die hierdoor gestart worden:

1. Je wordt gevraagd in te loggen op Azure – volg de instructies om te authenticeren
1. Voer een unieke omgevingnaam in voor jezelf – bijvoorbeeld, ik gebruikte `nitya-mshack-azd`
1. Dit maakt een `.azure/` map aan – je ziet een submap met de omgevingnaam
1. Je wordt gevraagd een abonnementsnaam te selecteren – selecteer de standaard
1. Je wordt gevraagd een locatie te kiezen – gebruik `East US 2`

Wacht nu tot het provisionen klaar is. **Dit duurt 10-15 minuten**

1. Als het klaar is, toont je console een SUCCES melding zoals deze:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Je Azure Portal heeft nu een voorzien resourcegroep met die omgevingnaam:

      ![Infra](../../../../../translated_images/nl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Je bent nu klaar om de gedeployde infrastructuur en applicatie te valideren**.

---

## 4. Validatie van het Sjabloon

1. Bezoek de Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) pagina – log in wanneer daarom gevraagd wordt
1. Klik op de RG (Resource Group) van je omgevingsnaam – je ziet de bovenstaande pagina

      - klik op de Azure Container Apps resource
      - klik op de Application Url in de sectie _Essentials_ (rechtsboven)

1. Je zou een gehoste applicatie front-end UI moeten zien zoals deze:

   ![App](../../../../../translated_images/nl/03-test-application.471910da12c3038e.webp)

1. Probeer een paar [voorbeeldvragen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Vraag: ```Wat is de hoofdstad van Frankrijk?```
      1. Vraag: ```Wat is de beste tent onder $200 voor twee personen en welke eigenschappen heeft deze?```

1. Je zou antwoorden moeten krijgen die lijken op wat hieronder staat. _Maar hoe werkt dit precies?_

      ![App](../../../../../translated_images/nl/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validatie van de Agent

De Azure Container App deployed een endpoint die verbindt met de AI Agent provisioned in het Microsoft Foundry project voor dit sjabloon. Laten we kijken wat dat betekent.

1. Keer terug naar de Azure Portal _Overzicht_ pagina voor je resourcegroep

1. Klik op de `Microsoft Foundry` resource in die lijst

1. Je zou dit moeten zien. Klik op de knop `Ga naar Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/nl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Je ziet de Foundry Project pagina voor jouw AI applicatie
   ![Project](../../../../../translated_images/nl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik op `Agents` – je ziet de standaard Agent die in je project voorzien is
   ![Agents](../../../../../translated_images/nl/06-visit-agents.bccb263f77b00a09.webp)

1. Selecteer die – en je ziet de Agent details. Let op het volgende:

      - De agent gebruikt standaard File Search (altijd)
      - De agent `Knowledge` geeft aan dat er 32 bestanden zijn geüpload (voor file search)
      ![Agents](../../../../../translated_images/nl/07-view-agent-details.0e049f37f61eae62.webp)

1. Zoek naar de optie `Data+indexes` in het linkermenu en klik voor details.

      - Je zou de 32 data bestanden moeten zien die geüpload zijn voor kennis.
      - Deze corresponderen met de 12 klantbestanden en 20 productbestanden onder `src/files`
      ![Data](../../../../../translated_images/nl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Je hebt de werking van de Agent gevalideerd!**

1. De antwoorden van de agent zijn gebaseerd op de kennis in die bestanden.
1. Je kunt nu vragen stellen gerelateerd aan die data, en grondige antwoorden krijgen.
1. Voorbeeld: `customer_info_10.json` beschrijft de 3 aankopen van "Amanda Perez"

Ga terug naar het browser tabblad met het Container App endpoint en vraag: `Welke producten bezit Amanda Perez?`. Je zou zoiets moeten zien:

![Data](../../../../../translated_images/nl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Laten we wat meer intuïtie opbouwen over de mogelijkheden van Microsoft Foundry door de Agent te testen in de Agents Playground.

1. Ga terug naar de pagina `Agents` in Microsoft Foundry – selecteer de standaard agent
1. Klik op de optie `Try in Playground` – je zou een Playground UI moeten zien zoals deze
1. Stel dezelfde vraag: `Welke producten bezit Amanda Perez?`

    ![Data](../../../../../translated_images/nl/09-ask-in-playground.a1b93794f78fa676.webp)

Je krijgt hetzelfde (of een vergelijkbaar) antwoord – maar je krijgt ook extra informatie die je kunt gebruiken om de kwaliteit, kosten, en prestaties van je agentische app beter te begrijpen. Bijvoorbeeld:

1. Let erop dat het antwoord verwijst naar data bestanden die gebruikt zijn om het antwoord te "onderbouwen"
1. Beweeg je muis over een van deze bestandslabels – komt de data overeen met je vraag en het getoonde antwoord?

Je ziet ook een _statistieken_ rij onder het antwoord.

1. Beweeg je muis over een meting – bijvoorbeeld Veiligheid. Je ziet zoiets als dit
1. Komt de beoordeelde rating overeen met jouw intuïtie over het veiligheidsniveau van het antwoord?

      ![Data](../../../../../translated_images/nl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Ingebouwde Observeerbaarheid

Observeerbaarheid gaat over het instrumenteren van je applicatie om data te genereren die kan worden gebruikt voor het begrijpen, debuggen en optimaliseren van de werking. Om hier een gevoel bij te krijgen:

1. Klik op de knop `View Run Info` – je zou dit beeld moeten zien. Dit is een voorbeeld van [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in actie. _Je kunt dit beeld ook krijgen door te klikken op Thread Logs in het bovenste menu_.

   - Krijg een beeld van de uitvoerstappen en tools die door de agent zijn ingezet
   - Begrijp het totaal aantal tokens (vergeleken met gebruikte output tokens) voor het antwoord
   - Begrijp de vertraging en waar tijd wordt besteed in de uitvoering

      ![Agent](../../../../../translated_images/nl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik op het tabblad `Metadata` om extra attributen voor de run te zien, die nuttige context kunnen bieden voor het debuggen van problemen later.

      ![Agent](../../../../../translated_images/nl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik op het tabblad `Evaluations` om de automatische beoordelingen op het agentantwoord te zien. Deze omvatten veiligheidsevaluaties (bijv. Zelfbeschadiging) en agentspecifieke evaluaties (bijv. Intentieresolutie, Taaknaleving).

      ![Agent](../../../../../translated_images/nl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Klik tot slot op het tabblad `Monitoring` in het zijmenu.

      - Selecteer het tabblad `Resource usage` op de weergegeven pagina - en bekijk de statistieken.
      - Volg het applicatiegebruik in termen van kosten (tokens) en belasting (requesten).
      - Volg de applicatievertraging naar de eerste byte (inputverwerking) en laatste byte (output).

      ![Agent](../../../../../translated_images/nl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Omgevingsvariabelen

Tot nu toe hebben we de deployment via de browser doorlopen – en gevalideerd dat onze infrastructuur is geprovisioned en de applicatie operationeel is. Maar om met de applicatie _code-first_ te werken, moeten we onze lokale ontwikkelomgeving configureren met de relevante variabelen die nodig zijn om met deze resources te werken. Met `azd` is dat eenvoudig.

1. De Azure Developer CLI [gebruikt omgevingsvariabelen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) om configuratie-instellingen voor applicatie-deployments op te slaan en beheren.

1. Omgevingsvariabelen worden opgeslagen in `.azure/<env-naam>/.env` – dit scopeert ze naar de `env-naam` omgeving die tijdens deployment is gebruikt en helpt je omgevingen te isoleren tussen verschillende deploymentdoelen in dezelfde repo.

1. Omgevingsvariabelen worden automatisch geladen door het `azd` commando wanneer het een specifiek commando uitvoert (bijvoorbeeld `azd up`). Let op dat `azd` niet automatisch _OS-niveau_ omgevingsvariabelen leest (bijv. ingesteld in de shell) – gebruik in plaats daarvan `azd set env` en `azd get env` om informatie binnen scripts te transfereren.


Laten we een paar commando's uitproberen:

1. Vraag alle omgevingsvariabelen op die zijn ingesteld voor `azd` in deze omgeving:

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

1. Vraag een specifieke waarde op – bijvoorbeeld, ik wil weten of we de waarde `AZURE_AI_AGENT_MODEL_NAME` hebben ingesteld

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Je ziet zoiets – het was niet standaard ingesteld!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Stel een nieuwe omgevingsvariabele in voor `azd`. Hier updaten we de agent modelnaam. _Let op: alle wijzigingen worden direct weerspiegeld in het `.azure/<env-naam>/.env` bestand.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nu zouden we de waarde ingesteld moeten zien:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Let op dat sommige resources persistent zijn (bijv. model deployments) en meer vereisen dan alleen een `azd up` om de herdeployment af te dwingen. Laten we proberen om de originele deployment af te breken en opnieuw te deployen met gewijzigde omgevingsvariabelen.

1. **Ververs** Als je eerder infrastructuur hebt gedeployed met behulp van een azd sjabloon – dan kun je de status van je lokale omgevingsvariabelen verversen op basis van de huidige status van je Azure deployment met het volgende commando:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Dit is een krachtige manier om omgevingsvariabelen te _synchroniseren_ tussen twee of meer lokale ontwikkelomgevingen (bijv. een team met meerdere ontwikkelaars) - waardoor de uitgerolde infrastructuur dient als de onbetwiste waarheid voor de staat van de omgevingsvariabelen. Teamleden hoeven alleen maar de variabelen te _verversen_ om weer synchroon te lopen.

---

## 9. Gefeliciteerd 🏆

Je hebt zojuist een end-to-end workflow voltooid waarin je:

- [X] Het AZD-sjabloon geselecteerd dat je wilt gebruiken
- [X] Het sjabloon geopend in een ondersteunde ontwikkelomgeving
- [X] Het sjabloon uitgerold en gevalideerd dat het werkt

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->