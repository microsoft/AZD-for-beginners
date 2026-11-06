# AI Workshop Lab: Gjør AI-løsningene dine AZD-distribuerbare

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 2 - AI-først Utvikling
- **⬅️ Forrige**: [Distribusjon av AI-modell](ai-model-deployment.md)
- **➡️ Neste**: [Beste praksis for produksjons-AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Neste Kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

## Workshop Oversikt

Dette praktiske laboratoriet veileder utviklere gjennom prosessen med å ta en eksisterende AI-mal og distribuere den ved bruk av Azure Developer CLI (AZD). Du lærer viktige mønstre for produksjons-AI-distribusjoner med Microsoft Foundry-tjenester.

> **Utgivelsesgjennomgang (2026-11-04):** Veiledningen for AZD-kommandoer og eksemplarkonfigurasjonsnavn ble sjekket mot `azd` `1.37.2` utgivelsen og den linkede eksempelkodens nåværende konfigurasjon. Dette er en dokumentasjonsgjennomgang, ikke en validering av live-distribusjon. RAG-laboratoriet krever ikke agent-ekstensjonen; for agentvurderinger, bruk den separate `azure.ai.evaluations`-ekstensjonen og [nåværende evalueringsarbeidsflyt](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), ikke eldre agentvurderingskommandoer.

**Varighet:** 2-3 timer  
**Nivå:** Middels  
**Forutsetninger:** Grunnleggende Azure-kunnskap, kjennskap til AI/ML-konsepter

## 🎓 Læringsmål

Når du er ferdig med denne workshopen, vil du kunne:
- ✅ Utforske en eksisterende AI AZD-mal og planlegge konvertering av din egen applikasjon
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker håndtering av legitimasjon for AI-tjenester
- ✅ Distribuere en AI-referanseapplikasjon med overvåking
- ✅ Feilsøke vanlige AI-distribusjonsproblemer

## Forutsetninger

### Nødvendige Verktøy
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installert
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installert
- [Git](https://git-scm.com/) installert
- Kodeeditor (anbefalt VS Code)

Disse kommandoblokkene bruker Bash-syntaks (inkludert linjefortsettelser og `grep`). På Windows, bruk Git Bash/WSL eller oversett dem til PowerShell. Installer også språk, pakkebehandler og containerverktøy som er listet i [eksempelets lokale miljøoppsett](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure-Ressurser
- Azure-abonnement med rettigheter til ressursprovisjonering og rolle-tilordninger (Contributor alene kan ikke opprette RBAC-tildelinger; bruk en autorisert rolleadministrator eller eksempelkodens dokumenterte ekvivalent)
- Tilgang til Microsoft Foundry Models-tjenester (eller mulighet til å be om tilgang)
- Rettigheter til å opprette ressursgruppe

### Kunnskapsforutsetninger
- Grunnleggende forståelse av Azure-tjenester
- Kjennskap til kommandolinjegrensesnitt
- Grunnleggende AI/ML-konsepter (API-er, modeller, prompts)

## Oppsett av laboratoriet

### Steg 1: Forbered miljøet

1. **Verifiser verktøyinstallasjoner:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
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

Utforsk nøkkelfilene i en AI-klar AZD-mal:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Det utgitte eksempelet kan endres; `.azure/` vises etter miljøinitialisering, ikke nødvendigvis i en fersk kloning. Undersøk den faktiske utgitte versjonen i stedet for å lage manglende kataloger for å matche dette skjemaet.

### **Labøvelse 1.1: Utforsk konfigurasjonen**

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

**Viktige AI-mønstre å identifisere:**
- Microsoft Foundry Models tjenesteprovisjonering
- Azure AI Search-integrasjon
- Sikker nøkkelhåndtering
- Nettverkssikkerhetskonfigurasjoner

### **Diskusjonspunkt:** Hvorfor disse mønstrene er viktige for AI

- **Tjenesteavhengigheter**: AI-apper krever ofte flere koordinerte tjenester
- **Sikkerhet**: API-nøkler og endepunkter må håndteres sikkert
- **Skalerbarhet**: AI-arbeidsbelastninger har unike skaleringsbehov
- **Kostnadsstyring**: AI-tjenester kan bli dyre hvis de ikke konfigureres riktig

## Modul 2: Distribuer din første AI-applikasjon

### Steg 2.1: Initialiser miljøet

1. **Opprett et nytt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Sett nødvendige parametere:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Steg 2.2: Distribuer infrastrukturen og applikasjonen

1. **Distribuer med AZD:**
```bash
azd up
```

**Hva skjer under `azd up`:**
- ✅ Provisionerer Microsoft Foundry Models-tjeneste
- ✅ Oppretter Azure AI Search-tjeneste
- ✅ Setter opp Azure Container Apps for backend og inkludert frontend (nåværende standard i eksempelet)
- ✅ Konfigurerer nettverk og sikkerhet
- ✅ Distribuerer applikasjonskode
- ✅ Setter opp overvåking og logging

2. **Overvåk distribusjonsprogresjonen** og merk hvilke ressurser som blir opprettet.

### Steg 2.3: Verifiser distribusjonen din

1. **Sjekk de distribuerte ressursene:**
```bash
azd show
```

2. **Åpne den distribuerte applikasjonen:**
```bash
azd show
```

Åpne webendepunktet som vises i `azd show`-utdataene.

3. **Test AI-funksjonaliteten:**
   - Naviger til webapplikasjonen
   - Prøv eksempelforespørsler
   - Bekreft at AI-responsene fungerer

### **Labøvelse 2.1: Feilsøkingspraksis**

**Scenario**: Distribusjonen din lyktes, men AI-en svarer ikke.

**Vanlige problemer å sjekke:**
1. **Autentisering**: Verifiser managed identity og rolle-tilordninger; sjekk API-nøkler kun hvis du bevisst aktiverte nøkkelbasert autentisering
2. **Modelltjenestetilgjengelighet**: Sjekk om regionen din støtter modellen
3. **Nettverkstilkobling**: Sørg for at tjenestene kan kommunisere
4. **RBAC-tillatelser**: Verifiser at appen kan få tilgang til OpenAI

**Feilsøkingskommandoer:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpasning av AI-applikasjoner for dine behov

### Steg 3.1: Endre AI-konfigurasjonen

1. **Oppdater OpenAI-modellen:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Legg til ekstra AI-tjenester:**

Rediger `infra/main.bicep` for å legge til Document Intelligence:

Følgende er et illustrerende fragment, ikke en fullstendig mal. Eksemplet kan allerede provisjonere dokumentbearbeidelsestjenester: undersøk dagens infrastruktur før du legger til dupliserte ressurser. Egne tillegg krever sammenkobling av utdata, identiteter og applikasjonskonfigurasjon.

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

**Beste praksis**: Ulike konfigurasjoner for utvikling vs produksjon.

1. **Opprett produksjonsmiljø:**
```bash
azd env new myai-production
```

2. **Sett produksjonsspesifikke parametere:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Disse navnene kommer fra eksempelets [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json). `azd env set` lagrer en verdi, men gjør ikke en vilkårlig variabel effektiv: malen må konsumere den. Gå gjennom eksempelkodens [nettverksisolasjon-guide](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) før du deaktiverer offentlig tilgang, og bruk `azd up` for å anvende infrastrukturendringer. OpenAI SKU `S0` alene avgjør ikke modellens gjennomstrømning; type modell-distribusjon og kapasitet spiller også inn.

### **Labøvelse 3.1: Kostnadsoptimalisering**

**Utfordring**: Konfigurer malen for kostnadseffektiv utvikling.

**Oppgaver:**
1. Velg det engangs brukte workshop-miljøet: `azd env select myai-workshop`.
2. Noter nåværende Search SKU og modellkapasitet fra `infra/main.parameters.json` og det valgte miljøet.
3. Bruk de støttede inndataene nedenfor, etter å ha bekreftet modell-/regionskvote:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Verifiser Search SKU og distribusjonskapasitet i portalen og estimer forskjellen med prisberegneren. Ikke forvent at faktureringsdata oppdateres umiddelbart.

**Suksesskriterier:** Search bruker Basic, chat-distribusjonen har den forespurte støttede kapasiteten, og appen svarer fortsatt på et eksempelspørsmål. Kapasitet `10` er en rategrense-tildeling, ikke en tokenprisrabatt. Endringer i Search-nivå kan være begrenset eller kreve rekreasjon; ikke eksperimenter på produksjonsressurser. F0 er tjenestespesifikk og ikke en Azure OpenAI-modell-SKU.

## Modul 4: Sikkerhet og beste praksis for produksjon

### Steg 4.1: Sikker håndtering av legitimasjon

**Nåværende utfordring:** Mange AI-apper hardkoder API-nøkler eller bruker usikker lagring.

**AZD-løsning:** Managed Identity + Key Vault-integrasjon.

1. **Gå gjennom sikkerhetskonfigurasjonen i malen din:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Bekreft at Managed Identity fungerer:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Steg 4.2: Nettverkssikkerhet

1. **Aktiver private endepunkter** ved bruk av eksempelkodens støttede nettverkskonfigurasjon (hvis ikke allerede konfigurert).

For din egen mal viser dette illustrerende fragmentet OpenAI-endepunktsforbindelsen. Det krever også VNet, privat DNS-konfigurasjon og applikasjonstilkobling; ikke lim det uendret inn i eksempelet, som allerede har moduler for private endepunkter:
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

### Steg 4.3: Overvåking og observerbarhet

1. **Konfigurer Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Aktiver eksempelkodens Application Insights-integrasjon:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Eksempelkodens instrumentering sender telemetri; en vilkårlig `OPENAI_MONITOR_ENABLED`-innstilling aktiverer ikke AI-metrikker. Gå gjennom spor for modellkall, forsinkelse, feil og tokenbruk, og unngå å logge sensitive prompts eller responser.

### **Labøvelse 4.1: Sikkerhetsrevisjon**

**Oppgave:** Gå gjennom distribusjonen din for sikkerhetsbeste praksis.

**Sjekkliste:**
- [ ] Ingen hardkodede hemmeligheter i kode eller konfigurasjon
- [ ] Bruk av Managed Identity for tjeneste-til-tjeneste-autentisering
- [ ] Key Vault lagrer sensitiv konfigurasjon
- [ ] Nettverkstilgang er riktig begrenset
- [ ] Overvåking og logging er aktivert

## Modul 5: Konvertere din egen AI-applikasjon

### Steg 5.1: Vurderingsarbeidsark

**Før du konverterer appen din**, svar på disse spørsmålene:

1. **Applikasjonsarkitektur:**
   - Hvilke AI-tjenester bruker appen din?
   - Hvilke beregningsressurser trenger den?
   - Krever den en database?
   - Hva er avhengighetene mellom tjenestene?

2. **Sikkerhetskrav:**
   - Hvilke sensitive data håndterer appen din?
   - Hvilke samsvarskrav har du?
   - Trenger du privat nettverk?

3. **Skaleringskrav:**
   - Hva er forventet belastning?
   - Trenger du automatisk skalering?
   - Er det regionale krav?

### Steg 5.2: Opprett din AZD-mal

**Følg dette mønsteret for å konvertere appen din:**

**Kun skjelettstruktur:** Denne seksjonen gir ikke kildekode for API/web-applikasjon, vertsinfrastruktur, modell-distribusjoner, identitet/RBAC eller en ferdig `main.parameters.json`. Ressursgruppe-avgrenset Bicep illustrerer modulkomposisjon; et typisk AZD-abonnement-avgrenset startpunkt må opprette en ressursgruppe og kalle den i dette omfanget. Ikke forvent at `azd up` distribuerer en komplett app etter kopiering av kun disse fragmentene. For en kjørbar basis, fortsett å bruke RAG-malen fra Modul 1.

1. **Opprett grunnstrukturen:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Labøvelse 5.1: Malopprettingsutfordring**

**Utfordring:** Lag en AZD-mal for en AI-app for dokumentbehandling.

**Krav:**
- Microsoft Foundry Models for innholdsanalyse
- Document Intelligence for OCR
- Storage Account for dokumentopplasting
- Funksjonsapp for behandlingslogikk
- Webapp for brukergrensesnitt

**Bonuspoeng:**
- Legg til riktig feilhåndtering
- Inkluder kostnadsestimering
- Sett opp overvåkingsdashboards

## Modul 6: Feilsøking av vanlige problemer

### Vanlige distribusjonsproblemer

#### Problem 1: OpenAI-tjenestekvote overskredet
**Symptomer:** Distribusjon feiler med kvotefeil
**Løsninger:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Modell ikke tilgjengelig i region
**Symptomer:** AI-responser feiler eller modell-distribusjonsfeil
**Løsninger:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
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
3. Verifiser nettverkstilkobling og forsinkelse

**Løsninger:**
- Implementer caching for vanlige forespørsler
- Bruk passende OpenAI-modell for ditt bruksområde
- Skaler applikasjonsreplikaer først etter å ha sjekket modellens RPM/TPM-grenser; Azure OpenAI-distribusjoner eksponerer ikke en generell database-stil "read replica" innstilling

### **Labøvelse 6.1: Feilsøkingsutfordring**

**Scenario:** Din distribusjon lyktes, men applikasjonen gir 500-feil.

**Feilsøkingsoppgaver:**
1. Sjekk applikasjonslogger
2. Verifiser tjenestetilkobling
3. Test autentisering
4. Gjennomgå konfigurasjon

**Verktøy å bruke:**
- `azd show` for distribusjonsoverblikk
- Azure-portalen for detaljerte tjenestelogg
- Application Insights for applikasjonstelemetri

## Modul 7: Overvåking og optimalisering

### Steg 7.1: Sett opp omfattende overvåking

1. **Lag egendefinerte dashbord:**

Naviger til Azure-portalen og lag et dashbord med:
- OpenAI-forespørselsantall og latenstid
- Applikasjonsfeilrater
- Ressursutnyttelse
- Kostnadssporing

2. **Sett opp varsler:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Bekreft at komponenten sender forespørselstelemetri og legg til en aksjonsgruppe hvis varsler kreves. Målingen er et antall, ikke en feilprosent; et ratevarsel trenger en passende spørring og nevner.

### Steg 7.2: Kostnadsoptimalisering

1. **Analyser nåværende kostnader:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Bytt ut dato- plassholdere. Forbruk-API-støtte varierer etter fakturaavtale; bruk Kostnadshåndtering i portalen hvis bruksdetaljer ikke er tilgjengelig. Kostnader er forsinket, ikke en sanntids testoracle.

2. **Implementer kostnadskontroller:**
- Sett opp budsjettvarsler
- Bruk autoskaleringpolicyer
- Implementer forespørselslagring
- Overvåk tokenbruk for OpenAI

### **Lab-øvelse 7.1: Ytelsesoptimalisering**

**Oppgave**: Optimaliser AI-applikasjonen din for både ytelse og kostnad.

**Metrikker å forbedre:**
- Reduser gjennomsnittlig responstid med 20%
- Reduser månedlige kostnader med 15%
- Definer en 99,9 % tilgjengelighets-SLO og et målevindu (et kort lab kan ikke demonstrere månedlig oppetid)

**Strategier å prøve:**
- Implementer responsslagring
- Optimaliser prompts for token-effektivitet
- Bruk passende compute-SKUer
- Sett opp riktig autoskalering

## Sluttutfordring: Fullstendig implementering

### Utfordringsscenario

Dette er en **valgfri arkitektur-/designutfordring**, ikke en levert kjørbar øvelse eller en produksjonssertifisering. Foreslå en AI-drevet kundeservicechatbot og dokumenter hvilke krav som trenger videre implementering og bevis:

**Funksjonelle krav:**
- Webgrensesnitt for kundekommunikasjon
- Integrasjon med Microsoft Foundry Models for svar
- Dokumentasjonssøking med Azure AI Search
- Integrasjon med eksisterende kundedatabase
- Støtte for flere språk

**Ikke-funksjonelle krav:**
- Håndtere 1000 samtidige brukere
- 99,9 % oppetids-SLA
- SOC 2 samsvar
- Kostnad under $500/måned
- Distribuer til flere miljøer (dev, staging, prod)

Dette er hypotetiske interessentbegrensninger, ikke samtidig garanterte resultat. Definer forespørselsrate, prompt-/utdata-størrelser og sesjonsvarighet før estimering av kostnader; 1000 samtidige brukere etablerer ikke en arbeidsmengde eller beviser at $500 budsjettet er gjennomførbart. SOC 2 er et organisatorisk revisjonsresultat, ikke en bryter aktivert av en AZD-mal. Identifier avveininger og forkast urealistiske begrensninger med bevis.

### Implementeringstrinn

1. **Design arkitekturen**
2. **Lag AZD-malen**
3. **Implementer sikkerhetstiltak**
4. **Sett opp overvåking og varsling**
5. **Lag distribusjonsrørledninger**
6. **Dokumenter løsningen**

### Evalueringskriterier

- ✅ **Funksjonalitet**: Er implementerte funksjoner demonstrert og gjenværende gap tydelige?
- ✅ **Sikkerhet**: Er beste praksis implementert?
- ✅ **Skalerbarhet**: Kan det håndtere belastningen?
- ✅ **Vedlikeholdbarhet**: Er kode og infrastruktur godt organisert?
- ✅ **Kostnad**: Holder det seg innen budsjett?

## Ekstra ressurser

### Microsoft-dokumentasjon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelmaler
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Fellesressurser
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Fullføringspunkt

Gratulerer! Du har fullført AI Workshop-laben. Du skal nå kunne:

- ✅ Forklare hvordan man tilpasser en eksisterende AI-applikasjon til en AZD-mal
- ✅ Distribuere og teste en AI-referanseapplikasjon
- ✅ Implementere sikkerhet best practices for AI-arbeidsmengder
- ✅ Overvåke og optimalisere AI-applikasjons ytelse
- ✅ Feilsøke vanlige distribusjonsproblemer

**Rydd opp:** Kjør `azd env list`, velg hvert engangsmiljø som ble opprettet i denne laben (`myai-workshop`, og hvis distribuert `myai-production`/`myai-quota-test`), og kjør `azd down` i hvert. Gå gjennom sletteplanen; å slette et miljøs lokale konfigurasjon alene sletter ikke Azure-ressurser. Unngå `--purge` med mindre du forstår irreversibel fjerning av mykt slettede ressurser.

### Neste steg
1. Bruk disse mønstrene i dine egne AI-prosjekter
2. Bidra med maler tilbake til fellesskapet
3. Bli med i Microsoft Foundry Discord for løpende støtte
4. Utforsk avanserte emner som distribusjon i flere regioner

---

**Workshop-tilbakemelding**: Hjelp oss forbedre denne workshoppen ved å dele din erfaring i [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-Første Utvikling
- **⬅️ Forrige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Neste**: [Produksjons-AI Beste Praksis](../chapter-08-production/production-ai-practices.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

**Trenger du hjelp?** Bli med i vårt fellesskap for støtte og diskusjoner om AZD og AI-distribusjoner.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->