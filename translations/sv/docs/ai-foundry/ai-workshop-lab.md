<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:29:01+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "sv"
}
-->
# AI Workshop Lab: Göra dina AI-lösningar AZD-distribuerbara

**Kapitelöversikt:**
- **📚 Kurshemsida**: [AZD för nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-först utveckling
- **⬅️ Föregående**: [Distribuering av AI-modeller](ai-model-deployment.md)
- **➡️ Nästa**: [Bästa praxis för produktions-AI](production-ai-practices.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

## Workshopöversikt

Denna praktiska labb guidar utvecklare genom processen att ta en befintlig AI-mall och distribuera den med hjälp av Azure Developer CLI (AZD). Du kommer att lära dig viktiga mönster för AI-distributioner i produktion med Azure AI Foundry-tjänster.

**Varaktighet:** 2-3 timmar  
**Nivå:** Medel  
**Förkunskaper:** Grundläggande kunskaper om Azure, bekantskap med AI/ML-koncept

## 🎓 Inlärningsmål

Efter denna workshop kommer du att kunna:
- ✅ Konvertera en befintlig AI-applikation för att använda AZD-mallar
- ✅ Konfigurera Azure AI Foundry-tjänster med AZD
- ✅ Implementera säker hantering av autentiseringsuppgifter för AI-tjänster
- ✅ Distribuera produktionsklara AI-applikationer med övervakning
- ✅ Felsöka vanliga problem vid AI-distribution

## Förkunskaper

### Nödvändiga verktyg
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installerat
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installerat
- [Git](https://git-scm.com/) installerat
- Kodredigerare (VS Code rekommenderas)

### Azure-resurser
- Azure-prenumeration med bidragsgivarbehörighet
- Tillgång till Azure OpenAI-tjänster (eller möjlighet att begära åtkomst)
- Behörighet att skapa resursgrupper

### Kunskapsförkunskaper
- Grundläggande förståelse för Azure-tjänster
- Bekantskap med kommandoradsgränssnitt
- Grundläggande AI/ML-koncept (API:er, modeller, prompts)

## Labuppsättning

### Steg 1: Förberedelse av miljö

1. **Verifiera installation av verktyg:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Klona workshopens repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Förstå AZD-strukturen för AI-applikationer

### Anatomi av en AI-redo AZD-mall

Utforska nyckelfilerna i en AI-redo AZD-mall:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Labövning 1.1: Utforska konfigurationen**

1. **Granska azure.yaml-filen:**
```bash
cat azure.yaml
```

**Vad du ska leta efter:**
- Tjänstedefinitioner för AI-komponenter
- Kartläggning av miljövariabler
- Värdkonfigurationer

2. **Granska main.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Viktiga AI-mönster att identifiera:**
- Provisionering av Azure OpenAI-tjänst
- Integration av Cognitive Search
- Säker hantering av nycklar
- Nätverkssäkerhetskonfigurationer

### **Diskussionspunkt:** Varför dessa mönster är viktiga för AI

- **Tjänstberoenden**: AI-appar kräver ofta flera samordnade tjänster
- **Säkerhet**: API-nycklar och slutpunkter behöver säker hantering
- **Skalbarhet**: AI-arbetsbelastningar har unika skalningskrav
- **Kostnadshantering**: AI-tjänster kan bli dyra om de inte är korrekt konfigurerade

## Modul 2: Distribuera din första AI-applikation

### Steg 2.1: Initiera miljön

1. **Skapa en ny AZD-miljö:**
```bash
azd env new myai-workshop
```

2. **Ställ in nödvändiga parametrar:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Steg 2.2: Distribuera infrastrukturen och applikationen

1. **Distribuera med AZD:**
```bash
azd up
```

**Vad som händer under `azd up`:**
- ✅ Provisionerar Azure OpenAI-tjänst
- ✅ Skapar Cognitive Search-tjänst
- ✅ Ställer in App Service för webbapplikationen
- ✅ Konfigurerar nätverk och säkerhet
- ✅ Distribuerar applikationskod
- ✅ Ställer in övervakning och loggning

2. **Övervaka distributionsförloppet** och notera de resurser som skapas.

### Steg 2.3: Verifiera din distribution

1. **Kontrollera de distribuerade resurserna:**
```bash
azd show
```

2. **Öppna den distribuerade applikationen:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testa AI-funktionaliteten:**
   - Navigera till webbapplikationen
   - Testa exempelqueries
   - Verifiera att AI-svaren fungerar

### **Labövning 2.1: Felsökningsövning**

**Scenario**: Din distribution lyckades men AI svarar inte.

**Vanliga problem att kontrollera:**
1. **OpenAI API-nycklar**: Verifiera att de är korrekt inställda
2. **Modelltillgänglighet**: Kontrollera om din region stöder modellen
3. **Nätverksanslutning**: Säkerställ att tjänster kan kommunicera
4. **RBAC-behörigheter**: Verifiera att appen kan komma åt OpenAI

**Felsökningskommandon:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Anpassa AI-applikationer efter dina behov

### Steg 3.1: Modifiera AI-konfigurationen

1. **Uppdatera OpenAI-modellen:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Lägg till ytterligare AI-tjänster:**

Redigera `infra/main.bicep` för att lägga till Document Intelligence:

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

2. **Ställ in produktionsspecifika parametrar:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labövning 3.1: Kostnadsoptimering**

**Utmaning**: Konfigurera mallen för kostnadseffektiv utveckling.

**Uppgifter:**
1. Identifiera vilka SKU:er som kan ställas in på gratis/basnivåer
2. Konfigurera miljövariabler för minimal kostnad
3. Distribuera och jämför kostnader med produktionskonfigurationen

**Lösningsförslag:**
- Använd F0 (gratis) nivå för Cognitive Services när det är möjligt
- Använd Basic-nivå för Search Service i utveckling
- Överväg att använda Consumption-plan för Functions

## Modul 4: Säkerhet och bästa praxis för produktion

### Steg 4.1: Säker hantering av autentiseringsuppgifter

**Nuvarande utmaning**: Många AI-appar hårdkodar API-nycklar eller använder osäker lagring.

**AZD-lösning**: Managed Identity + Key Vault-integration.

1. **Granska säkerhetskonfigurationen i din mall:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifiera att Managed Identity fungerar:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Steg 4.2: Nätverkssäkerhet

1. **Aktivera privata slutpunkter** (om de inte redan är konfigurerade):

Lägg till i din bicep-mall:
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

### Steg 4.3: Övervakning och spårbarhet

1. **Konfigurera Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ställ in AI-specifik övervakning:**

Lägg till anpassade mätvärden för AI-operationer:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Labövning 4.1: Säkerhetsrevision**

**Uppgift**: Granska din distribution för säkerhetsbästa praxis.

**Checklista:**
- [ ] Inga hårdkodade hemligheter i kod eller konfiguration
- [ ] Managed Identity används för tjänst-till-tjänst-autentisering
- [ ] Key Vault lagrar känslig konfiguration
- [ ] Nätverksåtkomst är korrekt begränsad
- [ ] Övervakning och loggning är aktiverade

## Modul 5: Konvertera din egen AI-applikation

### Steg 5.1: Bedömningsformulär

**Innan du konverterar din app**, svara på dessa frågor:

1. **Applikationsarkitektur:**
   - Vilka AI-tjänster använder din app?
   - Vilka beräkningsresurser behövs?
   - Behöver den en databas?
   - Vilka är beroendena mellan tjänster?

2. **Säkerhetskrav:**
   - Vilka känsliga data hanterar din app?
   - Vilka efterlevnadskrav har du?
   - Behöver du privat nätverk?

3. **Skalningskrav:**
   - Vilken belastning förväntas?
   - Behöver du autoskalning?
   - Finns det regionala krav?

### Steg 5.2: Skapa din AZD-mall

**Följ detta mönster för att konvertera din app:**

1. **Skapa grundstrukturen:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
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

3. **Skapa infrastrukturmallar:**

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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Labövning 5.1: Mallskapande utmaning**

**Utmaning**: Skapa en AZD-mall för en dokumentbearbetnings-AI-app.

**Krav:**
- Azure OpenAI för innehållsanalys
- Document Intelligence för OCR
- Storage Account för dokumentuppladdningar
- Function App för bearbetningslogik
- Webbapp för användargränssnitt

**Bonuspoäng:**
- Lägg till korrekt felhantering
- Inkludera kostnadsberäkning
- Ställ in övervakningspaneler

## Modul 6: Felsökning av vanliga problem

### Vanliga distributionsproblem

#### Problem 1: OpenAI-tjänstens kvot överskriden
**Symptom:** Distribution misslyckas med kvotfel
**Lösningar:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell inte tillgänglig i regionen
**Symptom:** AI-svar misslyckas eller modellens distribution ger fel
**Lösningar:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Behörighetsproblem
**Symptom:** 403 Forbidden-fel vid anrop av AI-tjänster
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

#### Problem 4: Långsamma AI-svar
**Undersökningssteg:**
1. Kontrollera Application Insights för prestandamätningar
2. Granska OpenAI-tjänstens mätvärden i Azure-portalen
3. Verifiera nätverksanslutning och latens

**Lösningar:**
- Implementera caching för vanliga frågor
- Använd lämplig OpenAI-modell för ditt användningsfall
- Överväg läsrepliker för hög belastning

### **Labövning 6.1: Felsökningsutmaning**

**Scenario**: Din distribution lyckades, men applikationen returnerar 500-fel.

**Felsökningsuppgifter:**
1. Kontrollera applikationsloggar
2. Verifiera tjänstanslutning
3. Testa autentisering
4. Granska konfiguration

**Verktyg att använda:**
- `azd show` för distributionsöversikt
- Azure-portalen för detaljerade tjänstloggar
- Application Insights för applikationstelemetri

## Modul 7: Övervakning och optimering

### Steg 7.1: Ställ in omfattande övervakning

1. **Skapa anpassade paneler:**

Navigera till Azure-portalen och skapa en panel med:
- OpenAI-förfrågningsantal och latens
- Applikationsfelfrekvenser
- Resursutnyttjande
- Kostnadsspårning

2. **Ställ in varningar:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Steg 7.2: Kostnadsoptimering

1. **Analysera aktuella kostnader:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementera kostnadskontroller:**
- Ställ in budgetvarningar
- Använd autoskalningspolicyer
- Implementera förfrågningscaching
- Övervaka tokenanvändning för OpenAI

### **Labövning 7.1: Prestandaoptimering**

**Uppgift**: Optimera din AI-applikation för både prestanda och kostnad.

**Mätvärden att förbättra:**
- Minska genomsnittlig svarstid med 20 %
- Minska månadskostnader med 15 %
- Bibehåll 99,9 % upptid

**Strategier att prova:**
- Implementera svarscaching
- Optimera prompts för tokeneffektivitet
- Använd lämpliga beräknings-SKU:er
- Ställ in korrekt autoskalning

## Slututmaning: Implementering från början till slut

### Utmaningsscenario

Du har fått i uppdrag att skapa en produktionsklar AI-driven kundtjänstchatbot med följande krav:

**Funktionella krav:**
- Webbgränssnitt för kundinteraktioner
- Integration med Azure OpenAI för svar
- Dokumentssökfunktionalitet med Cognitive Search
- Integration med befintlig kunddatabas
- Stöd för flera språk

**Icke-funktionella krav:**
- Hantera 1000 samtidiga användare
- 99,9 % upptid SLA
- SOC 2-efterlevnad
- Kostnad under $500/månad
- Distribuera till flera miljöer (utveckling, staging, produktion)

### Implementeringssteg

1. **Designa arkitekturen**
2. **Skapa AZD-mallen**
3. **Implementera säkerhetsåtgärder**
4. **Ställ in övervakning och varningar**
5. **Skapa distributionspipelines**
6. **Dokumentera lösningen**

### Utvärderingskriterier

- ✅ **Funktionalitet**: Uppfyller den alla krav?
- ✅ **Säkerhet**: Är bästa praxis implementerad?
- ✅ **Skalbarhet**: Kan den hantera belastningen?
- ✅ **Underhållbarhet**: Är koden och infrastrukturen välorganiserad?
- ✅ **Kostnad**: Håller den sig inom budget?

## Ytterligare resurser

### Microsoft-dokumentation
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI-tjänstdokumentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry-dokumentation](https://learn.microsoft.com/azure/ai-studio/)

### Exempelmallar
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community-resurser
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Slutförandecertifikat
Grattis! Du har slutfört AI Workshop Lab. Du bör nu kunna:

- ✅ Konvertera befintliga AI-applikationer till AZD-mallar
- ✅ Distribuera produktionsklara AI-applikationer
- ✅ Implementera säkerhetsbästa praxis för AI-arbetsbelastningar
- ✅ Övervaka och optimera AI-applikationers prestanda
- ✅ Felsöka vanliga distributionsproblem

### Nästa steg
1. Använd dessa mönster i dina egna AI-projekt
2. Bidra med mallar tillbaka till communityn
3. Gå med i Azure AI Foundry Discord för löpande support
4. Utforska avancerade ämnen som multi-region distributioner

---

**Workshop Feedback**: Hjälp oss förbättra denna workshop genom att dela din erfarenhet i [Azure AI Foundry Discord #Azure-kanalen](https://discord.gg/microsoft-azure).

---

**Kapitelnavigation:**
- **📚 Kursens startsida**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-First Utveckling
- **⬅️ Föregående**: [AI-modell distribution](ai-model-deployment.md)
- **➡️ Nästa**: [Bästa praxis för produktions-AI](production-ai-practices.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

**Behöver du hjälp?** Gå med i vår community för support och diskussioner om AZD och AI-distributioner.

---

