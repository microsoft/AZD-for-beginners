# 2. Valider en mal

> Validert mot `azd 1.25.6` i juni 2026.

!!! tip "PÅ SLUTTEN AV DETTE MODULEN VIL DU KUNNE"

    - [ ] Analysere AI-løsningsarkitekturen
    - [ ] Forstå AZD-distribusjonsarbeidsflyten
    - [ ] Bruke GitHub Copilot for å få hjelp med AZD-bruk
    - [ ] **Lab 2:** Distribuere og validere AI Agents-malen

---


## 1. Introduksjon

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) eller `azd` er et åpen kildekode kommandolinjeverktøy som strømlinjeformer utviklerarbeidsflyten ved bygging og distribusjon av applikasjoner til Azure.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) er standardiserte depot som inkluderer eksempelapplikasjonskode, _infrastruktur-som-kode_-ressurser, og `azd` konfigurasjonsfiler for en sammenhengende løsningsarkitektur. Å provisjonere infrastrukturen blir så enkelt som en `azd provision`-kommando – mens bruk av `azd up` lar deg provisjonere infrastruktur **og** distribuere applikasjonen din i én operasjon!

Som et resultat kan det å komme i gang med applikasjonsutviklingsprosessen være så enkelt som å finne den riktige _AZD Starter-malen_ som kommer nærmest dine applikasjons- og infrastrukturbehov – deretter tilpasse depotet til dine scenariospesifikke krav.

Før vi begynner, la oss forsikre oss om at du har Azure Developer CLI installert.

1. Åpne et VS Code-terminalvindu og skriv denne kommandoen:

      ```bash title="" linenums="0"
      azd version
      ```

1. Du bør se noe slikt!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Du er nå klar til å velge og distribuere en mal med azd**

---

## 2. Malvalg

Microsoft Foundry-plattformen kommer med et [sett anbefalte AZD-maler](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) som dekker populære løsningsscenarier som _multi-agent arbeidsflytautomatisering_ og _multi-modalt innholdsbehandling_. Du kan også finne disse malene ved å besøke Microsoft Foundry-portalen.

1. Besøk [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Logg inn i Microsoft Foundry-portalen når du blir bedt om det – du vil se noe slikt.

![Pick](../../../../../translated_images/no/01-pick-template.60d2d5fff5ebc374.webp)


**Basic**-alternativene er startmalene dine:

1. [ ] [Kom i gang med AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) som distribuerer en enkel chatteapplikasjon _med dine data_ til Azure Container Apps. Bruk dette til å utforske et grunnleggende AI chattebotscenario.
1. [X] [Kom i gang med AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) som også distribuerer en standard AI Agent (med Foundry Agents). Bruk dette for å bli kjent med agent-baserte AI-løsninger som involverer verktøy og modeller.

Besøk den andre lenken i en ny nettleserfane (eller klikk `Open in GitHub` for det relaterte kortet). Du burde se depotet for denne AZD-malen. Ta et minutt til å utforske README. Applikasjonsarkitekturen ser slik ut:

![Arch](../../../../../translated_images/no/architecture.8cec470ec15c65c7.webp)

---

## 3. Malaktivering

La oss prøve å distribuere denne malen og forsikre oss om at den er gyldig. Vi følger retningslinjene i [Kom i gang](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)-seksjonen.

1. Velg et arbeidsmiljø for maldepotet:

      - **GitHub Codespaces**: Klikk [denne lenken](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) og bekreft `Create codespace`
      - **Lokal kloning eller utviklingscontainer**: Klon `Azure-Samples/get-started-with-ai-agents` og åpne det i VS Code

1. Vent til VS Code-terminalen er klar, og skriv deretter denne kommandoen:

   ```bash title="" linenums="0"
   azd up
   ```

Fullfør arbeidsflyttrinnene som dette vil trigge:

1. Du blir bedt om å logge inn på Azure – følg instruksjonene for autentisering
1. Skriv inn et unikt miljønavn for deg – f.eks. jeg brukte `nitya-mshack-azd`
1. Dette vil opprette en `.azure/`-mappe – du vil se en undermappe med miljønavnet
1. Du blir bedt om å velge et abonnement – velg standard
1. Du blir bedt om plassering – bruk `East US 2`

Nå venter du på at provisjoneringen skal fullføres. **Dette tar 10-15 minutter**

1. Når det er ferdig, vil konsollen vise en SUKSESS-melding som dette:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Din Azure Portal vil nå ha en opprettet ressursgruppe med det miljønavnet:

      ![Infra](../../../../../translated_images/no/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Du er nå klar til å validere den distribuerte infrastrukturen og applikasjonen**.

---

## 4. Malvalidering

1. Besøk Azure Portal [Ressursgrupper](https://portal.azure.com/#browse/resourcegroups)-side – logg inn når du blir bedt om det
1. Klikk på RG for miljønavnet ditt – du ser siden ovenfor

      - klikk på Azure Container Apps-ressursen
      - klikk på Applikasjons-URL-en i _Essentials_-seksjonen (øverst til høyre)

1. Du bør se en hostet applikasjons front-end UI som dette:

   ![App](../../../../../translated_images/no/03-test-application.471910da12c3038e.webp)

1. Prøv å stille et par [eksempelspørsmål](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Spør: ```Hva er hovedstaden i Frankrike?``` 
      1. Spør: ```Hva er det beste teltet under $200 for to personer, og hvilke funksjoner har det?```

1. Du bør få svar som ligner på det som vises nedenfor. _Men hvordan fungerer dette?_ 

      ![App](../../../../../translated_images/no/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentvalidering

Azure Container App distribuerer et endepunkt som kobler til AI Agent provisioned i Microsoft Foundry-prosjektet for denne malen. La oss ta en titt på hva det betyr.

1. Gå tilbake til Azure Portal _Oversikt_-siden for ressursgruppen din

1. Klikk på `Microsoft Foundry`-ressursen i den listen

1. Du bør se dette. Klikk på knappen `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/no/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Du bør se Foundry-prosjektsiden for AI-applikasjonen din
   ![Project](../../../../../translated_images/no/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klikk på `Agents` – du ser standardsagenten opprettet i prosjektet ditt
   ![Agents](../../../../../translated_images/no/06-visit-agents.bccb263f77b00a09.webp)

1. Velg den – og du ser agentdetaljene. Merk følgende:

      - Agenten bruker File Search som standard (alltid)
      - Agentens `Knowledge` indikerer at den har 32 filer lastet opp (for søk i filer)
      ![Agents](../../../../../translated_images/no/07-view-agent-details.0e049f37f61eae62.webp)

1. Se etter `Data+indexes`-alternativet i venstremenyen og klikk for detaljer.

      - Du bør se de 32 datafilene lastet opp for kunnskap.
      - Disse tilsvarer de 12 kunde-filene og 20 produktfilene under `src/files` 
      ![Data](../../../../../translated_images/no/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Du validerte agentdrift!** 

1. Agentens svar er basert på kunnskapen i disse filene. 
1. Du kan nå stille spørsmål relatert til disse dataene, og få svar med grunnlag.
1. Eksempel: `customer_info_10.json` beskriver de 3 kjøpene gjort av "Amanda Perez"

Gå tilbake til nettleserfanen med Container App-endepunktet og spør: `Hvilke produkter eier Amanda Perez?`. Du bør se noe sånt:

![Data](../../../../../translated_images/no/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent-lekeplass

La oss bygge litt mer intuisjon for mulighetene i Microsoft Foundry, ved å prøve Agenten i Agents Playground.

1. Gå tilbake til `Agents`-siden i Microsoft Foundry – velg standardagenten
1. Klikk på `Try in Playground`-alternativet – du bør få en Playground UI som denne
1. Still det samme spørsmålet: `Hvilke produkter eier Amanda Perez?`

    ![Data](../../../../../translated_images/no/09-ask-in-playground.a1b93794f78fa676.webp)

Du får det samme (eller lignende) svaret – men du får også tilleggsinformasjon som du kan bruke til å forstå kvaliteten, kostnaden og ytelsen til agentapplikasjonen din. For eksempel:

1. Merk at svaret henviser til datafiler som brukes for å "grunnfeste" svaret
1. Hold musen over noen av disse filetikettene – stemmer dataene med spørsmålet og det viste svaret?

Du ser også en _statistikk_-rad under svaret.

1. Hold musen over en hvilken som helst metrikk – f.eks. Safety. Du ser noe sånt
1. Stemmer den vurderte rangeringen med din intuisjon om sikkerhetsnivået i svaret?

      ![Data](../../../../../translated_images/no/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Innebygd observabilitet

Observabilitet handler om å instrumentere applikasjonen din for å generere data som kan brukes til å forstå, feilsøke og optimalisere driften. For å få en følelse av dette:

1. Klikk på `View Run Info`-knappen – du bør se denne visningen. Dette er et eksempel på [Agent-sporing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) i aksjon. _Du kan også få opp denne visningen ved å klikke på Thread Logs i toppnivåmenyen_.

   - Få en forståelse for kjørestrinnene og verktøyene agenten brukte
   - Forstå totalt antall tokens (vs. bruk av output tokens) for responsen
   - Forstå ventetid og hvor tiden brukes i eksekveringen

      ![Agent](../../../../../translated_images/no/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klikk på `Metadata`-fanen for å se tilleggsattributter for kjøringen, som kan gi nyttig kontekst ved feilsøking senere.

      ![Agent](../../../../../translated_images/no/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klikk på `Evaluations`-fanen for å se egenvurderinger gjort på agentrsporsen. Disse inkluderer sikkerhetsvurderinger (f.eks., selvskading) og agent-spesifikke vurderinger (f.eks., intensjonsløsning, oppgaveoverholdelse).

      ![Agent](../../../../../translated_images/no/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Sist men ikke minst, klikk på `Monitoring`-fanen i sidepanelet.

      - Velg `Resource usage`-fanen på siden som vises – og se på målingene.
      - Spor applikasjonsbruk i form av kostnader (tokens) og belastning (forespørsler).
      - Spor applikasjonsforsinkelse til første byte (inngangsbehandling) og siste byte (utgang).

      ![Agent](../../../../../translated_images/no/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Miljøvariabler

Så langt har vi gått gjennom distribusjonen i nettleseren – og validert at infrastrukturen vår er provisjonert og applikasjonen er operasjonell. Men for å jobbe med applikasjonskoden _først_, må vi konfigurere vårt lokale utviklingsmiljø med relevante variabler som kreves for å jobbe med disse ressursene. Bruk av `azd` gjør dette enkelt.

1. Azure Developer CLI [bruker miljøvariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) for å lagre og administrere konfigurasjonsinnstillinger for applikasjonsdistribusjoner.

1. Miljøvariabler lagres i `.azure/<env-name>/.env` – dette begrenser dem til miljøet `env-name` som ble brukt under distribusjon og hjelper deg å isolere miljøer mellom forskjellige distribusjonsmål i det samme depotet.

1. Miljøvariabler lastes automatisk av `azd`-kommandoen hver gang den kjører en spesifikk kommando (f.eks. `azd up`). Merk at `azd` ikke automatisk leser _operativsystem-nivå_ miljøvariabler (f.eks. satt i shell) – i stedet bruker du `azd set env` og `azd get env` for å overføre informasjon innad i skript.

La oss prøve noen kommandoer:

1. Hent alle miljøvariabler satt for `azd` i dette miljøet:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Du ser noe slik:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Hent en spesifikk verdi – f.eks. jeg vil vite om vi har satt `AZURE_AI_AGENT_MODEL_NAME`-verdien

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Du ser noe slikt – det var ikke satt som standard!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Sett en ny miljøvariabel for `azd`. Her oppdaterer vi agentmodellnavnet. _Merk: eventuelle endringer gjøres umiddelbart i `.azure/<env-name>/.env`-filen.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nå bør vi finne at verdien er satt:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Merk at noen ressurser er persistente (f.eks. modellutplasseringer) og krever mer enn bare en `azd up` for å tvinge ny distribusjon. La oss prøve å rive ned den opprinnelige distribusjonen og distribuere på nytt med endrede miljøvariabler.

1. **Oppdater** Hvis du tidligere har distribuert infrastruktur med en azd-mal – kan du _oppdatere_ tilstanden for dine lokale miljøvariabler basert på den nåværende tilstanden i din Azure-distribusjon med denne kommandoen:

      ```bash title="" linenums="0"
      azd env refresh
      ```

Dette er en kraftig måte å _synkronisere_ miljøvariabler på tvers av to eller flere lokale utviklingsmiljøer (f.eks. team med flere utviklere) – slik at den distribuerte infrastrukturen fungerer som sannhetsgrunnlaget for tilstanden til miljøvariablene. Teammedlemmer kan enkelt _oppdatere_ variabler for å komme tilbake i synk.

---

## 9. Gratulerer 🏆

Du har nettopp fullført en ende-til-ende arbeidsflyt hvor du:

- [X] Valgte AZD-malen du ønsker å bruke
- [X] Åpnet malen i et støttet utviklingsmiljø
- [X] Distribuerte malen og bekreftet at den fungerer

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->