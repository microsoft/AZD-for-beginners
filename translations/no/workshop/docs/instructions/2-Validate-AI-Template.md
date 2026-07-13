# 2. Valider en mal

> Validert mot `azd 1.27.1` i juli 2026.

!!! tip "ETTER DETTE MODULEN VIL DU KUNNE"

    - [ ] Analysere AI-løsningsarkitekturen
    - [ ] Forstå AZD distribusjonsarbeidsflyt
    - [ ] Bruke GitHub Copilot for å få hjelp med AZD-bruk
    - [ ] **Lab 2:** Distribuer og valider AI Agents-malen

---


## 1. Introduksjon

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) eller `azd` er et åpen kildekode kommandolinjeverktøy som effektiviserer utviklerarbeidsflyten når du bygger og distribuerer applikasjoner til Azure.

[AZD-maler](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) er standardiserte repositorier som inkluderer eksempel på applikasjonskode, _infrastruktur-som-kode_-ressurser og `azd` konfigurasjonsfiler for en helhetlig løsningsarkitektur. Å provisjonere infrastrukturen blir så enkelt som en `azd provision` kommando – mens bruk av `azd up` lar deg provisjonere infrastruktur **og** distribuere applikasjonen din i ett slag!

Som en konsekvens kan du raskt starte applikasjonsutviklingen ved å finne riktig _AZD Starter-mal_ som kommer nærmest dine applikasjons- og infrastrukturbehov – og deretter tilpasse repositoriet for å dekke dine scenariokrav.

Før vi begynner, la oss sikre at du har Azure Developer CLI installert.

1. Åpne et VS Code-terminalvindu og skriv denne kommandoen:

      ```bash title="" linenums="0"
      azd version
      ```

1. Du skal se noe som dette!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Du er nå klar til å velge og distribuere en mal med azd**

---

## 2. Malvalg

Microsoft Foundry-plattformen leveres med et [sett med anbefalte AZD-maler](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) som dekker populære løsningsscenarier som _multi-agent arbeidsflytautomatisering_ og _multi-modal innholdsbehandling_. Du kan også finne disse malene ved å besøke Microsoft Foundry-portalen.

1. Besøk [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Logg inn på Microsoft Foundry-portalen når du blir bedt om det – du vil se noe som dette.

![Pick](../../../../../translated_images/no/01-pick-template.60d2d5fff5ebc374.webp)


**Basic**-alternativene er startmalene dine:

1. [ ] [Kom i gang med AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) som distribuerer en enkel chatteapplikasjon _med dine data_ til Azure Container Apps. Bruk denne for å utforske et grunnleggende AI-chatbotscenario.
1. [X] [Kom i gang med AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) som også distribuerer en standard AI Agent (med Foundry Agents). Bruk denne for å bli kjent med agent-baserte AI-løsninger som involverer verktøy og modeller.

Besøk den andre lenken i en ny nettleserfane (eller klikk `Open in GitHub` for det relaterte kortet). Du bør se repositoriet for denne AZD-malen. Ta deg tid til å utforske README-filen. Applikasjonsarkitekturen ser slik ut:

![Arch](../../../../../translated_images/no/architecture.8cec470ec15c65c7.webp)

---

## 3. Malaktivering

La oss prøve å distribuere denne malen og sikre at den er gyldig. Vi følger retningslinjene i [Kom i gang](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)-seksjonen.

1. Velg et arbeidsmiljø for mal-repositoriet:

      - **GitHub Codespaces**: Klikk [denne lenken](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) og bekreft `Create codespace`
      - **Lokal klon eller dev container**: Klon `Azure-Samples/get-started-with-ai-agents` og åpne den i VS Code

1. Vent til VS Code-terminalen er klar, og skriv deretter denne kommandoen:

   ```bash title="" linenums="0"
   azd up
   ```

Fullfør arbeidsflytstegene som denne vil utløse:

1. Du blir bedt om å logge inn på Azure – følg instruksjonene for å autentisere
1. Skriv inn et unikt miljønavn for deg – f.eks. brukte jeg `nitya-mshack-azd`
1. Dette vil opprette en `.azure/`-mappe – du vil se en undermappe med miljønavnet
1. Du blir bedt om å velge et abonnement – velg standard
1. Du blir bedt om å velge en plassering – bruk `East US 2`

Nå venter du på at provisjoneringen fullføres. **Dette tar 10-15 minutter**

1. Når det er gjort, vil konsollen din vise en SUKSESS-melding som denne:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure-portalen din vil nå ha en provisjonert ressursgruppe med det miljønavnet:

      ![Infra](../../../../../translated_images/no/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Du er nå klar til å validere den distribuerte infrastrukturen og applikasjonen**.

---

## 4. Malvalidering

1. Besøk Azure-portalen [Ressursgrupper](https://portal.azure.com/#browse/resourcegroups) siden – logg inn når du blir bedt om det
1. Klikk på RG for miljønavnet ditt – du ser siden ovenfor

      - klikk på Azure Container Apps-ressursen
      - klikk på Applikasjons-URL-en i _Essentials_-seksjonen (øverst til høyre)

1. Du skal se en vert applikasjon med front-end UI som dette:

   ![App](../../../../../translated_images/no/03-test-application.471910da12c3038e.webp)

1. Prøv å stille et par [eksempelspørsmål](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Spør: ```Hva er hovedstaden i Frankrike?```
      1. Spør: ```Hva er det beste teltet under 200 dollar for to personer, og hvilke funksjoner inkluderer det?```

1. Du skal få svar som ligner det som vises nedenfor. _Men hvordan fungerer dette?_

      ![App](../../../../../translated_images/no/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentvalidering

Azure Container App distribuerer et endepunkt som kobler til AI Agent som er provisjonert i Microsoft Foundry-prosjektet for denne malen. La oss se nærmere på hva det betyr.

1. Gå tilbake til Azure-portalen _Oversikt_-siden for ressursgruppen din

1. Klikk på `Microsoft Foundry`-ressursen i den listen

1. Du skal se dette. Klikk på `Go to Microsoft Foundry Portal`-knappen.
   ![Foundry](../../../../../translated_images/no/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Du skal nå se Foundry-prosjektsiden for AI-applikasjonen din
   ![Project](../../../../../translated_images/no/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klikk på `Agents` - du ser standardagenten provisjonert i prosjektet ditt
   ![Agents](../../../../../translated_images/no/06-visit-agents.bccb263f77b00a09.webp)

1. Velg den – og du ser agentdetaljene. Merk følgende:

      - Agenten bruker Fil-søk som standard (alltid)
      - Agentens `Knowledge` viser at den har 32 filer lastet opp (for filsøk)
      ![Agents](../../../../../translated_images/no/07-view-agent-details.0e049f37f61eae62.webp)

1. Se etter alternativet `Data+indexes` i venstremenyen og klikk for detaljer.

      - Du skal se de 32 datafilene lastet opp for kunnskapsgrunnlaget.
      - Disse tilsvarer de 12 kunde-filene og 20 produkt-filene under `src/files`
      ![Data](../../../../../translated_images/no/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Du har validert agentens funksjon!**

1. Agentens svar er fundert i kunnskapen i disse filene.
1. Du kan nå stille spørsmål relatert til disse dataene, og få funderte svar.
1. Eksempel: `customer_info_10.json` beskriver de 3 kjøpene gjort av "Amanda Perez"

Gå tilbake til nettleserfanen med Container App-endepunktet og spør: `Hvilke produkter eier Amanda Perez?`. Du skal se noe som dette:

![Data](../../../../../translated_images/no/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent-lekeplass

La oss bygge litt mer intuisjon for Microsoft Foundrys muligheter ved å teste agenten i Agent Playground.

1. Gå tilbake til `Agents`-siden i Microsoft Foundry – velg standardagenten
1. Klikk på `Try in Playground`-valget – du bør få et Playground UI som dette
1. Still det samme spørsmålet: `Hvilke produkter eier Amanda Perez?`

    ![Data](../../../../../translated_images/no/09-ask-in-playground.a1b93794f78fa676.webp)

Du får samme (eller lignende) svar – men du får også tillegg-informasjon som du kan bruke til å forstå kvalitet, kostnad og ytelse av agent-appen din. For eksempel:

1. Merk at svaret siterer datafiler brukt til å "fundere" svaret
1. Hold musen over noen av disse fil-etikettene – samsvarer dataene med ditt spørsmål og vist svar?

Du ser også en _statistikk_-rad under svaret.

1. Hold musen over en av målingene – f.eks. Safety. Du ser noe som dette
1. Stemmer den vurderte rangeringen med din intuisjon om svarets sikkerhetsnivå?

      ![Data](../../../../../translated_images/no/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Innebygd observabilitet

Observabilitet handler om å instrumentere applikasjonen din for å generere data som kan brukes til å forstå, feilsøke og optimalisere dens operasjoner. For å få en følelse av dette:

1. Klikk på `View Run Info`-knappen – du skal se denne visningen. Dette er et eksempel på [Agent-sporing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) i praksis. _Du kan også få denne visningen ved å klikke på Thread Logs i toppmenyen_.

   - Få en oversikt over kjørestegene og verktøyene agenten brukte
   - Forstå total antall tokens (vs. output tokens bruk) for svaret
   - Forstå latenstiden og hvor tid brukes i utførelsen

      ![Agent](../../../../../translated_images/no/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klikk på `Metadata`-fanen for å se tilleggsegenskaper for kjøringen, som kan gi nyttig kontekst for feilsøking senere.

      ![Agent](../../../../../translated_images/no/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klikk på `Evaluations`-fanen for å se automatiske vurderinger gjort på agentsvaret. Disse inkluderer sikkerhetsevalueringer (f.eks., Selvskading) og agent-spesifikke evalueringer (f.eks., Intensjonsoppklaring, Oppgaveoverholdelse).

      ![Agent](../../../../../translated_images/no/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Sist, men ikke minst, klikk på `Monitoring`-fanen i sidepanelet.

      - Velg `Resource usage`-fanen på siden som vises – og se på målingene.
      - Følg applikasjonsbruk i form av kostnader (tokens) og belastning (forespørsler).
      - Følg applikasjonslatenstid til første byte (inndata behandling) og siste byte (utdata).

      ![Agent](../../../../../translated_images/no/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Miljøvariabler

Så langt har vi gått gjennom distribusjonen i nettleseren – og bekreftet at infrastrukturen er provisjonert og applikasjonen fungerer. Men for å jobbe med applikasjonskoden _først_, må vi konfigurere vårt lokale utviklingsmiljø med relevante variabler som kreves for å jobbe med disse ressursene. Å bruke `azd` gjør dette enkelt.

1. Azure Developer CLI [bruker miljøvariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) til å lagre og administrere konfigurasjonsinnstillinger for applikasjonsdistribusjonene.

1. Miljøvariabler lagres i `.azure/<env-name>/.env` – dette avgrenser dem til det `env-name` miljøet som brukes under distribusjon og hjelper deg å isolere miljøer mellom ulike distribusjonsmål i samme repo.

1. Miljøvariabler lastes automatisk inn av `azd`-kommandoen når den kjører en spesifikk kommando (f.eks., `azd up`). Merk at `azd` ikke automatisk leser _OS-nivås_ miljøvariabler (f.eks., satt i shell) – bruk i stedet `azd set env` og `azd get env` for å overføre informasjon innen skript.


La oss prøve noen kommandoer:

1. Hent alle miljøvariabler satt for `azd` i dette miljøet:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Du ser noe som:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Hent en spesifikk verdi – f.eks., jeg vil vite om vi har satt `AZURE_AI_AGENT_MODEL_NAME`-verdien

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Du ser noe som dette – den var ikke satt som standard!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Sett en ny miljøvariabel for `azd`. Her oppdaterer vi agentmodellens navn. _Merk: eventuelle endringer vil umiddelbart gjenspeiles i `.azure/<env-name>/.env`-filen.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nå skal vi finne at verdien er satt:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Merk at noen ressurser er vedvarende (f.eks., modellutplasseringer) og vil kreve mer enn bare en `azd up` for å tvinge om-distribusjon. La oss prøve å rive ned den opprinnelige distribusjonen og distribuere på nytt med endrede miljøvariabler.

1. **Oppdater** Hvis du tidligere har distribuert infrastruktur med en azd-mal – kan du _oppdatere_ tilstanden til dine lokale miljøvariabler basert på nåværende tilstand av din Azure-distribusjon med denne kommandoen:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Dette er en kraftfull måte å _synkronisere_ miljøvariabler på tvers av to eller flere lokale utviklingsmiljøer (f.eks. team med flere utviklere) - som lar den distribuerte infrastrukturen fungere som sannheten for tilstanden til miljøvariablene. Teammedlemmer kan enkelt _oppdatere_ variablene for å komme i synk.

---

## 9. Gratulerer 🏆

Du har nettopp fullført en helhetlig arbeidsflyt der du:

- [X] Valgte AZD-malen du ønsker å bruke
- [X] Åpnet malen i et støttet utviklingsmiljø
- [X] Distribuerte malen og bekreftet at den fungerer

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->