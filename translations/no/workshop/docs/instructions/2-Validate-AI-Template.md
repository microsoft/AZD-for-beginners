# 2. Valider en mal

!!! tip "PÅ SLUTTEN AV DETTE MODULEN VIL DU KUNNE"

    - [ ] Analysere AI-løsningsarkitekturen
    - [ ] Forstå AZD-deploymentsflyten
    - [ ] Bruke GitHub Copilot for hjelp med AZD-bruk
    - [ ] **Lab 2:** Deployment og validering av AI Agents-mal

---


## 1. Introduksjon

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) eller `azd` er et åpen kildekode kommandolinjeverktøy som effektiviserer utviklerflyten når du bygger og deployerer applikasjoner til Azure.

[AZD-maler](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) er standardiserte repoer som inkluderer eksempelapplikasjonskode, _infrastruktur-som-kode_ ressurser, og `azd` konfigurasjonsfiler for en helhetlig løsningsarkitektur. Å provisjonere infrastrukturen blir så enkelt som en `azd provision`-kommando – mens bruk av `azd up` lar deg provisjonere infrastruktur **og** deployere applikasjonen på en gang!

Som et resultat kan oppstart av applikasjonsutviklingsprosessen være så enkelt som å finne riktig _AZD Starter-mal_ som kommer nærmest dine behov for applikasjon og infrastruktur – og deretter tilpasse repoet til ditt scenario.

Før vi begynner, la oss sørge for at du har Azure Developer CLI installert.

1. Åpne et VS Code-terminalvindu og skriv denne kommandoen:

      ```bash title="" linenums="0"
      azd version
      ```

1. Du bør se noe som dette!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Du er nå klar til å velge og deployere en mal med azd**

---

## 2. Malvalg

Microsoft Foundry-plattformen kommer med et [sett med anbefalte AZD-maler](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) som dekker populære løsningsscenarier som _multi-agent arbeidsflyt automatisering_ og _multi-modal innholdsbehandling_. Du kan også oppdage disse malene ved å besøke Microsoft Foundry-portalen.

1. Besøk [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Logg inn på Microsoft Foundry-portalen når du blir bedt om det – du vil se noe som dette.

![Pick](../../../../../translated_images/no/01-pick-template.60d2d5fff5ebc374.webp)


**Basic**-alternativene er dine startmaler:

1. [ ] [Kom i gang med AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) som deployerer en enkel chatteapplikasjon _med dine data_ til Azure Container Apps. Bruk denne for å utforske et grunnleggende AI-chatbot-scenario.
1. [X] [Kom i gang med AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) som også deployerer en standard AI-agent (med Foundry-agenter). Bruk denne for å bli kjent med agentbaserte AI-løsninger med verktøy og modeller.

Besøk den andre lenken i en ny nettleserfane (eller klikk `Open in GitHub` for det relaterte kortet). Du bør se repoet for denne AZD-malen. Ta et minutt for å utforske README. Applikasjonsarkitekturen ser slik ut:

![Arch](../../../../../translated_images/no/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivering av mal

La oss prøve å deployere denne malen og sikre at den er gyldig. Vi følger retningslinjene i [Kom i gang](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)-seksjonen.

1. Klikk [denne lenken](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) – bekreft standard handling med `Create codespace`
1. Dette åpner en ny nettleserfane – vent til GitHub Codespaces-økten er fullastet
1. Åpne VS Code-terminalen i Codespaces – skriv følgende kommando:

   ```bash title="" linenums="0"
   azd up
   ```

Fullfør arbeidsflytstegene som denne kommandoen utløser:

1. Du vil bli bedt om å logge inn på Azure – følg instruksjonene for autentisering
1. Skriv inn et unikt miljønavn for deg – f.eks. brukte jeg `nitya-mshack-azd`
1. Dette vil lage en `.azure/` mappe – du vil se en undermappe med miljønavnet
1. Du vil bli bedt om å velge et abonnement – velg standard
1. Du vil bli bedt om å velge en lokasjon – bruk `East US 2`

Nå venter du til provisjoneringen er fullført. **Dette tar 10-15 minutter**

1. Når det er ferdig, vil konsollen din vise en SUKSESS-melding som denne:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure-portalen din vil nå ha en provisjonert ressursgruppe med det navnet:

      ![Infra](../../../../../translated_images/no/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Du er nå klar til å validere den deployerte infrastrukturen og applikasjonen**.

---

## 4. Validering av mal

1. Besøk Azure-portalen sin side for [Ressursgrupper](https://portal.azure.com/#browse/resourcegroups) – logg inn når du blir bedt om det
1. Klikk på RG for miljønavnet ditt – du ser siden ovenfor

      - klikk på ressursen Azure Container Apps
      - klikk på Application Url i _Essentials_-seksjonen (øverst til høyre)

1. Du bør se et hostet applikasjonsfrontend som dette:

   ![App](../../../../../translated_images/no/03-test-application.471910da12c3038e.webp)

1. Prøv å stille et par [eksempelspørsmål](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Spør: ```Hva er hovedstaden i Frankrike?``` 
      1. Spør: ```Hva er det beste teltet under 200 dollar for to personer, og hvilke funksjoner har det?```

1. Du bør få svar som ligner på de som vises nedenfor. _Men hvordan fungerer dette?_

      ![App](../../../../../translated_images/no/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validering av agent

Azure Container App deployerer en endepunkt som kobler til AI-agenten som er provisjonert i Microsoft Foundry-prosjektet for denne malen. La oss se nærmere på hva dette betyr.

1. Gå tilbake til Azure Portal sin _Oversikt_-side for ressursgruppen din

1. Klikk på `Microsoft Foundry`-ressursen i listen

1. Du bør se dette. Klikk på knappen `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/no/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Du bør se Foundry-prosjektsiden for AI-applikasjonen din
   ![Project](../../../../../translated_images/no/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klikk på `Agents` – du ser standardagenten som er provisjonert i prosjektet ditt
   ![Agents](../../../../../translated_images/no/06-visit-agents.bccb263f77b00a09.webp)

1. Velg den – og du ser Agent-detaljene. Legg merke til følgende:

      - Agenten bruker File Search som standard (alltid)
      - Agentens `Knowledge` indikerer at den har 32 filer lastet opp (for fil-søk)
      ![Agents](../../../../../translated_images/no/07-view-agent-details.0e049f37f61eae62.webp)

1. Se etter `Data+indexes`-valget i venstremenyen og klikk for detaljer.

      - Du bør se de 32 datafilene lastet opp for kunnskapsgrunnlaget.
      - Disse tilsvarer 12 kunde-filer og 20 produkt-filer under `src/files`
      ![Data](../../../../../translated_images/no/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Du har validert agentens funksjon!**

1. Agentens svar er forankret i kunnskapen i disse filene.
1. Du kan nå stille spørsmål relatert til disse dataene, og få forankrede svar.
1. Eksempel: `customer_info_10.json` beskriver de 3 kjøpene gjort av "Amanda Perez"

Gå tilbake til nettleserfanen med Container App-endepunktet og spør: `Hvilke produkter eier Amanda Perez?`. Du bør se noe som dette:

![Data](../../../../../translated_images/no/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent-lekeplass

La oss bygge litt mer forståelse for Microsoft Foundrys muligheter ved å prøve agenten i Agents Playground.

1. Gå tilbake til `Agents`-siden i Microsoft Foundry – velg standardagenten
1. Klikk på `Try in Playground`-valget – du bør få en Playground-brukerflate som denne
1. Still det samme spørsmålet: `Hvilke produkter eier Amanda Perez?`

    ![Data](../../../../../translated_images/no/09-ask-in-playground.a1b93794f78fa676.webp)

Du får det samme (eller lignende) svaret – men du får også ekstra informasjon som du kan bruke til å forstå kvalitet, kostnad, og ytelse på agentapplikasjonen din. For eksempel:

1. Legg merke til at svaret henviser til datafiler som brukes for å "forankre" svaret
1. Hold musepekeren over noen av disse filnavnene – stemmer dataene med spørsmålet og det viste svaret?

Du ser også en _stats_-rad under svaret.

1. Hold musepekeren over en hvilken som helst måling – f.eks. Safety. Du ser noe slikt
1. Stemmer den vurderte karakteren med din intuisjon for sikkerhetsnivået til svaret?

      ![Data](../../../../../translated_images/no/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Innebygd observabilitet

Observabilitet handler om å instrumentere applikasjonen for å generere data som kan brukes til å forstå, feilsøke og optimalisere driften. For å få en følelse av dette:

1. Klikk på knappen `View Run Info` – du bør se denne visningen. Dette er et eksempel på [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) i praksis. _Du kan også få denne visningen ved å klikke på Thread Logs i toppmenyen_.

   - Få en oversikt over kjøretrinnene og verktøyene agenten benytter
   - Forstå total token-telling (vs. brukte output-tokens) for svaret
   - Forstå ventetiden og hvor tiden brukes i kjøringen

      ![Agent](../../../../../translated_images/no/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klikk på `Metadata`-fanen for å se flere attributter for kjøret som kan gi nyttig kontekst for feilsøking senere

      ![Agent](../../../../../translated_images/no/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klikk på `Evaluations`-fanen for å se automatiske vurderinger gjort på agentsvaret. Disse inkluderer sikkerhetsvurderinger (f.eks. selvskading) og agent-spesifikke evalueringer (f.eks. intensjonsløsning, oppgaveoverholdelse).

      ![Agent](../../../../../translated_images/no/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Sist men ikke minst, klikk på `Monitoring`-fanen i sidefeltmenyen.

      - Velg fanen `Resource usage` på siden som vises – og se på målingene.
      - Følg applikasjonsbruk i form av kostnader (tokens) og belastning (forespørsler).
      - Overvåk applikasjonsforsinkelse til første byte (input-behandling) og siste byte (output).

      ![Agent](../../../../../translated_images/no/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Miljøvariabler

Så langt har vi gått gjennom deployering i nettleseren – og validert at infrastrukturen er provisjonert og applikasjonen kjører. Men for å jobbe med applikasjonskoden _først_, må vi konfigurere vårt lokale utviklingsmiljø med de relevante variablene som trengs for å jobbe med disse ressursene. Bruk av `azd` gjør dette enkelt.

1. Azure Developer CLI [bruker miljøvariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) for å lagre og administrere konfigurasjonsinnstillinger for applikasjonsdeployments.

1. Miljøvariablene lagres i `.azure/<env-name>/.env` – dette avgrenser dem til miljøet `env-name` som brukes under deployering, og hjelper deg med å isolere miljøer mellom ulike deployeringsmål i samme repo.

1. Miljøvariablene blir automatisk lastet av `azd`-kommandoen hver gang en spesifikk kommando kjøres (f.eks. `azd up`). Merk at `azd` ikke automatisk leser _OS-nivå_ miljøvariabler (f.eks. satt i skallet) – bruk heller `azd set env` og `azd get env` for å overføre informasjon i skript.


La oss prøve noen kommandoer:

1. Få alle miljøvariabler satt for `azd` i dette miljøet:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Du ser noe som dette:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Få en spesifikk verdi – f.eks. jeg vil vite om vi har satt verdien `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Du ser noe som dette – det var ikke satt som standard!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Sett en ny miljøvariabel for `azd`. Her oppdaterer vi agent-modellnavnet. _Merk: endringer vil umiddelbart reflekteres i `.azure/<env-name>/.env`-filen.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nå bør vi finne at verdien er satt:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Merk at noen ressurser er vedvarende (f.eks. modelldeployments) og vil kreve mer enn bare en `azd up` for å tvinge redeployment. La oss prøve å rive ned den opprinnelige deployeringen og deployere med endrede miljøvariabler.

1. **Oppdater** Hvis du tidligere har deployert infrastruktur med en azd-mal – kan du _oppdatere_ tilstanden til dine lokale miljøvariabler basert på gjeldende status til din Azure-deployering med denne kommandoen:

      ```bash title="" linenums="0"
      azd env refresh
      ```

Dette er en kraftfull måte å _synkronisere_ miljøvariabler på tvers av to eller flere lokale utviklingsmiljøer (f.eks. et team med flere utviklere) – som lar den distribuerte infrastrukturen fungere som sannhetsgrunnlaget for tilstanden til miljøvariablene. Teammedlemmer kan ganske enkelt _oppdatere_ variablene for å komme i synk.

---

## 9. Gratulerer 🏆

Du har nettopp gjennomført en helhetlig arbeidsflyt hvor du:

- [X] Valgte AZD-malen du ønsket å bruke
- [X] Startet malen med GitHub Codespaces
- [X] Distribuerte malen og validerte at den fungerer

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->