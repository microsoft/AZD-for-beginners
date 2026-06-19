# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Kapitel 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Denna praktiska labb vägleder utvecklare genom processen att ta en befintlig AI-mall och distribuera den med Azure Developer CLI (AZD). Du kommer att lära dig viktiga mönster för produktionsdistributioner av AI med Microsoft Foundry-tjänster.

> **Valideringsnotering (2026-03-25):** Denna workshop granskades mot `azd` `1.23.12`. Om din lokala installation är äldre, uppdatera AZD innan du börjar så att autentisering, mall och distributionsflöde matchar stegen nedan.

**Varaktighet:** 2–3 timmar  
**Nivå:** Mellanliggande  
**Förkunskaper:** Grundläggande Azure-kunskaper, bekantskap med AI/ML-koncept

## 🎓 Learning Objectives

I slutet av denna workshop kommer du att kunna:
- ✅ Konvertera en befintlig AI-applikation för att använda AZD-mallar
- ✅ Konfigurera Microsoft Foundry-tjänster med AZD
- ✅ Implementera säker hantering av autentiseringsuppgifter för AI-tjänster
- ✅ Distribuera produktionsklara AI-applikationer med övervakning
- ✅ Felsöka vanliga problem vid AI-distribution

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installerad
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installerad
- [Git](https://git-scm.com/) installerat
- Kodredigerare (rekommenderas VS Code)

### Azure Resources
- Azure-prenumeration med contributor-åtkomst
- Åtkomst till Microsoft Foundry Models-tjänster (eller möjlighet att begära åtkomst)
- Rättigheter att skapa resursgrupper

### Knowledge Prerequisites
- Grundläggande förståelse för Azure-tjänster
- Bekantskap med kommandoradsgränssnitt
- Grundläggande AI/ML-koncept (API:er, modeller, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Kontrollera AZD-installationen
azd version

# Kontrollera Azure CLI
az --version

# Logga in på Azure för AZD-arbetsflöden
azd auth login

# Logga in i Azure CLI endast om du planerar att köra az-kommandon under diagnostik
az login
```

Om du arbetar över flera tenants eller din prenumeration inte upptäcks automatiskt, försök igen med `azd auth login --tenant-id <tenant-id>`.

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Utforska nyckelfilerna i en AI-redo AZD-mall:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- Tjänstdefinitioner för AI-komponenter
- Miljövariabelmappningar
- Hostkonfigurationer

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Provisionering av Microsoft Foundry Models-tjänst
- Integration med Azure AI Search
- Säker nyckelhantering
- Nätverkssäkerhetskonfigurationer

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI-appar kräver ofta flera koordinerade tjänster
- **Security**: API-nycklar och endpoints behöver säker hantering
- **Scalability**: AI-workloads har unika krav för skalning
- **Cost Management**: AI-tjänster kan bli dyra om de inte är korrekt konfigurerade

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Ange din föredragna Azure-region
azd env set AZURE_LOCATION eastus

# Valfritt: Ange en specifik OpenAI-modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Provisionerar Microsoft Foundry Models-tjänst
- ✅ Skapar Azure AI Search-tjänst
- ✅ Sätter upp App Service för webbapplikationen
- ✅ Konfigurerar nätverk och säkerhet
- ✅ Distribuerar applikationskoden
- ✅ Sätter upp övervakning och loggning

2. **Monitor the deployment progress** och notera resurserna som skapas.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show
```

Öppna webbslutpunkten som visas i `azd show`-utdata.

3. **Test the AI functionality:**
   - Navigera till webbapplikationen
   - Prova exempelqueries
   - Verifiera att AI-svar fungerar

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Din distribution lyckades men AI svarar inte.

**Common issues to check:**
1. **OpenAI API keys**: Verifiera att de är korrekt inställda
2. **Model availability**: Kontrollera om din region stöder modellen
3. **Network connectivity**: Säkerställ att tjänster kan kommunicera
4. **RBAC permissions**: Verifiera att appen kan nå OpenAI

**Debugging commands:**
```bash
# Kontrollera miljövariabler
azd env get-values

# Visa distributionsloggar
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontrollera OpenAI-distributionens status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Byt till en annan modell (om den är tillgänglig i ditt område)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Distribuera om med den nya konfigurationen
azd deploy
```

2. **Add additional AI services:**

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

### Step 3.2: Environment-Specific Configurations

**Best Practice**: Olika konfigurationer för utveckling jämfört med produktion.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# Produktion använder vanligtvis högre SKU:er
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktivera ytterligare säkerhetsfunktioner
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Konfigurera mallen för kostnadseffektiv utveckling.

**Tasks:**
1. Identifiera vilka SKUs som kan sättas till free/basic-tier
2. Konfigurera miljövariabler för minimal kostnad
3. Distribuera och jämför kostnader med produktionskonfigurationen

**Solution hints:**
- Använd F0 (gratis) nivå för Azure AI Services när det är möjligt
- Använd Basic-nivå för Search Service i utveckling
- Överväg att använda Consumption-plan för Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Många AI-appar hårdkodar API-nycklar eller använder osäker lagring.

**AZD Solution**: Managed Identity + Key Vault-integration.

1. **Review the security configuration in your template:**
```bash
# Sök efter konfiguration för Key Vault och Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Kontrollera om webbappen har korrekt identitetskonfiguration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

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

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights bör konfigureras automatiskt
# Kontrollera konfigurationen:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

Lägg till egna metrics för AI-operationer:
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

### **Lab Exercise 4.1: Security Audit**

**Task**: Granska din distribution för säkerhetsbästa praxis.

**Checklist:**
- [ ] Inga hårdkodade hemligheter i kod eller konfiguration
- [ ] Managed Identity används för tjänst-till-tjänst-autentisering
- [ ] Key Vault lagrar känslig konfiguration
- [ ] Nätverksåtkomst är korrekt begränsad
- [ ] Övervakning och loggning är aktiverade

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, besvara dessa frågor:

1. **Application Architecture:**
   - Vilka AI-tjänster använder din app?
   - Vilka beräkningsresurser behöver den?
   - Kräver den en databas?
   - Vad är beroendena mellan tjänsterna?

2. **Security Requirements:**
   - Vilka känsliga data hanterar din app?
   - Vilka regelkrav måste du uppfylla?
   - Behöver du privat nätverk?

3. **Scaling Requirements:**
   - Vad är din förväntade belastning?
   - Behöver du autoskalning?
   - Finns det regionala krav?

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initiera AZD-mallen
azd init --template minimal
```

2. **Create azure.yaml:**
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

3. **Create infrastructure templates:**

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

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: Skapa en AZD-mall för en dokumentbearbetande AI-app.

**Requirements:**
- Microsoft Foundry Models för innehållsanalys
- Document Intelligence för OCR
- Storage Account för dokumentuppladdningar
- Function App för bearbetningslogik
- Webbapp för användargränssnitt

**Bonuspoäng:**
- Lägg till ordentlig felhantering
- Inkludera kostnadsuppskattning
- Sätt upp övervakningsdashboards

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Distribution misslyckas med kvotfel
**Solutions:**
```bash
# Kontrollera aktuella kvoter
az cognitiveservices usage list --location eastus

# Begär en kvotökning eller försök en annan region
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** AI-svar misslyckas eller modelldistribution felar
**Solutions:**
```bash
# Kontrollera modellens tillgänglighet per region
az cognitiveservices model list --location eastus

# Uppdatera till en tillgänglig modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** 403 Forbidden-fel när du anropar AI-tjänster
**Solutions:**
```bash
# Kontrollera rolltilldelningar
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Lägg till saknade roller
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Kontrollera Application Insights för prestandamått
2. Granska OpenAI-tjänstens mätvärden i Azure-portalen
3. Verifiera nätverksanslutning och latens

**Solutions:**
- Implementera caching för vanliga frågor
- Använd lämplig OpenAI-modell för ditt användningsfall
- Överväg read replicas för hög belastning

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Din distribution lyckades, men applikationen returnerar 500-fel.

**Debugging tasks:**
1. Kontrollera applikationsloggar
2. Verifiera tjänstekonnektivitet
3. Testa autentisering
4. Granska konfiguration

**Tools to use:**
- `azd show` för översikt av distributionen
- Azure-portalen för detaljerade tjänstloggar
- Application Insights för applikationstelemetri

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Navigera till Azure-portalen och skapa en dashboard med:
- OpenAI förfrågningsantal och latens
- Applikationsfelräntor
- Resursutnyttjande
- Kostnadsspårning

2. **Set up alerts:**
```bash
# Varning för hög felfrekvens
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Använd Azure CLI för att hämta kostnadsdata
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Konfigurera budgetvarningar
- Använd autoskalningspolicyer
- Implementera förfrågningscache
- Övervaka tokenanvändning för OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimera din AI-applikation för både prestanda och kostnad.

**Mått att förbättra:**
- Minska genomsnittlig responstid med 20%
- Minska månadskostnader med 15%
- Bibehåll 99,9% upptid

**Strategier att prova:**
- Implementera responscache
- Optimera prompts för token-effektivitet
- Använd lämpliga compute-SKUs
- Sätt upp korrekt autoskalning

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Du har i uppdrag att skapa en produktionsklar AI-driven kundservicechattbot med dessa krav:

**Functional Requirements:**
- Webbgränssnitt för kundinteraktioner
- Integration med Microsoft Foundry Models för svar
- Dokumentsökfunktion med Azure AI Search
- Integration med befintlig kunddatabas
- Fler språkstöd

**Non-Functional Requirements:**
- Hantera 1000 samtidiga användare
- 99,9% upptid SLA
- SOC 2-efterlevnad
- Kostnad under $500/månad
- Distribuera till flera miljöer (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: Uppfyller det alla krav?
- ✅ **Security**: Är bästa praxis implementerade?
- ✅ **Scalability**: Kan det hantera belastningen?
- ✅ **Maintainability**: Är koden och infrastrukturen välorganiserad?
- ✅ **Cost**: Håller det sig inom budget?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Gemenskapsresurser
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Intyg om genomförande

Grattis! Du har slutfört AI Workshop Lab. Du bör nu kunna:

- ✅ Konvertera befintliga AI-applikationer till AZD-mallar
- ✅ Distribuera produktionsfärdiga AI-applikationer
- ✅ Implementera säkerhetsbästa praxis för AI-arbetsbelastningar
- ✅ Övervaka och optimera AI-applikationers prestanda
- ✅ Felsöka vanliga distributionsproblem

### Nästa steg
1. Tillämpa dessa mönster på dina egna AI-projekt
2. Bidra med mallar tillbaka till communityn
3. Gå med i Microsoft Foundry Discord för kontinuerligt stöd
4. Utforska avancerade ämnen som distribution i flera regioner

---

**Feedback om workshopen**: Hjälp oss förbättra den här workshopen genom att dela dina erfarenheter i [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Kapitelnavigering:**
- **📚 Kurshem**: [AZD For Beginners](../../README.md)
- **📖 Aktuellt kapitel**: Chapter 2 - AI-First Development
- **⬅️ Föregående**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Nästa**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Nästa kapitel**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Behöver du hjälp?** Gå med i vår community för stöd och diskussioner om AZD och AI-distributioner.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->