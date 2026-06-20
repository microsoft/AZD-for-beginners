# AI Workshop Lab: Gjøre AI-løsningene dine AZD-distribuerbare

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-Først Utvikling
- **⬅️ Forrige**: [AI Modell Distribusjon](ai-model-deployment.md)
- **➡️ Neste**: [Produksjons AI Beste Praksiser](production-ai-practices.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

## Workshop Oversikt

Dette praktiske laboratoriet veileder utviklere gjennom prosessen med å ta en eksisterende AI-mal og distribuere den ved hjelp av Azure Developer CLI (AZD). Du vil lære essensielle mønstre for produksjonsklare AI-distribusjoner med Microsoft Foundry-tjenester.

> **Valideringsnotat (2026-03-25):** Denne workshopen ble gjennomgått mot `azd` `1.23.12`. Hvis din lokale installasjon er eldre, oppdater AZD før du starter slik at autentisering, mal og distribusjonsflyt samsvarer med trinnene nedenfor.

**Varighet:** 2-3 timer  
**Nivå:** Mellomnivå  
**Forutsetninger:** Grunnleggende Azure-kunnskap, kjennskap til AI/ML-konsepter

## 🎓 Læringsmål

Ved slutten av denne workshopen vil du kunne:
- ✅ Konvertere en eksisterende AI-applikasjon for å bruke AZD-maler
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker håndtering av legitimasjon for AI-tjenester
- ✅ Distribuere produksjonsklare AI-applikasjoner med overvåking
- ✅ Feilsøke vanlige problemer med AI-distribusjon

## Forutsetninger

### Påkrevde Verktøy
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installert
- [Git](https://git-scm.com/) installert
- Kodeeditor (anbefalt VS Code)

### Azure Ressurser
- Azure-abonnement med bidragsytertilgang
- Tilgang til Microsoft Foundry Models-tjenester (eller mulighet for å be om tilgang)
- Rettigheter til å opprette ressursgrupper

### Kunnskapsforutsetninger
- Grunnleggende forståelse av Azure-tjenester
- Kjennskap til kommandolinjegrensesnitt
- Grunnleggende AI/ML-konsepter (APIer, modeller, forespørsler)

## Lab Oppsett

### Trinn 1: Miljøforberedelse

1. **Verifiser installasjon av verktøy:**
```bash
# Sjekk AZD-installasjon
azd version

# Sjekk Azure CLI
az --version

# Logg inn på Azure for AZD-arbeidsflyter
azd auth login

# Logg inn på Azure CLI kun hvis du planlegger å kjøre az-kommandoer under feilsøking
az login
```

Hvis du jobber på tvers av flere leietakere eller abonnementet ditt ikke oppdages automatisk, prøv igjen med `azd auth login --tenant-id <tenant-id>`.

2. **Klon workshop-repositoriet:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Forstå AZDs Struktur for AI-applikasjoner

### Anatomi av en AI AZD-mal

Utforsk nøkkelfilene i en AI-klar AZD-mal:

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

### **Lab Øvelse 1.1: Utforsk Konfigurasjonen**

1. **Undersøk azure.yaml-filen:**
```bash
cat azure.yaml
```

**Hva du skal se etter:**
- Tjenestedefinisjoner for AI-komponenter
- Miljøvariabelkartlegginger
- Vertskonfigurasjoner

2. **Gå gjennom main.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Nøkkelmønstre for AI å identifisere:**
- Oppsett av Microsoft Foundry Models-tjeneste
- Integrasjon med Azure AI Search
- Sikker nøkkelhåndtering
- Nettverkssikkerhetskonfigurasjoner

### **Diskusjonspunkt:** Hvorfor disse mønstrene er viktige for AI

- **Tjenesteavhengigheter**: AI-apper krever ofte flere koordinerte tjenester
- **Sikkerhet**: API-nøkler og endepunkter må håndteres sikkert
- **Skalerbarhet**: AI-arbeidsmengder har unike skaleringsbehov
- **Kostnadskontroll**: AI-tjenester kan bli dyre uten riktig konfigurasjon

## Modul 2: Distribuer Din Første AI-applikasjon

### Trinn 2.1: Initialiser Miljøet

1. **Opprett et nytt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Sett påkrevde parametere:**
```bash
# Sett din foretrukne Azure-region
azd env set AZURE_LOCATION eastus

# Valgfritt: Angi spesifikk OpenAI-modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Trinn 2.2: Distribuer Infrastruktur og Applikasjon

1. **Distribuer med AZD:**
```bash
azd up
```

**Hva som skjer under `azd up`:**
- ✅ Oppretter Microsoft Foundry Models-tjeneste
- ✅ Oppretter Azure AI Search-tjeneste
- ✅ Setter opp App Service for webapplikasjonen
- ✅ Konfigurerer nettverk og sikkerhet
- ✅ Distribuerer applikasjonskode
- ✅ Setter opp overvåking og logging

2. **Følg med på distribusjonsprogresjonen** og noter hvilke ressurser som opprettes.

### Trinn 2.3: Verifiser Distribusjonen Din

1. **Sjekk de deployerte ressursene:**
```bash
azd show
```

2. **Åpne den deployerte applikasjonen:**
```bash
azd show
```

Åpne web-endepunktet vist i `azd show`-outputen.

3. **Test AI-funksjonaliteten:**
   - Naviger til webapplikasjonen
   - Prøv eksempelforespørsler
   - Bekreft at AI-responsene fungerer

### **Lab Øvelse 2.1: Feilsøkingsøvelse**

**Scenario**: Distribusjonen din var vellykket, men AI-en svarer ikke.

**Vanlige problemer å sjekke:**
1. **OpenAI API-nøkler**: Verifiser at de er korrekt satt
2. **Modelltilgjengelighet**: Sjekk om regionen din støtter modellen
3. **Nettverksforbindelse**: Sørg for at tjenestene kan kommunisere
4. **RBAC-tillatelser**: Verifiser at appen har tilgang til OpenAI

**Feilsøkingskommandoer:**
```bash
# Sjekk miljøvariabler
azd env get-values

# Se distribusjonslogger
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sjekk status for OpenAI-distribusjon
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpass AI-applikasjoner for dine behov

### Trinn 3.1: Endre AI-konfigurasjonen

1. **Oppdater OpenAI-modellen:**
```bash
# Bytt til en annen modell (hvis tilgjengelig i din region)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Distribuer på nytt med den nye konfigurasjonen
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

### Trinn 3.2: Miljøspesifikke Konfigurasjoner

**Beste praksis**: Bruk forskjellige konfigurasjoner for utvikling vs produksjon.

1. **Opprett et produksjonsmiljø:**
```bash
azd env new myai-production
```

2. **Sett produksjonsspesifikke parametere:**
```bash
# Produksjon bruker vanligvis høyere SKU-er
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktiver ytterligere sikkerhetsfunksjoner
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Øvelse 3.1: Kostnadsoptimalisering**

**Utfordring**: Konfigurer malen for kostnadseffektiv utvikling.

**Oppgaver:**
1. Identifiser hvilke SKUer som kan settes til gratis/grunnleggende nivå
2. Konfigurer miljøvariabler for minimal kostnad
3. Distribuer og sammenligne kostnader med produksjonskonfigurasjonen

**Løsningshint:**
- Bruk F0 (gratis) nivå for Azure AI Services når mulig
- Bruk Basic nivå for Search Service i utvikling
- Vurder å bruke Forbruksplan for Functions

## Modul 4: Sikkerhet og Beste Praksiser i Produksjon

### Trinn 4.1: Sikker Håndtering av Legitimasjon

**Nåværende utfordring**: Mange AI-apper hardkoder API-nøkler eller bruker usikre lagringer.

**AZD-løsning**: Managed Identity + Key Vault-integrasjon.

1. **Gjennomgå sikkerhetskonfigurasjonen i malen din:**
```bash
# Se etter Key Vault og Managed Identity-konfigurasjon
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

### Trinn 4.3: Overvåking og Observabilitet

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

### **Lab Øvelse 4.1: Sikkerhetsrevisjon**

**Oppgave**: Gjennomgå distribusjonen din for sikkerhetsbeste praksis.

**Sjekkliste:**
- [ ] Ingen hardkodede hemmeligheter i kode eller konfigurasjon
- [ ] Managed Identity brukt for tjeneste-til-tjeneste-autentisering
- [ ] Key Vault lagrer sensitiv konfigurasjon
- [ ] Nettverkstilgang er riktig begrenset
- [ ] Overvåking og logging er aktivert

## Modul 5: Konverter Din Egen AI-applikasjon

### Trinn 5.1: Vurderingsskjema

**Før du konverterer appen din**, svar på disse spørsmålene:

1. **Applikasjonsarkitektur:**
   - Hvilke AI-tjenester bruker appen din?
   - Hvilke datakraftressurser trenger den?
   - Krever den en database?
   - Hva er avhengighetene mellom tjenestene?

2. **Sikkerhetskrav:**
   - Hvilke sensitive data håndterer appen din?
   - Hvilke samsvarsregler gjelder?
   - Trenger du privat nettverk?

3. **Skaleringskrav:**
   - Hva er forventet belastning?
   - Trenger du automatisk skalering?
   - Finnes regionale krav?

### Trinn 5.2: Lag Din AZD-mal

**Følg dette mønsteret for å konvertere appen:**

1. **Opprett grunnstrukturen:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialiser AZD-mal
azd init --template minimal
```

2. **Lag azure.yaml:**
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

3. **Lag infrastruktursmaler:**

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

### **Lab Øvelse 5.1: Malopprettingsutfordring**

**Utfordring**: Lag en AZD-mal for en AI-app for dokumentbehandling.

**Krav:**
- Microsoft Foundry Models for innholdsanalyse
- Document Intelligence for OCR
- Storage-konto for dokumentopplastinger
- Function App for behandlingslogikk
- Webapp for brukergrensesnitt

**Bonuspoeng:**
- Legg til skikkelig feilhåndtering
- Inkluder kostnadsestimat
- Sett opp overvåkingsdashboards

## Modul 6: Feilsøking av Vanlige Problemer

### Vanlige Distribusjonsproblemer

#### Problem 1: OpenAI Service Kvote Overskredet
**Symptomer:** Distribusjonen feiler med kvotefeil
**Løsninger:**
```bash
# Sjekk nåværende kvoter
az cognitiveservices usage list --location eastus

# Be om kvoteøkning eller prøv en annen region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell Ikke Tilgjengelig i Region
**Symptomer:** AI-svar feiler eller modell distribusjonsfeil
**Løsninger:**
```bash
# Sjekk modellens tilgjengelighet etter region
az cognitiveservices model list --location eastus

# Oppdater til tilgjengelig modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Tillatelsesproblemer
**Symptomer:** 403 Forbidden feil ved kall til AI-tjenester
**Løsninger:**
```bash
# Sjekk rollefordelinger
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Legg til manglende roller
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Ytelsesproblemer

#### Problem 4: Langsomme AI-svar
**Undersøkelsestrinn:**
1. Sjekk Application Insights for ytelsesmetrikker
2. Gå gjennom OpenAI-tjenestemetrikker i Azure-portalen
3. Verifiser nettverkstilkobling og ventetid

**Løsninger:**
- Implementer caching for vanlige forespørsler
- Bruk passende OpenAI-modell for brukstilfellet ditt
- Vurder lese-replikering for høy belastning

### **Lab Øvelse 6.1: Feilsøkingsutfordring**

**Scenario**: Distribusjonen lyktes, men applikasjonen returnerer 500-feil.

**Feilsøkingsoppgaver:**
1. Sjekk applikasjonslogger
2. Verifiser tjenestetilkobling
3. Test autentisering
4. Gå gjennom konfigurasjonen

**Verktøy å bruke:**
- `azd show` for oversikt over distribusjon
- Azure-portalen for detaljerte tjenesteloger
- Application Insights for applikasjonstelemetri

## Modul 7: Overvåking og Optimalisering

### Trinn 7.1: Sett Opp Omfattende Overvåking

1. **Lag egendefinerte dashboards:**

Naviger til Azure-portalen og opprett et dashboard med:
- OpenAI forespørselsantall og ventetid
- Applikasjonsfeilrater
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
- Bruk autoskalering
- Implementer forespørsels-caching
- Overvåk tokenbruk for OpenAI

### **Lab Øvelse 7.1: Ytelsesoptimalisering**

**Oppgave**: Optimaliser AI-applikasjonen din for både ytelse og kostnad.

**Mål å forbedre:**
- Redusere gjennomsnittlig responstid med 20 %
- Redusere månedlige kostnader med 15 %
- Opprettholde 99,9 % oppetid

**Strategier å prøve:**
- Implementer respons-caching
- Optimaliser forespørsler for token-effektivitet
- Bruk passende compute-SKUer
- Sett opp riktig autoskalering

## Sluttutfordring: Ende-til-ende Implementering

### Utfordringssituasjon

Du er ansvarlig for å lage en produksjonsklar AI-drevet kundeservice-chatbot med disse kravene:

**Funksjonelle krav:**
- Webgrensesnitt for kundeinteraksjoner
- Integrasjon med Microsoft Foundry Models for svar
- Dokument-søk med Azure AI Search
- Integrasjon med eksisterende kundedatabase
- Flerspråklig støtte

**Ikke-funksjonelle krav:**
- Håndtere 1000 samtidige brukere
- 99,9 % oppetid SLA
- SOC 2 samsvar
- Kostnad under $500/måned
- Distribuere til flere miljøer (dev, staging, prod)

### Implementeringstrinn

1. **Design arkitekturen**
2. **Lag AZD-malen**
3. **Implementer sikkerhetstiltak**
4. **Sett opp overvåking og varsling**
5. **Lag distribusjonspipelines**
6. **Dokumenter løsningen**

### Evalueringskriterier

- ✅ **Funksjonalitet**: Oppfyller den alle krav?
- ✅ **Sikkerhet**: Er beste praksis implementert?
- ✅ **Skalerbarhet**: Kan den håndtere belastningen?
- ✅ **Vedlikeholdbarhet**: Er kode og infrastruktur godt organisert?
- ✅ **Kostnad**: Holder den seg innen budsjett?

## Tilleggsressurser

### Microsoft Dokumentasjon
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Tjenestedokumentasjon](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentasjon](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelmaler
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Hurtigstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fellesskapsressurser
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Fullføringsbevis

Gratulerer! Du har fullført AI Workshop Lab. Du skal nå kunne:

- ✅ Konvertere eksisterende AI-applikasjoner til AZD-maler
- ✅ Distribuere produksjonsklare AI-applikasjoner
- ✅ Implementere sikkerhetsbeste praksis for AI-arbeidsbelastninger
- ✅ Overvåke og optimalisere AI-applikasjonsytelse
- ✅ Feilsøke vanlige distribusjonsproblemer

### Neste steg
1. Bruk disse mønstrene på dine egne AI-prosjekter
2. Bidra med maler tilbake til fellesskapet
3. Bli med i Microsoft Foundry Discord for kontinuerlig støtte
4. Utforsk avanserte emner som distribusjon i flere regioner

---

**Tilbakemelding på workshop:** Hjelp oss å forbedre denne workshopen ved å dele din erfaring i [Microsoft Foundry Discord #Azure-kanalen](https://discord.gg/microsoft-azure).

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-First Utvikling
- **⬅️ Forrige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Neste**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

**Trenger du hjelp?** Bli med i vårt fellesskap for støtte og diskusjoner om AZD og AI-distribusjoner.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->