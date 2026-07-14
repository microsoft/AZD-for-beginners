# AI Workshop Lab: Göra Dina AI-Lösningar AZD-distribuerbara

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 2 - AI-First Utveckling
- **⬅️ Föregående**: [AI Modell-Distribution](ai-model-deployment.md)
- **➡️ Nästa**: [Produktions-AI Bästa Praxis](production-ai-practices.md)
- **🚀 Nästa Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Workshop Översikt

Denna praktiska labb vägleder utvecklare genom processen att ta en befintlig AI-mall och distribuera den med hjälp av Azure Developer CLI (AZD). Du kommer att lära dig viktiga mönster för produktionsdistribution av AI med Microsoft Foundry-tjänster.

> **Valideringsnotering (2026-07-13):** Denna workshop granskades mot `azd` `1.27.1`. Om din lokala installation är äldre, uppdatera AZD innan du startar så att autentisering, mall och distributionsflöde matchar stegen nedan.

**Varaktighet:** 2-3 timmar  
**Nivå:** Medel  
**Förkunskaper:** Grundläggande Azure-kunskaper, kännedom om AI/ML-koncept

## 🎓 Lärandemål

I slutet av denna workshop kommer du att kunna:
- ✅ Konvertera en befintlig AI-applikation att använda AZD-mallar
- ✅ Konfigurera Microsoft Foundry-tjänster med AZD
- ✅ Implementera säker hantering av autentiseringsuppgifter för AI-tjänster
- ✅ Distribuera produktionsklara AI-applikationer med övervakning
- ✅ Felsöka vanliga problem vid AI-distribution

## Förkunskaper

### Krävs Verktyg
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installerat
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installerat
- [Git](https://git-scm.com/) installerat
- Kodredigerare (helst VS Code)

### Azure Resurser
- Azure-prenumeration med bidragsbehörighet
- Tillgång till Microsoft Foundry Models-tjänster (eller möjlighet att ansöka om tillgång)
- Behörighet att skapa resursgrupper

### Kunskapsförkunskaper
- Grundläggande förståelse för Azure-tjänster
- Kännedom om kommandoradsgränssnitt
- Grundläggande AI/ML-koncept (API:er, modeller, prompts)

## Lab Setup

### Steg 1: Miljöförberedelse

1. **Verifiera verktygsinstallationer:**
```bash
# Kontrollera AZD-installation
azd version

# Kontrollera Azure CLI
az --version

# Logga in på Azure för AZD-arbetsflöden
azd auth login

# Logga bara in på Azure CLI om du planerar att köra az-kommandon under diagnostik
az login
```

Om du arbetar över flera hyresgäster eller din prenumeration inte upptäcks automatiskt, försök igen med `azd auth login --tenant-id <tenant-id>`.

2. **Kloning av workshop-repositoriet:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Förstå AZD-Strukturen för AI Applikationer

### Anatomi av en AI AZD-mall

Utforska nyckelfiler i en AI-redo AZD-mall:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Laborationsövning 1.1: Utforska Konfigurationen**

1. **Granska filen azure.yaml:**
```bash
cat azure.yaml
```

**Att leta efter:**
- Tjänstedefinitioner för AI-komponenter
- Miljövariabelmappningar
- Host-konfigurationer

2. **Granska main.bicep infrastruktur:**
```bash
cat infra/main.bicep
```

**Viktiga AI-mönster att identifiera:**
- Microsoft Foundry Models tjänsteprovisionering
- Azure AI Search-integration
- Säker nyckelhantering
- Nätverkssäkerhetskonfigurationer

### **Diskussionspunkt:** Varför Dessa Mönster är Viktiga för AI

- **Tjänsteberoenden**: AI-appar kräver ofta flera koordinerade tjänster
- **Säkerhet**: API-nycklar och endpoints behöver säker hantering
- **Skalbarhet**: AI-arbetsbelastningar har unika skalningskrav
- **Kostnadshantering**: AI-tjänster kan vara kostsamma om de inte är korrekt konfigurerade

## Modul 2: Distribuera Din Första AI-applikation

### Steg 2.1: Initiera Miljön

1. **Skapa en ny AZD-miljö:**
```bash
azd env new myai-workshop
```

2. **Ställ in nödvändiga parametrar:**
```bash
# Ange din föredragna Azure-region
azd env set AZURE_LOCATION eastus

# Valfritt: Ange specifik OpenAI-modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Steg 2.2: Distribuera Infrastruktur och Applikation

1. **Distribuera med AZD:**
```bash
azd up
```

**Vad som händer under `azd up`:**
- ✅ Provisions Microsoft Foundry Models tjänst
- ✅ Skapar Azure AI Search-tjänst
- ✅ Ställer in App Service för webbapplikationen
- ✅ Konfigurerar nätverk och säkerhet
- ✅ Distribuerar applikationskoden
- ✅ Ställer in övervakning och loggning

2. **Bevaka distributionsprocessen** och notera resurser som skapas.

### Steg 2.3: Verifiera Din Distribution

1. **Kontrollera distribuerade resurser:**
```bash
azd show
```

2. **Öppna den distribuerade applikationen:**
```bash
azd show
```

Öppna webbendpointen som visas i `azd show`-utdata.

3. **Testa AI-funktionaliteten:**
   - Navigera till webbapplikationen
   - Prova exempelqueries
   - Bekräfta att AI-svaren fungerar

### **Laborationsövning 2.1: Felsökningsövning**

**Scenario**: Din distribution lyckades men AI svarar inte.

**Vanliga problem att kontrollera:**
1. **OpenAI API-nycklar**: Kontrollera att de är korrekt inställda
2. **Modelltillgänglighet**: Kontrollera om din region stöder modellen
3. **Nätverksanslutning**: Säkerställ att tjänster kan kommunicera
4. **RBAC-behörigheter**: Kontrollera att appen har åtkomst till OpenAI

**Felsökningskommandon:**
```bash
# Kontrollera miljövariabler
azd env get-values

# Visa distributionsloggar
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontrollera OpenAI-distributionsstatus
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Anpassa AI-applikationer efter Dina Behov

### Steg 3.1: Modifiera AI-konfigurationen

1. **Uppdatera OpenAI-modellen:**
```bash
# Byt till en annan modell (om tillgänglig i din region)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Distribuera om med den nya konfigurationen
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

### Steg 3.2: Miljöspecifika Konfigurationer

**Bästa praxis**: Olika konfigurationer för utveckling jämfört med produktion.

1. **Skapa en produktionsmiljö:**
```bash
azd env new myai-production
```

2. **Ställ in produktionsspecifika parametrar:**
```bash
# Produktion använder vanligtvis högre SKU:er
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktivera ytterligare säkerhetsfunktioner
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laborationsövning 3.1: Kostnadsoptimering**

**Utmaning**: Konfigurera mallen för kostnadseffektiv utveckling.

**Uppgifter:**
1. Identifiera vilka SKU:er som kan ställas in på fria/grundläggande nivåer
2. Konfigurera miljövariabler för minimal kostnad
3. Distribuera och jämför kostnader med produktionskonfigurationen

**Lösa tips:**
- Använd F0 (fri) nivå för Azure AI-tjänster när möjligt
- Använd Grundläggande nivå för Search Service i utveckling
- Överväg att använda Consumption-plan för Functions

## Modul 4: Säkerhet och Produktionsbästa Praxis

### Steg 4.1: Säker Hantering av Autentiseringsuppgifter

**Nuvarande utmaning**: Många AI-appar hårdkodar API-nycklar eller använder osäker lagring.

**AZD-lösning**: Managed Identity + Key Vault-integration.

1. **Granska säkerhetskonfigurationen i din mall:**
```bash
# Leta efter konfiguration för Key Vault och Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifiera att Managed Identity fungerar:**
```bash
# Kontrollera om webbappen har rätt identitetskonfiguration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Steg 4.2: Nätverkssäkerhet

1. **Aktivera privata endpoints** (om inte redan konfigurerat):

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

### Steg 4.3: Övervakning och Observerbarhet

1. **Konfigurera Application Insights:**
```bash
# Application Insights bör konfigureras automatiskt
# Kontrollera konfigurationen:
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

### **Laborationsövning 4.1: Säkerhetsgranskning**

**Uppgift**: Granska din distribution ur ett säkerhetsperspektiv.

**Checklista:**
- [ ] Inga hårdkodade hemligheter i kod eller konfiguration
- [ ] Managed Identity används för tjänst-till-tjänst autentisering
- [ ] Key Vault lagrar känslig konfiguration
- [ ] Nätverksåtkomst är korrekt begränsad
- [ ] Övervakning och loggning är aktiverade

## Modul 5: Konvertera Din Egna AI-applikation

### Steg 5.1: Bedömningsformulär

**Innan du konverterar din app**, svara på dessa frågor:

1. **Applikationsarkitektur:**
   - Vilka AI-tjänster använder din app?
   - Vilka beräkningsresurser behöver den?
   - Krävs en databas?
   - Vilka är beroendena mellan tjänster?

2. **Säkerhetskrav:**
   - Vilka känsliga data hanterar din app?
   - Vilka regelefterlevnadskrav finns?
   - Behöver du privat nätverk?

3. **Skalningskrav:**
   - Vad är din förväntade belastning?
   - Behöver du autoskalning?
   - Finns regionala krav?

### Steg 5.2: Skapa Din AZD-mall

**Följ detta mönster för att konvertera din app:**

1. **Skapa grundstrukturen:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initiera AZD-mall
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

3. **Skapa infrastrukturella mallar:**

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

### **Laborationsövning 5.1: Mallskapande Utmaning**

**Utmaning**: Skapa en AZD-mall för en dokumentbehandlings-AI-app.

**Krav:**
- Microsoft Foundry Models för innehållsanalys
- Document Intelligence för OCR
- Storage Account för dokumentuppladdningar
- Funktion-App för bearbetningslogik
- Webb-app för användargränssnitt

**Bonuspoäng:**
- Lägg till korrekt felhantering
- Inkludera kostnadsuppskattning
- Sätt upp övervakningspaneler

## Modul 6: Felsökning av Vanliga Problem

### Vanliga Distributionsproblem

#### Problem 1: OpenAI-tjänstkvot överskriden
**Symtom:** Distribution misslyckas med kvotfel
**Lösningar:**
```bash
# Kontrollera nuvarande kvoter
az cognitiveservices usage list --location eastus

# Begär kvöthöjning eller försök i en annan region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell inte tillgänglig i regionen
**Symtom:** AI-svar misslyckas eller modell-distributionsfel
**Lösningar:**
```bash
# Kontrollera modellens tillgänglighet per region
az cognitiveservices model list --location eastus

# Uppdatera till tillgänglig modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Behörighetsproblem
**Symtom:** 403 Forbidden-fel vid anrop till AI-tjänster
**Lösningar:**
```bash
# Kontrollera rolltilldelningar
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Lägg till saknade roller
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Prestandaproblem

#### Problem 4: Långsamma AI-svar
**Undersökningssteg:**
1. Kontrollera Application Insights för prestandamätvärden
2. Granska OpenAI-tjänstemätvärden i Azure-portalen
3. Verifiera nätverksanslutning och latens

**Lösningar:**
- Implementera caching för vanliga frågor
- Använd lämplig OpenAI-modell för ditt användningsfall
- Överväg läsrepliker för högbelastningsscenarier

### **Laborationsövning 6.1: Felsökningsutmaning**

**Scenario**: Din distribution lyckades, men applikationen returnerar 500-fel.

**Felsökningsuppgifter:**
1. Kontrollera applikationsloggar
2. Verifiera tjänstanslutning
3. Testa autentisering
4. Granska konfiguration

**Verktyg att använda:**
- `azd show` för översikt över distribution
- Azure-portalen för detaljerade tjänstloggar
- Application Insights för applikationstelemetri

## Modul 7: Övervakning och Optimering

### Steg 7.1: Sätt Upp Omfattande Övervakning

1. **Skapa anpassade dashboards:**

Navigera till Azure-portalen och skapa en dashboard med:
- OpenAI begärande antal och latens
- Applikationsfelräntor
- Resursanvändning
- Kostnadsspårning

2. **Sätt upp larm:**
```bash
# Varning för hög felprocent
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Steg 7.2: Kostnadsoptimering

1. **Analysera nuvarande kostnader:**
```bash
# Använd Azure CLI för att hämta kostnadsdata
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementera kostnadskontroller:**
- Sätt upp budgetlarm
- Använd autoskalningspolicyer
- Implementera begärandecaching
- Övervaka tokenanvändning för OpenAI

### **Laborationsövning 7.1: Prestandaoptimering**

**Uppgift**: Optimera din AI-applikation för både prestanda och kostnad.

**Mått att förbättra:**
- Minska genomsnittlig svarstid med 20%
- Minska månadskostnader med 15%
- Upprätthåll 99,9% driftstid

**Strategier att prova:**
- Implementera svarscaching
- Optimera prompts för token-effektivitet
- Använd lämpliga beräknings-SKU:er
- Sätt upp korrekt autoskalning

## Slututmaning: Implementation från Start till Mål

### Utmaningsscenario

Du har fått i uppdrag att skapa en produktionsklar AI-driven kundtjänstchatbot med dessa krav:

**Funktionella krav:**
- Webbgränssnitt för kundinteraktioner
- Integration med Microsoft Foundry Models för svar
- Dokument-sökmöjlighet med Azure AI Search
- Integration med befintlig kunddatabas
- Fler språkstöd

**Icke-funktionella krav:**
- Hantera 1000 samtidiga användare
- 99,9% SLA för driftstid
- SOC 2-efterlevnad
- Kostnad under 500 USD/månad
- Distribuera till flera miljöer (dev, staging, prod)

### Implementeringssteg

1. **Designa arkitekturen**
2. **Skapa AZD-mallen**
3. **Implementera säkerhetsåtgärder**
4. **Sätt upp övervakning och larm**
5. **Skapa distributionsrörledningar**
6. **Dokumentera lösningen**

### Utvärderingskriterier

- ✅ **Funktionalitet**: Uppfyller den alla krav?
- ✅ **Säkerhet**: Har bästa praxis implementerats?
- ✅ **Skalbarhet**: Kan den hantera belastningen?
- ✅ **Underhållbarhet**: Är kod och infrastruktur välorganiserad?
- ✅ **Kostnad**: Håller den sig inom budget?

## Ytterligare Resurser

### Microsoft-dokumentation
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Tjänstedokumentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentation](https://learn.microsoft.com/azure/ai-studio/)

### Exempelmallar
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Slutfört intyg

Grattis! Du har slutfört AI Workshop-laben. Du bör nu kunna:

- ✅ Konvertera befintliga AI-applikationer till AZD-mallar
- ✅ Distribuera produktionsklara AI-applikationer
- ✅ Implementera säkerhetsbästa praxis för AI-arbetsbelastningar
- ✅ Övervaka och optimera AI-applikations prestanda
- ✅ Felsöka vanliga distributionsproblem

### Nästa steg
1. Använd dessa mönster i dina egna AI-projekt
2. Bidra med mallar tillbaka till communityn
3. Gå med i Microsoft Foundry Discord för löpande support
4. Utforska avancerade ämnen som distributioner i flera regioner

---

**Workshop Feedback**: Hjälp oss att förbättra denna workshop genom att dela din upplevelse i [Microsoft Foundry Discord #Azure-kanalen](https://discord.gg/microsoft-azure).

---

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD För nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-First Utveckling
- **⬅️ Föregående**: [AI Modell-distribution](ai-model-deployment.md)
- **➡️ Nästa**: [Produktions AI Bästa Praxis](production-ai-practices.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Behöver du hjälp?** Gå med i vår community för support och diskussioner om AZD och AI-distributioner.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->