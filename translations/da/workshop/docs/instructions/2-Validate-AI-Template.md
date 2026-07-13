# 2. Validér en Skabelon

> Valideret mod `azd 1.27.1` i juli 2026.

!!! tip "VED SLUTNINGEN AF DETTE MODUL VIL DU VÆRE I STAND TIL AT"

    - [ ] Analysere AI-løsningsarkitektur
    - [ ] Forstå AZD-udrulningsworkflow
    - [ ] Bruge GitHub Copilot for hjælp til AZD-brug
    - [ ] **Lab 2:** Udrul & valider AI Agents-skabelonen

---


## 1. Introduktion

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) eller `azd` er et open-source kommandolinjeværktøj, som effektiviserer udviklerens workflow, når man bygger og implementerer applikationer til Azure.

[AZD Skabeloner](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) er standardiserede repositories, som inkluderer eksempel applikationskode, _infrastruktur-som-kode_ assets og `azd` konfigurationsfiler for en sammenhængende løsningsarkitektur. Provisionering af infrastrukturen bliver lige så enkelt som en `azd provision` kommando - mens brug af `azd up` tillader dig at provisionere infrastruktur **og** implementere din applikation i ét trin!

Som følge heraf kan det at kickstarte din applikationsudviklingsproces være lige så enkelt som at finde den rette _AZD Starter-skabelon_, som bedst matcher dine applikations- og infrastrukturelle behov - og derefter tilpasse repositoryet, så det passer til dine scenariekrav.

Før vi begynder, lad os sikre, at du har Azure Developer CLI installeret.

1. Åbn en VS Code terminal og skriv denne kommando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Du burde se noget lignende dette!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Du er nu klar til at vælge og udrulle en skabelon med azd**

---

## 2. Skabelonvalg

Microsoft Foundry-platformen leveres med et [sæt anbefalede AZD-skabeloner](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), der dækker populære løsningsscenarier som _multi-agent workflow automation_ og _multi-modal indholdsbehandling_. Du kan også finde disse skabeloner ved at besøge Microsoft Foundry-portalen.

1. Besøg [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log ind på Microsoft Foundry-portalen, når du bliver bedt om det - du vil se noget i denne stil.

![Pick](../../../../../translated_images/da/01-pick-template.60d2d5fff5ebc374.webp)


De **Basis** muligheder er dine startskabeloner:

1. [ ] [Kom i gang med AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), der implementerer en grundlæggende chatapplikation _med dine data_ til Azure Container Apps. Brug denne til at udforske et grundlæggende AI chatbot-scenarie.
1. [X] [Kom i gang med AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents), som også implementerer en standard AI Agent (med Foundry Agents). Brug denne til at blive fortrolig med agent-baserede AI-løsninger, der involverer værktøjer og modeller.

Besøg det andet link i en ny browserfane (eller klik på `Open in GitHub` for det relaterede kort). Du burde se repositoryet for denne AZD-skabelon. Brug et øjeblik på at udforske README'en. Applikationsarkitekturen ser sådan ud:

![Arch](../../../../../translated_images/da/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivering af skabelon

Lad os prøve at implementere denne skabelon og sikre, at den er gyldig. Vi følger retningslinjerne i afsnittet [Kom godt i gang](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Vælg et arbejdsmiljø for skabelon-repositoryet:

      - **GitHub Codespaces**: Klik på [dette link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) og bekræft `Create codespace`
      - **Lokal klon eller dev container**: Klon `Azure-Samples/get-started-with-ai-agents` og åbn det i VS Code

1. Vent, indtil VS Code-terminalen er klar, og skriv derefter følgende kommando:

   ```bash title="" linenums="0"
   azd up
   ```

Fuldfør de workflow-trin, som denne vil udløse:

1. Du bliver bedt om at logge ind på Azure - følg instruktionerne for autentificering
1. Indtast et unikt miljønavn for dig - f.eks. brugte jeg `nitya-mshack-azd`
1. Dette vil oprette en `.azure/` mappe - du vil se en undermappe med miljønavnet
1. Du bliver bedt om at vælge et abonnement - vælg standard
1. Du bliver bedt om at vælge en lokation - brug `East US 2`

Nu venter du på, at provisioneringen bliver færdig. **Dette tager 10-15 minutter**

1. Når det er færdigt, viser din konsol en SUCCESS-meddelelse som denne:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Din Azure Portal vil nu have en provisioneret resource group med det miljønavn:

      ![Infra](../../../../../translated_images/da/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Du er nu klar til at validere den udrullede infrastruktur og applikation**.

---

## 4. Validering af skabelon

1. Besøg Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups)-siden - log ind, når du bliver bedt om det
1. Klik på RG for dit miljønavn - du ser siden ovenfor

      - klik på Azure Container Apps-ressourcen
      - klik på Application Url i _Essentials_ sektionen (øverst til højre)

1. Du burde se en hostet applikations frontend UI som denne:

   ![App](../../../../../translated_images/da/03-test-application.471910da12c3038e.webp)

1. Prøv at stille et par [eksempelspørgsmål](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Spørg: ```What is the capital of France?``` 
      1. Spørg: ```What's the best tent under $200 for two people, and what features does it include?```

1. Du burde få svar, der ligner det viste nedenfor. _Men hvordan virker det?_

      ![App](../../../../../translated_images/da/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentvalidering

Azure Container App implementerer et endpoint, der forbinder til AI Agenten, der er provisioneret i Microsoft Foundry-projektet for denne skabelon. Lad os se nærmere på, hvad det betyder.

1. Gå tilbage til Azure Portalens _Oversigt_ side for din resourcegruppe

1. Klik på `Microsoft Foundry` ressourcen i den liste

1. Du skal se dette. Klik på `Go to Microsoft Foundry Portal` knappen.
   ![Foundry](../../../../../translated_images/da/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Du skal se Foundry Projekt-siden for din AI-applikation
   ![Project](../../../../../translated_images/da/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik på `Agents` - du ser den standard Agent, der er provisioneret i dit projekt
   ![Agents](../../../../../translated_images/da/06-visit-agents.bccb263f77b00a09.webp)

1. Vælg den - og du ser Agent-detaljerne. Bemærk følgende:

      - Agenten bruger som standard File Search (altid)
      - Agentens `Knowledge` angiver, at den har 32 filer uploadet (til fil-søgning)
      ![Agents](../../../../../translated_images/da/07-view-agent-details.0e049f37f61eae62.webp)

1. Kig efter `Data+indexes` indstillingen i venstremenuen og klik for detaljer.

      - Du burde se de 32 datafiler uploadet til viden.
      - Disse svarer til de 12 kundefiler og 20 produktfiler under `src/files`
      ![Data](../../../../../translated_images/da/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Du har valideret Agent-driften!**

1. Agentens svar er forankret i den viden, der findes i disse filer.
1. Du kan nu stille spørgsmål relateret til disse data og få forankrede svar.
1. Eksempel: `customer_info_10.json` beskriver de 3 køb, der er foretaget af "Amanda Perez"

Gå tilbage til browserfanen med Container App-endpointet og spørg: `What products does Amanda Perez own?`. Du burde se noget lignende dette:

![Data](../../../../../translated_images/da/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Lad os opbygge lidt mere intuition om Microsoft Foundrys kapabiliteter ved at prøve Agenten i Agents Playground.

1. Gå tilbage til `Agents` siden i Microsoft Foundry - vælg standard agenten
1. Klik på `Try in Playground` valgmuligheden - du skulle gerne få et Playground UI som dette
1. Stil samme spørgsmål: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/da/09-ask-in-playground.a1b93794f78fa676.webp)

Du får samme (eller lignende) svar - men du får også yderligere information, som du kan bruge til at forstå kvaliteten, omkostningerne og ydelsen af din agentbaserede app. For eksempel:

1. Bemærk, at svaret citerer datafiler, der er brugt til at "forankre" svaret
1. Hover over en af disse filnavne - stemmer data med din forespørgsel og det viste svar?

Du ser også en _stats_ række under svaret.

1. Hover over en hvilken som helst meter - f.eks. Safety. Du ser noget som dette
1. Matcher den vurderede bedømmelse din intuition for svarets sikkerhedsniveau?

      ![Data](../../../../../translated_images/da/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Indbygget Observability

Observability handler om at instrumentere din applikation til at generere data, som kan bruges til at forstå, debugge og optimere dens drift. For at få en fornemmelse af dette:

1. Klik på `View Run Info` knappen - du skulle se denne visning. Dette er et eksempel på [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) i aktion. _Du kan også få denne visning ved at klikke på Thread Logs i topmenuen_.

   - Få indsigt i kørselstrin og værktøjer, som agenten anvender
   - Forstå total Token-tælling (vs. output token-brug) for svaret
   - Forstå latenstid og hvor tiden bruges i eksekveringen

      ![Agent](../../../../../translated_images/da/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik på `Metadata` fanen for at se yderligere attributter for kørslen, som kan give brugbar kontekst til debugging af problemer senere.

      ![Agent](../../../../../translated_images/da/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik på `Evaluations` fanen for at se auto-vurderinger foretaget på agentens svar. Disse inkluderer sikkerhedsvurderinger (fx Selvskade) og agentspecifikke vurderinger (fx Intent opløsning, Opgavetilhørighed).

      ![Agent](../../../../../translated_images/da/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Sidst, men ikke mindst, klik på `Monitoring` fanen i sidemenuen.

      - Vælg `Resource usage` fanen på den viste side - og se metrikerne.
      - Følg applikationsbrug mht. omkostninger (tokens) og belastning (requests).
      - Følg applikationslatenstid til første byte (inputbehandling) og sidste byte (output).

      ![Agent](../../../../../translated_images/da/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Miljøvariabler

Indtil nu har vi fulgt udrulningen i browseren - og valideret, at vores infrastruktur er provisioneret og applikationen er operationel. Men for at arbejde _kode-først_ med applikationen, skal vi konfigurere vores lokale udviklingsmiljø med de relevante variabler, der kræves for at arbejde med disse ressourcer. Brug af `azd` gør det nemt.

1. Azure Developer CLI [bruger miljøvariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) til at gemme og administrere konfigurationsindstillinger for applikationsudrulninger.

1. Miljøvariabler gemmes i `.azure/<env-name>/.env` - dette afgrænser dem til det `env-name` miljø, der bruges under udrulning, og hjælper dig med at isolere miljøer mellem forskellige udrulningsmål i samme repo.

1. Miljøvariabler bliver automatisk indlæst af `azd` kommandoen, hver gang en specifik kommando køres (fx `azd up`). Bemærk, at `azd` ikke automatisk læser _OS-niveau_ miljøvariabler (fx sat i shell) - brug i stedet `azd set env` og `azd get env` til at overføre information indenfor scripts.


Lad os prøve et par kommandoer:

1. Få alle miljøvariabler sat for `azd` i dette miljø:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Du ser noget som:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Få en specifik værdi - fx jeg vil gerne vide, om vi satte `AZURE_AI_AGENT_MODEL_NAME` værdien

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Du ser noget som dette - det var ikke sat som standard!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Sæt en ny miljøvariabel for `azd`. Her opdaterer vi agent model navnet. _Bemærk: ændringer foretages straks i `.azure/<env-name>/.env` filen.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nu skulle vi kunne finde værdien sat:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Bemærk, at nogle ressourcer er vedvarende (fx modeludrulninger) og vil kræve mere end bare en `azd up` for at tvinge en ny udrulning. Lad os prøve at fjerne den oprindelige udrulning og udrulle igen med ændrede miljøvariabler.

1. **Opdater** Hvis du tidligere har udrullet infrastruktur ved brug af en azd skabelon - kan du _opdatere_ tilstanden af dine lokale miljøvariabler baseret på den aktuelle tilstand af din Azure-udrulning ved hjælp af denne kommando:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Dette er en kraftfuld måde at _synkronisere_ miljøvariabler på tværs af to eller flere lokale udviklingsmiljøer (f.eks. et team med flere udviklere) - hvilket tillader den deployerede infrastruktur at fungere som den endelige sandhed for tilstanden af miljøvariabler. Teammedlemmer behøver blot at _opdatere_ variabler for at blive synkroniseret igen.

---

## 9. Tillykke 🏆

Du har netop fuldført en arbejdsgang fra start til slut, hvor du:

- [X] Valgte den AZD-skabelon, du ønskede at bruge
- [X] Åbnede skabelonen i et understøttet udviklingsmiljø
- [X] Deployerede skabelonen og bekræftede, at den virker

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->