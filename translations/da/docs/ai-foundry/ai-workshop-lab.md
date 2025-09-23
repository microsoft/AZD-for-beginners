<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:29:49+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "da"
}
-->
# AI Workshop Lab: Gør dine AI-løsninger AZD-Deployable

**Kapiteloversigt:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 2 - AI-First Udvikling
- **⬅️ Forrige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Næste**: [Produktion AI Best Practices](production-ai-practices.md)
- **🚀 Næste Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

## Workshop Oversigt

Denne praktiske lab guider udviklere gennem processen med at tage en eksisterende AI-skabelon og implementere den ved hjælp af Azure Developer CLI (AZD). Du vil lære essentielle mønstre for produktionsklare AI-implementeringer ved hjælp af Azure AI Foundry-tjenester.

**Varighed:** 2-3 timer  
**Niveau:** Mellem  
**Forudsætninger:** Grundlæggende Azure-viden, kendskab til AI/ML-koncepter

## 🎓 Læringsmål

Ved afslutningen af denne workshop vil du kunne:
- ✅ Konvertere en eksisterende AI-applikation til at bruge AZD-skabeloner
- ✅ Konfigurere Azure AI Foundry-tjenester med AZD
- ✅ Implementere sikker håndtering af legitimationsoplysninger for AI-tjenester
- ✅ Udrulle produktionsklare AI-applikationer med overvågning
- ✅ Fejlsøge almindelige AI-implementeringsproblemer

## Forudsætninger

### Nødvendige Værktøjer
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installeret
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installeret
- [Git](https://git-scm.com/) installeret
- Kodeeditor (VS Code anbefales)

### Azure Ressourcer
- Azure-abonnement med bidragsyderadgang
- Adgang til Azure OpenAI-tjenester (eller mulighed for at anmode om adgang)
- Tilladelser til at oprette ressourcegrupper

### Vidensforudsætninger
- Grundlæggende forståelse af Azure-tjenester
- Kendskab til kommandolinjegrænseflader
- Grundlæggende AI/ML-koncepter (API'er, modeller, prompts)

## Lab Opsætning

### Trin 1: Forberedelse af Miljø

1. **Bekræft installation af værktøjer:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Klon workshop-repositoriet:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Forstå AZD-strukturen for AI-applikationer

### Anatomien af en AI AZD-skabelon

Udforsk nøglefilerne i en AI-klar AZD-skabelon:

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

### **Lab Øvelse 1.1: Udforsk Konfigurationen**

1. **Undersøg azure.yaml-filen:**
```bash
cat azure.yaml
```

**Hvad du skal kigge efter:**
- Service-definitioner for AI-komponenter
- Miljøvariabel-mapping
- Værtskonfigurationer

2. **Gennemgå main.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Vigtige AI-mønstre at identificere:**
- Provisionering af Azure OpenAI-tjeneste
- Integration af Cognitive Search
- Sikker nøglehåndtering
- Netværkssikkerhedskonfigurationer

### **Diskussionspunkt:** Hvorfor disse mønstre er vigtige for AI

- **Serviceafhængigheder**: AI-apps kræver ofte flere koordinerede tjenester
- **Sikkerhed**: API-nøgler og endpoints skal håndteres sikkert
- **Skalerbarhed**: AI-arbejdsbelastninger har unikke skaleringskrav
- **Omkostningsstyring**: AI-tjenester kan være dyre, hvis de ikke er korrekt konfigureret

## Modul 2: Implementer din første AI-applikation

### Trin 2.1: Initialiser Miljøet

1. **Opret et nyt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Indstil nødvendige parametre:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Trin 2.2: Implementer Infrastruktur og Applikation

1. **Implementer med AZD:**
```bash
azd up
```

**Hvad der sker under `azd up`:**
- ✅ Provisionerer Azure OpenAI-tjeneste
- ✅ Opretter Cognitive Search-tjeneste
- ✅ Opsætter App Service til webapplikationen
- ✅ Konfigurerer netværk og sikkerhed
- ✅ Implementerer applikationskode
- ✅ Opsætter overvågning og logning

2. **Overvåg implementeringsprocessen** og noter de ressourcer, der oprettes.

### Trin 2.3: Verificer din Implementering

1. **Tjek de implementerede ressourcer:**
```bash
azd show
```

2. **Åbn den implementerede applikation:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test AI-funktionaliteten:**
   - Naviger til webapplikationen
   - Prøv eksempler på forespørgsler
   - Bekræft, at AI-svar fungerer

### **Lab Øvelse 2.1: Fejlsøgningspraksis**

**Scenario**: Din implementering lykkedes, men AI svarer ikke.

**Almindelige problemer at tjekke:**
1. **OpenAI API-nøgler**: Bekræft, at de er korrekt indstillet
2. **Modeltilgængelighed**: Tjek om din region understøtter modellen
3. **Netværksforbindelse**: Sørg for, at tjenester kan kommunikere
4. **RBAC-tilladelser**: Bekræft, at appen kan få adgang til OpenAI

**Fejlsøgningskommandoer:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpasning af AI-applikationer til dine behov

### Trin 3.1: Opdater AI-konfigurationen

1. **Opdater OpenAI-modellen:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Tilføj yderligere AI-tjenester:**

Rediger `infra/main.bicep` for at tilføje Document Intelligence:

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

### Trin 3.2: Miljøspecifikke Konfigurationer

**Bedste praksis**: Forskellige konfigurationer for udvikling vs produktion.

1. **Opret et produktionsmiljø:**
```bash
azd env new myai-production
```

2. **Indstil produktionsspecifikke parametre:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Øvelse 3.1: Omkostningsoptimering**

**Udfordring**: Konfigurer skabelonen til omkostningseffektiv udvikling.

**Opgaver:**
1. Identificer hvilke SKUs der kan indstilles til gratis/basisniveauer
2. Konfigurer miljøvariabler for minimale omkostninger
3. Implementer og sammenlign omkostninger med produktionskonfigurationen

**Løsningshint:**
- Brug F0 (gratis) niveau for Cognitive Services, når det er muligt
- Brug Basic niveau for Search Service i udvikling
- Overvej at bruge Consumption-plan for Functions

## Modul 4: Sikkerhed og Produktionsbedste Praksis

### Trin 4.1: Sikker Håndtering af Legitimationsoplysninger

**Nuværende udfordring**: Mange AI-apps hardcoder API-nøgler eller bruger usikker lagring.

**AZD-løsning**: Managed Identity + Key Vault integration.

1. **Gennemgå sikkerhedskonfigurationen i din skabelon:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Bekræft, at Managed Identity fungerer:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Trin 4.2: Netværkssikkerhed

1. **Aktiver private endpoints** (hvis ikke allerede konfigureret):

Tilføj til din bicep-skabelon:
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

### Trin 4.3: Overvågning og Observabilitet

1. **Konfigurer Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Opsæt AI-specifik overvågning:**

Tilføj brugerdefinerede metrikker for AI-operationer:
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

### **Lab Øvelse 4.1: Sikkerhedsrevision**

**Opgave**: Gennemgå din implementering for sikkerhedsbedste praksis.

**Tjekliste:**
- [ ] Ingen hardcodede hemmeligheder i kode eller konfiguration
- [ ] Managed Identity bruges til service-til-service autentifikation
- [ ] Key Vault gemmer følsom konfiguration
- [ ] Netværksadgang er korrekt begrænset
- [ ] Overvågning og logning er aktiveret

## Modul 5: Konvertering af din egen AI-applikation

### Trin 5.1: Vurderingsark

**Før du konverterer din app**, besvar disse spørgsmål:

1. **Applikationsarkitektur:**
   - Hvilke AI-tjenester bruger din app?
   - Hvilke compute-ressourcer har den brug for?
   - Kræver den en database?
   - Hvad er afhængighederne mellem tjenester?

2. **Sikkerhedskrav:**
   - Hvilke følsomme data håndterer din app?
   - Hvilke overholdelseskrav har du?
   - Har du brug for privat netværk?

3. **Skaleringskrav:**
   - Hvad er din forventede belastning?
   - Har du brug for auto-skalering?
   - Er der regionale krav?

### Trin 5.2: Opret din AZD-skabelon

**Følg dette mønster for at konvertere din app:**

1. **Opret den grundlæggende struktur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Opret azure.yaml:**
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

3. **Opret infrastrukturskabeloner:**

**infra/main.bicep** - Hovedskabelon:
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

### **Lab Øvelse 5.1: Skabelonoprettelsesudfordring**

**Udfordring**: Opret en AZD-skabelon til en dokumentbehandlings-AI-app.

**Krav:**
- Azure OpenAI til indholdsanalyse
- Document Intelligence til OCR
- Storage Account til dokumentuploads
- Function App til behandlingslogik
- Webapp til brugergrænseflade

**Bonuspoint:**
- Tilføj korrekt fejlhåndtering
- Inkluder omkostningsestimering
- Opsæt overvågningsdashboard

## Modul 6: Fejlsøgning af Almindelige Problemer

### Almindelige Implementeringsproblemer

#### Problem 1: OpenAI Service Kvota Overskredet
**Symptomer:** Implementering fejler med kvotafejl
**Løsninger:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model Ikke Tilgængelig i Region
**Symptomer:** AI-svar fejler eller modelimplementeringsfejl
**Løsninger:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Tilladelsesproblemer
**Symptomer:** 403 Forbidden fejl ved kald til AI-tjenester
**Løsninger:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Ydelsesproblemer

#### Problem 4: Langsomme AI-svar
**Undersøgelsestrin:**
1. Tjek Application Insights for ydelsesmålinger
2. Gennemgå OpenAI-tjenestemålinger i Azure-portalen
3. Bekræft netværksforbindelse og latenstid

**Løsninger:**
- Implementer caching for almindelige forespørgsler
- Brug passende OpenAI-model til din brugssag
- Overvej read replicas for høj belastning

### **Lab Øvelse 6.1: Fejlsøgningsudfordring**

**Scenario**: Din implementering lykkedes, men applikationen returnerer 500-fejl.

**Fejlsøgningsopgaver:**
1. Tjek applikationslogfiler
2. Bekræft serviceforbindelse
3. Test autentifikation
4. Gennemgå konfiguration

**Værktøjer at bruge:**
- `azd show` for implementeringsoversigt
- Azure-portalen for detaljerede servicelogfiler
- Application Insights for applikationstelemetri

## Modul 7: Overvågning og Optimering

### Trin 7.1: Opsæt Omfattende Overvågning

1. **Opret brugerdefinerede dashboards:**

Naviger til Azure-portalen og opret et dashboard med:
- OpenAI forespørgselsantal og latenstid
- Applikationsfejlprocenter
- Ressourceudnyttelse
- Omkostningssporing

2. **Opsæt alarmer:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Trin 7.2: Omkostningsoptimering

1. **Analyser aktuelle omkostninger:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementer omkostningskontroller:**
- Opsæt budgetalarmer
- Brug autoskalering politikker
- Implementer forespørgselscaching
- Overvåg tokenforbrug for OpenAI

### **Lab Øvelse 7.1: Ydelsesoptimering**

**Opgave**: Optimer din AI-applikation for både ydelse og omkostninger.

**Metrikker at forbedre:**
- Reducer gennemsnitlig svartid med 20%
- Reducer månedlige omkostninger med 15%
- Oprethold 99,9% oppetid

**Strategier at prøve:**
- Implementer svartidscaching
- Optimer prompts for token-effektivitet
- Brug passende compute SKUs
- Opsæt korrekt autoskalering

## Endelig Udfordring: Implementering fra Start til Slut

### Udfordringsscenario

Du er blevet bedt om at oprette en produktionsklar AI-drevet kundeservice chatbot med følgende krav:

**Funktionelle Krav:**
- Webgrænseflade til kundekommunikation
- Integration med Azure OpenAI for svar
- Dokument søgefunktionalitet ved hjælp af Cognitive Search
- Integration med eksisterende kundedatabase
- Flersproget support

**Ikke-Funktionelle Krav:**
- Håndter 1000 samtidige brugere
- 99,9% oppetid SLA
- SOC 2 overholdelse
- Omkostninger under $500/måned
- Implementer til flere miljøer (dev, staging, prod)

### Implementeringstrin

1. **Design arkitekturen**
2. **Opret AZD-skabelonen**
3. **Implementer sikkerhedsforanstaltninger**
4. **Opsæt overvågning og alarmer**
5. **Opret implementeringspipelines**
6. **Dokumenter løsningen**

### Evalueringskriterier

- ✅ **Funktionalitet**: Opfylder den alle krav?
- ✅ **Sikkerhed**: Er bedste praksis implementeret?
- ✅ **Skalerbarhed**: Kan den håndtere belastningen?
- ✅ **Vedligeholdelse**: Er koden og infrastrukturen velorganiseret?
- ✅ **Omkostninger**: Holder den sig inden for budgettet?

## Yderligere Ressourcer

### Microsoft Dokumentation
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Dokumentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry Dokumentation](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelskabeloner
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fællesskabsressourcer
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Afslutningscertifikat
Tillykke! Du har gennemført AI Workshop Lab. Du bør nu kunne:

- ✅ Konvertere eksisterende AI-applikationer til AZD-skabeloner
- ✅ Udrulle produktionsklare AI-applikationer
- ✅ Implementere sikkerhedsbedste praksis for AI-arbejdsbelastninger
- ✅ Overvåge og optimere AI-applikationers ydeevne
- ✅ Fejlsøge almindelige udrullingsproblemer

### Næste Skridt
1. Anvend disse mønstre på dine egne AI-projekter
2. Bidrag med skabeloner tilbage til fællesskabet
3. Deltag i Azure AI Foundry Discord for løbende support
4. Udforsk avancerede emner som multi-region udrulninger

---

**Workshop Feedback**: Hjælp os med at forbedre denne workshop ved at dele din oplevelse i [Azure AI Foundry Discord #Azure-kanalen](https://discord.gg/microsoft-azure).

---

**Kapitel Navigation:**
- **📚 Kursus Hjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 2 - AI-First Udvikling
- **⬅️ Forrige**: [AI Model Udrulning](ai-model-deployment.md)
- **➡️ Næste**: [Produktions AI Bedste Praksis](production-ai-practices.md)
- **🚀 Næste Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

**Brug for Hjælp?** Deltag i vores fællesskab for support og diskussioner om AZD og AI-udrulninger.

---

