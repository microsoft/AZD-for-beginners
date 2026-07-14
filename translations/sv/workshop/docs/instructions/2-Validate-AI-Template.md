# 2. Validera en Mall

> Validerad mot `azd 1.27.1` i juli 2026.

!!! tip "I SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Analysera AI-lösningens arkitektur
    - [ ] Förstå AZD-distributionsarbetsflödet
    - [ ] Använd GitHub Copilot för hjälp med AZD-användning
    - [ ] **Laboration 2:** Distribuera & Validera AI Agents-mallen

---


## 1. Introduktion

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) eller `azd` är ett open-source kommandoradsverktyg som effektiviserar utvecklarens arbetsflöde vid skapande och distribution av applikationer till Azure.

[AZD-mallar](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) är standardiserade arkiv som inkluderar exempel på applikationskod, _infrastruktur-som-kod_-resurser och `azd` konfigurationsfiler för en sammanhållen lösningsarkitektur. Att tillhandahålla infrastrukturen blir lika enkelt som ett kommando `azd provision` - medan `azd up` låter dig tillhandahålla infrastrukturen **och** distribuera din applikation i ett enda steg!

Som en följd kan start av din applikationsutvecklingsprocess vara lika enkelt som att hitta rätt _AZD Starter mall_ som ligger närmast dina applikations- och infrastruktursbehov – och sedan anpassa arkivet för att passa dina scenariokrav.

Innan vi börjar, låt oss säkerställa att du har Azure Developer CLI installerad.

1. Öppna en terminal i VS Code och skriv denna kommando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Du bör se något liknande detta!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Du är nu redo att välja och distribuera en mall med azd**

---

## 2. Mallval

Microsoft Foundry-plattformen levereras med ett [set av rekommenderade AZD-mallar](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) som täcker populära lösningsscenarier som _multi-agent arbetsflödesautomatisering_ och _multi-modal innehållsbehandling_. Du kan också hitta dessa mallar genom att besöka Microsoft Foundry-portalen.

1. Besök [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Logga in på Microsoft Foundry-portalen när det efterfrågas – du kommer att se något liknande detta.

![Pick](../../../../../translated_images/sv/01-pick-template.60d2d5fff5ebc374.webp)


Alternativen **Basic** är dina startmallar:

1. [ ] [Kom igång med AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) som distribuerar en grundläggande chattapplikation _med dina data_ till Azure Container Apps. Använd detta för att utforska ett grundläggande AI chatbot-scenario.
1. [X] [Kom igång med AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) som också distribuerar en standard AI Agent (med Foundry Agents). Använd detta för att bli bekant med agent-baserade AI-lösningar som involverar verktyg och modeller.

Besök den andra länken i en ny webbläsarflik (eller klicka `Open in GitHub` för relaterat kort). Du bör se arkivet för denna AZD-mall. Ta en minut för att utforska README. Applikationsarkitekturen ser ut så här:

![Arch](../../../../../translated_images/sv/architecture.8cec470ec15c65c7.webp)

---

## 3. Mallaktivering

Låt oss försöka distribuera denna mall och säkerställa att den är giltig. Vi följer riktlinjerna i [Kom igång](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started)-sektionen.

1. Välj en arbetsmiljö för mallarkivet:

      - **GitHub Codespaces**: Klicka på [denna länk](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) och bekräfta `Create codespace`
      - **Lokal kloning eller dev container**: Klona `Azure-Samples/get-started-with-ai-agents` och öppna den i VS Code

1. Vänta tills VS Code-terminalen är klar, skriv sedan följande kommando:

   ```bash title="" linenums="0"
   azd up
   ```

Slutför de arbetsflödessteg som detta kommer att trigga:

1. Du blir ombedd att logga in på Azure - följ instruktionerna för att autentisera
1. Ange ett unikt namn för din miljö - t.ex. jag använde `nitya-mshack-azd`
1. Detta skapar en `.azure/`-mapp - du kommer att se en undermapp med miljönamnet
1. Du ombeds att välja en prenumerationsnamn - välj standard
1. Du ombeds om plats - använd `East US 2`

Nu väntar du på att tillhandahållandet ska slutföras. **Detta tar 10-15 minuter**

1. När det är klart visas ett SUCCESS-meddelande i konsolen som detta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Din Azure Portal kommer nu att ha en tillhandahållen resursgrupp med det miljönamnet:

      ![Infra](../../../../../translated_images/sv/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Du är nu redo att validera den distribuerade infrastrukturen och applikationen**.

---

## 4. Mallvalidering

1. Gå till Azure Portal [Resursgrupper](https://portal.azure.com/#browse/resourcegroups)-sidan - logga in när det efterfrågas
1. Klicka på RG för ditt miljönamn - du ser sidan ovan

      - klicka på Azure Container Apps-resursen
      - klicka på Applikations-URL i avsnittet _Essentials_ (uppe till höger)

1. Du bör se en värd applikations frontend UI som denna:

   ![App](../../../../../translated_images/sv/03-test-application.471910da12c3038e.webp)

1. Försök ställa några [exempelfrågor](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Fråga: ```Vad är huvudstaden i Frankrike?```
      1. Fråga: ```Vilket är det bästa tältet under $200 för två personer och vilka egenskaper har det?```

1. Du bör få svar liknande det som visas nedan. _Men hur fungerar detta?_

      ![App](../../../../../translated_images/sv/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentvalidering

Azure Container App distribuerar en endpoint som ansluter till AI Agenten som tillhandahållits i Microsoft Foundry-projektet för denna mall. Låt oss titta på vad det betyder.

1. Gå tillbaka till Azure Portal _Översikt_-sidan för din resursgrupp

1. Klicka på `Microsoft Foundry`-resursen i listan

1. Du bör se detta. Klicka på knappen `Gå till Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/sv/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Du bör se Foundry projektets sida för din AI-applikation
   ![Project](../../../../../translated_images/sv/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klicka på `Agents` - du ser standardagenten som tillhandahållits i ditt projekt
   ![Agents](../../../../../translated_images/sv/06-visit-agents.bccb263f77b00a09.webp)

1. Välj den - och du ser agentens detaljer. Observera följande:

      - Agenten använder som standard Fil-sökning (alltid)
      - Agentens `Kunskap` anger att den har 32 filer uppladdade (för filsökning)
      ![Agents](../../../../../translated_images/sv/07-view-agent-details.0e049f37f61eae62.webp)

1. Leta efter `Data+indexes`-alternativet i vänstermenyn och klicka för detaljer.

      - Du bör se de 32 datafilerna uppladdade för kunskap.
      - Dessa motsvarar de 12 kundfilerna och 20 produktfiler under `src/files`
      ![Data](../../../../../translated_images/sv/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Du har validerat agentens funktion!**

1. Agentens svar baseras på kunskapen i dessa filer.
1. Du kan nu ställa frågor relaterade till dessa data och få grundade svar.
1. Exempel: `customer_info_10.json` beskriver de 3 köp som gjorts av "Amanda Perez"

Gå tillbaka till webbläsarfliken med Container App-endpointen och fråga: `Vilka produkter äger Amanda Perez?`. Du borde se något liknande detta:

![Data](../../../../../translated_images/sv/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Lekplats

Låt oss bygga lite mer förståelse för Microsoft Foundrys kapabiliteter genom att testa agenten i Agents Lekplats.

1. Gå tillbaka till sidan `Agents` i Microsoft Foundry - välj standardagenten
1. Klicka på alternativet `Prova i lekplats` - du bör få ett lekplatsgränssnitt som detta
1. Ställ samma fråga: `Vilka produkter äger Amanda Perez?`

    ![Data](../../../../../translated_images/sv/09-ask-in-playground.a1b93794f78fa676.webp)

Du får samma (eller liknande) svar - men du får också ytterligare information som du kan använda för att förstå kvalitet, kostnad och prestanda för din agentbaserade app. Till exempel:

1. Observera att svaret citerar datafiler som används för att "grunda" svaret
1. Hovra över någon av dessa filetiketter - stämmer data med din fråga och visade svar?

Du ser också en _statistik_ rad nedanför svaret.

1. Hovra över någon mått - t.ex. Säkerhet. Du ser något liknande detta
1. Stämmer den bedömda betygsättningen med din intuition för svarssäkerheten?

      ![Data](../../../../../translated_images/sv/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Inbyggd Observability

Observability handlar om att instrumentera din applikation för att generera data som kan användas för att förstå, felsöka och optimera dess drift. För att få en känsla för detta:

1. Klicka på knappen `Visa körinformation` - du bör se denna vy. Detta är ett exempel på [Agent-tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) i praktiken. _Du kan också få denna vy genom att klicka på Trådloggar i toppmenyn_.

   - Få en känsla för körsteg och verktyg som agenten engagerat
   - Förstå totalt antal Token (jämfört med utgångs-tokenanvändning) för svaret
   - Förstå latens och var tiden spenderas i exekveringen

      ![Agent](../../../../../translated_images/sv/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klicka på fliken `Metadata` för att se ytterligare attribut för körningen som kan ge användbar kontext för felsökning senare.

      ![Agent](../../../../../translated_images/sv/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klicka på fliken `Utvärderingar` för att se automatiska bedömningar gjort på agentsvaret. Dessa inkluderar säkerhetsutvärderingar (t.ex., Självskada) och agent-specifika utvärderingar (t.ex., Intentlösning, Uppgiftsföljsamhet).

      ![Agent](../../../../../translated_images/sv/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Sist men inte minst, klicka på fliken `Övervakning` i sidomenyn.

      - Välj fliken `Resursanvändning` på den visade sidan - och se mätvärdena.
      - Spåra applikationsanvändning i termer av kostnader (tokens) och belastning (förfrågningar).
      - Spåra applikationslatens till första byte (ingångsbehandling) och sista byte (utgång).

      ![Agent](../../../../../translated_images/sv/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Miljövariabler

Hittills har vi gått igenom distributionen i webbläsaren - och validerat att vår infrastruktur har tillhandahållits och applikationen är operativ. Men för att arbeta med applikationskod _först_, behöver vi konfigurera vår lokala utvecklingsmiljö med relevanta variabler som krävs för att arbeta med dessa resurser. Att använda `azd` gör det enkelt.

1. Azure Developer CLI [använder miljövariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) för att lagra och hantera konfigurationsinställningar för applikationsdistributioner.

1. Miljövariabler lagras i `.azure/<env-name>/.env` - detta avgränsar dem till `env-name` miljön som används under distributionen och hjälper dig att isolera miljöer mellan olika distributionmål i samma arkiv.

1. Miljövariabler laddas automatiskt av `azd`-kommandot när det körs ett specifikt kommando (t.ex., `azd up`). Observera att `azd` inte automatiskt läser _OS-nivå_ miljövariabler (t.ex. inställda i skalet) - använd istället `azd set env` och `azd get env` för att överföra information inom skript.


Låt oss prova några kommandon:

1. Hämta alla miljövariabler som är inställda för `azd` i denna miljö:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Du ser något liknande:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Hämta ett specifikt värde - t.ex. vill jag veta om vi satt värdet `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Du ser något liknande detta - det var inte satt som standard!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Sätt en ny miljövariabel för `azd`. Här uppdaterar vi agentens modellnamn. _Notera: eventuella ändringar som görs reflekteras omedelbart i filen `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nu bör vi hitta att värdet är satt:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Notera att vissa resurser är permanenta (t.ex. modelldistributioner) och kräver mer än bara `azd up` för att tvinga omdistribution. Låt oss försöka ta ner den ursprungliga distributionen och distribuera igen med ändrade env vars.

1. **Uppdatera** Om du tidigare har distribuerat infrastruktur med en azd-mall - kan du _uppdatera_ ditt lokala miljövariabelstatus baserat på det aktuella tillståndet för din Azure-distribution med detta kommando:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Detta är ett kraftfullt sätt att _synkronisera_ miljövariabler mellan två eller flera lokala utvecklingsmiljöer (t.ex. ett team med flera utvecklare) - vilket tillåter den deployade infrastrukturen att fungera som den slutgiltiga sanningen för statusen på miljövariablerna. Teammedlemmar behöver bara _uppdatera_ variablerna för att komma i synk.

---

## 9. Grattis 🏆

Du har just slutfört ett komplett arbetsflöde där du:

- [X] Valde den AZD-mall du vill använda
- [X] Öppnade mallen i en stödd utvecklingsmiljö
- [X] Deployade mallen och verifierade att den fungerar

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->