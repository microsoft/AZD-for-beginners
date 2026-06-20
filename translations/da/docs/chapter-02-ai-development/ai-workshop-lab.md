# AI Workshop Lab: Gør dine AI-løsninger AZD-deployerbare

**Chapter Navigation:**
- **📚 Course Home**: [AZD For begyndere](../../README.md)
- **📖 Current Chapter**: Kapitel 2 - AI-først udvikling
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Workshop Oversigt

Denne hands-on lab guider udviklere gennem processen med at tage en eksisterende AI-skabelon og deployere den ved hjælp af Azure Developer CLI (AZD). Du lærer essentielle mønstre for produktionsklare AI-deploymenter ved brug af Microsoft Foundry-tjenester.

> **Valideringsnote (2026-03-25):** Denne workshop blev gennemgået med `azd` `1.23.12`. Hvis din lokale installation er ældre, opdater AZD før start, så auth-, skabelon- og deploy-workflow matcher trinnene nedenfor.

**Varighed:** 2-3 timer  
**Niveau:** Mellem    
**Forudsætninger:** Grundlæggende Azure-viden, kendskab til AI/ML-koncepter

## 🎓 Læringsmål

Ved slutningen af denne workshop vil du kunne:
- ✅ Konvertere en eksisterende AI-applikation til at bruge AZD-skabeloner
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker credential-håndtering for AI-tjenester
- ✅ Deploaye produktionsklare AI-applikationer med overvågning
- ✅ Fejlsøge almindelige AI-deploymentsproblemer

## Forudsætninger

### Krævede værktøjer
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installeret
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installeret
- [Git](https://git-scm.com/) installeret
- Kodeeditor (VS Code anbefales)

### Azure-ressourcer
- Azure-abonnement med contributor-adgang
- Adgang til Microsoft Foundry Models-tjenester (eller mulighed for at anmode om adgang)
- Tilladelser til oprettelse af resource groups

### Viden forudsætninger
- Grundlæggende forståelse af Azure-tjenester
- Fortrolighed med kommandolinjegrænseflader
- Grundlæggende AI/ML-koncepter (API'er, modeller, prompts)

## Lab Setup

### Trin 1: Forberedelse af miljø

1. **Verifier installation af værktøjer:**
```bash
# Kontroller AZD-installation
azd version

# Kontroller Azure CLI
az --version

# Log ind på Azure til AZD-arbejdsgange
azd auth login

# Log kun ind på Azure CLI, hvis du planlægger at køre az-kommandoer under diagnostik
az login
```

Hvis du arbejder på tværs af flere tenants eller dit abonnement ikke registreres automatisk, prøv igen med `azd auth login --tenant-id <tenant-id>`.

2. **Clone workshop-repositoriet:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Forstå AZD-strukturen for AI-applikationer

### Anatomi af en AI AZD-skabelon

Udforsk nøglefilerne i en AI-klar AZD-skabelon:

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

### **Lab Exercise 1.1: Udforsk konfigurationen**

1. **Undersøg azure.yaml-filen:**
```bash
cat azure.yaml
```

**Hvad du skal kigge efter:**
- Servicedefinitioner for AI-komponenter
- Miljøvariabel-mappinger
- Host-konfigurationer

2. **Gennemgå main.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Vigtige AI-mønstre at identificere:**
- Provisionering af Microsoft Foundry Models-tjeneste
- Integration af Azure AI Search
- Sikker nøglehåndtering
- Netværkssikkerhedskonfigurationer

### **Diskussionspunkt:** Hvorfor disse mønstre betyder noget for AI

- **Serviceafhængigheder:** AI-apps kræver ofte flere koordinerede tjenester
- **Sikkerhed:** API-nøgler og endpoints skal håndteres sikkert
- **Skalerbarhed:** AI-workloads har unikke skaleringsekrav
- **Omkostningsstyring:** AI-tjenester kan blive dyre, hvis de ikke er korrekt konfigureret

## Modul 2: Deploy din første AI-applikation

### Trin 2.1: Initialiser miljøet

1. **Opret et nyt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Angiv nødvendige parametre:**
```bash
# Angiv din foretrukne Azure-region
azd env set AZURE_LOCATION eastus

# Valgfrit: Angiv en specifik OpenAI-model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Trin 2.2: Deploy infrastrukturen og applikationen

1. **Deploy med AZD:**
```bash
azd up
```

**Hvad sker der under `azd up`:**
- ✅ Provisionerer Microsoft Foundry Models-tjeneste
- ✅ Opretter Azure AI Search-tjeneste
- ✅ Sætter App Service op til webapplikationen
- ✅ Konfigurerer netværk og sikkerhed
- ✅ Deployerer applikationskoden
- ✅ Sætter overvågning og logging op

2. **Overvåg deployment-processen** og bemærk ressourcerne, der oprettes.

### Trin 2.3: Verificer dit deployment

1. **Tjek de deployerede ressourcer:**
```bash
azd show
```

2. **Åbn den deployerede applikation:**
```bash
azd show
```

Åbn web-endpointet vist i `azd show` output.

3. **Test AI-funktionaliteten:**
   - Naviger til webapplikationen
   - Prøv eksempelforespørgsler
   - Bekræft at AI-svar fungerer

### **Lab Exercise 2.1: Fejlsøgningsøvelse**

**Scenarie**: Dit deployment lykkedes, men AI reagerer ikke.

**Almindelige problemer at tjekke:**
1. **OpenAI API-nøgler**: Bekræft at de er korrekt sat
2. **Modeltilgængelighed**: Tjek om din region understøtter modellen
3. **Netværksforbindelse**: Sørg for at tjenesterne kan kommunikere
4. **RBAC-tilladelser**: Bekræft at appen kan få adgang til OpenAI

**Debugging-kommandoer:**
```bash
# Kontroller miljøvariabler
azd env get-values

# Vis udrulningslogfiler
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontroller OpenAI-udrulningsstatus
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpasning af AI-applikationer til dine behov

### Trin 3.1: Ændre AI-konfigurationen

1. **Opdater OpenAI-modellen:**
```bash
# Skift til en anden model (hvis tilgængelig i din region)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Genudrul med den nye konfiguration
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

### Trin 3.2: Miljøspecifikke konfigurationer

**Bedste praksis**: Forskellige konfigurationer for udvikling vs. produktion.

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

### **Lab Exercise 3.1: Omkostningsoptimering**

**Udfordring**: Konfigurer skabelonen til omkostningseffektiv udvikling.

**Opgaver:**
1. Identificer hvilke SKUs der kan sættes til free/basic-niveauer
2. Konfigurer miljøvariabler for minimal omkostning
3. Deploy og sammenlign omkostninger med produktionskonfigurationen

**Løsningshint:**
- Brug F0 (gratis) tier for Azure AI Services når muligt
- Brug Basic-tier for Search Service i udvikling
- Overvej at bruge Consumption-plan for Functions

## Modul 4: Sikkerhed og produktions bedste praksis

### Trin 4.1: Sikker credential-håndtering

**Nuværende udfordring**: Mange AI-apps hardcoder API-nøgler eller bruger usikker opbevaring.

**AZD-løsning**: Managed Identity + Key Vault-integration.

1. **Gennemgå sikkerhedskonfigurationen i din skabelon:**
```bash
# Søg efter Key Vault- og Managed Identity-konfiguration.
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verificer at Managed Identity virker:**
```bash
# Kontroller, om webappen har den korrekte identitetskonfiguration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Trin 4.2: Netværkssikkerhed

1. **Aktivér private endpoints** (hvis ikke allerede konfigureret):

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

### Trin 4.3: Overvågning og observabilitet

1. **Konfigurer Application Insights:**
```bash
# Application Insights bør konfigureres automatisk
# Kontrollér konfigurationen:
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

### **Lab Exercise 4.1: Sikkerhedsrevision**

**Opgave**: Gennemgå dit deployment for sikker bedste praksis.

**Tjekliste:**
- [ ] Ingen hardcodede hemmeligheder i kode eller konfiguration
- [ ] Managed Identity bruges til service-til-service autentifikation
- [ ] Key Vault gemmer følsom konfiguration
- [ ] Netværksadgang er korrekt begrænset
- [ ] Overvågning og logging er slået til

## Modul 5: Konverter din egen AI-applikation

### Trin 5.1: Assessments-arbejdsark

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

### Trin 5.2: Opret din AZD-skabelon

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

### **Lab Exercise 5.1: Skabelonoprettelsesudfordring**

**Udfordring**: Opret en AZD-skabelon til en dokumentbehandlings-AI-app.

**Krav:**
- Microsoft Foundry Models til indholdsanalyse
- Document Intelligence til OCR
- Storage Account til dokumentuploads
- Function App til behandlingslogik
- Webapp til brugergrænsefladen

**Bonuspoint:**
- Tilføj ordentlig fejlbehandling
- Inkludér omkostningsestimering
- Opsæt overvågningsdashboards

## Modul 6: Fejlsøgning af almindelige problemer

### Almindelige deployment-problemer

#### Problem 1: OpenAI Service Quota overskredet
**Symptomer:** Deployment fejler med quota-fejl
**Løsninger:**
```bash
# Tjek nuværende kvoter
az cognitiveservices usage list --location eastus

# Anmod om kvoteforhøjelse eller prøv en anden region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model ikke tilgængelig i regionen
**Symptomer:** AI-svar fejler eller modeldeployment fejler
**Løsninger:**
```bash
# Kontroller modeltilgængelighed efter region
az cognitiveservices model list --location eastus

# Opdater til en tilgængelig model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Tilladelsesproblemer
**Symptomer:** 403 Forbidden-fejl ved kald til AI-tjenester
**Løsninger:**
```bash
# Kontroller rolle-tildelinger
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tilføj manglende roller
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance-problemer

#### Problem 4: Langsomme AI-responser
**Undersøgelsestrin:**
1. Tjek Application Insights for performance-metrics
2. Gennemgå OpenAI-tjenestemetrics i Azure-portalen
3. Verificer netværksforbindelse og latency

**Løsninger:**
- Implementer caching for almindelige forespørgsler
- Brug passende OpenAI-model til dit brugsscenarie
- Overvej read replicas til høj-load scenarier

### **Lab Exercise 6.1: Debugging-udfordring**

**Scenarie**: Dit deployment lykkedes, men applikationen returnerer 500-fejl.

**Debugging-opgaver:**
1. Tjek applikationslogs
2. Bekræft serviceforbindelser
3. Test autentifikation
4. Gennemgå konfiguration

**Værktøjer at bruge:**
- `azd show` for deployment-overblik
- Azure-portalen for detaljerede servicelogs
- Application Insights for applikationstelemetri

## Modul 7: Overvågning og optimering

### Trin 7.1: Opsæt omfattende overvågning

1. **Opret brugerdefinerede dashboards:**

Naviger til Azure-portalen og opret et dashboard med:
- OpenAI request count og latency
- Applikationsfejlrate
- Ressourceudnyttelse
- Omkostningssporing

2. **Opsæt alerts:**
```bash
# Advarsel om høj fejlrate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Trin 7.2: Omkostningsoptimering

1. **Analyser nuværende omkostninger:**
```bash
# Brug Azure CLI til at hente omkostningsdata
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementer omkostningskontroller:**
- Opsæt budget-alerts
- Brug autoscaling-politikker
- Implementer request-caching
- Overvåg tokenforbrug for OpenAI

### **Lab Exercise 7.1: Performance-optimering**

**Opgave**: Optimér din AI-applikation både for performance og omkostninger.

**Metrics at forbedre:**
- Reducer gennemsnitlig svartid med 20%
- Reducer månedlige omkostninger med 15%
- Oprethold 99.9% oppetid

**Strategier at prøve:**
- Implementer response-caching
- Optimér prompts for token-effektivitet
- Brug passende compute-SKUs
- Opsæt korrekt autoskalering

## Afsluttende udfordring: End-to-End implementering

### Udfordringsscenarie

Du skal skabe en produktionsklar AI-drevet kundeservice-chatbot med disse krav:

**Funktionelle krav:**
- Webinterface til kundedialog
- Integration med Microsoft Foundry Models til svar
- Dokument-søgefunktionalitet ved hjælp af Azure AI Search
- Integration med eksisterende kundedatabase
- Multisprogssupport

**Non-funktionelle krav:**
- Håndtere 1000 samtidige brugere
- 99.9% oppetids-SLA
- SOC 2 compliance
- Omkostninger under $500/måned
- Deploy til flere miljøer (dev, staging, prod)

### Implementeringstrin

1. **Design arkitekturen**
2. **Opret AZD-skabelonen**
3. **Implementer sikkerhedsforanstaltninger**
4. **Sæt overvågning og alerting op**
5. **Opret deployments-pipelines**
6. **Dokumentér løsningen**

### Evalueringskriterier

- ✅ **Funktionalitet**: Opfylder den alle krav?
- ✅ **Sikkerhed**: Er bedste praksis implementeret?
- ✅ **Skalerbarhed**: Kan den håndtere load?
- ✅ **Vedligeholdelighed**: Er kode og infrastruktur velorganiseret?
- ✅ **Omkostninger**: Holder den sig inden for budget?

## Yderligere ressourcer

### Microsoft-dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelskabeloner
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fællesskabsressourcer
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Gennemførelsesbevis

Tillykke! Du har gennemført AI Workshop-laboratoriet. Du bør nu være i stand til at:

- ✅ Konverter eksisterende AI-applikationer til AZD-skabeloner
- ✅ Udrul produktionsklare AI-applikationer
- ✅ Implementer bedste sikkerhedspraksis for AI-arbejdsbelastninger
- ✅ Overvåg og optimer AI-applikationers ydeevne
- ✅ Fejlfind almindelige udrulningsproblemer

### Næste skridt
1. Anvend disse mønstre på dine egne AI-projekter
2. Bidrag med skabeloner til fællesskabet
3. Deltag i Microsoft Foundry Discord for løbende support
4. Udforsk avancerede emner som udrulninger på tværs af flere regioner

---

**Workshop-feedback**: Hjælp os med at forbedre denne workshop ved at dele din oplevelse i [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Chapter 2 - AI-First Development
- **⬅️ Forrige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Næste**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Har du brug for hjælp?** Deltag i vores fællesskab for support og diskussioner om AZD og AI-udrulninger.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->