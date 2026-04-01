# Ditt Første Prosjekt - Praktisk Veiledning

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [Installasjon & Oppsett](installation.md)
- **➡️ Neste**: [Konfigurasjon](configuration.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Velkommen til ditt første Azure Developer CLI-prosjekt! Denne omfattende, praktiske veiledningen gir en komplett gjennomgang av å opprette, distribuere og administrere en fullstakk-applikasjon på Azure ved bruk av azd. Du vil jobbe med en ekte todo-applikasjon som inkluderer en React frontend, Node.js API-backend, og MongoDB database.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre arbeidsflyten for initialisering av azd-prosjekter ved bruk av maler
- Forstå Azure Developer CLI prosjekstruktur og konfigurasjonsfiler
- Utføre fullstendig applikasjonsdistribusjon til Azure med infrastrukturutførelse
- Implementere applikasjonsoppdateringer og strategier for ny distribusjon
- Administrere flere miljøer for utvikling og staging
- Anvende praksis for ressursopprydding og kostnadshåndtering

## Læringsutbytte

Etter fullføring vil du kunne:
- Initialisere og konfigurere azd-prosjekter fra maler på egen hånd
- Navigere i og modifisere azd-prosjektstrukturer effektivt
- Distribuere fullstakk-applikasjoner til Azure med enkel kommando
- Feilsøke vanlige distribusjonsproblemer og autentiseringsfeil
- Administrere flere Azure-miljøer for forskjellige distribusjonsstadier
- Implementere kontinuerlige distribusjonsarbeidsflyter for applikasjonsoppdateringer

## Komme I Gang

### Sjekkliste for Forutsetninger
- ✅ Azure Developer CLI installert ([Installasjonsguide](installation.md))
- ✅ AZD autentisering fullført med `azd auth login`
- ✅ Git installert på systemet ditt
- ✅ Node.js 16+ (for denne veiledningen)
- ✅ Visual Studio Code (anbefalt)

Før du fortsetter, kjør oppsettsvalidatoren fra rotmappen i repositoriet:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifiser Oppsettet Ditt
```bash
# Sjekk azd-installasjon
azd version

# Sjekk AZD-autentisering
azd auth login --check-status
```

### Verifiser valgfri Azure CLI-autentisering

```bash
az account show
```

### Sjekk Node.js-versjon
```bash
node --version
```

## Steg 1: Velg og Initialiser en Mal

La oss starte med en populær todo-applikasjonsmal som inkluderer en React frontend og Node.js API-backend.

```bash
# Bla gjennom tilgjengelige maler
azd template list

# Initialiser todo-app-malen
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Følg instruksjonene:
# - Skriv inn et miljønavn: "dev"
# - Velg et abonnement (hvis du har flere)
# - Velg en region: "East US 2" (eller din foretrukne region)
```

### Hva Skjedde Nettopp?
- Lastet ned mal-koden til din lokale mappe
- Laget en `azure.yaml`-fil med tjenestedefinisjoner
- Satt opp infrastrukturkode i `infra/`-mappen
- Opprettet en miljøkonfigurasjon

## Steg 2: Utforsk Prosjektstrukturen

La oss undersøke hva azd opprettet for oss:

```bash
# Vis prosjektstrukturen
tree /f   # Windows
# eller
find . -type f | head -20   # macOS/Linux
```

Du bør se:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Viktige Filer å Forstå

**azure.yaml** - Kjernen i ditt azd-prosjekt:
```bash
# Vis prosjektkonfigurasjonen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinisjon:
```bash
# Vis infrastrukturkoden
head -30 infra/main.bicep
```

## Steg 3: Tilpass Ditt Prosjekt (Valgfritt)

Før du distribuerer, kan du tilpasse applikasjonen:

### Endre Frontend
```bash
# Åpne React app-komponenten
code src/web/src/App.tsx
```

Gjør en enkel endring:
```typescript
// Finn tittelen og endre den
<h1>My Awesome Todo App</h1>
```

### Konfigurer Miljøvariabler
```bash
# Angi tilpassede miljøvariabler
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vis alle miljøvariabler
azd env get-values
```

## Steg 4: Distribuer til Azure

Nå kommer det spennende - distribuer alt til Azure!

```bash
# Distribuer infrastruktur og applikasjon
azd up

# Denne kommandoen vil:
# 1. Opprette Azure-ressurser (App Service, Cosmos DB, osv.)
# 2. Bygge applikasjonen din
# 3. Distribuere til de opprettede ressursene
# 4. Vise applikasjons-URLen
```

### Hva Skjer Under Distribusjonen?

Kommandoen `azd up` utfører disse stegene:
1. **Provision** (`azd provision`) - Oppretter Azure-ressurser
2. **Package** - Bygger applikasjonskoden din
3. **Deploy** (`azd deploy`) - Distribuerer kode til Azure-ressurser

### Forventet Utdata
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Steg 5: Test Applikasjonen Din

### Tilgang til Applikasjonen Din
Klikk på URL-en som vises i distribusjonsutdata, eller få den når som helst:
```bash
# Hent applikasjonsendepunkter
azd show

# Åpne applikasjonen i nettleseren din
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-appen
1. **Legg til en todo** - Klikk "Add Todo" og skriv inn en oppgave
2. **Marker som fullført** - Kryss av fullførte elementer
3. **Slett elementer** - Fjern todo-oppgaver du ikke trenger lenger

### Overvåk Applikasjonen Din
```bash
# Åpne Azure-portalen for ressursene dine
azd monitor

# Vis applikasjonslogger
azd monitor --logs

# Vis sanntidsmetrikker
azd monitor --live
```

## Steg 6: Gjør Endringer og Distribuer På Nytt

La oss gjøre en endring og se hvor enkelt det er å oppdatere:

### Endre API
```bash
# Rediger API-koden
code src/api/src/routes/lists.js
```

Legg til en egendefinert svar-header:
```javascript
// Finn en rutehåndterer og legg til:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuer Kun Kodeendringene
```bash
# Distribuer kun applikasjonskoden (hopp over infrastruktur)
azd deploy

# Dette er mye raskere enn 'azd up' siden infrastrukturen allerede eksisterer
```

## Steg 7: Administrer Flere Miljøer

Opprett et staging-miljø for å teste endringer før produksjon:

```bash
# Opprett et nytt staging-miljø
azd env new staging

# Distribuer til staging
azd up

# Bytt tilbake til utviklingsmiljø
azd env select dev

# List opp alle miljøer
azd env list
```

### Sammenligning av Miljøer
```bash
# Vis utviklingsmiljø
azd env select dev
azd show

# Vis staging-miljø
azd env select staging
azd show
```

## Steg 8: Rydd Opp Resurser

Når du er ferdig med å eksperimentere, rydd opp for å unngå løpende kostnader:

```bash
# Slett alle Azure-ressurser for gjeldende miljø
azd down

# Tving sletting uten bekreftelse og tøm ressursene som er mjukt slettet
azd down --force --purge

# Slett spesifikt miljø
azd env select staging
azd down --force --purge
```

## Klassisk App vs. AI-Drevet App: Samme Arbeidsflyt

Du har nettopp distribuert en tradisjonell webapplikasjon. Men hva hvis du ønsket å distribuere en AI-drevet app i stedet — for eksempel en chatteapplikasjon støttet av Microsoft Foundry Models?

Den gode nyheten: **arbeidsflyten er identisk.**

| Steg | Klassisk Todo-app | AI Chat-app |
|------|-------------------|-------------|
| Initialiser | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentiser | `azd auth login` | `azd auth login` |
| Distribuer | `azd up` | `azd up` |
| Overvåk | `azd monitor` | `azd monitor` |
| Rydd opp | `azd down --force --purge` | `azd down --force --purge` |

Den eneste forskjellen er **malen** du starter fra. En AI-mal inkluderer ekstra infrastruktur (som en Microsoft Foundry Models-ressurs eller en AI Search-indeks), men azd håndterer alt for deg. Du trenger ikke å lære nye kommandoer, bruke et annet verktøy, eller endre hvordan du tenker om distribusjon.

Dette er kjerneprinsippet til azd: **en arbeidsflyt, alle typer arbeidsmengder.** Ferdighetene du øvde på i denne veiledningen — initialisering, distribusjon, overvåking, ny distribusjon, og opprydding — gjelder like mye for AI-applikasjoner og agenter.

---

## Hva Du Har Lært

Gratulerer! Du har med suksess:
- ✅ Initialisert et azd-prosjekt fra en mal
- ✅ Utforsket prosjektstrukturen og viktige filer
- ✅ Distribuert en fullstakk-applikasjon til Azure
- ✅ Gjort kodeendringer og distribuert på nytt
- ✅ Administrert flere miljøer
- ✅ Ryddet opp ressurser

## 🎯 Ferdighetsvalideringsøvelser

### Øvelse 1: Distribuer en Annen Mal (15 minutter)
**Mål**: Demonstrer mestring av azd init og distribusjonsarbeidsflyt

```bash
# Prøv Python + MongoDB-stabel
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifiser distribusjon
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Rydd opp
azd down --force --purge
```

**Suksesskriterier:**
- [ ] Applikasjonen distribueres uten feil
- [ ] Kan få tilgang til applikasjons-URL i nettleser
- [ ] Applikasjonen fungerer korrekt (legge til/fjerne todos)
- [ ] Alle ressurser er ryddet opp etter bruk

### Øvelse 2: Tilpass Konfigurasjon (20 minutter)
**Mål**: Øv på konfigurering av miljøvariabler

```bash
cd my-first-azd-app

# Opprett egendefinert miljø
azd env new custom-config

# Sett egendefinerte variabler
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifiser variabler
azd env get-values | grep APP_TITLE

# Distribuer med egendefinert konfigurasjon
azd up
```

**Suksesskriterier:**
- [ ] Tilpasset miljø opprettet vellykket
- [ ] Miljøvariabler satt og hentbare
- [ ] Applikasjonen distribueres med tilpasset konfigurasjon
- [ ] Kan verifisere tilpassede innstillinger i distribuert app

### Øvelse 3: Arbeidsflyt med Flere Miljøer (25 minutter)
**Mål**: Mestre miljøadministrasjon og distribusjonsstrategier

```bash
# Opprett utviklingsmiljø
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Noter utviklings-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Opprett staging-miljø
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Noter staging-URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Sammenlign miljøer
azd env list

# Test begge miljøer
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Rydd opp i begge
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Suksesskriterier:**
- [ ] To miljøer opprettet med forskjellige konfigurasjoner
- [ ] Begge miljøene distribuert vellykket
- [ ] Kan bytte mellom miljøer med `azd env select`
- [ ] Miljøvariabler varierer mellom miljøene
- [ ] Begge miljøene ryddet opp vellykket

## 📊 Din Fremgang

**Tidsbruk**: ~60-90 minutter  
**Ervervede Ferdigheter**:
- ✅ Malbasert prosjektinitialisering
- ✅ Azure-ressursforberedelse
- ✅ Applikasjonsdistribusjonsarbeidsflyter
- ✅ Miljøadministrasjon
- ✅ Konfigurasjonsstyring
- ✅ Ressursopprydding og kostnadshåndtering

**Neste Nivå**: Du er klar for [Konfigurasjonsguide](configuration.md) for å lære avanserte konfigurasjonsmønstre!

## Feilsøking Vanlige Problemer

### Autentiseringsfeil
```bash
# Autentiser på nytt med Azure
az login

# Verifiser tilgang til abonnementet
az account show
```

### Distribusjonssvikt
```bash
# Aktiver feilsøkingslogg
export AZD_DEBUG=true
azd up --debug

# Vis applikasjonslogger i Azure
azd monitor --logs

# For Container Apps, bruk Azure CLI:
# az containerapp logs show --name <app-navn> --resource-group <rg-navn> --follow
```

### Konflikter med Ressursnavn
```bash
# Bruk et unikt miljønavn
azd env new dev-$(whoami)-$(date +%s)
```

### Porter/Nettilgang Problemer
```bash
# Sjekk om porter er tilgjengelige
netstat -an | grep :3000
netstat -an | grep :3100
```

## Neste Steg

Nå som du har fullført ditt første prosjekt, kan du utforske disse avanserte emnene:

### 1. Tilpass Infrastruktur
- [Infrastruktur som kode](../chapter-04-infrastructure/provisioning.md)
- [Legg til databaser, lagring, og andre tjenester](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sett Opp CI/CD
- [Distribusjonsguide](../chapter-04-infrastructure/deployment-guide.md) - Komplette CI/CD-arbeidsflyter
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelinekonfigurasjon

### 3. Beste Praksis for Produksjon
- [Distribusjonsguide](../chapter-04-infrastructure/deployment-guide.md) - Sikkerhet, ytelse, og overvåking

### 4. Utforsk Flere Maler
```bash
# Bla gjennom maler etter kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Prøv forskjellige teknologistakker
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ytterligere Ressurser

### Læringsmateriell
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Maler & Eksempler
- [Offisiell Malgalleri](https://azure.github.io/awesome-azd/)
- [Community Maler](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulerer med å fullføre ditt første azd-prosjekt!** Du er nå klar til å bygge og distribuere fantastiske applikasjoner på Azure med selvtillit.

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [Installasjon & Oppsett](installation.md)
- **➡️ Neste**: [Konfigurasjon](configuration.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Neste Leksjon**: [Distribusjonsguide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk skal anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->