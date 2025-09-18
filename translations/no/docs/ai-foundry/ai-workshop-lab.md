<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-18T06:13:39+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "no"
}
-->
# AI Workshop Lab: Gjør AI-løsningene dine AZD-klare

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-First Utvikling
- **⬅️ Forrige**: [AI Modellutplassering](ai-model-deployment.md)
- **➡️ Neste**: [Beste Praksis for Produksjons-AI](production-ai-practices.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)

## Workshopoversikt

Denne praktiske laben veileder utviklere gjennom prosessen med å ta en eksisterende AI-applikasjon og gjøre den klar for utplassering ved hjelp av Azure Developer CLI (AZD). Du vil lære essensielle mønstre for produksjonsutplassering av AI ved bruk av Azure AI Foundry-tjenester.

**Varighet:** 2-3 timer  
**Nivå:** Middels  
**Forutsetninger:** Grunnleggende Azure-kunnskap, kjennskap til AI/ML-konsepter

## 🎓 Læringsmål

Ved slutten av denne workshoppen vil du kunne:
- ✅ Konvertere en eksisterende AI-applikasjon til å bruke AZD-maler
- ✅ Konfigurere Azure AI Foundry-tjenester med AZD
- ✅ Implementere sikker håndtering av legitimasjon for AI-tjenester
- ✅ Utplassere produksjonsklare AI-applikasjoner med overvåking
- ✅ Feilsøke vanlige problemer med AI-utplassering

## Forutsetninger

### Nødvendige Verktøy
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installert
- [Git](https://git-scm.com/) installert
- Kodeeditor (VS Code anbefales)

### Azure Ressurser
- Azure-abonnement med bidragsytertilgang
- Tilgang til Azure OpenAI-tjenester (eller mulighet til å be om tilgang)
- Tillatelse til å opprette ressursgrupper

### Kunnskapsforutsetninger
- Grunnleggende forståelse av Azure-tjenester
- Kjennskap til kommandolinjegrensesnitt
- Grunnleggende AI/ML-konsepter (API-er, modeller, prompts)

## Laboppsett

### Steg 1: Forberedelse av Miljø

1. **Bekreft installasjon av verktøy:**
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

## Modul 1: Forstå AZD-strukturen for AI-applikasjoner

### Anatomien til en AI-klar AZD-mal

Utforsk nøkkelfilene i en AI-klar AZD-mal:

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

### **Labøvelse 1.1: Utforsk Konfigurasjonen**

1. **Undersøk azure.yaml-filen:**
```bash
cat azure.yaml
```

**Hva du bør se etter:**
- Tjenestedefinisjoner for AI-komponenter
- Miljøvariabelkartlegginger
- Vertskonfigurasjoner

2. **Gå gjennom main.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Viktige AI-mønstre å identifisere:**
- Klargjøring av Azure OpenAI-tjeneste
- Integrasjon med Cognitive Search
- Sikker håndtering av nøkler
- Nettverkssikkerhetskonfigurasjoner

### **Diskusjonspunkt:** Hvorfor Disse Mønstrene Er Viktige for AI

- **Tjenesteavhengigheter**: AI-applikasjoner krever ofte flere koordinerte tjenester
- **Sikkerhet**: API-nøkler og endepunkter må håndteres sikkert
- **Skalerbarhet**: AI-arbeidsmengder har unike krav til skalering
- **Kostnadsstyring**: AI-tjenester kan være dyre hvis de ikke er riktig konfigurert

## Modul 2: Utplassering av Din Første AI-applikasjon

### Steg 2.1: Initialiser Miljøet

1. **Opprett et nytt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Sett nødvendige parametere:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Steg 2.2: Utplassering av Infrastruktur og Applikasjon

1. **Utplasser med AZD:**
```bash
azd up
```

**Hva som skjer under `azd up`:**
- ✅ Klargjør Azure OpenAI-tjeneste
- ✅ Oppretter Cognitive Search-tjeneste
- ✅ Setter opp App Service for webapplikasjonen
- ✅ Konfigurerer nettverk og sikkerhet
- ✅ Utplasserer applikasjonskode
- ✅ Setter opp overvåking og logging

2. **Overvåk utplasseringsfremdriften** og noter ressursene som opprettes.

### Steg 2.3: Verifiser Din Utplassering

1. **Sjekk de utplasserte ressursene:**
```bash
azd show
```

2. **Åpne den utplasserte applikasjonen:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test AI-funksjonaliteten:**
   - Naviger til webapplikasjonen
   - Prøv eksempelforespørsler
   - Verifiser at AI-responsene fungerer

### **Labøvelse 2.1: Feilsøkingspraksis**

**Scenario**: Utplasseringen din lyktes, men AI svarer ikke.

**Vanlige problemer å sjekke:**
1. **OpenAI API-nøkler**: Bekreft at de er riktig satt
2. **Modelltilgjengelighet**: Sjekk om regionen din støtter modellen
3. **Nettverkstilkobling**: Sørg for at tjenestene kan kommunisere
4. **RBAC-tillatelser**: Bekreft at appen kan få tilgang til OpenAI

**Feilsøkingskommandoer:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpasning av AI-applikasjoner til Dine Behov

### Steg 3.1: Endre AI-konfigurasjonen

1. **Oppdater OpenAI-modellen:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Legg til flere AI-tjenester:**

Rediger `infra/main.bicep` for å legge til Document Intelligence:

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

### Steg 3.2: Miljøspesifikke Konfigurasjoner

**Beste Praksis**: Ulike konfigurasjoner for utvikling vs produksjon.

1. **Opprett et produksjonsmiljø:**
```bash
azd env new myai-production
```

2. **Sett produksjonsspesifikke parametere:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labøvelse 3.1: Kostnadsoptimalisering**

**Utfordring**: Konfigurer malen for kostnadseffektiv utvikling.

**Oppgaver:**
1. Identifiser hvilke SKUs som kan settes til gratis/grunnleggende nivåer
2. Konfigurer miljøvariabler for minimal kostnad
3. Utplasser og sammenlign kostnader med produksjonskonfigurasjonen

**Løsningshint:**
- Bruk F0 (gratis) nivå for Cognitive Services når mulig
- Bruk Basic nivå for Search Service i utvikling
- Vurder å bruke Consumption-plan for Functions

## Modul 4: Sikkerhet og Beste Praksis for Produksjon

### Steg 4.1: Sikker Håndtering av Legitimasjon

**Nåværende utfordring**: Mange AI-applikasjoner hardkoder API-nøkler eller bruker usikker lagring.

**AZD-løsning**: Managed Identity + Key Vault-integrasjon.

1. **Gå gjennom sikkerhetskonfigurasjonen i malen din:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Bekreft at Managed Identity fungerer:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Steg 4.2: Nettverkssikkerhet

1. **Aktiver private endepunkter** (hvis ikke allerede konfigurert):

Legg til i bicep-malen din:
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

### Steg 4.3: Overvåking og Observabilitet

1. **Konfigurer Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sett opp AI-spesifikk overvåking:**

Legg til egendefinerte metrikker for AI-operasjoner:
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

### **Labøvelse 4.1: Sikkerhetsrevisjon**

**Oppgave**: Gå gjennom utplasseringen din for beste praksis innen sikkerhet.

**Sjekkliste:**
- [ ] Ingen hardkodede hemmeligheter i kode eller konfigurasjon
- [ ] Managed Identity brukt for tjeneste-til-tjeneste autentisering
- [ ] Key Vault lagrer sensitiv konfigurasjon
- [ ] Nettverkstilgang er riktig begrenset
- [ ] Overvåking og logging er aktivert

## Modul 5: Konvertering av Din Egen AI-applikasjon

### Steg 5.1: Vurderingsskjema

**Før du konverterer appen din**, svar på disse spørsmålene:

1. **Applikasjonsarkitektur:**
   - Hvilke AI-tjenester bruker appen din?
   - Hvilke databehandlingsressurser trenger den?
   - Trenger den en database?
   - Hva er avhengighetene mellom tjenestene?

2. **Sikkerhetskrav:**
   - Hvilke sensitive data håndterer appen din?
   - Hvilke samsvarskrav har du?
   - Trenger du privat nettverk?

3. **Skaleringskrav:**
   - Hva er din forventede belastning?
   - Trenger du auto-skalering?
   - Er det regionale krav?

### Steg 5.2: Opprett Din AZD-mal

**Følg dette mønsteret for å konvertere appen din:**

1. **Opprett grunnstrukturen:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Opprett azure.yaml:**
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

3. **Opprett infrastruktursmaler:**

**infra/main.bicep** - Hovedmal:
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

### **Labøvelse 5.1: Malutfordring**

**Utfordring**: Opprett en AZD-mal for en dokumentbehandlings-AI-app.

**Krav:**
- Azure OpenAI for innholdsanalyse
- Document Intelligence for OCR
- Storage Account for dokumentopplastinger
- Function App for behandlingslogikk
- Webapp for brukergrensesnitt

**Bonuspoeng:**
- Legg til riktig feilhåndtering
- Inkluder kostnadsestimering
- Sett opp overvåkingsdashbord

## Modul 6: Feilsøking av Vanlige Problemer

### Vanlige Utplasseringsproblemer

#### Problem 1: OpenAI-tjenestekvote Overskredet
**Symptomer:** Utplassering mislykkes med kvotefeil
**Løsninger:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell Ikke Tilgjengelig i Region
**Symptomer:** AI-responser mislykkes eller modellutplasseringsfeil
**Løsninger:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Tillatelsesproblemer
**Symptomer:** 403 Forbidden-feil ved kall til AI-tjenester
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

### Ytelsesproblemer

#### Problem 4: Trege AI-responser
**Undersøkelsestrinn:**
1. Sjekk Application Insights for ytelsesmetrikker
2. Gå gjennom OpenAI-tjenestemetrikker i Azure-portalen
3. Bekreft nettverkstilkobling og forsinkelse

**Løsninger:**
- Implementer caching for vanlige forespørsler
- Bruk passende OpenAI-modell for ditt brukstilfelle
- Vurder lese-replikater for høy belastning

### **Labøvelse 6.1: Feilsøkingsutfordring**

**Scenario**: Utplasseringen din lyktes, men applikasjonen returnerer 500-feil.

**Feilsøkingsoppgaver:**
1. Sjekk applikasjonslogger
2. Bekreft tjenestetilkobling
3. Test autentisering
4. Gå gjennom konfigurasjonen

**Verktøy å bruke:**
- `azd show` for utplasseringsoversikt
- Azure-portalen for detaljerte tjenestelogger
- Application Insights for applikasjonstelemetri

## Modul 7: Overvåking og Optimalisering

### Steg 7.1: Sett Opp Omfattende Overvåking

1. **Opprett egendefinerte dashbord:**

Naviger til Azure-portalen og opprett et dashbord med:
- OpenAI forespørselsantall og forsinkelse
- Applikasjonsfeilrater
- Ressursutnyttelse
- Kostnadssporing

2. **Sett opp varsler:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Steg 7.2: Kostnadsoptimalisering

1. **Analyser nåværende kostnader:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementer kostnadskontroller:**
- Sett opp budsjettvarsler
- Bruk autoskalering
- Implementer forespørselscaching
- Overvåk tokenbruk for OpenAI

### **Labøvelse 7.1: Ytelsesoptimalisering**

**Oppgave**: Optimaliser AI-applikasjonen din for både ytelse og kostnad.

**Metrikker å forbedre:**
- Reduser gjennomsnittlig responstid med 20%
- Reduser månedlige kostnader med 15%
- Oppretthold 99.9% oppetid

**Strategier å prøve:**
- Implementer responscaching
- Optimaliser prompts for tokeneffektivitet
- Bruk passende databehandlings-SKUs
- Sett opp riktig autoskalering

## Endelig Utfordring: Implementering fra Start til Slutt

### Utfordringsscenario

Du har fått i oppdrag å lage en produksjonsklar AI-drevet kundeservice-chatbot med følgende krav:

**Funksjonelle Krav:**
- Webgrensesnitt for kundesamtaler
- Integrasjon med Azure OpenAI for svar
- Dokumentssøkfunksjonalitet ved bruk av Cognitive Search
- Integrasjon med eksisterende kundedatabase
- Støtte for flere språk

**Ikke-funksjonelle Krav:**
- Håndtere 1000 samtidige brukere
- 99.9% oppetid SLA
- SOC 2-samsvar
- Kostnad under $500/måned
- Utplassering til flere miljøer (utvikling, staging, produksjon)

### Implementeringstrinn

1. **Design arkitekturen**
2. **Opprett AZD-malen**
3. **Implementer sikkerhetstiltak**
4. **Sett opp overvåking og varsling**
5. **Opprett utplasseringspipelines**
6. **Dokumenter løsningen**

### Evalueringskriterier

- ✅ **Funksjonalitet**: Oppfyller den alle kravene?
- ✅ **Sikkerhet**: Er beste praksis implementert?
- ✅ **Skalerbarhet**: Kan den håndtere belastningen?
- ✅ **Vedlikeholdbarhet**: Er koden og infrastrukturen godt organisert?
- ✅ **Kostnad**: Holder den seg innenfor budsjettet?

## Tilleggsressurser

### Microsoft Dokumentasjon
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Dokumentasjon](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry Dokumentasjon](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelmaler
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fellesskapsressurser
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Fullføringssertifikat

Gratulerer! Du har fullført AI Workshop Lab. Du bør nå kunne:

- ✅ Konvertere eksisterende AI-applikasjoner til AZD-maler
- ✅ Distribuere produksjonsklare AI-applikasjoner
- ✅ Implementere sikkerhetspraksis for AI-arbeidsbelastninger
- ✅ Overvåke og optimalisere ytelsen til AI-applikasjoner
- ✅ Feilsøke vanlige distribusjonsproblemer

### Neste steg
1. Bruk disse mønstrene i dine egne AI-prosjekter
2. Bidra med maler tilbake til fellesskapet
3. Bli med på Azure AI Foundry Discord for kontinuerlig støtte
4. Utforsk avanserte emner som distribusjon på tvers av regioner

---

**Workshop-tilbakemelding**: Hjelp oss med å forbedre denne workshopen ved å dele din erfaring i [Azure AI Foundry Discord #Azure-kanalen](https://discord.gg/microsoft-azure).

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-First Development
- **⬅️ Forrige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Neste**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)

**Trenger du hjelp?** Bli med i vårt fellesskap for støtte og diskusjoner om AZD og AI-distribusjoner.

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.