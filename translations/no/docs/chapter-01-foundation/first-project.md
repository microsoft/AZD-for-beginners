# Ditt Første Prosjekt - Praktisk Veiledning

**Kapitelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [Installasjon & Oppsett](installation.md)
- **➡️ Neste**: [Konfigurasjon](configuration.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduksjon

Velkommen til ditt første Azure Developer CLI-prosjekt! Denne omfattende praktiske veiledningen gir en komplett gjennomgang av å lage, distribuere og administrere en fullstack-applikasjon på Azure ved bruk av azd. Du vil jobbe med en ekte todo-applikasjon som inkluderer en React frontend, Node.js API backend, og MongoDB database.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre azd prosjektinitialiseringsarbeidsflyten ved bruk av maler
- Forstå Azure Developer CLI prosjektstruktur og konfigurasjonsfiler
- Utføre fullstendig applikasjonsdistribusjon til Azure med infrastrukturprovisjonering
- Implementere oppdaterings- og redistribusjonsstrategier for applikasjonen
- Administrere flere miljøer for utvikling og staging
- Bruke praksiser for ressursopprydding og kostnadsstyring

## Læringsutbytte

Etter fullført vil du kunne:
- Initialisere og konfigurere azd-prosjekter fra maler på egenhånd
- Navigere og endre azd-prosjektstrukturer effektivt
- Distribuere fullstack-applikasjoner til Azure med enkle kommandoer
- Feilsøke vanlige distribusjonsproblemer og autentiseringsfeil
- Administrere flere Azure-miljøer for ulike distribusjonsstadier
- Implementere kontinuerlige distribusjonsarbeidsflyter for applikasjonsoppdateringer

## Komme I Gang

### Forutsetningssjekkliste
- ✅ Azure Developer CLI installert ([Installasjonsveiledning](installation.md))
- ✅ Azure CLI installert og autentisert
- ✅ Git installert på systemet ditt
- ✅ Node.js 16+ (for denne veiledningen)
- ✅ Visual Studio Code (anbefalt)

### Verifiser Oppsettet Ditt
```bash
# Sjekk azd-installasjon
azd version
```
### Verifiser Azure-autentisering

```bash
az account show
```

### Sjekk Node.js-versjon
```bash
node --version
```

## Trinn 1: Velg og Initialiser en Mal

La oss starte med en populær todo-applikasjonsmal som inkluderer en React frontend og Node.js API backend.

```bash
# Bla gjennom tilgjengelige maler
azd template list

# Initialiser todo-appmalen
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Følg instruksjonene:
# - Skriv inn et miljønavn: "dev"
# - Velg et abonnement (hvis du har flere)
# - Velg en region: "East US 2" (eller din foretrukne region)
```

### Hva Skjedde Nettopp?
- Lastet ned mal-kode til din lokale mappe
- Opprettet en `azure.yaml` fil med tjenestedefinisjoner
- Satt opp infrastrukturkode i `infra/` mappen
- Opprettet en miljøkonfigurasjon

## Trinn 2: Utforsk Prosjektstrukturen

La oss se på hva azd opprettet for oss:

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

### Viktige Filer Å Forstå

**azure.yaml** - Hjertet i ditt azd-prosjekt:
```bash
# Vis prosjektkonfigurasjonen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinisjon:
```bash
# Se infrastrukturen kode
head -30 infra/main.bicep
```

## Trinn 3: Tilpass Prosjektet Ditt (Valgfritt)

Før distribusjon kan du tilpasse applikasjonen:

### Endre Frontenden
```bash
# Åpne React app komponenten
code src/web/src/App.tsx
```

Gjør en enkel endring:
```typescript
// Finn tittelen og endre den
<h1>My Awesome Todo App</h1>
```

### Konfigurer Miljøvariabler
```bash
# Angi egendefinerte miljøvariabler
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vis alle miljøvariabler
azd env get-values
```

## Trinn 4: Distribuer til Azure

Nå kommer det mest spennende - distribuer alt til Azure!

```bash
# Distribuer infrastruktur og applikasjon
azd up

# Denne kommandoen vil:
# 1. Tilby Azure-ressurser (App Service, Cosmos DB, osv.)
# 2. Bygge applikasjonen din
# 3. Distribuere til de tildelte ressursene
# 4. Vise applikasjonens URL
```

### Hva Skjer Under Distribusjonen?

`azd up` kommandoen utfører disse trinnene:
1. **Provision** (`azd provision`) - Oppretter Azure-ressurser
2. **Package** - Kompilerer applikasjonskoden din
3. **Deploy** (`azd deploy`) - Distribuerer koden til Azure-ressurser

### Forventet Utdata
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Trinn 5: Test Applikasjonen Din

### Få Tilgang Til Applikasjonen
Klikk på URL-en som vises i distribusjonsutdata, eller hent den når som helst:
```bash
# Hent applikasjonsendepunkter
azd show

# Åpne applikasjonen i nettleseren din
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-appen
1. **Legg til en todo-oppgave** - Klikk på "Add Todo" og skriv inn en oppgave
2. **Marker som fullført** - Kryss av fullførte oppgaver
3. **Slett oppgaver** - Fjern todos du ikke lenger trenger

### Overvåk Applikasjonen
```bash
# Åpne Azure-portalen for ressursene dine
azd monitor

# Vis applikasjonslogger
azd monitor --logs

# Vis sanntidsmålinger
azd monitor --live
```

## Trinn 6: Gjør Endringer og Redistribuer

La oss gjøre en endring og se hvor lett det er å oppdatere:

### Endre API-et
```bash
# Rediger API-koden
code src/api/src/routes/lists.js
```

Legg til en egendefinert respons-header:
```javascript
// Finn en rutehåndterer og legg til:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuer Bare Kodeendringene
```bash
# Distribuer bare applikasjonskoden (hopp over infrastruktur)
azd deploy

# Dette er mye raskere enn 'azd up' siden infrastrukturen allerede eksisterer
```

## Trinn 7: Administrer Flere Miljøer

Lag et staging-miljø for å teste endringer før produksjon:

```bash
# Opprett et nytt staging-miljø
azd env new staging

# Distribuer til staging
azd up

# Bytt tilbake til utviklingsmiljø
azd env select dev

# List alle miljøer
azd env list
```

### Miljøsammenligning
```bash
# Vis utviklingsmiljø
azd env select dev
azd show

# Vis staging-miljø
azd env select staging
azd show
```

## Trinn 8: Rydd Opp i Ressurser

Når du er ferdig med å eksperimentere, rydd opp for å unngå løpende kostnader:

```bash
# Slett alle Azure-ressurser for gjeldende miljø
azd down

# Tving sletting uten bekreftelse og tøm mykt slettede ressurser
azd down --force --purge

# Slett spesifikt miljø
azd env select staging
azd down --force --purge
```

## Klassisk App vs. AI-Drevet App: Samme Arbeidsflyt

Du har nettopp distribuert en tradisjonell webapplikasjon. Men hva om du ønsket å distribuere en AI-drevet app i stedet – for eksempel en chatteapplikasjon støttet av Microsoft Foundry Models?

Den gode nyheten: **arbeidsflyten er identisk.**

| Trinn | Klassisk Todo App | AI Chat App |
|------|-------------------|-------------|
| Initialiser | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentiser | `azd auth login` | `azd auth login` |
| Distribuer | `azd up` | `azd up` |
| Overvåk | `azd monitor` | `azd monitor` |
| Rydd opp | `azd down --force --purge` | `azd down --force --purge` |

Den eneste forskjellen er **malen** du starter fra. En AI-mal inkluderer ekstra infrastruktur (som en Microsoft Foundry Models-ressurs eller en AI Search-indeks), men azd håndterer alt dette for deg. Du trenger ikke lære nye kommandoer, ta i bruk et annet verktøy, eller endre hvordan du tenker på distribusjon.

Dette er kjerneprinsippet til azd: **en arbeidsflyt, alle typer arbeidsbelastninger.** Ferdighetene du øvde på i denne veiledningen – initialisering, distribusjon, overvåking, redistribusjon og opprydding – gjelder like mye for AI-applikasjoner og agenter.

---

## Hva Du Har Lært

Gratulerer! Du har med suksess:
- ✅ Initialisert et azd-prosjekt fra en mal
- ✅ Utforsket prosjektstrukturen og viktige filer
- ✅ Distribuert en fullstack-applikasjon til Azure
- ✅ Gjort kodeendringer og redistribuert
- ✅ Administrert flere miljøer
- ✅ Ryddet opp i ressurser

## 🎯 Ferdighetsvalideringsøvelser

### Øvelse 1: Distribuer en Annen Mal (15 minutter)
**Mål**: Demonstrere mestring av azd init og distribusjonsarbeidsflyt

```bash
# Prøv Python + MongoDB-stabel
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Bekreft distribusjon
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Rydd opp
azd down --force --purge
```

**Suksesskriterier:**
- [ ] Applikasjonen distribueres uten feil
- [ ] Kan få tilgang til applikasjons-URL i nettleser
- [ ] Applikasjonen fungerer korrekt (legg til/fjern todos)
- [ ] Ryddet opp i alle ressurser med suksess

### Øvelse 2: Tilpass Konfigurasjon (20 minutter)
**Mål**: Øve på konfigurasjon av miljøvariabler

```bash
cd my-first-azd-app

# Lag tilpasset miljø
azd env new custom-config

# Sett tilpassede variabler
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifiser variabler
azd env get-values | grep APP_TITLE

# Distribuer med tilpasset konfigurasjon
azd up
```

**Suksesskriterier:**
- [ ] Egendefinert miljø opprettet med suksess
- [ ] Miljøvariabler satt og kan hentes
- [ ] Applikasjonen distribueres med egendefinert konfigurasjon
- [ ] Kan verifisere egendefinerte innstillinger i distribuert app

### Øvelse 3: Arbeidsflyt for Flere Miljøer (25 minutter)
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

# Test begge miljøene
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Rydd opp i begge
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Suksesskriterier:**
- [ ] To miljøer opprettet med ulike konfigurasjoner
- [ ] Begge miljøer distribuert med suksess
- [ ] Kan bytte mellom miljøer ved bruk av `azd env select`
- [ ] Miljøvariabler varierer mellom miljøene
- [ ] Ryddet opp i begge miljøene med suksess

## 📊 Din Fremdrift

**Tidsbruk**: ~60-90 minutter  
**Ervervede ferdigheter**:
- ✅ Malbasert prosjektinitialisering
- ✅ Azure ressursprovisjonering
- ✅ Applikasjonsdistribusjonsarbeidsflyter
- ✅ Miljøadministrasjon
- ✅ Konfigurasjonsadministrasjon
- ✅ Ressursopprydding og kostnadsstyring

**Neste nivå**: Du er klar for [Konfigurasjonsveiledning](configuration.md) for å lære avanserte konfigurasjonsmønstre!

## Feilsøking av Vanlige Problemer

### Autentiseringsfeil
```bash
# Autentiser på nytt med Azure
az login

# Verifiser tilgang til abonnementet
az account show
```

### Distribusjonsfeil
```bash
# Aktiver feilsøkingslogging
export AZD_DEBUG=true
azd up --debug

# Se applikasjonslogger i Azure
azd monitor --logs

# For Container Apps, bruk Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Ressursnavnkonflikter
```bash
# Bruk et unikt miljønavn
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Nettverksproblemer
```bash
# Sjekk om porter er tilgjengelige
netstat -an | grep :3000
netstat -an | grep :3100
```

## Neste Steg

Nå som du har fullført ditt første prosjekt, utforsk disse avanserte temaene:

### 1. Tilpass Infrastruktur
- [Infrastruktur som kode](../chapter-04-infrastructure/provisioning.md)
- [Legg til databaser, lagring og andre tjenester](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sett Opp CI/CD
- [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md) - Komplette CI/CD-arbeidsflyter
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline-konfigurasjon

### 3. Best Practices for Produksjon
- [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md) - Sikkerhet, ytelse og overvåking

### 4. Utforsk Flere Maler
```bash
# Bla gjennom maler etter kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Prøv forskjellige teknologistabler
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Tilleggsressurser

### Læringsmaterialer
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Fellesskap & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Maler & Eksempler
- [Offisiell Malgalleri](https://azure.github.io/awesome-azd/)
- [Fellesskapsmaler](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulerer med å ha fullført ditt første azd-prosjekt!** Du er nå klar til å bygge og distribuere fantastiske applikasjoner på Azure med selvtillit.

---

**Kapitelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Rask Start
- **⬅️ Forrige**: [Installasjon & Oppsett](installation.md)
- **➡️ Neste**: [Konfigurasjon](configuration.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Neste Leksjon**: [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Originaldokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->