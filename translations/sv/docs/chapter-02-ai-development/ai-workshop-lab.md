# AI Workshop Lab: Göra Dina AI-lösningar Azure Developer CLI-distribuerbara

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-Först Utveckling
- **⬅️ Föregående**: [Distribution av AI-modell](ai-model-deployment.md)
- **➡️ Nästa**: [Bästa praxis för produktion av AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Workshopöversikt

Denna praktiska labb guidar utvecklare genom processen att ta en befintlig AI-mall och distribuera den med hjälp av Azure Developer CLI (AZD). Du lär dig viktiga mönster för produktionsdistribution av AI med Microsoft Foundry-tjänster.

> **Releasegranskning (2026-11-04):** AZD-kommandovägledning och exempel på konfigurationsnamn kontrollerades mot `azd` `1.37.2`-releasen och den länkade exempelns aktuella konfiguration. Detta är en dokumentationsgranskning, inte en validering av live-distribution. RAG-labbet kräver inte agenttillägget; för agentutvärderingar, använd det separata `azure.ai.evaluations`-tillägget och [aktuell utvärderingsarbetsflöde](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), inte äldre agentutvärderingskommandon.

**Varaktighet:** 2-3 timmar  
**Nivå:** Mellannivå  
**Förkunskaper:** Grundläggande Azure-kunskaper, bekantskap med AI/ML-koncept

## 🎓 Inlärningsmål

Vid slutet av denna workshop kommer du att kunna:
- ✅ Utforska en befintlig AI AZD-mall och planera konvertering av din egen applikation
- ✅ Konfigurera Microsoft Foundry-tjänster med AZD
- ✅ Implementera säker hantering av behörigheter för AI-tjänster
- ✅ Distribuera en AI-referensapplikation med övervakning
- ✅ Felsöka vanliga AI-distributionsproblem

## Förkunskaper

### Nödvändiga Verktyg
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installerat
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installerat
- [Git](https://git-scm.com/) installerat
- Kodredigerare (rekommenderas VS Code)

Dessa kommandoblock använder Bash-syntax (inklusive radavbrott och `grep`). På Windows, använd Git Bash/WSL eller översätt dem till PowerShell. Installera också språk-, paket- och containerverktygen som listas i [exempelets lokala miljöinställning](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure-resurser
- Azure-prenumeration med behörighet för resursprovisionering och rolltilldelning (endast Contributor kan inte skapa RBAC-tilldelningar; använd en auktoriserad rolladministratör eller exempels dokumenterade motsvarighet)
- Tillgång till Microsoft Foundry Models-tjänster (eller möjlighet att begära tillgång)
- Behörighet att skapa resursgrupp

### Kunskapsförkunskaper
- Grundläggande förståelse för Azure-tjänster
- Bekantskap med kommandoradsgränssnitt
- Grundläggande AI/ML-koncept (API:er, modeller, uppmaningar)

## Lab Setup

### Steg 1: Miljöförberedelse

1. **Verifiera verktygsinstallationer:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Om du arbetar över flera tenants eller din prenumeration inte upptäcks automatiskt, försök igen med `azd auth login --tenant-id <tenant-id>`.

2. **Klona workshop-förvaret:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Förstå AZD-strukturen för AI-applikationer

### Anatomi av en AI AZD-mall

Utforska nyckelfiler i en AI-redo AZD-mall:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Det utcheckade exemplet kan förändras; `.azure/` visas efter miljöinitiering, inte nödvändigtvis i en färsk klon. Granska den faktiska utcheckningen istället för att skapa saknade kataloger för att matcha denna schematisk.

### **Labövning 1.1: Utforska konfigurationen**

1. **Granska azure.yaml-filen:**
```bash
cat azure.yaml
```

**Vad du ska leta efter:**
- Tjänstedefinitioner för AI-komponenter
- Miljövariabelmappningar
- Hostkonfigurationer

2. **Granska main.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Viktiga AI-mönster att identifiera:**
- Provisionering av Microsoft Foundry Models-tjänst
- Azure AI Search-integration
- Säker nyckelhantering
- Nätverkssäkerhetskonfigurationer

### **Diskussionspunkt:** Varför dessa mönster är viktiga för AI

- **Tjänsteberoenden**: AI-appar kräver ofta flera koordinerade tjänster
- **Säkerhet**: API-nycklar och endpoints kräver säker hantering
- **Skalbarhet**: AI-arbetsbelastningar har unika skalningskrav
- **Kostnadshantering**: AI-tjänster kan bli kostsamma om de inte konfigureras korrekt

## Modul 2: Distribuera din första AI-applikation

### Steg 2.1: Initialisera miljön

1. **Skapa en ny AZD-miljö:**
```bash
azd env new myai-workshop
```

2. **Ange nödvändiga parametrar:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Steg 2.2: Distribuera infrastrukturen och applikationen

1. **Distribuera med AZD:**
```bash
azd up
```

**Vad som händer under `azd up`:**
- ✅ Provisionerar Microsoft Foundry Models-tjänsten
- ✅ Skapar Azure AI Search-tjänsten
- ✅ Sätter upp Azure Container Apps för backend och sammanbunden frontend (nuvarande standard i exemplet)
- ✅ Konfigurerar nätverk och säkerhet
- ✅ Distribuerar applikationskod
- ✅ Sätter upp övervakning och loggning

2. **Övervaka distributionsprocessen** och notera vilka resurser som skapas.

### Steg 2.3: Verifiera din distribution

1. **Granska de distribuerade resurserna:**
```bash
azd show
```

2. **Öppna den distribuerade applikationen:**
```bash
azd show
```

Öppna webbadressen som visas i `azd show`-utdata.

3. **Testa AI-funktionaliteten:**
   - Navigera till webbapplikationen
   - Prova exempel på frågor
   - Bekräfta att AI-svar fungerar

### **Labövning 2.1: Felsökningsövning**

**Scenario**: Din distribution lyckades men AI:n svarar inte.

**Vanliga problem att kontrollera:**
1. **Autentisering**: Verifiera managed identity och rolltilldelningar; kontrollera API-nycklar endast om du medvetet aktiverat nyckelbaserad autentisering
2. **Modelltillgänglighet**: Kontrollera om din region stöder modellen
3. **Nätverksanslutning**: Säkerställ att tjänster kan kommunicera
4. **RBAC-behörigheter**: Verifiera att appen kan nå OpenAI

**Felsökningskommandon:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Anpassa AI-applikationer efter dina behov

### Steg 3.1: Modifiera AI-konfigurationen

1. **Uppdatera OpenAI-modellen:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Lägg till ytterligare AI-tjänster:**

Redigera `infra/main.bicep` för att lägga till Document Intelligence:

Följande är ett illustrativt fragment, inte en komplett mall. Exemplet kan redan provisionera dokumentbearbetningstjänster: inspektera dess nuvarande infrastruktur innan du lägger till dubbla resurser. Anpassade tillägg kräver att koppla ihop utdata, identiteter och applikationskonfiguration.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Steg 3.2: Miljöspecifika konfigurationer

**Bästa praxis**: Olika konfigurationer för utveckling och produktion.

1. **Skapa en produktionsmiljö:**
```bash
azd env new myai-production
```

2. **Ange produktionsspecifika parametrar:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Dessa namn kommer från exempels [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json). `azd env set` lagrar ett värde men gör det inte effektivt som en godtycklig variabel: mallen måste konsumera det. Granska exempels [network isolation guide](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) före inaktivering av offentlig åtkomst och använd `azd up` för att tillämpa infrastrukturförändringar. OpenAI SKU `S0` avgör inte ensam modellens genomströmning; modellens distributionstyp och kapacitet spelar också roll.

### **Labövning 3.1: Kostnadsoptimering**

**Utmaning**: Konfigurera mallen för kostnadseffektiv utveckling.

**Uppgifter:**
1. Välj den disponibla workshop-miljön: `azd env select myai-workshop`.
2. Anteckna nuvarande Search SKU och modellkapacitet från `infra/main.parameters.json` och den valda miljön.
3. Använd de stödjade indata nedan, efter att ha bekräftat modell-/regionkvot:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Verifiera Search SKU och distributionskapacitet i portalen och uppskatta skillnaden med prisberäknaren. Förvänta dig inte att faktureringsdata uppdateras direkt.

**Framgångskriterier:** Search använder Basic, chattdistributionen har den begärda stödjande kapaciteten, och appen svarar fortfarande på en exempel-fråga. Kapacitet `10` är en hastighetsbegränsningsallokering, inte en tokenprissänkning. Ändringar i Search-nivå kan vara begränsade eller kräva omedelbar återuppbyggnad; experimentera inte på produktionsresurser. F0 är tjänstespecifik och är inte en Azure OpenAI-modell SKU.

## Modul 4: Säkerhet och bästa praxis för produktion

### Steg 4.1: Säker hantering av behörigheter

**Aktuell utmaning**: Många AI-appar hårdkodar API-nycklar eller använder osäker lagring.

**AZD-lösning**: Managed Identity + Key Vault-integration.

1. **Granska säkerhetskonfigurationen i din mall:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifiera att Managed Identity fungerar:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Steg 4.2: Nätverkssäkerhet

1. **Aktivera privata endpoints** med exempelets stödjande nätverkskonfiguration (om inte redan konfigurerad).

För din egen mall visar detta illustrativa fragment OpenAI-endpointanslutningen. Den behöver också VNet, privat DNS-konfiguration och applikationsanslutning; klistra inte in det oförändrat i exemplet, som redan har moduler för privata endpoints:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Steg 4.3: Övervakning och observerbarhet

1. **Konfigurera Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Aktivera exempelets Application Insights-integration:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Exempelets instrumentation sänder telemetri; en godtycklig `OPENAI_MONITOR_ENABLED`-inställning aktiverar inte AI-mått. Granska spår för modellanrop, latens, fel och tokenanvändning, och undvik att spela in känsliga uppmaningar eller svar.

### **Labövning 4.1: Säkerhetsrevision**

**Uppgift**: Granska din distribution för säkerhetens bästa praxis.

**Checklista:**
- [ ] Inga hårdkodade hemligheter i kod eller konfiguration
- [ ] Managed Identity används för tjänst-till-tjänst autentisering
- [ ] Key Vault lagrar känslig konfiguration
- [ ] Nätverksåtkomst är korrekt begränsad
- [ ] Övervakning och loggning är aktiverade

## Modul 5: Konvertera din egen AI-applikation

### Steg 5.1: Utvärderingsformulär

**Innan du konverterar din app**, svara på dessa frågor:

1. **Applikationsarkitektur:**
   - Vilka AI-tjänster använder din app?
   - Vilka beräkningsresurser behöver den?
   - Kräver den en databas?
   - Vilka beroenden finns mellan tjänsterna?

2. **Säkerhetskrav:**
   - Vilka känsliga uppgifter hanterar din app?
   - Vilka efterlevnadskrav gäller?
   - Behöver du privat nätverk?

3. **Skalningskrav:**
   - Vad är din förväntade belastning?
   - Behöver du autoskalning?
   - Finns regionala krav?

### Steg 5.2: Skapa din AZD-mall

**Följ detta mönster för att konvertera din app:**

**Endast skal:** Detta avsnitt innehåller inte API/webbapplikationskod, hostinfrastruktur, modelldistributioner, identiteter/RBAC eller ett färdigt `main.parameters.json`. Resursgruppsskopad Bicep illustrerar modulkomposition; en typisk AZD-prenumerationsskopad startpunkt måste skapa en resursgrupp och anropa den i detta scope. Förvänta dig inte att `azd up` distribuerar en komplett app efter att bara ha kopierat dessa fragment. För en körbar baseline, fortsätt använda RAG-mallen från Modul 1.

1. **Skapa grundstrukturen:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Skapa azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Skapa infrastruktursmallar:**

**infra/main.bicep** - Huvudmall:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI-modul:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Labövning 5.1: Mallskapandeutmaning**

**Utmaning**: Skapa en AZD-mall för en AI-app för dokumenthantering.

**Krav:**
- Microsoft Foundry Models för innehållsanalys
- Document Intelligence för OCR
- Storage Account för dokumentuppladdningar
- Function App för bearbetningslogik
- Webbapp för användargränssnitt

**Bonuspoäng:**
- Lägg till korrekt felhantering
- Inkludera kostnadsuppskattning
- Sätt upp övervakningsinstrumentpaneler

## Modul 6: Felsökning av vanliga problem

### Vanliga distributionsproblem

#### Problem 1: Överskriden OpenAI-tjänstkvot
**Symptom:** Distribution misslyckas med kvotfel
**Lösningar:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell inte tillgänglig i regionen
**Symptom:** AI-svar misslyckas eller modellens distributionsfel
**Lösningar:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problem 3: Behörighetsproblem
**Symptom:** 403 Förbjudet-fel vid anrop till AI-tjänster
**Lösningar:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Prestandaproblem

#### Problem 4: Långa AI-svarstider
**Undersökningssteg:**
1. Kontrollera Application Insights för prestandamått
2. Granska OpenAI-tjänstmått i Azure-portalen
3. Verifiera nätverksanslutning och latens

**Lösningar:**
- Implementera caching för vanliga frågor
- Använd lämplig OpenAI-modell för ditt användningsfall
- Skala applikationsrepliker först efter kontroll av modellens RPM/TPM-gränser; Azure OpenAI-distributioner exponerar inte en generell databasliknande "read replica"-inställning

### **Labövning 6.1: Felsökningsutmaning**

**Scenario**: Din distribution lyckades, men applikationen returnerar 500-fel.

**Felsökningsuppgifter:**
1. Kontrollera applikationsloggar
2. Verifiera tjänstekoppling
3. Testa autentisering
4. Granska konfiguration

**Verktyg att använda:**
- `azd show` för översikt av distribution
- Azure-portalen för detaljerade tjänsteloggar
- Application Insights för applikationstelemetri

## Modul 7: Övervakning och optimering

### Steg 7.1: Ställ in omfattande övervakning

1. **Skapa anpassade instrumentpaneler:**

Navigera till Azure-portalen och skapa en instrumentpanel med:
- Antal och latens för OpenAI-förfrågningar
- Applikationsfelräntor
- Resursanvändning
- Kostnadsspårning

2. **Ställ in varningar:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Kontrollera att komponenten sänder förfrågnings-telemetri och lägg till en åtgärdsgrupp om aviseringar krävs. Metriken är en räkning, inte en felprocent; en räntevarning kräver en lämplig fråga och nämnare.

### Steg 7.2: Kostnadsoptimering

1. **Analysera nuvarande kostnader:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Ersätt datumplatshållare. Konsumtions-API-stöd varierar beroende på faktureringsavtal; använd Kostnadshantering i portalen om användningsdetaljer inte finns tillgängliga. Kostnader är fördröjda, inte ett realtids-testorakel.

2. **Implementera kostnadskontroller:**
- Ställ in budgetvarningar
- Använd autoskalningspolicyer
- Implementera cachning av förfrågningar
- Övervaka tokenanvändning för OpenAI

### **Labövning 7.1: Prestandaoptimering**

**Uppgift**: Optimera din AI-applikation för både prestanda och kostnad.

**Mått att förbättra:**
- Minska genomsnittlig svarstid med 20%
- Minska månadskostnader med 15%
- Definiera en 99,9% tillgänglighets-SLO och ett mätningsfönster (en kort övning kan inte visa månatlig drifttid)

**Strategier att prova:**
- Implementera svarscachning
- Optimera promptar för tokeleffektivitet
- Använd lämpliga beräknings-SKU:er
- Ställ in korrekt autoskalning

## Slututmaning: Helhetsimplementering

### Utmaningsscenario

Detta är en **valfri arkitektur-/designutmaning**, inte en given körbar övning eller en produktionscertifiering. Föreslå en AI-driven kundservicechatbot och dokumentera vilka krav som behöver ytterligare implementering och bevis:

**Funktionskrav:**
- Webbgränssnitt för kundinteraktioner
- Integration med Microsoft Foundry-modeller för svar
- Dokumentsökningsfunktion med Azure AI Search
- Integration med befintlig kunddatabas
- Flerspråkigt stöd

**Icke-funktionella krav:**
- Hantera 1000 samtidiga användare
- 99,9% drifttid SLA
- SOC 2-efterlevnad
- Kostnad under 500 $/månad
- Distribuera till flera miljöer (dev, staging, prod)

Detta är hypotetiska intressentbegränsningar, inte samtidigt garanterade utfall. Definiera förfrågningsfrekvens, prompt-/utdata storlekar och sessionslängd innan kostnader uppskattas; 1000 samtidiga användare fastställer inte en arbetsbelastning eller bevisar att en budget på 500 $ är möjlig. SOC 2 är ett organisatoriskt revisionsutfall, inte en brytare aktiverad av en AZD-mall. Identifiera kompromisser och avvisa ogenomförbara begränsningar med bevis.

### Implementeringssteg

1. **Designa arkitekturen**
2. **Skapa AZD-mallen**
3. **Implementera säkerhetsåtgärder**
4. **Ställ in övervakning och avisering**
5. **Skapa distributionspipelines**
6. **Dokumentera lösningen**

### Utvärderingskriterier

- ✅ **Funktionalitet**: Visas implementerade möjligheter och återstående luckor tydligt?
- ✅ **Säkerhet**: Är bästa praxis implementerad?
- ✅ **Skalbarhet**: Kan den hantera belastningen?
- ✅ **Underhållbarhet**: Är koden och infrastrukturen välorganiserade?
- ✅ **Kostnad**: Håller den sig inom budget?

## Ytterligare resurser

### Microsoft-dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Exempelmallar
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community-resurser
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Slutförandekontrollpunkt

Grattis! Du har slutfört AI Workshop-labbet. Du bör nu kunna:

- ✅ Förklara hur man anpassar en befintlig AI-applikation till en AZD-mall
- ✅ Distribuera och testa en AI-referensapplikation
- ✅ Implementera säkerhetsbästa praxis för AI-arbetsbelastningar
- ✅ Övervaka och optimera AI-applikationens prestanda
- ✅ Felsöka vanliga distribueringsproblem

**Rensa upp:** Kör `azd env list`, välj varje förbrukningsbar miljö skapad i detta labb (`myai-workshop`, och om distribuerad `myai-production`/`myai-quota-test`), och kör `azd down` i varje. Granska raderingsplanen; att radera en miljös lokala konfiguration tar inte bort Azure-resurser. Undvik `--purge` om du inte förstår irreversibel borttagning av mjukborttagna resurser.

### Nästa steg
1. Applicera dessa mönster på dina egna AI-projekt
2. Bidra med mallar tillbaka till communityn
3. Gå med i Microsoft Foundry Discord för löpande support
4. Utforska avancerade ämnen som distribution i flera regioner

---

**Workshop Feedback**: Hjälp oss förbättra denna workshop genom att dela din erfarenhet i [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD För nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-först utveckling
- **⬅️ Föregående**: [AI Modell-Distribution](ai-model-deployment.md)
- **➡️ Nästa**: [Produktions-AI Bästa Praxis](../chapter-08-production/production-ai-practices.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Behöver du hjälp?** Gå med i vårt community för stöd och diskussioner om AZD och AI-distributioner.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->