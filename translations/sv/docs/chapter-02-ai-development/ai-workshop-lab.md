# AI Workshop Lab: Gör dina AI-lösningar AZD-distribuerbara

**Kapitelnavigering:**
- **📚 Kurshemsida**: [AZD For Beginners](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-först utveckling
- **⬅️ Föregående**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Nästa**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Nästa kapitel**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshopöversikt

Detta praktiska labb guidar utvecklare genom processen att ta en befintlig AI-mall och distribuera den med Azure Developer CLI (AZD). Du lär dig viktiga mönster för produktionsklara AI-distributioner med Microsoft Foundry-tjänster.

> **Valideringsanteckning (2026-03-25):** Detta workshop har granskats mot `azd` `1.23.12`. Om din lokala installation är äldre, uppdatera AZD innan du börjar så att autentisering, mall- och distributionsarbetsflödet matchar stegen nedan.

**Varaktighet:** 2-3 timmar  
**Nivå:** Medelnivå  
**Förkunskaper:** Grundläggande kunskaper om Azure, bekantskap med AI/ML-koncept

## 🎓 Lärandemål

Efter avslutad workshop kommer du att kunna:
- ✅ Konvertera en befintlig AI-applikation för att använda AZD-mallar
- ✅ Konfigurera Microsoft Foundry-tjänster med AZD
- ✅ Implementera säker hantering av autentiseringsuppgifter för AI-tjänster
- ✅ Distribuera produktionsklara AI-applikationer med övervakning
- ✅ Felsöka vanliga problem vid AI-distributioner

## Förkunskaper

### Nödvändiga verktyg
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installerad
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installerad
- [Git](https://git-scm.com/) installerat
- Kodredigerare (VS Code rekommenderas)

### Azure-resurser
- Azure-prenumeration med Contributor-åtkomst
- Åtkomst till Microsoft Foundry Models-tjänster (eller möjlighet att begära åtkomst)
- Behörighet att skapa resursgrupper

### Nödvändig kunskap
- Grundläggande förståelse för Azure-tjänster
- Bekantskap med kommandoradsgränssnitt
- Grundläggande AI/ML-koncept (API:er, modeller, prompts)

## Labbinställning

### Steg 1: Förberedelse av miljö

1. **Verifiera att verktygen är installerade:**
```bash
# Kontrollera AZD-installationen
azd version

# Kontrollera Azure CLI
az --version

# Logga in på Azure för AZD-arbetsflöden
azd auth login

# Logga in på Azure CLI endast om du planerar att köra az-kommandon under diagnostik
az login
```

If you work across multiple tenants or your subscription is not detected automatically, retry with `azd auth login --tenant-id <tenant-id>`.

2. **Klona workshop-repositoriet:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Förstå AZD-strukturen för AI-applikationer

### Anatomi av en AI AZD-mall

Utforska nyckelfilerna i en AI-redo AZD-mall:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Labbövning 1.1: Utforska konfigurationen**

1. **Granska filen azure.yaml:**
```bash
cat azure.yaml
```

**Vad du ska leta efter:**
- Tjänstdefinitioner för AI-komponenter
- Miljövariabelmappningar
- Hostkonfigurationer

2. **Granska infrastrukturen main.bicep:**
```bash
cat infra/main.bicep
```

**Viktiga AI-mönster att identifiera:**
- Provisionering av Microsoft Foundry Models-tjänst
- Integrering med Cognitive Search
- Säker hantering av nycklar
- Nätverkssäkerhetskonfigurationer

### **Diskussionspunkt:** Varför dessa mönster är viktiga för AI

- **Tjänsteberoenden**: AI-appar kräver ofta flera samordnade tjänster
- **Säkerhet**: API-nycklar och endpoints behöver hanteras säkert
- **Skalbarhet**: AI-arbetsbelastningar har unika skalningskrav
- **Kostnadshantering**: AI-tjänster kan bli kostsamma om de inte konfigureras korrekt

## Modul 2: Distribuera din första AI-applikation

### Steg 2.1: Initiera miljön

1. **Skapa en ny AZD-miljö:**
```bash
azd env new myai-workshop
```

2. **Ange nödvändiga parametrar:**
```bash
# Ställ in din föredragna Azure-region
azd env set AZURE_LOCATION eastus

# Valfritt: Ange en specifik OpenAI-modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Steg 2.2: Distribuera infrastrukturen och applikationen

1. **Distribuera med AZD:**
```bash
azd up
```

**Vad som händer under `azd up`:**
- ✅ Provisionerar Microsoft Foundry Models-tjänst
- ✅ Skapar Cognitive Search-tjänst
- ✅ Ställer in App Service för webbapplikationen
- ✅ Konfigurerar nätverk och säkerhet
- ✅ Distribuerar applikationskod
- ✅ Ställer in övervakning och loggning

2. **Övervaka distributionsförloppet** och notera resurserna som skapas.

### Steg 2.3: Verifiera din distribution

1. **Kontrollera de distribuerade resurserna:**
```bash
azd show
```

2. **Öppna den distribuerade applikationen:**
```bash
azd show
```

Öppna webbendpunkten som visas i utdata från `azd show`.

3. **Testa AI-funktionaliteten:**
   - Navigera till webbapplikationen
   - Prova exempelqueries
   - Verifiera att AI-svaren fungerar

### **Labbövning 2.1: Felsökningsövning**

**Scenario**: Din distribution lyckades men AI:n svarar inte.

**Vanliga problem att kontrollera:**
1. **OpenAI API-nycklar**: Verifiera att de är korrekt inställda
2. **Modelltillgänglighet**: Kontrollera om din region stöder modellen
3. **Nätverksanslutning**: Säkerställ att tjänsterna kan kommunicera
4. **RBAC-behörigheter**: Verifiera att appen kan få åtkomst till OpenAI

**Felsökningskommandon:**
```bash
# Kontrollera miljövariablerna
azd env get-values

# Visa distributionsloggar
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontrollera status för OpenAI-distributionen
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Anpassa AI-applikationer efter dina behov

### Steg 3.1: Ändra AI-konfigurationen

1. **Uppdatera OpenAI-modellen:**
```bash
# Byt till en annan modell (om tillgänglig i din region)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Driftsätt på nytt med den nya konfigurationen
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

2. **Ange produktionsspecifika parametrar:**
```bash
# I produktion används vanligtvis högre SKU:er
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktivera ytterligare säkerhetsfunktioner
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labbövning 3.1: Kostnadsoptimering**

**Utmaning**: Konfigurera mallen för kostnadseffektiv utveckling.

**Uppgifter:**
1. Identifiera vilka SKU:er som kan sättas till gratis/basic-nivåer
2. Konfigurera miljövariabler för minimal kostnad
3. Distribuera och jämför kostnader med produktionskonfigurationen

**Lösningsledtrådar:**
- Använd F0 (gratis)-nivå för Cognitive Services när det är möjligt
- Använd Basic-nivån för Search Service i utveckling
- Överväg att använda Consumption-planen för Functions

## Modul 4: Säkerhet och bästa praxis för produktion

### Steg 4.1: Säker hantering av autentiseringsuppgifter

**Nuvarande utmaning**: Många AI-appar hårdkodar API-nycklar eller använder osäker lagring.

**AZD-lösning**: Managed Identity + Key Vault-integration.

1. **Granska säkerhetskonfigurationen i din mall:**
```bash
# Sök efter konfiguration för Key Vault och hanterad identitet
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifiera att Managed Identity fungerar:**
```bash
# Kontrollera att webbappen har korrekt identitetskonfiguration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Steg 4.2: Nätverkssäkerhet

1. **Aktivera privata endpoints** (om det inte redan är konfigurerat):

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

### Steg 4.3: Övervakning och observabilitet

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

### **Labbövning 4.1: Säkerhetsrevision**

**Uppgift**: Granska din distribution för säkerhetsbästa praxis.

**Checklista:**
- [ ] Inga hårdkodade hemligheter i kod eller konfiguration
- [ ] Managed Identity används för tjänst-till-tjänst-autentisering
- [ ] Key Vault lagrar känslig konfiguration
- [ ] Nätverksåtkomst är korrekt begränsad
- [ ] Övervakning och loggning är aktiverade

## Modul 5: Konvertera din egen AI-applikation

### Steg 5.1: Bedömningsblankett

**Innan du konverterar din app**, besvara dessa frågor:

1. **Applikationsarkitektur:**
   - Vilka AI-tjänster använder din app?
   - Vilka beräkningsresurser behöver den?
   - Kräver den en databas?
   - Vilka beroenden finns mellan tjänsterna?

2. **Säkerhetskrav:**
   - Vilka känsliga data hanterar din app?
   - Vilka efterlevnadskrav har du?
   - Behöver du privat nätverk?

3. **Skalningskrav:**
   - Vad är din förväntade belastning?
   - Behöver du automatisk skalning?
   - Finns regionala krav?

### Steg 5.2: Skapa din AZD-mall

**Följ detta mönster för att konvertera din app:**

1. **Skapa grundstrukturen:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initiera AZD-mallen
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

### **Labbövning 5.1: Mallskapandeutmaning**

**Utmaning**: Skapa en AZD-mall för en dokumentbehandlings-AI-app.

**Krav:**
- Microsoft Foundry Models för innehållsanalys
- Document Intelligence för OCR
- Storage Account för dokumentuppladdningar
- Function App för bearbetningslogik
- Web app för användargränssnitt

**Bonuspoäng:**
- Lägg till korrekt felhantering
- Inkludera kostnadsberäkning
- Sätt upp övervakningsdashboardar

## Modul 6: Felsökning av vanliga problem

### Vanliga distributionsproblem

#### Problem 1: OpenAI-tjänstens kvot överskriden
**Symptom:** Distribution misslyckas med kvotfel
**Lösningar:**
```bash
# Kontrollera aktuella kvoter
az cognitiveservices usage list --location eastus

# Begär kvotökning eller försök en annan region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell inte tillgänglig i regionen
**Symptom:** AI-svar misslyckas eller modellutplacering ger fel
**Lösningar:**
```bash
# Kontrollera modellens tillgänglighet per region
az cognitiveservices model list --location eastus

# Uppdatera till en tillgänglig modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Behörighetsproblem
**Symptom:** 403 Forbidden-fel när AI-tjänster anropas
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
1. Kontrollera Application Insights för prestandamått
2. Granska OpenAI-tjänstens mått i Azure-portalen
3. Verifiera nätverksanslutning och latens

**Lösningar:**
- Implementera caching för vanliga förfrågningar
- Använd lämplig OpenAI-modell för ditt användningsfall
- Överväg läs-repliker för scenarier med hög belastning

### **Labbövning 6.1: Felsökningsutmaning**

**Scenario**: Din distribution lyckades, men applikationen returnerar 500-fel.

**Felsökningsuppgifter:**
1. Kontrollera applikationsloggar
2. Verifiera tjänstekonnektivitet
3. Testa autentisering
4. Granska konfiguration

**Verktyg att använda:**
- `azd show` för översikt av distributionen
- Azure-portalen för detaljerade tjänstloggar
- Application Insights för applikationstelemetri

## Modul 7: Övervakning och optimering

### Steg 7.1: Sätt upp omfattande övervakning

1. **Skapa anpassade instrumentpaneler:**

Gå till Azure-portalen och skapa en instrumentpanel med:
- OpenAI-förfrågningar och latens
- Applikationsfelprocent
- Resursutnyttjande
- Kostnadsspårning

2. **Konfigurera varningar:**
```bash
# Varning för hög felfrekvens
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

2. **Inför kostnadskontroller:**
- Ställ in budgetvarningar
- Använd autoskalningsprinciper
- Implementera förfrågningscaching
- Övervaka tokenanvändning för OpenAI

### **Labbövning 7.1: Prestandaoptimering**

**Uppgift**: Optimera din AI-applikation för både prestanda och kostnad.

**Mått att förbättra:**
- Minska genomsnittlig svarstid med 20%
- Minska månadskostnader med 15%
- Behåll 99,9% drifttid

**Strategier att pröva:**
- Implementera responscaching
- Optimera prompts för token-effektivitet
- Använd lämpliga compute-SKU:er
- Sätt upp korrekt autoskalning

## Slututmaning: Slut-till-slut-implementering

### Utmaningsscenario

Du har i uppdrag att skapa en produktionsredo AI-driven kundtjänstchattbot med dessa krav:

**Funktionella krav:**
- Webbgränssnitt för kundinteraktioner
- Integration med Microsoft Foundry Models för svar
- Dokumentsökfunktionalitet med Cognitive Search
- Integration med befintlig kunddatabas
- Fler språkstöd

**Icke-funktionella krav:**
- Hantera 1000 samtidiga användare
- 99,9% drifttid SLA
- SOC 2-efterlevnad
- Kostnad under $500/månad
- Distribuera till flera miljöer (dev, staging, prod)

### Implementeringssteg

1. **Designa arkitekturen**
2. **Skapa AZD-mallen**
3. **Implementera säkerhetsåtgärder**
4. **Sätt upp övervakning och varningar**
5. **Skapa deploymentspipelines**
6. **Dokumentera lösningen**

### Utvärderingskriterier

- ✅ **Funktionalitet**: Uppfyller den alla krav?
- ✅ **Säkerhet**: Är bästa praxis implementerade?
- ✅ **Skalbarhet**: Kan den hantera belastningen?
- ✅ **Underhållbarhet**: Är koden och infrastrukturen välorganiserad?
- ✅ **Kostnad**: Håller den sig inom budget?

## Ytterligare resurser

### Microsoft-dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Exempelmallar
- [Microsoft Foundry Models Chattapp](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Snabbstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chatt](https://github.com/Azure-Samples/contoso-chat)

### Gemenskapsresurser
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI på GitHub](https://github.com/Azure/azure-dev)
- [Fantastiska AZD-mallar](https://azure.github.io/awesome-azd/)

## 🎓 Slutförandecertifikat

Grattis! Du har slutfört AI Workshop-labben. Du bör nu kunna:

- ✅ Konvertera befintliga AI-applikationer till AZD-mallar
- ✅ Distribuera produktionsklara AI-applikationer
- ✅ Implementera säkerhetsbästa praxis för AI-arbetsbelastningar
- ✅ Övervaka och optimera prestandan hos AI-applikationer
- ✅ Felsöka vanliga distributionsproblem

### Nästa steg
1. Använd dessa mönster i dina egna AI-projekt
2. Bidra med mallar till communityn
3. Gå med i Microsoft Foundry Discord för kontinuerligt stöd
4. Utforska avancerade ämnen som distribution över flera regioner

---

**Workshop-feedback**: Hjälp oss förbättra denna workshop genom att dela din upplevelse i [Microsoft Foundry Discord #Azure-kanal](https://discord.gg/microsoft-azure).

---

**Kapitelnavigering:**
- **📚 Kurshem**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-först utveckling
- **⬅️ Föregående**: [Distribution av AI-modeller](ai-model-deployment.md)
- **➡️ Nästa**: [Bästa praxis för produktions-AI](production-ai-practices.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Behöver du hjälp?** Gå med i vår community för support och diskussioner om AZD och utplaceringar av AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen observera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet i dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas en professionell, mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->