# AI Workshop-laboratorium: Gør dine AI-løsninger AZD-udrulningsklare

**Kapitelnavigation:**
- **📚 Kursusstart**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-først udvikling
- **⬅️ Forrige**: [Udrulning af AI-model](ai-model-deployment.md)
- **➡️ Næste**: [Bedste praksis for AI i produktion](production-ai-practices.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Oversigt over workshoppen

Denne hands-on workshop guider udviklere gennem processen med at tage en eksisterende AI-skabelon og udrulle den ved hjælp af Azure Developer CLI (AZD). Du lærer essentielle mønstre for produktionsudrulninger af AI ved brug af Microsoft Foundry-tjenester.

> **Valideringsnote (2026-03-25):** Denne workshop blev gennemgået i forhold til `azd` `1.23.12`. Hvis din lokale installation er ældre, opdater AZD før start, så auth-, skabelon- og udrulningsworkflowet matcher trinnene nedenfor.

**Varighed:** 2-3 timer  
**Niveau:** Mellemliggende  
**Forudsætninger:** Grundlæggende Azure-viden, kendskab til AI/ML-koncepter

## 🎓 Læringsmål

Ved afslutningen af denne workshop vil du kunne:
- ✅ Konvertere en eksisterende AI-applikation til at bruge AZD-skabeloner
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker legitimationshåndtering for AI-tjenester
- ✅ Udrulle produktionsklare AI-applikationer med overvågning
- ✅ Fejlsøge almindelige problemer ved AI-udrulning

## Forudsætninger

### Krævede værktøjer
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installeret
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installeret
- [Git](https://git-scm.com/) installeret
- Kodeeditor (VS Code anbefales)

### Azure-ressourcer
- Azure-abonnement med bidragyderadgang
- Adgang til Microsoft Foundry Models-tjenester (eller mulighed for at anmode om adgang)
- Tilladelse til at oprette en ressourcegruppe

### Videnforudsætninger
- Grundlæggende forståelse af Azure-tjenester
- Fortrolighed med kommandolinjegrænseflader
- Grundlæggende AI/ML-koncepter (APIs, modeller, prompts)

## Opsætning af laboratoriet

### Trin 1: Forberedelse af miljøet

1. **Bekræft værktøjsinstallationer:**
```bash
# Kontroller AZD-installation
azd version

# Kontroller Azure CLI
az --version

# Log ind på Azure for AZD-arbejdsgange
azd auth login

# Log ind på Azure CLI kun hvis du planlægger at køre az-kommandoer under diagnosticering
az login
```

Hvis du arbejder på tværs af flere tenants, eller dit abonnement ikke bliver registreret automatisk, prøv igen med `azd auth login --tenant-id <tenant-id>`.

2. **Klon workshop-repositoriet:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Forstå AZD-strukturen for AI-applikationer

### Anatomi af en AI AZD-skabelon

Gennemgå nøglefilerne i en AI-klar AZD-skabelon:

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

### **Laboratorieøvelse 1.1: Udforsk konfigurationen**

1. **Undersøg filen azure.yaml:**
```bash
cat azure.yaml
```

**Hvad du skal kigge efter:**
- Tjenestedefinitioner for AI-komponenter
- Miljøvariabelkortlægninger
- Værtskonfigurationer

2. **Gennemgå infrastrukturen main.bicep:**
```bash
cat infra/main.bicep
```

**Vigtige AI-mønstre at identificere:**
- Provisionering af Microsoft Foundry Models-tjeneste
- Integration med Cognitive Search
- Sikker nøglehåndtering
- Netværkssikkerhedskonfigurationer

### **Diskussionspunkt:** Hvorfor disse mønstre betyder noget for AI

- **Tjenesteafhængigheder**: AI-apps kræver ofte flere koordinerede tjenester
- **Sikkerhed**: API-nøgler og endpoints kræver sikker håndtering
- **Skalerbarhed**: AI-workloads har unikke krav til skalering
- **Omkostningsstyring**: AI-tjenester kan være dyre, hvis de ikke er korrekt konfigureret

## Modul 2: Udrul din første AI-applikation

### Trin 2.1: Initialiser miljøet

1. **Opret et nyt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Angiv nødvendige parametre:**
```bash
# Indstil din foretrukne Azure-region
azd env set AZURE_LOCATION eastus

# Valgfrit: Angiv en specifik OpenAI-model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Trin 2.2: Udrul infrastrukturen og applikationen

1. **Udrul med AZD:**
```bash
azd up
```

**Hvad sker der under `azd up`:**
- ✅ Provisionerer Microsoft Foundry Models-tjeneste
- ✅ Opretter Cognitive Search-tjeneste
- ✅ Opretter App Service til webapplikationen
- ✅ Konfigurerer netværk og sikkerhed
- ✅ Udruller applikationskode
- ✅ Opsætter overvågning og logning

2. **Overvåg udrulningsforløbet** og bemærk de ressourcer, der oprettes.

### Trin 2.3: Bekræft din udrulning

1. **Kontrollér de udrullede ressourcer:**
```bash
azd show
```

2. **Åbn den udrullede applikation:**
```bash
azd show
```

Åbn webendpunktet vist i `azd show`-outputtet.

3. **Test AI-funktionaliteten:**
   - Navigér til webapplikationen
   - Prøv eksempelforespørgsler
   - Bekræft, at AI-svar fungerer

### **Laboratorieøvelse 2.1: Fejlsøgningsøvelse**

**Scenario**: Din udrulning lykkedes, men AI'en reagerer ikke.

**Almindelige problemer at kontrollere:**
1. **OpenAI API-nøgler**: Bekræft, at de er korrekt angivet
2. **Modeltilgængelighed**: Tjek, om din region understøtter modellen
3. **Netværksforbindelse**: Sørg for, at tjenesterne kan kommunikere
4. **RBAC-tilladelser**: Bekræft, at appen kan få adgang til OpenAI

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

### Trin 3.1: Ændre AI-konfigurationen

1. **Opdater OpenAI-modellen:**
```bash
# Skift til en anden model (hvis tilgængelig i dit område)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Udrul igen med den nye konfiguration
azd deploy
```

2. **Tilføj ekstra AI-tjenester:**

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

**Best Practice**: Forskellige konfigurationer for udvikling og produktion.

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

**Udfordring**: Konfigurer skabelonen til omkostningseffektiv udvikling.

**Opgaver:**
1. Identificér hvilke SKUs der kan sættes til gratis/basisniveauer
2. Konfigurer miljøvariabler for minimal omkostning
3. Udrul og sammenlign omkostninger med produktionskonfigurationen

**Løsningshint:**
- Brug F0 (gratis) niveau for Cognitive Services når muligt
- Brug Basic-niveau for Search Service i udvikling
- Overvej at bruge Consumption-planen til Functions

## Modul 4: Sikkerhed og bedste praksis for produktion

### Trin 4.1: Sikker håndtering af legitimationsoplysninger

**Nuværende udfordring**: Mange AI-apps indlejrer API-nøgler eller bruger usikker lagring.

**AZD-løsning**: Managed Identity + Key Vault-integration.

1. **Gennemgå sikkerhedskonfigurationen i din skabelon:**
```bash
# Søg efter Key Vault- og Managed Identity-konfiguration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Bekræft, at Managed Identity fungerer:**
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

### Trin 4.3: Overvågning og observerbarhed

1. **Konfigurer Application Insights:**
```bash
# Application Insights bør konfigureres automatisk
# Kontroller konfigurationen:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sæt AI-specifik overvågning op:**

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

### **Laboratorieøvelse 4.1: Sikkerhedsrevision**

**Opgave**: Gennemgå din udrulning for sikkerhedens bedste praksis.

**Tjekliste:**
- [ ] Ingen indlejrede hemmeligheder i kode eller konfiguration
- [ ] Managed Identity anvendt til tjeneste-til-tjeneste-autentificering
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
- Microsoft Foundry Models til indholdsanalyse
- Document Intelligence til OCR
- Storage Account til dokumentuploads
- Function App til behandlingslogik
- Webapp til brugergrænseflade

**Bonuspoint:**
- Tilføj korrekt fejlhåndtering
- Inkludér omkostningsestimat
- Opsæt overvågningsdashboard

## Modul 6: Fejlsøgning af almindelige problemer

### Almindelige udrulningsproblemer

#### Problem 1: OpenAI-tjenestekvote overskredet
**Symptomer:** Udrulning mislykkes med kvotafejl
**Løsninger:**
```bash
# Tjek nuværende kvoter
az cognitiveservices usage list --location eastus

# Anmod om kvoteforhøjelse eller prøv en anden region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model ikke tilgængelig i regionen
**Symptomer:** AI-svar fejler eller modeludrulning giver fejl
**Løsninger:**
```bash
# Kontroller modeltilgængelighed efter region
az cognitiveservices model list --location eastus

# Opdater til en tilgængelig model
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Tilladelsesproblemer
**Symptomer:** 403 Forbidden-fejl ved kald af AI-tjenester
**Løsninger:**
```bash
# Kontroller rolletildelinger
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tilføj manglende roller
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Ydeevneproblemer

#### Problem 4: Langsomme AI-svar
Undersøgelsestrin:
1. Tjek Application Insights for ydeevnemålinger
2. Gennemgå OpenAI-tjenestens målinger i Azure-portalen
3. Bekræft netværksforbindelse og latency

**Løsninger:**
- Implementér caching for almindelige forespørgsler
- Brug en passende OpenAI-model til dit brugstilfælde
- Overvej read-replicas til scenarier med høj belastning

### **Laboratorieøvelse 6.1: Debugging-udfordring**

**Scenario**: Din udrulning lykkedes, men applikationen returnerer 500-fejl.

**Fejlsøgningsopgaver:**
1. Kontroller applikationslogs
2. Bekræft tjenesteforbindelse
3. Test autentificering
4. Gennemgå konfiguration

**Værktøjer at bruge:**
- `azd show` til udrulningsoverblik
- Azure-portalen til detaljerede tjenestelogs
- Application Insights til applikationstelemetri

## Modul 7: Overvågning og optimering

### Trin 7.1: Opsæt omfattende overvågning

1. **Opret brugerdefinerede dashboards:**

Gå til Azure-portalen og opret et dashboard med:
- OpenAI-anmodningsantal og latenstid
- Applikationsfejlrater
- Ressourceudnyttelse
- Omkostningssporing

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

### Trin 7.2: Omkostningsoptimering

1. **Analyser nuværende omkostninger:**
```bash
# Brug Azure CLI til at hente omkostningsdata
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementér omkostningskontroller:**
- Opsæt budgetalarmer
- Brug autoscaleringspolitikker
- Implementér forespørgselscaching
- Overvåg tokenforbrug for OpenAI

### **Laboratorieøvelse 7.1: Ydeevneoptimering**

**Opgave**: Optimer din AI-applikation for både ydeevne og omkostninger.

**Mål at forbedre:**
- Reducér gennemsnitlig svartid med 20%
- Reducér månedlige omkostninger med 15%
- Oprethold 99,9% oppetid

**Strategier at prøve:**
- Implementér responscaching
- Optimér prompts for tokeneffektivitet
- Brug passende compute-SKUs
- Opsæt korrekt autoskalering

## Afsluttende udfordring: Ende-til-ende-implementering

### Udfordringsscenarie

Du har til opgave at skabe en produktionsklar AI-drevet kundeservice-chatbot med disse krav:

Funktionelle krav:
- Webgrænseflade til kundedialoger
- Integration med Microsoft Foundry Models til svar
- Dokumentsøgefunktion ved brug af Cognitive Search
- Integration med eksisterende kundedatabase
- Flersproget support

Ikke-funktionelle krav:
- Håndtere 1000 samtidige brugere
- 99,9% oppetid SLA
- SOC 2-overholdelse
- Omkostninger under $500/md.
- Udrul til flere miljøer (dev, staging, prod)

### Implementeringstrin

1. **Design arkitekturen**
2. **Opret AZD-skabelonen**
3. **Implementér sikkerhedsforanstaltninger**
4. **Opsæt overvågning og alarmering**
5. **Opret udrulningspipelines**
6. **Dokumentér løsningen**

### Evalueringskriterier

- ✅ **Funktionalitet**: Opfylder det alle krav?
- ✅ **Sikkerhed**: Er bedste praksis implementeret?
- ✅ **Skalerbarhed**: Kan det håndtere belastningen?
- ✅ **Vedligeholdelighed**: Er kode og infrastruktur velorganiseret?
- ✅ **Omkostninger**: Holder det sig inden for budgettet?

## Yderligere ressourcer

### Microsoft-dokumentation
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service-dokumentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry-dokumentation](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelskabeloner
- [Microsoft Foundry Models Chat-app](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat-app Hurtigstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fællesskabsressourcer
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI på GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD-skabeloner](https://azure.github.io/awesome-azd/)

## 🎓 Gennemførelsescertifikat

Tillykke! Du har gennemført AI Workshop Lab. Du bør nu kunne:

- ✅ Konvertere eksisterende AI-applikationer til AZD-skabeloner
- ✅ Udrulle AI-applikationer klar til produktion
- ✅ Implementere bedste sikkerhedspraksis for AI-arbejdsbelastninger
- ✅ Overvåge og optimere AI-applikationers ydeevne
- ✅ Fejlsøge almindelige udrulningsproblemer

### Næste skridt
1. Anvend disse mønstre på dine egne AI-projekter
2. Bidrag med skabeloner tilbage til fællesskabet
3. Deltag i Microsoft Foundry Discord for løbende support
4. Udforsk avancerede emner som udrulning i flere regioner

---

**Workshop-feedback**: Hjælp os med at forbedre denne workshop ved at dele din oplevelse i [Microsoft Foundry Discord #Azure-kanal](https://discord.gg/microsoft-azure).

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 2 - AI-først udvikling
- **⬅️ Forrige**: [AI-modeludrulning](ai-model-deployment.md)
- **➡️ Næste**: [Bedste praksis for AI i produktion](production-ai-practices.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Brug for hjælp?** Deltag i vores fællesskab for support og diskussioner om AZD og AI-udrulninger.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets originalsprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->