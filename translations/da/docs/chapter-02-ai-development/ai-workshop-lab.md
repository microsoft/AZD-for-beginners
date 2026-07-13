# AI Workshop Lab: Gør dine AI-løsninger AZD-udrulningsklare

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-Første Udvikling
- **⬅️ Forrige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Næste**: [Produktion AI Best Practices](production-ai-practices.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Workshop Oversigt

Dette praktiske laboratorium guider udviklere gennem processen med at tage en eksisterende AI-skabelon og udrulle den ved hjælp af Azure Developer CLI (AZD). Du lærer essentielle mønstre for produktions AI-udrulninger ved hjælp af Microsoft Foundry-tjenester.

> **Valideringsnote (2026-07-13):** Denne workshop blev gennemgået med `azd` `1.27.1`. Hvis din lokale installation er ældre, opdater AZD før start, så autentificerings-, skabelons- og udrulningsarbejdsgangen matcher trinene nedenfor.

**Varighed:** 2-3 timer  
**Niveau:** Mellem  
**Forudsætninger:** Grundlæggende Azure-kendskab, fortrolighed med AI/ML-koncepter

## 🎓 Læringsmål

Når du er færdig med denne workshop, vil du kunne:
- ✅ Konvertere en eksisterende AI-applikation til at bruge AZD-skabeloner
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker håndtering af legitimationsoplysninger til AI-tjenester
- ✅ Udrulle produktionsklare AI-applikationer med overvågning
- ✅ Fejlsøge almindelige AI-udrulningsproblemer

## Forudsætninger

### Krævede værktøjer
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installeret
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installeret
- [Git](https://git-scm.com/) installeret
- Kodeeditor (VS Code anbefales)

### Azure ressourcer
- Azure-abonnement med bidragyderadgang
- Adgang til Microsoft Foundry Models-tjenester (eller mulighed for at anmode om adgang)
- Tilladelse til oprettelse af ressourcegrupper

### Videnforudsætninger
- Grundlæggende forståelse af Azure-tjenester
- Fortrolighed med kommandolinjegrænseflader
- Grundlæggende AI/ML-koncepter (API'er, modeller, prompts)

## Labopsætning

### Trin 1: Miljøforberedelse

1. **Bekræft værktøjsinstallationer:**
```bash
# Tjek AZD installation
azd version

# Tjek Azure CLI
az --version

# Log ind på Azure for AZD arbejdsgange
azd auth login

# Log kun ind på Azure CLI, hvis du planlægger at køre az-kommandoer under diagnostik
az login
```

Hvis du arbejder på tværs af flere lejere, eller dit abonnement ikke registreres automatisk, prøv igen med `azd auth login --tenant-id <tenant-id>`.

2. **Klon workshop-arkivet:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Forståelse af AZD-struktur for AI-applikationer

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

### **Labøvelse 1.1: Udforsk konfigurationen**

1. **Undersøg azure.yaml-filen:**
```bash
cat azure.yaml
```

**Hvad du skal kigge efter:**
- Tjenestedefinitioner for AI-komponenter
- Miljøvariabelkortlægninger
- Host-konfigurationer

2. **Gennemgå main.bicep infrastrukturen:**
```bash
cat infra/main.bicep
```

**Nøgledemønstre for AI at identificere:**
- Microsoft Foundry Models tjenesteprovisionering
- Azure AI Search integration
- Sikker nøglehåndtering
- Netværkssikkerhedskonfigurationer

### **Diskussionspunkt:** Hvorfor disse mønstre er vigtige for AI

- **Tjenesteafhængigheder**: AI-apps kræver ofte flere koordinerede tjenester
- **Sikkerhed**: API-nøgler og endpoints skal håndteres sikkert
- **Skalerbarhed**: AI-arbejdsmængder har unikke skaleringskrav
- **Omkostningsstyring**: AI-tjenester kan være dyre, hvis de ikke er korrekt konfigureret

## Modul 2: Udrul din første AI-applikation

### Trin 2.1: Initialiser miljøet

1. **Opret et nyt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Indstil krævede parametre:**
```bash
# Indstil din foretrukne Azure-region
azd env set AZURE_LOCATION eastus

# Valgfrit: Indstil specifik OpenAI-model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Trin 2.2: Udrul infrastrukturen og applikationen

1. **Udrul med AZD:**
```bash
azd up
```

**Hvad der sker under `azd up`:**
- ✅ Provisionerer Microsoft Foundry Models tjeneste
- ✅ Opretter Azure AI Search tjeneste
- ✅ Opsætter App Service til webapplikationen
- ✅ Konfigurerer netværk og sikkerhed
- ✅ Udruller applikationskode
- ✅ Opsætter overvågning og logging

2. **Overvåg udrulningsfremdriften** og bemærk de oprettede ressourcer.

### Trin 2.3: Bekræft din udrulning

1. **Tjek de udrullede ressourcer:**
```bash
azd show
```

2. **Åbn den udrullede applikation:**
```bash
azd show
```

Åbn web-endpointet, der vises i outputtet fra `azd show`.

3. **Test AI-funktionaliteten:**
   - Naviger til webapplikationen
   - Prøv eksempelforespørgsler
   - Bekræft at AI-svarene fungerer

### **Labøvelse 2.1: Fejlsøgningstræning**

**Scenario**: Din udrulning lykkedes, men AI'en svarer ikke.

**Almindelige problemer at tjekke:**
1. **OpenAI API-nøgler**: Bekræft, at de er korrekt indstillet
2. **Modeltilgængelighed**: Tjek om din region understøtter modellen
3. **Netværksforbindelse**: Sørg for, at tjenester kan kommunikere
4. **RBAC-tilladelser**: Bekræft at appen kan få adgang til OpenAI

**Fejlsøgningskommandoer:**
```bash
# Tjek miljøvariabler
azd env get-values

# Se udrulningslogfiler
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Tjek OpenAI udrulningsstatus
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpasning af AI-applikationer til dine behov

### Trin 3.1: Ændring af AI-konfigurationen

1. **Opdater OpenAI-modellen:**
```bash
# Skift til en anden model (hvis tilgængelig i dit område)
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

**Best Practice**: Forskellige konfigurationer for udvikling vs produktion.

1. **Opret et produktionsmiljø:**
```bash
azd env new myai-production
```

2. **Indstil produktionsspecifikke parametre:**
```bash
# Produktion bruger typisk højere SKU'er
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktiver yderligere sikkerhedsfunktioner
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labøvelse 3.1: Omkostningsoptimering**

**Udfordring**: Konfigurer skabelonen for omkostningseffektiv udvikling.

**Opgaver:**
1. Identificer hvilke SKU'er der kan sættes til gratis/grundlæggende niveauer
2. Konfigurer miljøvariabler for minimale omkostninger
3. Udrul og sammenlign omkostninger med produktionskonfigurationen

**Løsningshint:**
- Brug F0 (gratis) niveau for Azure AI Services, hvor det er muligt
- Brug Grundlæggende niveau for Search Service i udvikling
- Overvej at bruge Forbrugsplan for Functions

## Modul 4: Sikkerhed og bedste praksis i produktion

### Trin 4.1: Sikker håndtering af legitimationsoplysninger

**Aktuel udfordring**: Mange AI-apps hardcoder API-nøgler eller bruger usikret lagring.

**AZD-løsning**: Managed Identity + Key Vault integration.

1. **Gennemgå sikkerhedskonfigurationen i din skabelon:**
```bash
# Søg efter Key Vault og konfiguration for Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Bekræft at Managed Identity fungerer:**
```bash
# Kontroller, om webappen har den korrekte identitetskonfiguration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Trin 4.2: Netværkssikkerhed

1. **Aktiver private endpoints** (hvis ikke allerede konfigureret):

Tilføj i din bicep-skabelon:
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

### Trin 4.3: Overvågning og observerbarhed

1. **Konfigurer Application Insights:**
```bash
# Application Insights skal konfigureres automatisk
# Tjek konfigurationen:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Opsæt AI-specifik overvågning:**

Tilføj brugerdefinerede målinger for AI-operationer:
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

### **Labøvelse 4.1: Sikkerhedsaudit**

**Opgave**: Gennemgå din udrulning for bedste sikkerhedspraksis.

**Tjekliste:**
- [ ] Ingen hardcodede hemmeligheder i kode eller konfiguration
- [ ] Managed Identity brugt til tjeneste-til-tjeneste autentificering
- [ ] Key Vault opbevarer følsom konfiguration
- [ ] Netværksadgang er korrekt begrænset
- [ ] Overvågning og logging er aktiveret

## Modul 5: Konvertering af din egen AI-applikation

### Trin 5.1: Vurderingsark

**Før du konverterer din app**, besvar disse spørgsmål:

1. **Applikationsarkitektur:**
   - Hvilke AI-tjenester bruger din app?
   - Hvilke compute-ressourcer kræver den?
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

**infra/modules/openai.bicep** - OpenAI modul:
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

### **Labøvelse 5.1: Skabelonoprettelsesudfordring**

**Udfordring**: Opret en AZD-skabelon til en dokumentbehandlings-AI-app.

**Krav:**
- Microsoft Foundry Models til indholdsanalyse
- Document Intelligence til OCR
- Storage Account til dokumentupload
- Function App til behandlingslogik
- Webapp til brugergrænseflade

**Bonuspoint:**
- Tilføj korrekt fejlhåndtering
- Inkluder omkostningsestimering
- Opsæt overvågningsdashboard

## Modul 6: Fejlsøgning af almindelige problemer

### Almindelige udrulningsproblemer

#### Problem 1: OpenAI Service Kvote overskredet
**Symptomer:** Udrulning fejler med kvotefejl
**Løsninger:**
```bash
# Tjek nuværende kvoter
az cognitiveservices usage list --location eastus

# Anmod om kvoteforøgelse eller prøv en anden region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model ikke tilgængelig i region
**Symptomer:** AI-svar fejler eller modeludrulningsfejl
**Løsninger:**
```bash
# Tjek modeltilgængelighed efter region
az cognitiveservices model list --location eastus

# Opdater til tilgængelig model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Tilladelsesproblemer
**Symptomer:** 403 Forbidden fejl ved kald til AI-tjenester
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

### Ydeevneproblemer

#### Problem 4: Langsomme AI-svar
**Undersøgelsestrin:**
1. Tjek Application Insights for ydelsesmålinger
2. Gennemgå OpenAI tjenestemålinger i Azure portal
3. Bekræft netværksforbindelse og latenstid

**Løsninger:**
- Implementer caching for almindelige forespørgsler
- Brug passende OpenAI-model til dit brugsscenarie
- Overvej læsereplikering for høj belastning

### **Labøvelse 6.1: Fejlsøgningsudfordring**

**Scenario**: Din udrulning lykkedes, men applikationen returnerer 500-fejl.

**Fejlsøgningsopgaver:**
1. Tjek applikationslogfiler
2. Bekræft tjenesteforbindelse
3. Test autentificering
4. Gennemgå konfiguration

**Værktøjer til brug:**
- `azd show` for udrulningsoversigt
- Azure portal til detaljerede tjenestelogger
- Application Insights til applikationstelemetri

## Modul 7: Overvågning og optimering

### Trin 7.1: Opsæt omfattende overvågning

1. **Opret brugerdefinerede dashboards:**

Gå til Azure-portalen og opret et dashboard med:
- Antal OpenAI-forespørgsler og latenstid
- Applikationsfejlrate
- Ressourceudnyttelse
- Omkostningssporing

2. **Opsæt alarmer:**
```bash
# Advarsel for høj fejlfrekvens
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
# Brug Azure CLI til at hente omkostningsdata
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementer omkostningskontrol:**
- Opsæt budgetalarmer
- Brug autoskalering politikker
- Implementer forespørgselscaching
- Overvåg tokenforbrug for OpenAI

### **Labøvelse 7.1: Ydelsesoptimering**

**Opgave**: Optimer din AI-applikation for både ydeevne og omkostninger.

**Målepunkter at forbedre:**
- Reducer gennemsnitlig svartid med 20%
- Reducer månedlige omkostninger med 15%
- Oprethold 99,9 % oppetid

**Strategier at prøve:**
- Implementer responscaching
- Optimer prompts for token-effektivitet
- Brug passende compute SKU'er
- Opsæt korrekt autoskalering

## Slutudfordring: End-to-End implementering

### Udfordringsscenario

Du skal skabe en produktionsklar AI-drevet kundeservice-chatbot med disse krav:

**Funktionelle krav:**
- Webgrænseflade til kundekontakter
- Integration med Microsoft Foundry Models til svar
- Dokument-søgefunktion ved brug af Azure AI Search
- Integration med eksisterende kundedatabase
- Flersproget understøttelse

**Ikke-funktionelle krav:**
- Håndter 1000 samtidige brugere
- 99,9 % oppetid SLA
- SOC 2 overholdelse
- Omkostninger under $500/måned
- Udrul til flere miljøer (dev, staging, prod)

### Implementeringstrin

1. **Design arkitekturen**
2. **Opret AZD-skabelonen**
3. **Implementer sikkerhedsforanstaltninger**
4. **Opsæt overvågning og alarmering**
5. **Opret udrulningspipelines**
6. **Dokumenter løsningen**

### Evalueringskriterier

- ✅ **Funktionalitet**: Opfylder den alle krav?
- ✅ **Sikkerhed**: Er bedste praksis implementeret?
- ✅ **Skalerbarhed**: Kan den håndtere belastningen?
- ✅ **Vedligeholdelse**: Er koden og infrastrukturen velorganiseret?
- ✅ **Omkostninger**: Holder den sig inden for budget?

## Yderligere ressourcer

### Microsoft Dokumentation
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Dokumentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentation](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelskabeloner
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fællesskabsressourcer
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Fuldførelsescertifikat

Tillykke! Du har gennemført AI Workshop Lab. Du bør nu kunne:

- ✅ Konvertere eksisterende AI-applikationer til AZD-skabeloner
- ✅ Udrulle produktionsklare AI-applikationer
- ✅ Implementere sikkerhedspraksis for AI-arbejdsbelastninger
- ✅ Overvåge og optimere AI-applikations ydeevne
- ✅ Fejlsøge almindelige udrulningsproblemer

### Næste skridt
1. Anvend disse mønstre på dine egne AI-projekter
2. Bidrag med skabeloner tilbage til fællesskabet
3. Deltag i Microsoft Foundry Discord for løbende support
4. Udforsk avancerede emner som multi-region udrulninger

---

**Workshop Feedback**: Hjælp os med at forbedre denne workshop ved at dele din oplevelse i [Microsoft Foundry Discord #Azure kanalen](https://discord.gg/microsoft-azure).

---

**Kapitelnavigation:**
- **📚 Kursus Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 2 - AI-Første Udvikling
- **⬅️ Forrige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Næste**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Næste Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brug for hjælp?** Deltag i vores fællesskab for support og diskussioner om AZD og AI-udrulninger.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->