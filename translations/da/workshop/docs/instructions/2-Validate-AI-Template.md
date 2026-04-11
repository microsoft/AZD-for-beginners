# 2. Valider en skabelon

> Valideret mod `azd 1.23.12` i marts 2026.

!!! tip "VED SLUTNINGEN AF DETTE MODUL KAN DU"

    - [ ] Analysere AI-løsningsarkitekturen
    - [ ] Forstå AZD-udrulningsworkflowen
    - [ ] Brug GitHub Copilot til at få hjælp til at bruge AZD
    - [ ] **Laboratorium 2:** Udrul og valider AI Agents-skabelonen

---


## 1. Introduktion

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` er et open source kommandolinjeværktøj, der strømliner udviklerarbejdsgangen, når man bygger og udruller applikationer til Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) er standardiserede repositories, der inkluderer eksempelapplikationskode, _infrastructure-as-code_ assets og `azd`-konfigurationsfiler for en sammenhængende løsningsarkitektur. Provisionering af infrastrukturen bliver så simpelt som en `azd provision`-kommando - mens brug af `azd up` giver dig mulighed for at provisionere infrastrukturen **og** udrulle din applikation på én gang!

Som følge heraf kan det at kickstarte din applikationsudviklingsproces være så enkelt som at finde den rigtige _AZD Starter template_, der kommer tættest på dine applikations- og infrastrukturbehov - og derefter tilpasse repositoryet til dine scenariekrav.

Inden vi begynder, lad os sikre os, at du har Azure Developer CLI installeret.

1. Åbn en VS Code-terminal og skriv denne kommando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Du burde se noget lignende!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Du er nu klar til at vælge og udrulle en skabelon med azd**

---

## 2. Skabelonvalg

Microsoft Foundry-platformen leveres med et [sæt anbefalede AZD-skabeloner](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), der dækker populære løsningsscenarier som _multi-agent workflow automatisering_ og _multi-modal indholdsbehandling_. Du kan også finde disse skabeloner ved at besøge Microsoft Foundry-portalen.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log ind på Microsoft Foundry-portalen, når du bliver spurgt - du vil se noget lignende dette.

![Vælg](../../../../../translated_images/da/01-pick-template.60d2d5fff5ebc374.webp)


De **Basic** muligheder er dine startskabeloner:

1. [ ] [Kom i gang med AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) som udruller en grundlæggende chatapplikation _med dine data_ til Azure Container Apps. Brug dette til at udforske et grundlæggende AI-chatbotscenarie.
1. [X] [Kom i gang med AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) som også udruller en standard AI-agent (med Foundry Agents). Brug dette til at blive fortrolig med agent-baserede AI-løsninger, der involverer værktøjer og modeller.

Besøg det andet link i en ny browserfane (eller klik `Open in GitHub` for det tilknyttede kort). Du bør se repositoryet for denne AZD-template. Tag et minut til at gennemgå README. Applikationsarkitekturen ser sådan ud:

![Arkitektur](../../../../../translated_images/da/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivering af skabelon

Lad os forsøge at udrulle denne skabelon og sikre, at den er gyldig. Vi følger retningslinjerne i [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)-sektionen.

1. Vælg et arbejdsmiljø for skabelon-repositoryet:

      - **GitHub Codespaces**: Klik på [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) og bekræft `Create codespace`
      - **Local clone or dev container**: Klon `Azure-Samples/get-started-with-ai-agents` og åbn det i VS Code

1. Vent til VS Code-terminalen er klar, og skriv derefter følgende kommando:

   ```bash title="" linenums="0"
   azd up
   ```

Fuldfør workflow-trinene, som dette vil udløse:

1. Du vil blive bedt om at logge ind på Azure - følg instruktionerne for at autentificere
1. Indtast et unikt miljønavn til dig - f.eks. jeg brugte `nitya-mshack-azd`
1. Dette vil oprette en `.azure/`-mappe - du vil se en undermappe med miljønavnet
1. Du vil blive bedt om at vælge et abonnementsnavn - vælg standard
1. Du vil blive bedt om en lokation - brug `East US 2`

Nu venter du på, at provisioning fuldføres. **Dette tager 10-15 minutter**

1. Når det er færdigt, vil din terminal vise en SUCCESS-besked som denne:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Din Azure Portal vil nu have en provisioneret resourcegruppe med det miljønavn:

      ![Infrastruktur](../../../../../translated_images/da/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Du er nu klar til at validere den udrullede infrastruktur og applikation**.

---

## 4. Validering af skabelon

1. Besøg Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups)-siden - log ind når du bliver bedt om det
1. Klik på RG for dit miljønavn - du ser siden ovenfor

      - klik på Azure Container Apps-ressourcen
      - klik på Application Url i _Essentials_-sektionen (øverst til højre)

1. Du burde se en hostet applikations front-end UI som denne:

   ![Applikation](../../../../../translated_images/da/03-test-application.471910da12c3038e.webp)

1. Prøv at stille et par [eksempler på spørgsmål](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Spørg: ```What is the capital of France?``` 
      1. Spørg: ```What's the best tent under $200 for two people, and what features does it include?```

1. Du burde få svar svar, der ligner det, der vises nedenfor. _Men hvordan fungerer det?_

      ![Applikation](../../../../../translated_images/da/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agentvalidering

Azure Container App udruller et endpoint, der forbinder til AI Agenten provisioneret i Microsoft Foundry-projektet for denne skabelon. Lad os se nærmere på, hvad det betyder.

1. Gå tilbage til Azure Portalens _Overview_-side for din resourcegruppe

1. Klik på `Microsoft Foundry`-ressourcen i den liste

1. Du bør se dette. Klik på knappen `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/da/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Du bør se Foundry Project-siden for din AI-applikation
   ![Projekt](../../../../../translated_images/da/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik på `Agents` - du ser den standardagent, der er provisioneret i dit projekt
   ![Agenter](../../../../../translated_images/da/06-visit-agents.bccb263f77b00a09.webp)

1. Vælg den - og du ser Agent-detaljerne. Bemærk følgende:

      - Agenten bruger File Search som standard (altid)
      - Agentens `Knowledge` angiver, at den har 32 filer uploadet (til fil-søgning)
      ![Agentdetaljer](../../../../../translated_images/da/07-view-agent-details.0e049f37f61eae62.webp)

1. Kig efter `Data+indexes`-muligheden i venstremenuen og klik for detaljer. 

      - Du bør se de 32 datafiler, der er uploadet til knowledge.
      - Disse svarer til de 12 kunde-filer og 20 produkt-filer under `src/files`
      ![Data](../../../../../translated_images/da/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Du har valideret agentens drift!** 

1. Agentens svar er baseret på den viden, der findes i disse filer. 
1. Du kan nu stille spørgsmål relateret til disse data og få svar, der er forankret i dataene.
1. Eksempel: `customer_info_10.json` beskriver de 3 køb foretaget af "Amanda Perez"

Gå tilbage til browserfanen med Container App-endpointet og spørg: `What products does Amanda Perez own?`. Du bør se noget i denne retning:

![Data](../../../../../translated_images/da/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Lad os opbygge lidt mere intuition for Microsoft Foundrys kapaciteter ved at afprøve agenten i Agents Playground. 

1. Gå tilbage til `Agents`-siden i Microsoft Foundry - vælg standardagenten
1. Klik på `Try in Playground`-muligheden - du bør få en Playground-UI som denne
1. Stil det samme spørgsmål: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/da/09-ask-in-playground.a1b93794f78fa676.webp)

Du får det samme (eller lignende) svar - men du får også yderligere information, som du kan bruge til at forstå kvaliteten, omkostningerne og ydeevnen af din agentbaserede app. For eksempel:

1. Bemærk, at svaret citerer datafiler brugt til at "grounde" svaret
1. Hold musen over et af disse filnavne - stemmer dataene overens med din forespørgsel og det viste svar?

Du ser også en _stats_-række under svaret. 

1. Hold musen over en hvilken som helst metrik - f.eks. Safety. Du ser noget i denne stil
1. Stemmer den vurderede score overens med din intuition for svarenes sikkerhedsniveau?

      ![Data](../../../../../translated_images/da/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Indbygget observabilitet

Observabilitet handler om at instrumentere din applikation til at generere data, der kan bruges til at forstå, fejlfinde og optimere dens drift. For at få en fornemmelse af dette:

1. Klik på knappen `View Run Info` - du bør se denne visning. Dette er et eksempel på [Agent-sporing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) i aktion. _Du kan også få denne visning ved at klikke på Thread Logs i topmenuen_.

   - Få en fornemmelse af run-trinene og de værktøjer, agenten engagerede
   - Forstå total token-tælling (vs. output-token-forbrug) for svaret
   - Forstå latenstid og hvor tiden bruges under udførelsen

      ![Agent](../../../../../translated_images/da/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik på fanen `Metadata` for at se yderligere attributter for run'et, som kan give nyttig kontekst til fejlfinding senere.   

      ![Agent](../../../../../translated_images/da/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik på fanen `Evaluations` for at se auto-vurderinger foretaget på agentens svar. Disse inkluderer sikkerhedsvurderinger (f.eks. Self-harm) og agent-specifikke evalueringer (f.eks. Intent resolution, Task adherence).

      ![Agent](../../../../../translated_images/da/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Sidst men ikke mindst, klik på fanen `Monitoring` i sidebarmenuen.

      - Vælg fanen `Resource usage` på den viste side - og se metrikkerne.
      - Spor applikationsbrug i form af omkostninger (tokens) og belastning (requests).
      - Spor applikationens latenstid til første byte (inputbehandling) og sidste byte (output).

      ![Agent](../../../../../translated_images/da/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Miljøvariabler

Indtil nu har vi gennemgået udrulningen i browseren - og valideret, at vores infrastruktur er provisioneret, og at applikationen er operationel. Men for at arbejde med applikationen _code-first_ skal vi konfigurere vores lokale udviklingsmiljø med de relevante variabler, der kræves for at arbejde med disse ressourcer. Brug af `azd` gør det nemt.

1. Azure Developer CLI [bruger miljøvariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) til at gemme og administrere konfigurationsindstillinger for applikationsudrulningerne.

1. Miljøvariabler gemmes i `.azure/<env-name>/.env` - dette afgrænser dem til det `env-name`-miljø, der blev brugt under udrulningen, og hjælper dig med at isolere miljøer mellem forskellige udrulningsmål i det samme repo.

1. Miljøvariabler indlæses automatisk af `azd`-kommandoen, når den kører en specifik kommando (f.eks. `azd up`). Bemærk, at `azd` ikke automatisk læser _OS-level_ miljøvariabler (f.eks. sat i shell) - brug i stedet `azd set env` og `azd get env` til at overføre oplysninger inden for scripts.


Lad os prøve et par kommandoer:

1. Hent alle miljøvariabler, der er sat for `azd` i dette miljø:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Du vil se noget som dette:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Hent en specifik værdi - f.eks. jeg vil gerne vide, om vi satte `AZURE_AI_AGENT_MODEL_NAME`-værdien

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Du ser noget som dette - den var ikke sat som standard!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Sæt en ny miljøvariabel for `azd`. Her opdaterer vi agentens modelnavn. _Bemærk: eventuelle ændringer vil straks blive afspejlet i `.azure/<env-name>/.env`-filen._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nu skulle vi kunne se, at værdien er sat:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Bemærk, at nogle ressourcer er vedvarende (f.eks. model-udrulninger) og vil kræve mere end blot et `azd up` for at tvinge en genudrulning. Lad os prøve at rive den oprindelige udrulning ned og genudrulle med ændrede miljøvariabler.

1. **Refresh** Hvis du tidligere har udrullet infrastruktur ved hjælp af en azd-template - kan du _refresh_ tilstanden af dine lokale miljøvariabler baseret på den aktuelle tilstand af din Azure-udrulning ved at bruge denne kommando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Dette er en kraftfuld måde at _synkronisere_ miljøvariabler på mellem to eller flere lokale udviklingsmiljøer (f.eks. et team med flere udviklere) - så den deployerede infrastruktur kan fungere som sandhedskilde for tilstanden af miljøvariabler. Teammedlemmer skal blot _opdatere_ variablerne for at blive synkroniseret igen.

---

## 9. Tillykke 🏆

Du har netop gennemført en ende-til-ende arbejdsgang, hvor du:

- [X] Valgte den AZD-skabelon, du vil bruge
- [X] Åbnede skabelonen i et understøttet udviklingsmiljø
- [X] Deployerede skabelonen og bekræftede, at den virker

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->