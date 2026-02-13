# AI Workshop-lab: Gjør AI-løsningene dine AZD-distribuerbare

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Gjeldende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Neste**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

## Oversikt over workshop

Denne praktiske laben leder utviklere gjennom prosessen med å ta en eksisterende AI-mal og distribuere den ved bruk av Azure Developer CLI (AZD). Du vil lære essensielle mønstre for produksjonsklare AI-distribusjoner ved bruk av Microsoft Foundry-tjenester.

**Varighet:** 2-3 timer  
**Nivå:** Mellomnivå  
**Forutsetninger:** Grunnleggende Azure-kunnskap, kjennskap til AI/ML-konsepter

## 🎓 Læringsmål

Ved slutten av denne workshoppen vil du kunne:
- ✅ Konvertere en eksisterende AI-applikasjon til å bruke AZD-maler
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker håndtering av legitimasjon for AI-tjenester
- ✅ Distribuere produksjonsklare AI-applikasjoner med overvåking
- ✅ Feilsøke vanlige AI-distribusjonsproblemer

## Forutsetninger

### Nødvendige verktøy
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installert
- [Git](https://git-scm.com/) installert
- Kodeeditor (VS Code anbefales)

### Azure-ressurser
- Azure-abonnement med bidragsytertilgang
- Tilgang til Azure OpenAI-tjenester (eller mulighet til å be om tilgang)
- Tillatelse til å opprette ressursgrupper

### Kunnskapsforutsetninger
- Grunnleggende forståelse av Azure-tjenester
- Kjennskap til kommandolinjegrensesnitt
- Grunnleggende AI/ML-konsepter (API-er, modeller, prompts)

## Lab-oppsett

### Trinn 1: Forbered miljøet

1. **Bekreft at verktøyene er installert:**
```bash
# Kontroller AZD-installasjonen
azd version

# Kontroller Azure CLI
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

### Anatomi av en AI-klargjort AZD-mal

Utforsk nøkkelfilene i en AI-klargjort AZD-mal:

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

### **Labøvelse 1.1: Utforsk konfigurasjonen**

1. **Undersøk azure.yaml-filen:**
```bash
cat azure.yaml
```

**Hva du skal se etter:**
- Tjenestedefinisjoner for AI-komponenter
- Miljøvariabel-mappinger
- Vertskonfigurasjoner

2. **Gå gjennom main.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Viktige AI-mønstre å identifisere:**
- Provisionering av Azure OpenAI-tjenesten
- Integrasjon med Cognitive Search
- Sikker nøkkelhåndtering
- Nettverkssikkerhetskonfigurasjoner

### **Diskusjonspunkt:** Hvorfor disse mønstrene er viktige for AI

- **Tjenesteavhengigheter**: AI-apper krever ofte flere koordinerte tjenester
- **Sikkerhet**: API-nøkler og endepunkter trenger sikker håndtering
- **Skalerbarhet**: AI-arbeidsmengder har unike skaleringskrav
- **Kostnadshåndtering**: AI-tjenester kan bli kostbare hvis de ikke er riktig konfigurert

## Modul 2: Distribuer din første AI-applikasjon

### Trinn 2.1: Initialiser miljøet

1. **Opprett et nytt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Angi nødvendige parametere:**
```bash
# Angi din foretrukne Azure-region
azd env set AZURE_LOCATION eastus

# Valgfritt: Angi en spesifikk OpenAI-modell
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Trinn 2.2: Distribuer infrastrukturen og applikasjonen

1. **Distribuer med AZD:**
```bash
azd up
```

**Hva skjer under `azd up`:**
- ✅ Oppretter Azure OpenAI-tjenesten
- ✅ Oppretter Cognitive Search-tjenesten
- ✅ Setter opp App Service for webapplikasjonen
- ✅ Konfigurerer nettverk og sikkerhet
- ✅ Distribuerer applikasjonskoden
- ✅ Setter opp overvåking og logging

2. **Overvåk distribusjonens fremdrift** og noter ressursene som blir opprettet.

### Trinn 2.3: Bekreft distribusjonen

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
   - Verifiser at AI-svar fungerer

### **Labøvelse 2.1: Feilsøkingsøvelse**

**Scenario**: Distribusjonen lyktes, men AI-en svarer ikke.

**Vanlige problemer å sjekke:**
1. **OpenAI API-nøkler**: Bekreft at de er korrekt satt
2. **Modellt tilgjengelighet**: Sjekk om modellen støttes i din region
3. **Nettverksforbindelse**: Sørg for at tjenestene kan kommunisere
4. **RBAC-tillatelser**: Bekreft at appen kan få tilgang til OpenAI

**Feilsøkingskommandoer:**
```bash
# Sjekk miljøvariabler
azd env get-values

# Vis distribusjonslogger
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sjekk status for OpenAI-distribusjonen
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpass AI-applikasjoner for dine behov

### Trinn 3.1: Endre AI-konfigurasjonen

1. **Oppdater OpenAI-modellen:**
```bash
# Bytt til en annen modell (hvis tilgjengelig i din region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Rull ut på nytt med den nye konfigurasjonen
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

### Trinn 3.2: Miljøspesifikke konfigurasjoner

**Beste praksis**: Forskjellige konfigurasjoner for utvikling vs produksjon.

1. **Opprett et produksjonsmiljø:**
```bash
azd env new myai-production
```

2. **Angi produksjonsspesifikke parametere:**
```bash
# Produksjon bruker vanligvis høyere SKU-er
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktiver ekstra sikkerhetsfunksjoner
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labøvelse 3.1: Kostnadsoptimalisering**

**Utfordring**: Konfigurer malen for kostnadseffektiv utvikling.

**Oppgaver:**
1. Identifiser hvilke SKUs som kan settes til free/basic-nivåer
2. Konfigurer miljøvariabler for minimale kostnader
3. Distribuer og sammenlign kostnader med produksjonskonfigurasjonen

**Løsningshint:**
- Bruk F0 (gratis) nivå for Cognitive Services når mulig
- Bruk Basic-nivå for Search Service i utvikling
- Vurder å bruke Consumption-plan for Functions

## Modul 4: Sikkerhet og beste praksis for produksjon

### Trinn 4.1: Sikker håndtering av legitimasjon

**Nåværende utfordring**: Mange AI-apper hardkoder API-nøkler eller bruker usikker lagring.

**AZD-løsning**: Managed Identity + Key Vault-integrasjon.

1. **Gå gjennom sikkerhetskonfigurasjonen i malen din:**
```bash
# Se etter konfigurasjon for Key Vault og Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifiser at Managed Identity fungerer:**
```bash
# Sjekk om webappen har riktig identitetskonfigurasjon
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Trinn 4.2: Nettverkssikkerhet

1. **Aktiver private endepunkter** (hvis ikke allerede konfigurert):

Legg til i din bicep-mal:
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

### Trinn 4.3: Overvåking og observabilitet

1. **Konfigurer Application Insights:**
```bash
# Application Insights bør konfigureres automatisk
# Sjekk konfigurasjonen:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sett opp AI-spesifikk overvåking:**

Legg til egendefinerte måledata for AI-operasjoner:
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

**Oppgave**: Gå gjennom distribusjonen med tanke på sikkerhetsbeste praksis.

**Sjekkliste:**
- [ ] Ingen hardkodede hemmeligheter i kode eller konfigurasjon
- [ ] Managed Identity brukes for tjeneste-til-tjeneste-autentisering
- [ ] Key Vault lagrer sensitiv konfigurasjon
- [ ] Nettverkstilgang er riktig begrenset
- [ ] Overvåking og logging er aktivert

## Modul 5: Konvertere din egen AI-applikasjon

### Trinn 5.1: Vurderingsskjema

**Før du konverterer appen din**, besvar disse spørsmålene:

1. **Applikasjonsarkitektur:**
   - Hvilke AI-tjenester bruker appen din?
   - Hvilke compute-ressurser trenger den?
   - Krever den en database?
   - Hva er avhengighetene mellom tjenestene?

2. **Sikkerhetskrav:**
   - Hvilke sensitive data håndterer appen din?
   - Hvilke samsvarskrav har du?
   - Trenger du privat nettverk?

3. **Skaleringskrav:**
   - Hva er forventet belastning?
   - Trenger du autoskalering?
   - Er det regionale krav?

### Trinn 5.2: Opprett din AZD-mal

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

3. **Opprett infrastrukturmaler:**

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

**Utfordring**: Lag en AZD-mal for en dokumentbehandlings-AI-app.

**Krav:**
- Azure OpenAI for innholdsanalyse
- Document Intelligence for OCR
- Storage Account for dokumentopplastinger
- Function App for behandlingslogikk
- Webapp for brukergrensesnitt

**Bonuspunkter:**
- Legg til riktig feilbehandling
- Inkluder kostnadsestimat
- Sett opp overvåkingsdashbord

## Modul 6: Feilsøking av vanlige problemer

### Vanlige distribusjonsproblemer

#### Problem 1: Kvote for OpenAI-tjenesten overskredet
**Symptomer:** Distribusjonen mislykkes med kvote-feil
**Løsninger:**
```bash
# Sjekk gjeldende kvoter
az cognitiveservices usage list --location eastus

# Be om økning av kvote eller prøv en annen region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell ikke tilgjengelig i regionen
**Symptomer:** AI-svar feiler eller modellutrullingsfeil
**Løsninger:**
```bash
# Sjekk modelltilgjengelighet per region
az cognitiveservices model list --location eastus

# Oppdater til en tilgjengelig modell
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problem 3: Tillatelsesproblemer
**Symptomer:** 403 Forbidden-feil ved kall til AI-tjenester
**Løsninger:**
```bash
# Kontroller rollefordelinger
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Legg til manglende roller
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Ytelsesproblemer

#### Problem 4: Langsomme AI-responser
**Undersøkelsestrinn:**
1. Sjekk Application Insights for ytelsesmetrikker
2. Gå gjennom OpenAI-tjenestemetrikker i Azure-portalen
3. Verifiser nettverkstilkobling og latenstid

**Løsninger:**
- Implementer caching for vanlige forespørsler
- Bruk passende OpenAI-modell for ditt bruksområde
- Vurder lese-replikaer for høy belastning

### **Labøvelse 6.1: Feilsøkingsutfordring**

**Scenario**: Distribusjonen lyktes, men applikasjonen returnerer 500-feil.

**Feilsøkingsoppgaver:**
1. Sjekk applikasjonslogger
2. Verifiser tjenestetilkobling
3. Test autentisering
4. Gå gjennom konfigurasjon

**Verktøy å bruke:**
- `azd show` for oversikt over distribusjonen
- Azure-portalen for detaljerte tjenestelogg
- Application Insights for applikasjonstelemetri

## Modul 7: Overvåking og optimalisering

### Trinn 7.1: Sett opp omfattende overvåking

1. **Lag egendefinerte dashbord:**

Gå til Azure-portalen og opprett et dashbord med:
- Antall OpenAI-forespørsler og latenstid
- Applikasjonens feilrate
- Ressursutnyttelse
- Kostnadssporing

2. **Sett opp varsler:**
```bash
# Varsel om høy feilrate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Trinn 7.2: Kostnadsoptimalisering

1. **Analyser nåværende kostnader:**
```bash
# Bruk Azure CLI for å hente kostnadsdata
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementer kostnadskontroller:**
- Sett opp budsjettvarsler
- Bruk autoskaleringspolicyer
- Implementer request-caching
- Overvåk token-bruk for OpenAI

### **Labøvelse 7.1: Ytelsesoptimalisering**

**Oppgave**: Optimaliser AI-applikasjonen for både ytelse og kostnad.

**Metrikker å forbedre:**
- Reduser gjennomsnittlig responstid med 20%
- Reduser månedlige kostnader med 15%
- Opprettholde 99,9 % tilgjengelighet

**Strategier å prøve:**
- Implementer responscaching
- Optimaliser prompts for token-effektivitet
- Bruk passende compute-SKUs
- Sett opp riktig autoskalering

## Avsluttende utfordring: Helhetlig implementering

### Utfordringssituasjon

Du har fått i oppgave å lage en produksjonsklar AI-drevet kundeservice-chatbot med disse kravene:

**Funksjonelle krav:**
- Webgrensesnitt for kundedialog
- Integrasjon med Azure OpenAI for svar
- Dokument-søk ved bruk av Cognitive Search
- Integrasjon med eksisterende kundedatabase
- Flerspråklig støtte

**Ikke-funksjonelle krav:**
- Håndtere 1000 samtidige brukere
- 99,9 % oppetids-SLA
- SOC 2-kompatibilitet
- Kostnad under $500/måned
- Distribuere til flere miljøer (dev, staging, prod)

### Implementeringstrinn

1. **Design arkitekturen**
2. **Opprett AZD-malen**
3. **Implementer sikkerhetstiltak**
4. **Sett opp overvåking og varsling**
5. **Opprett distribusjonspipelines**
6. **Dokumenter løsningen**

### Evalueringskriterier

- ✅ **Funksjonalitet**: Oppfyller den alle krav?
- ✅ **Sikkerhet**: Er beste praksis implementert?
- ✅ **Skalerbarhet**: Kan den håndtere belastningen?
- ✅ **Vedlikeholdbarhet**: Er koden og infrastrukturen godt organisert?
- ✅ **Kostnad**: Holder den seg innen budsjett?

## Ekstra ressurser

### Microsoft-dokumentasjon
- [Azure Developer CLI-dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI-tjenestens dokumentasjon](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry-dokumentasjon](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelmaler
- [Azure OpenAI Chat-app](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Hurtigstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fellesskapsressurser
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Fullføringsbevis
Gratulerer! Du har fullført AI Workshop-laben. Du skal nå kunne:

- ✅ Konvertere eksisterende AI-applikasjoner til AZD-maler
- ✅ Distribuere produksjonsklare AI-applikasjoner
- ✅ Implementere sikkerhetsbeste praksis for AI-arbeidsbelastninger
- ✅ Overvåke og optimalisere AI-applikasjoners ytelse
- ✅ Feilsøke vanlige distribusjonsproblemer

### Neste steg
1. Bruk disse mønstrene på dine egne AI-prosjekter
2. Bidra med maler tilbake til fellesskapet
3. Bli med i Microsoft Foundry Discord for kontinuerlig støtte
4. Utforsk avanserte emner som distribusjoner i flere regioner

---

**Tilbakemelding på workshop**: Hjelp oss å forbedre denne workshopen ved å dele din erfaring i [Microsoft Foundry Discord #Azure-kanal](https://discord.gg/microsoft-azure).

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD for nybegynnere](../../README.md)
- **📖 Gjeldende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige**: [Distribusjon av AI-modeller](ai-model-deployment.md)
- **➡️ Neste**: [Beste praksis for produksjons-AI](production-ai-practices.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

**Trenger du hjelp?** Bli med i vårt fellesskap for støtte og diskusjoner om AZD og AI-distribusjoner.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->