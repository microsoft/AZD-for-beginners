# AI Workshop Lab: Gør dine AI-løsninger klar til udrulning med AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Kapitel 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Denne praktiske workshop leder udviklere gennem processen med at tage en eksisterende AI-skabelon og udrulle den ved hjælp af Azure Developer CLI (AZD). Du vil lære væsentlige mønstre til produktionsklar AI-udrulning ved hjælp af Microsoft Foundry-tjenester.

**Varighed:** 2-3 timer  
**Niveau:** Mellemniveau  
**Forudsætninger:** Grundlæggende Azure-kendskab, fortrolighed med AI/ML-koncepter

## 🎓 Læringsmål

Når du har gennemført workshoppen, vil du kunne:
- ✅ Konvertere en eksisterende AI-applikation til at bruge AZD-skabeloner
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker credential-håndtering for AI-tjenester
- ✅ Udrulle produktionsklare AI-applikationer med overvågning
- ✅ Fejlsøge almindelige AI-udrulningsproblemer

## Forudsætninger

### Påkrævede værktøjer
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installeret
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installeret
- [Git](https://git-scm.com/) installeret
- Kodeeditor (VS Code anbefales)

### Azure-ressourcer
- Azure-abonnement med contributor-adgang
- Adgang til Azure OpenAI-tjenester (eller mulighed for at anmode om adgang)
- Tilladelser til oprettelse af ressourcegruppe

### Kendskab der kræves
- Grundlæggende forståelse af Azure-tjenester
- Fortrolighed med kommandolinjegrænseflader
- Grundlæggende AI/ML-koncepter (API'er, modeller, prompts)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Kontroller AZD-installation
azd version

# Kontroller Azure CLI
az --version

# Log ind på Azure
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Forståelse af AZD-strukturen for AI-applikationer

### Anatomi af en AI AZD-skabelon

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

### **Laboratorieøvelse 1.1: Udforsk konfigurationen**

1. **Undersøg filen azure.yaml:**
```bash
cat azure.yaml
```

**Hvad du skal kigge efter:**
- Service-definitioner for AI-komponenter
- Miljøvariabel-mapping
- Host-konfigurationer

2. **Gennemgå main.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Vigtige AI-mønstre at identificere:**
- Provisionering af Azure OpenAI-tjenesten
- Integration af Cognitive Search
- Sikker nøglehåndtering
- Netværkssikkerhedskonfigurationer

### **Diskussionspunkt:** Hvorfor disse mønstre er vigtige for AI

- **Service Dependencies**: AI-apps kræver ofte flere koordinerede tjenester
- **Security**: API-nøgler og endpoints skal håndteres sikkert
- **Scalability**: AI-workloads har unikke skaleringskrav
- **Cost Management**: AI-tjenester kan være dyre, hvis de ikke er korrekt konfigureret

## Modul 2: Udrul din første AI-applikation

### Step 2.1: Initialiser miljøet

1. **Opret et nyt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Angiv krævede parametre:**
```bash
# Angiv din foretrukne Azure-region
azd env set AZURE_LOCATION eastus

# Valgfrit: Angiv en specifik OpenAI-model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Udrul infrastrukturen og applikationen

1. **Udrul med AZD:**
```bash
azd up
```

**Hvad sker der under `azd up`:**
- ✅ Provisionerer Azure OpenAI-tjenesten
- ✅ Opretter Cognitive Search-tjenesten
- ✅ Sætter App Service op til webapplikationen
- ✅ Konfigurerer netværk og sikkerhed
- ✅ Udruller applikationskoden
- ✅ Opsætter overvågning og logging

2. **Overvåg udrulningsprocessen** og bemærk de ressourcer, der bliver oprettet.

### Step 2.3: Bekræft din udrulning

1. **Tjek de udrullede ressourcer:**
```bash
azd show
```

2. **Åbn den udrullede applikation:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test AI-funktionaliteten:**
   - Naviger til webapplikationen
   - Prøv eksemplariske forespørgsler
   - Bekræft at AI-svar fungerer

### **Laboratorieøvelse 2.1: Fejlsøgningsøvelse**

**Scenarie**: Din udrulning lykkedes, men AI'en svarer ikke.

**Almindelige problemer at tjekke:**
1. **OpenAI API keys**: Bekræft at de er korrekt indstillet
2. **Model availability**: Tjek om din region understøtter modellen
3. **Network connectivity**: Sørg for at tjenesterne kan kommunikere
4. **RBAC permissions**: Bekræft at appen kan få adgang til OpenAI

**Fejlsøgningskommandoer:**
```bash
# Kontroller miljøvariabler
azd env get-values

# Vis udrulningslogfiler
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontroller OpenAI-udrulningsstatus
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpasning af AI-applikationer til dine behov

### Step 3.1: Ændre AI-konfigurationen

1. **Opdater OpenAI-modellen:**
```bash
# Skift til en anden model (hvis tilgængelig i din region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Udrul igen med den nye konfiguration
azd deploy
```

2. **Tilføj yderligere AI-tjenester:**

Edit `infra/main.bicep` to add Document Intelligence:

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

### Step 3.2: Miljøspecifikke konfigurationer

**Bedste praksis**: Forskellige konfigurationer til udvikling vs produktion.

1. **Opret et produktionsmiljø:**
```bash
azd env new myai-production
```

2. **Angiv produktionsspecifikke parametre:**
```bash
# Produktion bruger typisk højere SKU'er
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktivér yderligere sikkerhedsfunktioner
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratorieøvelse 3.1: Omkostningsoptimering**

**Udfordring**: Konfigurer skabelonen for omkostningseffektiv udvikling.

**Opgaver:**
1. Identificer hvilke SKUs der kan sættes til free/basic-niveauer
2. Konfigurer miljøvariabler for minimal omkostning
3. Udrul og sammenlign omkostninger med produktionskonfigurationen

**Løsningshint:**
- Brug F0 (gratis) niveau for Cognitive Services når det er muligt
- Brug Basic-niveau for Search Service i udvikling
- Overvej at bruge Consumption-plan for Functions

## Modul 4: Sikkerhed og bedste praksis til produktion

### Step 4.1: Sikker credential-håndtering

**Nuværende udfordring**: Mange AI-apps hardcoder API-nøgler eller bruger usikker lagring.

**AZD-løsning**: Managed Identity + Key Vault-integration.

1. **Gennemgå sikkerhedskonfigurationen i din skabelon:**
```bash
# Se efter Key Vault- og Managed Identity-konfiguration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verificer at Managed Identity virker:**
```bash
# Kontroller, om webappen har den korrekte identitetskonfiguration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Netværkssikkerhed

1. **Aktiver private endpoints** (hvis ikke allerede konfigureret):

Add to your bicep template:
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

### Step 4.3: Overvågning og observerbarhed

1. **Konfigurer Application Insights:**
```bash
# Application Insights bør konfigureres automatisk
# Kontroller konfigurationen:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sæt AI-specifik overvågning op:**

Tilføj brugerdefinerede metrics for AI-operationer:
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

### **Laboratorieøvelse 4.1: Sikkerhedsrevision**

**Opgave**: Gennemgå din udrulning for bedste sikkerhedspraksis.

**Tjekliste:**
- [ ] Ingen hårdkodede hemmeligheder i kode eller konfiguration
- [ ] Managed Identity bruges til tjeneste-til-tjeneste-autentificering
- [ ] Key Vault gemmer følsom konfiguration
- [ ] Netværksadgang er korrekt begrænset
- [ ] Overvågning og logning er aktiveret

## Modul 5: Konverter din egen AI-applikation

### Step 5.1: Vurderingsark

**Før du konverterer din app**, besvar disse spørgsmål:

1. **Applikationsarkitektur:**
   - Hvilke AI-tjenester bruger din app?
   - Hvilke compute-ressourcer har den brug for?
   - Kræver den en database?
   - Hvad er afhængighederne mellem tjenesterne?

2. **Sikkerhedskrav:**
   - Hvilke følsomme data håndterer din app?
   - Hvilke compliance-krav har du?
   - Har du brug for privat netværk?

3. **Skaleringskrav:**
   - Hvad er dit forventede load?
   - Har du brug for autoskalering?
   - Er der regionale krav?

### Step 5.2: Opret din AZD-skabelon

**Følg dette mønster for at konvertere din app:**

1. **Opret den grundlæggende struktur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialiser AZD-skabelon
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

3. **Opret infrastruktur-skabeloner:**

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

### **Laboratorieøvelse 5.1: Skabelonoprettelsesudfordring**

**Udfordring**: Opret en AZD-skabelon til en dokumentbehandlings-AI-app.

**Krav:**
- Azure OpenAI til indholdsanalyse
- Document Intelligence til OCR
- Storage Account til dokumentuploads
- Function App til behandlingslogik
- Web-app til brugergrænseflade

**Bonuspoint:**
- Tilføj korrekt fejlbehandling
- Inkluder omkostningsestimering
- Opsæt overvågningsdashboards

## Modul 6: Fejlfinding af almindelige problemer

### Almindelige udrulningsproblemer

#### Issue 1: OpenAI Service Quota Exceeded
**Symptomer:** Udrulning fejler med kvote-fejl
**Løsninger:**
```bash
# Kontroller de nuværende kvoter
az cognitiveservices usage list --location eastus

# Anmod om en forhøjelse af kvoten eller prøv en anden region
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptomer:** AI-svar fejler eller modeludrulning fejler
**Løsninger:**
```bash
# Kontroller modeltilgængelighed efter region
az cognitiveservices model list --location eastus

# Opdater til en tilgængelig model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptomer:** 403 Forbidden-fejl ved kald til AI-tjenester
**Løsninger:**
```bash
# Kontroller rollefordelinger
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tilføj manglende roller
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Ydelsesproblemer

#### Issue 4: Slow AI Responses
**Undersøgelsestrin:**
1. Tjek Application Insights for ydelsesmetrics
2. Gennemgå OpenAI-service-metrics i Azure-portalen
3. Verificer netværksforbindelse og latency

**Løsninger:**
- Implementer caching for almindelige forespørgsler
- Brug passende OpenAI-model til dit brugsscenario
- Overvej read replicas til højbelastningsscenarier

### **Laboratorieøvelse 6.1: Fejlsøgningsudfordring**

**Scenarie**: Din udrulning lykkedes, men applikationen returnerer 500-fejl.

**Fejlsøgningsopgaver:**
1. Tjek applikationslogs
2. Bekræft serviceforbindelser
3. Test autentificering
4. Gennemgå konfiguration

**Værktøjer at bruge:**
- `azd show` for overblik over udrulning
- Azure-portalen for detaljerede servicelogs
- Application Insights for applikationstelemetri

## Modul 7: Overvågning og optimering

### Step 7.1: Opsæt omfattende overvågning

1. **Opret brugerdefinerede dashboards:**

Naviger til Azure-portalen og opret et dashboard med:
- OpenAI anmodningstælling og latency
- Applikationsfejlprocenter
- Ressourceudnyttelse
- Omkostningsovervågning

2. **Opsæt alarmer:**
```bash
# Advarsel om høj fejlrate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Omkostningsoptimering

1. **Analyser nuværende omkostninger:**
```bash
# Brug Azure CLI til at hente omkostningsdata
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementer omkostningskontroller:**
- Opsæt budgetalarmer
- Brug autoscaleringspolitikker
- Implementer request-caching
- Overvåg tokenforbrug for OpenAI

### **Laboratorieøvelse 7.1: Ydelsesoptimering**

**Opgave**: Optimér din AI-applikation for både ydelse og omkostninger.

**Metrics at forbedre:**
- Reducer gennemsnitlig svartid med 20%
- Reducer månedlige omkostninger med 15%
- Oprethold 99,9% oppetid

**Strategier at prøve:**
- Implementer responscaching
- Optimér prompts for token-effektivitet
- Brug passende compute-SKUs
- Opsæt korrekt autoskalering

## Afsluttende udfordring: Ende-til-ende-implementering

### Udfordringsscenario

Du skal skabe en produktionsklar AI-drevet kundeservice-chatbot med disse krav:

**Funktionelle krav:**
- Webinterface til kundekontakt
- Integration med Azure OpenAI til svar
- Dokumentsøgning ved brug af Cognitive Search
- Integration med eksisterende kundedatabase
- Multisprog-understøttelse

**Ikke-funktionelle krav:**
- Håndter 1000 samtidige brugere
- 99,9% oppetid SLA
- SOC 2 compliance
- Omkostninger under $500/måned
- Udrul til flere miljøer (dev, staging, prod)

### Implementeringstrin

1. **Design arkitekturen**
2. **Opret AZD-skabelonen**
3. **Implementer sikkerhedsforanstaltninger**
4. **Opsæt overvågning og alarmer**
5. **Opret udrulningspipelines**
6. **Dokumentér løsningen**

### Evalueringskriterier

- ✅ **Functionality**: Opfylder den alle krav?
- ✅ **Security**: Er bedste praksis implementeret?
- ✅ **Scalability**: Kan den håndtere belastningen?
- ✅ **Maintainability**: Er koden og infrastrukturen velorganiseret?
- ✅ **Cost**: Holder den sig inden for budget?

## Yderligere ressourcer

### Microsoft-dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelskabeloner
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fællesskabsressourcer
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Færdiggørelsescertifikat
Tillykke! Du har gennemført AI Workshop-labben. Du bør nu være i stand til at:

- ✅ Konvertere eksisterende AI-applikationer til AZD-skabeloner
- ✅ Udrulle produktionsklare AI-applikationer
- ✅ Implementere sikkerhedsbest practices for AI-arbejdsbelastninger
- ✅ Overvåge og optimere AI-applikationers ydeevne
- ✅ Fejlsøge almindelige udrulningsproblemer

### Næste skridt
1. Anvend disse mønstre på dine egne AI-projekter
2. Bidrag med skabeloner til fællesskabet
3. Deltag i Microsoft Foundry Discord for løbende support
4. Udforsk avancerede emner som udrulninger på tværs af flere regioner

---

**Workshop-feedback**: Hjælp os med at forbedre denne workshop ved at dele din oplevelse i [Microsoft Foundry Discord #Azure-kanal](https://discord.gg/microsoft-azure).

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 2 - AI-først udvikling
- **⬅️ Forrige**: [Udrulning af AI-model](ai-model-deployment.md)
- **➡️ Næste**: [Bedste praksis for AI i produktion](production-ai-practices.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brug for hjælp?** Deltag i vores fællesskab for support og diskussioner om AZD og AI-udrulninger.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For vigtig information anbefales professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->