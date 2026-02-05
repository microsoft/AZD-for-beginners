# AI Workshop Lab: Gjør AI-løsningene dine AZD-klare

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-First Utvikling
- **⬅️ Forrige**: [AI Modellutplassering](ai-model-deployment.md)
- **➡️ Neste**: [Beste Praksis for Produksjons-AI](production-ai-practices.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)

## Workshopoversikt

Denne praktiske laben veileder utviklere gjennom prosessen med å ta en eksisterende AI-mal og distribuere den ved hjelp av Azure Developer CLI (AZD). Du vil lære essensielle mønstre for produksjonsklare AI-distribusjoner ved bruk av Microsoft Foundry-tjenester.

**Varighet:** 2-3 timer  
**Nivå:** Middels  
**Forutsetninger:** Grunnleggende Azure-kunnskap, kjennskap til AI/ML-konsepter

## 🎓 Læringsmål

Ved slutten av denne workshoppen vil du kunne:
- ✅ Konvertere en eksisterende AI-applikasjon til å bruke AZD-maler
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker håndtering av legitimasjon for AI-tjenester
- ✅ Distribuere produksjonsklare AI-applikasjoner med overvåking
- ✅ Feilsøke vanlige problemer med AI-distribusjon

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
- Grunnleggende AI/ML-konsepter (API-er, modeller, forespørsler)

## Laboppsett

### Steg 1: Forberedelse av Miljø

1. **Bekreft verktøyinstallasjoner:**
```bash
# Sjekk AZD installasjon
azd version

# Sjekk Azure CLI
az --version

# Logg inn på Azure
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

**Hva du skal se etter:**
- Tjenestedefinisjoner for AI-komponenter
- Miljøvariabelkartlegginger
- Vertskonfigurasjoner

2. **Gjennomgå hoved.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Viktige AI-mønstre å identifisere:**
- Klargjøring av Azure OpenAI-tjeneste
- Integrasjon med Cognitive Search
- Sikker nøkkelhåndtering
- Nettverkssikkerhetskonfigurasjoner

### **Diskusjonspunkt:** Hvorfor Disse Mønstrene Er Viktige for AI

- **Tjenesteavhengigheter**: AI-applikasjoner krever ofte flere koordinerte tjenester
- **Sikkerhet**: API-nøkler og endepunkter trenger sikker håndtering
- **Skalerbarhet**: AI-arbeidsmengder har unike skaleringsbehov
- **Kostnadsstyring**: AI-tjenester kan være dyre hvis de ikke er riktig konfigurert

## Modul 2: Distribuer Din Første AI-applikasjon

### Steg 2.1: Initialiser Miljøet

1. **Opprett et nytt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Sett nødvendige parametere:**
```bash
# Angi din foretrukne Azure-region
azd env set AZURE_LOCATION eastus

# Valgfritt: Angi spesifikk OpenAI-modell
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Steg 2.2: Distribuer Infrastruktur og Applikasjon

1. **Distribuer med AZD:**
```bash
azd up
```

**Hva som skjer under `azd up`:**
- ✅ Klargjør Azure OpenAI-tjeneste
- ✅ Oppretter Cognitive Search-tjeneste
- ✅ Setter opp App Service for webapplikasjonen
- ✅ Konfigurerer nettverk og sikkerhet
- ✅ Distribuerer applikasjonskode
- ✅ Setter opp overvåking og logging

2. **Overvåk distribusjonsfremdriften** og noter ressursene som opprettes.

### Steg 2.3: Verifiser Din Distribusjon

1. **Sjekk de distribuerte ressursene:**
```bash
azd show
```

2. **Åpne den distribuerte applikasjonen:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test AI-funksjonaliteten:**
   - Naviger til webapplikasjonen
   - Prøv eksempelforespørsler
   - Verifiser at AI-responsene fungerer

### **Labøvelse 2.1: Feilsøkingspraksis**

**Scenario**: Distribusjonen din lyktes, men AI svarer ikke.

**Vanlige problemer å sjekke:**
1. **OpenAI API-nøkler**: Bekreft at de er riktig satt
2. **Modelltilgjengelighet**: Sjekk om regionen din støtter modellen
3. **Nettverkstilkobling**: Sørg for at tjenestene kan kommunisere
4. **RBAC-tillatelser**: Bekreft at appen kan få tilgang til OpenAI

**Feilsøkingskommandoer:**
```bash
# Sjekk miljøvariabler
azd env get-values

# Vis distribusjonslogger
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sjekk OpenAI distribusjonsstatus
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpasse AI-applikasjoner til Dine Behov

### Steg 3.1: Endre AI-konfigurasjonen

1. **Oppdater OpenAI-modellen:**
```bash
# Endre til en annen modell (hvis tilgjengelig i ditt område)
azd env set AZURE_OPENAI_MODEL gpt-4

# Gjenopprett med den nye konfigurasjonen
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
# Produksjon bruker vanligvis høyere SKUer
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktiver ekstra sikkerhetsfunksjoner
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labøvelse 3.1: Kostnadsoptimalisering**

**Utfordring**: Konfigurer malen for kostnadseffektiv utvikling.

**Oppgaver:**
1. Identifiser hvilke SKUs som kan settes til gratis/grunnleggende nivåer
2. Konfigurer miljøvariabler for minimal kostnad
3. Distribuer og sammenlign kostnader med produksjonskonfigurasjonen

**Løsningshint:**
- Bruk F0 (gratis) nivå for Cognitive Services når mulig
- Bruk Basic nivå for Search Service i utvikling
- Vurder å bruke Consumption-plan for Functions

## Modul 4: Sikkerhet og Beste Praksis for Produksjon

### Steg 4.1: Sikker Håndtering av Legitimasjon

**Nåværende utfordring**: Mange AI-applikasjoner hardkoder API-nøkler eller bruker usikker lagring.

**AZD-løsning**: Managed Identity + Key Vault-integrasjon.

1. **Gjennomgå sikkerhetskonfigurasjonen i malen din:**
```bash
# Se etter Key Vault og Managed Identity-konfigurasjon
grep -r "keyVault\|managedIdentity" infra/
```

2. **Bekreft at Managed Identity fungerer:**
```bash
# Sjekk om nettappen har riktig identitetskonfigurasjon
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

### Steg 4.3: Overvåking og Observasjon

1. **Konfigurer Application Insights:**
```bash
# Application Insights bør konfigureres automatisk
# Sjekk konfigurasjonen:
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

**Oppgave**: Gjennomgå distribusjonen din for sikkerhetsbeste praksis.

**Sjekkliste:**
- [ ] Ingen hardkodede hemmeligheter i kode eller konfigurasjon
- [ ] Managed Identity brukt for tjeneste-til-tjeneste-autentisering
- [ ] Key Vault lagrer sensitiv konfigurasjon
- [ ] Nettverkstilgang er riktig begrenset
- [ ] Overvåking og logging er aktivert

## Modul 5: Konvertere Din Egen AI-applikasjon

### Steg 5.1: Vurderingsark

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
   - Trenger du automatisk skalering?
   - Er det regionale krav?

### Steg 5.2: Opprett Din AZD-mal

**Følg dette mønsteret for å konvertere appen din:**

1. **Opprett grunnstrukturen:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialiser AZD-mal
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

### **Labøvelse 5.1: Malopprettingsutfordring**

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

### Vanlige Distribusjonsproblemer

#### Problem 1: OpenAI-tjenestekvote Overskredet
**Symptomer:** Distribusjonen mislykkes med kvotefeil
**Løsninger:**
```bash
# Sjekk nåværende kvoter
az cognitiveservices usage list --location eastus

# Be om kvoteøkning eller prøv en annen region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell Ikke Tilgjengelig i Region
**Symptomer:** AI-responsene mislykkes eller modellutplasseringsfeil
**Løsninger:**
```bash
# Sjekk modelltilgjengelighet etter region
az cognitiveservices model list --location eastus

# Oppdater til tilgjengelig modell
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Tillatelsesproblemer
**Symptomer:** 403 Forbidden-feil ved kall til AI-tjenester
**Løsninger:**
```bash
# Sjekk rolleoppgaver
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Legg til manglende roller
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Ytelsesproblemer

#### Problem 4: Trege AI-responser
**Undersøkelsestrinn:**
1. Sjekk Application Insights for ytelsesmetrikker
2. Gjennomgå OpenAI-tjenestemetrikker i Azure-portalen
3. Bekreft nettverkstilkobling og forsinkelse

**Løsninger:**
- Implementer caching for vanlige forespørsler
- Bruk passende OpenAI-modell for ditt brukstilfelle
- Vurder lese-replikater for høy belastning

### **Labøvelse 6.1: Feilsøkingsutfordring**

**Scenario**: Distribusjonen din lyktes, men applikasjonen returnerer 500-feil.

**Feilsøkingsoppgaver:**
1. Sjekk applikasjonslogger
2. Bekreft tjenestetilkobling
3. Test autentisering
4. Gjennomgå konfigurasjon

**Verktøy å bruke:**
- `azd show` for distribusjonsoversikt
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
# Varsel for høy feilrate
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
# Bruk Azure CLI for å hente kostnadsdata
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
- Oppretthold 99,9% oppetid

**Strategier å prøve:**
- Implementer responscaching
- Optimaliser forespørsler for tokeneffektivitet
- Bruk passende databehandlings-SKUs
- Sett opp riktig autoskalering

## Endelig Utfordring: Implementering fra Start til Slutt

### Utfordringsscenario

Du har fått i oppdrag å lage en produksjonsklar AI-drevet kundeservice-chatbot med følgende krav:

**Funksjonelle Krav:**
- Webgrensesnitt for kundesamtaler
- Integrasjon med Azure OpenAI for svar
- Dokumentssøkfunksjon ved bruk av Cognitive Search
- Integrasjon med eksisterende kundedatabase
- Støtte for flere språk

**Ikke-funksjonelle Krav:**
- Håndtere 1000 samtidige brukere
- 99,9% oppetid SLA
- SOC 2-samsvar
- Kostnad under $500/måned
- Distribuer til flere miljøer (utvikling, staging, produksjon)

### Implementeringstrinn

1. **Design arkitekturen**
2. **Opprett AZD-malen**
3. **Implementer sikkerhetstiltak**
4. **Sett opp overvåking og varsling**
5. **Opprett distribusjonspipelines**
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
- [Microsoft Foundry Dokumentasjon](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelmaler
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fellesskapsressurser
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Fullføringssertifikat
Gratulerer! Du har fullført AI Workshop Lab. Du bør nå kunne:

- ✅ Konvertere eksisterende AI-applikasjoner til AZD-maler
- ✅ Distribuere produksjonsklare AI-applikasjoner
- ✅ Implementere sikkerhetsbeste praksis for AI-arbeidsbelastninger
- ✅ Overvåke og optimalisere ytelsen til AI-applikasjoner
- ✅ Feilsøke vanlige distribusjonsproblemer

### Neste steg
1. Bruk disse mønstrene i dine egne AI-prosjekter
2. Bidra med maler tilbake til fellesskapet
3. Bli med i Microsoft Foundry Discord for kontinuerlig støtte
4. Utforsk avanserte emner som distribusjoner på tvers av regioner

---

**Workshop-tilbakemelding**: Hjelp oss med å forbedre denne workshoppen ved å dele din erfaring i [Microsoft Foundry Discord #Azure-kanalen](https://discord.gg/microsoft-azure).

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-First Utvikling
- **⬅️ Forrige**: [Distribusjon av AI-modeller](ai-model-deployment.md)
- **➡️ Neste**: [Beste praksis for produksjons-AI](production-ai-practices.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../getting-started/configuration.md)

**Trenger du hjelp?** Bli med i vårt fellesskap for støtte og diskusjoner om AZD og AI-distribusjoner.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->