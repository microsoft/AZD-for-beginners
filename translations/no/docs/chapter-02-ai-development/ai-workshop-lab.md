# AI Workshop Lab: Gjør AI-løsningene dine AZD-distribuerbare

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-Først Utvikling
- **⬅️ Forrige**: [AI Modell Distribusjon](ai-model-deployment.md)
- **➡️ Neste**: [Produksjons-AI Beste Praksis](production-ai-practices.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

## Workshop Oversikt

Denne praktiske labben veileder utviklere gjennom prosessen med å ta en eksisterende AI-mal og distribuere den ved hjelp av Azure Developer CLI (AZD). Du vil lære viktige mønstre for produksjonsklare AI-distribusjoner ved bruk av Microsoft Foundry-tjenester.

> **Valideringsnotat (2026-03-25):** Denne workshopen ble gjennomgått med `azd` `1.23.12`. Hvis din lokale installasjon er eldre, oppdater AZD før du starter slik at godkjenning, maler og distribusjonsflyt samsvarer med stegene nedenfor.

**Varighet:** 2-3 timer  
**Nivå:** Middels  
**Forutsetninger:** Grunnleggende Azure-kunnskap, kjennskap til AI/ML-konsepter

## 🎓 Læringsmål

Ved slutten av denne workshopen vil du kunne:
- ✅ Konvertere en eksisterende AI-applikasjon til å bruke AZD-maler
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker håndtering av legitimasjon for AI-tjenester
- ✅ Distribuere produksjonsklare AI-applikasjoner med overvåkning
- ✅ Feilsøke vanlige AI-distribusjonsproblemer

## Forutsetninger

### Nødvendige Verktøy
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installert
- [Git](https://git-scm.com/) installert
- Kodeeditor (VS Code anbefalt)

### Azure Ressurser
- Azure-abonnement med bidragsytertillatelse
- Tilgang til Microsoft Foundry Models-tjenester (eller mulighet til å be om tilgang)
- Tillatelser for å opprette ressursgrupper

### Kunnskapsforutsetninger
- Grunnleggende forståelse av Azure-tjenester
- Kjennskap til kommandolinjegrensesnitt
- Grunnleggende AI/ML-konsepter (APIer, modeller, prompt)

## Lab Oppsett

### Steg 1: Miljøforberedelse

1. **Verifiser verktøyinstallasjoner:**
```bash
# Sjekk AZD-installasjon
azd version

# Sjekk Azure CLI
az --version

# Logg inn på Azure for AZD-arbeidsflyter
azd auth login

# Logg inn på Azure CLI bare hvis du planlegger å kjøre az-kommandoer under diagnostikk
az login
```

Hvis du jobber på tvers av flere leietakere eller abonnementet ditt ikke oppdages automatisk, prøv igjen med `azd auth login --tenant-id <tenant-id>`.

2. **Klon workshop-repositoriet:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Forstå AZD-strukturen for AI-applikasjoner

### Anatomi av en AI AZD-mal

Utforsk de viktige filene i en AI-klar AZD-mal:

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

### **Labøvelse 1.1: Utforsk konfigurasjonen**

1. **Undersøk azure.yaml-filen:**
```bash
cat azure.yaml
```

**Hva du skal se etter:**
- Tjenestedefinisjoner for AI-komponenter
- Miljøvariabel-kartlegginger
- Vertskonfigurasjoner

2. **Gå gjennom main.bicep-infrastrukturen:**
```bash
cat infra/main.bicep
```

**Viktige AI-mønstre å identifisere:**
- Oppretting av Microsoft Foundry Models-tjeneste
- Integrasjon med Cognitive Search
- Sikker nøkkelhåndtering
- Nettverkssikkerhetskonfigurasjoner

### **Diskusjonspunkt:** Hvorfor disse mønstrene er viktige for AI

- **Tjenesteavhengigheter**: AI-applikasjoner krever ofte flere koordinerte tjenester
- **Sikkerhet**: API-nøkler og endepunkter må håndteres sikkert
- **Skalerbarhet**: AI-arbeidsmengder har unike krav til skalering
- **Kostnadshåndtering**: AI-tjenester kan bli kostbare hvis ikke riktig konfigurert

## Modul 2: Distribuer din første AI-applikasjon

### Steg 2.1: Initialiser miljøet

1. **Opprett et nytt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Sett nødvendige parametere:**
```bash
# Angi ditt foretrukne Azure-område
azd env set AZURE_LOCATION eastus

# Valgfritt: Angi spesifikk OpenAI-modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Steg 2.2: Distribuer infrastruktur og applikasjon

1. **Distribuer med AZD:**
```bash
azd up
```

**Hva som skjer under `azd up`:**
- ✅ Oppretter Microsoft Foundry Models-tjeneste
- ✅ Oppretter Cognitive Search-tjeneste
- ✅ Setter opp App Service for webapplikasjonen
- ✅ Konfigurerer nettverk og sikkerhet
- ✅ Distribuerer applikasjonskoden
- ✅ Setter opp overvåkning og logging

2. **Overvåk distribusjonsprosessen** og merk hvilke ressurser som opprettes.

### Steg 2.3: Verifiser distribusjonen

1. **Sjekk de distribuerte ressursene:**
```bash
azd show
```

2. **Åpne den distribuerte applikasjonen:**
```bash
azd show
```

Åpne webendepunktet som vises i `azd show`-utdata.

3. **Test AI-funksjonaliteten:**
   - Naviger til webapplikasjonen
   - Prøv ut prøvespørringer
   - Bekreft at AI-responsene fungerer

### **Labøvelse 2.1: Feilsøkingspraksis**

**Scenario:** Distribusjonen lyktes, men AI svarer ikke.

**Vanlige problemer å sjekke:**
1. **OpenAI API-nøkler**: Verifiser at de er korrekt satt
2. **Modellt tilgjengelighet**: Sjekk om regionen din støtter modellen
3. **Nettverksforbindelse**: Sørg for at tjenestene kan kommunisere
4. **RBAC-tillatelser**: Bekreft at appen kan aksessere OpenAI

**Feilsøkingskommandoer:**
```bash
# Sjekk miljøvariabler
azd env get-values

# Se distribusjonslogger
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Sjekk OpenAI distribusjonsstatus
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpass AI-applikasjoner for dine behov

### Steg 3.1: Endre AI-konfigurasjonen

1. **Oppdater OpenAI-modellen:**
```bash
# Bytt til en annen modell (hvis tilgjengelig i ditt område)
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

### Steg 3.2: Miljøspesifikke konfigurasjoner

**Beste praksis**: Ulike konfigurasjoner for utvikling kontra produksjon.

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

**Utfordring:** Konfigurer malen for kostnadseffektiv utvikling.

**Oppgaver:**
1. Identifiser hvilke SKUer som kan settes til gratis/grunnleggende nivåer
2. Konfigurer miljøvariabler for lavest mulig kostnad
3. Distribuer og sammenlign kostnader med produksjonskonfigurasjonen

**Løsningshint:**
- Bruk F0 (gratis) nivå for Cognitive Services om mulig
- Bruk Grunnleggende nivå for Search-tjeneste i utvikling
- Vurder forbruksplan for Functions

## Modul 4: Sikkerhet og beste praksis i produksjon

### Steg 4.1: Sikker håndtering av legitimasjon

**Nåværende utfordring:** Mange AI-apper hardkoder API-nøkler eller bruker usikret lagring.

**AZD-løsning:** Administrert identitet + Key Vault-integrasjon.

1. **Se gjennom sikkerhetskonfigurasjonen i malen din:**
```bash
# Se etter konfigurasjon av Key Vault og administrert identitet
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifiser at administrert identitet fungerer:**
```bash
# Sjekk om nettsøknaden har riktig identitetskonfigurasjon
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Steg 4.2: Nettverkssikkerhet

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

### Steg 4.3: Overvåkning og observabilitet

1. **Konfigurer Application Insights:**
```bash
# Application Insights skal konfigureres automatisk
# Sjekk konfigurasjonen:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sett opp AI-spesifikk overvåkning:**

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

**Oppgave:** Gjennomgå distribusjonen for sikker beste praksis.

**Sjekkliste:**
- [ ] Ingen hardkodede hemmeligheter i kode eller konfigurasjon
- [ ] Administrert identitet brukt for tjeneste-til-tjeneste-autentisering
- [ ] Key Vault lagrer sensitiv konfigurasjon
- [ ] Nettverkstilgang er passende begrenset
- [ ] Overvåkning og logging er aktivert

## Modul 5: Konverter din egen AI-applikasjon

### Steg 5.1: Vurderingsarbeidsark

**Før du konverterer appen din**, svar på disse spørsmålene:

1. **Applikasjonsarkitektur:**
   - Hvilke AI-tjenester bruker appen din?
   - Hvilke databehandlingsressurser trenger den?
   - Krever den en database?
   - Hva er avhengighetene mellom tjenestene?

2. **Sikkerhetskrav:**
   - Hvilke sensitive data håndterer appen din?
   - Hvilke samsvars- og krav har du?
   - Trenger du privat nettverk?

3. **Skaleringskrav:**
   - Hva er forventet belastning?
   - Trenger du autoskalering?
   - Finnes det regionale krav?

### Steg 5.2: Lag din AZD-mal

**Følg dette mønsteret for å konvertere appen din:**

1. **Lag den grunnleggende strukturen:**
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

3. **Lag infrastrukturmaler:**

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

### **Labøvelse 5.1: Mal-lageutfordring**

**Utfordring:** Lag en AZD-mal for en dokumentbehandlings-AI-app.

**Krav:**
- Microsoft Foundry Models for innholdsanalyse
- Document Intelligence for OCR
- Storage Account for dokumentopplastinger
- Function App for prosesseringslogikk
- Webapp for brukergrensesnitt

**Bonuspoeng:**
- Legg til korrekt feilhåndtering
- Inkluder kostnadsestimering
- Sett opp overvåkningsdashbord

## Modul 6: Feilsøking av vanlige problemer

### Vanlige distribusjonsproblemer

#### Problem 1: OpenAI-tjenestens kvote overskredet
**Symptomer:** Distribusjon feiler med kvotefeilmelding
**Løsninger:**
```bash
# Sjekk gjeldende kvoter
az cognitiveservices usage list --location eastus

# Be om økning av kvote eller prøv en annen region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell ikke tilgjengelig i region
**Symptomer:** AI-responser feiler eller modell-distribusjonsfeil
**Løsninger:**
```bash
# Sjekk modelltilgjengelighet etter region
az cognitiveservices model list --location eastus

# Oppdater til tilgjengelig modell
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problem 3: Tillatelsesproblemer
**Symptomer:** 403 Forbudt-feil ved kall til AI-tjenester
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

#### Problem 4: Sakte AI-responser
**Etterforskningssteg:**
1. Sjekk Application Insights for ytelsesmetrikker
2. Gå gjennom OpenAI-tjenestemetrikker i Azure-portalen
3. Verifiser nettverksforbindelse og ventetid

**Løsninger:**
- Implementer caching for vanlige spørringer
- Bruk riktig OpenAI-modell for ditt brukstilfelle
- Vurder lesereplikater for høy-belastningsscenarier

### **Labøvelse 6.1: Feilsøkingsutfordring**

**Scenario:** Distribusjonen lyktes, men applikasjonen returnerer 500-feil.

**Feilsøkingsoppgaver:**
1. Sjekk applikasjonslogger
2. Verifiser tjenestetilkobling
3. Test autentisering
4. Gå gjennom konfigurasjon

**Verktøy å bruke:**
- `azd show` for distribusjonsoversikt
- Azure-portalen for detaljerte tjenestelogger
- Application Insights for applikasjonstelemetri

## Modul 7: Overvåkning og optimalisering

### Steg 7.1: Sett opp omfattende overvåkning

1. **Lag egendefinerte dashbord:**

Naviger til Azure-portalen og opprett et dashbord med:
- Antall og ventetid for OpenAI-forespørsler
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
- Overvåk token-bruk for OpenAI

### **Labøvelse 7.1: Ytelsesoptimalisering**

**Oppgave:** Optimaliser AI-applikasjonen for både ytelse og kostnad.

**Metrikker å forbedre:**
- Reduser gjennomsnittlig responstid med 20 %
- Reduser månedlige kostnader med 15 %
- Oppretthold 99,9 % oppetid

**Strategier å prøve:**
- Implementer responscaching
- Optimaliser prompts for token-effektivitet
- Bruk riktige computekategorier (SKUer)
- Sett opp riktig autoskalering

## Sluttutfordring: Helhetlig implementering

### Utfordringsscenario

Du har fått i oppdrag å lage en produksjonsklar AI-drevet kundeservicechatbot med disse kravene:

**Funksjonelle krav:**
- Nettgrensesnitt for kundedialog
- Integrasjon med Microsoft Foundry Models for svar
- Dokument-søk via Cognitive Search
- Integrasjon med eksisterende kundedatabase
- Flerspråklig støtte

**Ikke-funksjonelle krav:**
- Håndter 1000 samtidige brukere
- 99,9 % uptime SLA
- SOC 2 samsvar
- Kostnad under $500/måned
- Distribuer til flere miljøer (utvikling, staging, produksjon)

### Implementeringstrinn

1. **Design arkitekturen**
2. **Lag AZD-malen**
3. **Implementer sikkerhetstiltak**
4. **Sett opp overvåkning og varsling**
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
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Ferdighetsbevis

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
4. Utforsk avanserte emner som flerregion-distribusjoner

---

**Workshop Feedback**: Hjelp oss å forbedre denne workshopen ved å dele din erfaring i [Microsoft Foundry Discord #Azure-kanal](https://discord.gg/microsoft-azure).

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD for nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige**: [AI Modell Distribusjon](ai-model-deployment.md)
- **➡️ Neste**: [Produksjons AI Beste Praksis](production-ai-practices.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

**Trenger du hjelp?** Bli med i vårt fellesskap for støtte og diskusjoner om AZD og AI-distribusjoner.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på dets opprinnelige språk skal anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->