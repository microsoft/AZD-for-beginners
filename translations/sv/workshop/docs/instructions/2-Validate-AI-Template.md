# 2. Validera en mall

!!! tip "I SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Analysera AI-lösningens arkitektur
    - [ ] Förstå AZD-distributionsflödet
    - [ ] Använd GitHub Copilot för hjälp med att använda AZD
    - [ ] **Lab 2:** Distribuera och validera AI Agents-mallen

---


## 1. Introduktion

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) eller `azd` är ett open-source kommandoradsverktyg som förenklar utvecklingsflödet när du bygger och distribuerar applikationer till Azure. 

[AZD-mallar](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) är standardiserade repositories som inkluderar exempel på applikationskod, _infrastruktur-som-kod_-tillgångar och `azd`-konfigurationsfiler för en sammanhållen lösningsarkitektur. Provisionering av infrastrukturen blir så enkelt som ett `azd provision`-kommando - samtidigt som `azd up` låter dig provisionera infrastrukturen **och** distribuera din applikation på en gång!

Som ett resultat kan du snabbt komma igång med din applikationsutveckling genom att hitta rätt _AZD Starter template_ som ligger närmast dina behov för applikation och infrastruktur - och sedan anpassa repositoryt för att passa dina scenariokrav.

Innan vi börjar, låt oss säkerställa att du har Azure Developer CLI installerat.

1. Öppna en VS Code-terminal och skriv detta kommando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Du bör se något i stil med detta!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Du är nu redo att välja och distribuera en mall med azd**

---

## 2. Mallval

Microsoft Foundry-plattformen levereras med ett [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) som täcker populära lösningsscenarier som _multi-agent workflow automation_ och _multi-modal content processing_. Du kan också upptäcka dessa mallar genom att besöka Microsoft Foundry-portalen.

1. Besök [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Logga in på Microsoft Foundry-portalen när du uppmanas - du kommer att se något i stil med detta.

![Välj](../../../../../translated_images/sv/01-pick-template.60d2d5fff5ebc374.webp)


De **Basic** alternativen är dina startmallar:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) som distribuerar en grundläggande chattapplikation _med dina data_ till Azure Container Apps. Använd detta för att utforska ett grundläggande AI-chattbot-scenario.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) som också distribuerar en standard AI Agent (med Foundry Agents). Använd detta för att bekanta dig med agentbaserade AI-lösningar som involverar verktyg och modeller.

Öppna den andra länken i en ny webbläsarflik (eller klicka `Open in GitHub` för det relaterade kortet). Du bör se repositoryt för denna AZD-mall. Ta en minut att utforska README. Applikationsarkitekturen ser ut så här:

![Arkitektur](../../../../../translated_images/sv/architecture.8cec470ec15c65c7.webp)

---

## 3. Mallaktivering

Låt oss försöka distribuera denna mall och försäkra oss om att den är giltig. Vi följer riktlinjerna i avsnittet [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Klicka på [denna länk](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - bekräfta standardåtgärden att `Create codespace`
1. Detta öppnar en ny webbläsarflik - vänta tills GitHub Codespaces-sessionen har laddat klart
1. Öppna VS Code-terminalen i Codespaces - skriv följande kommando:

   ```bash title="" linenums="0"
   azd up
   ```

Slutför arbetsflödesstegen som detta kommer att utlösa:

1. Du blir ombedd att logga in i Azure - följ instruktionerna för att autentisera
1. Ange ett unikt miljönamn för dig - t.ex., jag använde `nitya-mshack-azd`
1. Detta kommer att skapa en `.azure/`-mapp - du kommer att se en undermapp med miljönamnet
1. Du blir ombedd att välja ett prenumerationsnamn - välj standard
1. Du blir ombedd om en plats - använd `East US 2`

Nu väntar du på att provisioneringen ska slutföras. **Detta tar 10–15 minuter**

1. När det är klart kommer din konsol att visa ett SUCCESS-meddelande som detta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Din Azure Portal kommer nu att ha en provisionerad resursgrupp med det miljönamnet:

      ![Infrastruktur](../../../../../translated_images/sv/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Du är nu redo att validera den distribuerade infrastrukturen och applikationen**.

---

## 4. Mallvalidering

1. Besök Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - logga in när du uppmanas
1. Klicka på RG för ditt miljönamn - du ser sidan ovan

      - klicka på Azure Container Apps-resursen
      - klicka på Application Url i _Essentials_-sektionen (överst till höger)

1. Du bör se ett hostat applikationsfrontend-UI som detta:

   ![Applikation](../../../../../translated_images/sv/03-test-application.471910da12c3038e.webp)

1. Prova att ställa några [exempel frågor](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Ställ: ```Vad är huvudstaden i Frankrike?``` 
      1. Ställ: ```Vilket är det bästa tältet under $200 för två personer, och vilka funktioner har det?```

1. Du bör få svar liknande det som visas nedan. _Men hur fungerar detta?_ 

      ![Applikation](../../../../../translated_images/sv/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentvalidering

Azure Container App distribuerar en endpoint som kopplar till AI Agent som provisionerats i Microsoft Foundry-projektet för denna mall. Låt oss titta på vad det innebär.

1. Återgå till Azure Portal _Overview_-sidan för din resursgrupp

1. Klicka på `Microsoft Foundry`-resursen i den listan

1. Du bör se detta. Klicka på knappen `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/sv/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Du bör se Foundry Project-sidan för din AI-applikation
   ![Projekt](../../../../../translated_images/sv/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klicka på `Agents` - du ser standardagenten som provisionerats i ditt projekt
   ![Agenter](../../../../../translated_images/sv/06-visit-agents.bccb263f77b00a09.webp)

1. Markera den - och du ser Agent-detaljerna. Notera följande:

      - Agenten använder File Search som standard (alltid)
      - Agentens `Knowledge` anger att den har 32 filer uppladdade (för fil-sökning)
      ![Agenter](../../../../../translated_images/sv/07-view-agent-details.0e049f37f61eae62.webp)

1. Leta efter alternativet `Data+indexes` i vänstermenyn och klicka för detaljer. 

      - Du bör se de 32 datafilerna uppladdade för kunskap.
      - Dessa motsvarar de 12 kundfilerna och 20 produktfilerna under `src/files` 
      ![Data](../../../../../translated_images/sv/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Du validerade Agentens funktion!** 

1. Agentens svar är förankrade i kunskapen i dessa filer. 
1. Du kan nu ställa frågor relaterade till den datan och få förankrade svar.
1. Exempel: `customer_info_10.json` beskriver de 3 köp som gjorts av "Amanda Perez"

Återvänd till webbläsarfliken med Container App-endpointen och fråga: `Vilka produkter äger Amanda Perez?`. Du bör se något i stil med detta:

![Data](../../../../../translated_images/sv/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agentens lekplats

Låt oss bygga lite mer intuition för Microsoft Foundrys kapabiliteter genom att testa agenten i Agents Playground. 

1. Återgå till `Agents`-sidan i Microsoft Foundry - markera standardagenten
1. Klicka på alternativet `Try in Playground` - du bör få ett Playground-UI som detta
1. Ställ samma fråga: `Vilka produkter äger Amanda Perez?`

    ![Data](../../../../../translated_images/sv/09-ask-in-playground.a1b93794f78fa676.webp)

Du får samma (eller liknande) svar - men du får också ytterligare information som du kan använda för att förstå kvaliteten, kostnaden och prestandan för din agentbaserade app. Till exempel:

1. Notera att svaret citerar datafiler som användes för att "förankra" svaret
1. Hovra över någon av dessa filetiketter - stämmer datan med din fråga och det visade svaret?

Du ser också en _stats_-rad under svaret. 

1. Hovra över vilken metrik som helst - t.ex. Safety. Du ser något i stil med detta
1. Matchar den bedömda poängen din intuition för svarens säkerhetsnivå?

      ![Data](../../../../../translated_images/sv/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Inbyggd observerbarhet

Observerbarhet handlar om att instrumentera din applikation för att generera data som kan användas för att förstå, felsöka och optimera dess drift. För att få en känsla för detta:

1. Klicka på knappen `View Run Info` - du bör se denna vy. Detta är ett exempel på [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) i aktion. _Du kan också få denna vy genom att klicka Thread Logs i toppnivåmenyn_.

   - Få en känsla för körstegen och vilka verktyg agenten använde
   - Förstå total Token-räkning (vs. utgående tokens användning) för svaret
   - Förstå latenstiden och var tiden spenderas i exekveringen

      ![Agent](../../../../../translated_images/sv/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klicka på fliken `Metadata` för att se ytterligare attribut för körningen, som kan ge användbar kontext för felsökning senare.   

      ![Agent](../../../../../translated_images/sv/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klicka på fliken `Evaluations` för att se auto-bedömningar som gjorts på agentens svar. Dessa inkluderar säkerhetsutvärderingar (t.ex., Self-harm) och agent-specifika utvärderingar (t.ex., Intent resolution, Task adherence).

      ![Agent](../../../../../translated_images/sv/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Sist men inte minst, klicka på fliken `Monitoring` i sidomenyn.

      - Välj fliken `Resource usage` på den visade sidan - och visa mätvärdena.
      - Spåra applikationsanvändning i termer av kostnader (tokens) och belastning (requests).
      - Spåra applikationens latency till första byte (inputbearbetning) och sista byte (output).

      ![Agent](../../../../../translated_images/sv/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Miljövariabler

Hittills har vi gått igenom distributionen i webbläsaren - och validerat att vår infrastruktur är provisionerad och att applikationen fungerar. Men för att arbeta med applikationskoden _code-first_ behöver vi konfigurera vår lokala utvecklingsmiljö med relevanta variabler som krävs för att arbeta med dessa resurser. Att använda `azd` gör det enkelt.

1. Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) för att lagra och hantera konfigurationsinställningar för applikationsdistributionerna.

1. Miljövariabler lagras i `.azure/<env-name>/.env` - detta avgränsar dem till den `env-name`-miljö som användes under distributionen och hjälper dig att isolera miljöer mellan olika distributionsmål i samma repo.

1. Miljövariabler laddas automatiskt av `azd`-kommandot varje gång det kör ett specifikt kommando (t.ex., `azd up`). Notera att `azd` inte automatiskt läser _OS-nivå_ miljövariabler (t.ex., satta i shell) - använd istället `azd set env` och `azd get env` för att överföra information inom skript.


Låt oss prova några kommandon:

1. Hämta alla miljövariabler som är satta för `azd` i denna miljö:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Du ser något i stil med:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Hämta ett specifikt värde - t.ex., jag vill veta om vi satt värdet `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Du ser något i stil med detta - det sattes inte som standard!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Sätt en ny miljövariabel för `azd`. Här uppdaterar vi agentens modellnamn. _Observera: alla ändringar som görs kommer omedelbart att återspeglas i filen `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nu bör vi hitta att värdet är satt:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Observera att vissa resurser är persistenta (t.ex., modelldistributioner) och kommer att kräva mer än bara ett `azd up` för att tvinga omdistribuering. Låt oss försöka riva ner den ursprungliga distributionen och distribuera om med ändrade miljövariabler.

1. **Uppdatera** Om du tidigare har distribuerat infrastruktur med en azd-mall - kan du _refresh_ tillståndet för dina lokala miljövariabler baserat på det nuvarande tillståndet för din Azure-distribution med detta kommando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Detta är ett kraftfullt sätt att _synka_ miljövariabler över två eller fler lokala utvecklingsmiljöer (t.ex. ett team med flera utvecklare) - så att den distribuerade infrastrukturen fungerar som sanningskälla för miljövariablernas tillstånd. Teammedlemmar behöver bara _uppdatera_ variablerna för att komma i synk.

---

## 9. Grattis 🏆

Du har precis slutfört ett slut-till-slut-arbetsflöde där du:

- [X] Valde AZD-mallen du vill använda
- [X] Startade mallen med GitHub Codespaces 
- [X] Distribuerade mallen och verifierade att den fungerar

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Trots att vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller brister. Den ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->