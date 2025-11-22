<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-21T15:15:50+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "no"
}
-->
# Ditt Første Prosjekt - Praktisk Veiledning

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Hurtigstart
- **⬅️ Forrige**: [Installasjon & Oppsett](installation.md)
- **➡️ Neste**: [Konfigurasjon](configuration.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-First Utvikling](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduksjon

Velkommen til ditt første Azure Developer CLI-prosjekt! Denne omfattende praktiske veiledningen gir deg en komplett gjennomgang av hvordan du oppretter, distribuerer og administrerer en full-stack-applikasjon på Azure ved hjelp av azd. Du vil jobbe med en ekte todo-applikasjon som inkluderer en React frontend, Node.js API backend og MongoDB-database.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre arbeidsflyten for azd-prosjektinitialisering ved bruk av maler
- Forstå strukturen og konfigurasjonsfilene i Azure Developer CLI-prosjekter
- Utføre fullstendig applikasjonsdistribusjon til Azure med infrastrukturprovisjonering
- Implementere applikasjonsoppdateringer og strategier for ny distribusjon
- Administrere flere miljøer for utvikling og staging
- Anvende ressursopprydding og kostnadsstyringspraksis

## Læringsutbytte

Etter fullføring vil du kunne:
- Initialisere og konfigurere azd-prosjekter fra maler uavhengig
- Navigere og endre azd-prosjektstrukturer effektivt
- Distribuere full-stack-applikasjoner til Azure med enkle kommandoer
- Feilsøke vanlige distribusjonsproblemer og autentiseringsutfordringer
- Administrere flere Azure-miljøer for ulike distribusjonsstadier
- Implementere kontinuerlige distribusjonsarbeidsflyter for applikasjonsoppdateringer

## Kom i Gang

### Sjekkliste for Forutsetninger
- ✅ Azure Developer CLI installert ([Installasjonsveiledning](installation.md))
- ✅ Azure CLI installert og autentisert
- ✅ Git installert på systemet ditt
- ✅ Node.js 16+ (for denne veiledningen)
- ✅ Visual Studio Code (anbefalt)

### Verifiser Oppsettet
```bash
# Sjekk azd installasjon
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

## Steg 1: Velg og Initialiser en Mal

La oss starte med en populær todo-applikasjonsmal som inkluderer en React frontend og Node.js API backend.

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

### Hva Skjedde Akkurat?
- Lastet ned malens kode til din lokale katalog
- Opprettet en `azure.yaml`-fil med tjenestedefinisjoner
- Satt opp infrastrukturkode i `infra/`-katalogen
- Opprettet en miljøkonfigurasjon

## Steg 2: Utforsk Prosjektstrukturen

La oss undersøke hva azd har opprettet for oss:

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
# Se infrastrukturen kode
head -30 infra/main.bicep
```

## Steg 3: Tilpass Prosjektet (Valgfritt)

Før distribusjon kan du tilpasse applikasjonen:

### Endre Frontend
```bash
# Åpne React-appkomponenten
code src/web/src/App.tsx
```

Gjør en enkel endring:
```typescript
// Finn tittelen og endre den
<h1>My Awesome Todo App</h1>
```

### Konfigurer Miljøvariabler
```bash
# Sett egendefinerte miljøvariabler
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vis alle miljøvariabler
azd env get-values
```

## Steg 4: Distribuer til Azure

Nå til den spennende delen - distribuer alt til Azure!

```bash
# Distribuer infrastruktur og applikasjon
azd up

# Denne kommandoen vil:
# 1. Klargjøre Azure-ressurser (App Service, Cosmos DB, etc.)
# 2. Bygge applikasjonen din
# 3. Distribuere til de klargjorte ressursene
# 4. Vise applikasjons-URL-en
```

### Hva Skjer Under Distribusjonen?

Kommandoen `azd up` utfører disse stegene:
1. **Provisjon** (`azd provision`) - Oppretter Azure-ressurser
2. **Pakke** - Bygger applikasjonskoden din
3. **Distribuer** (`azd deploy`) - Distribuerer kode til Azure-ressurser

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

### Få Tilgang til Applikasjonen
Klikk på URL-en som er oppgitt i distribusjonsutdataene, eller hent den når som helst:
```bash
# Hent applikasjonsendepunkter
azd show

# Åpne applikasjonen i nettleseren din
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-Appen
1. **Legg til en todo** - Klikk "Add Todo" og skriv inn en oppgave
2. **Marker som fullført** - Kryss av fullførte oppgaver
3. **Slett oppgaver** - Fjern todos du ikke lenger trenger

### Overvåk Applikasjonen Din
```bash
# Åpne Azure-portalen for ressursene dine
azd monitor

# Vis applikasjonslogger
azd logs
```

## Steg 6: Gjør Endringer og Distribuer på Nytt

La oss gjøre en endring og se hvor enkelt det er å oppdatere:

### Endre API-en
```bash
# Rediger API-koden
code src/api/src/routes/lists.js
```

Legg til en tilpasset responsheader:
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

### Miljøsammenligning
```bash
# Vis utviklingsmiljø
azd env select dev
azd show

# Vis staging-miljø
azd env select staging
azd show
```

## Steg 8: Rydd Opp Ressurser

Når du er ferdig med å eksperimentere, rydd opp for å unngå løpende kostnader:

```bash
# Slett alle Azure-ressurser for nåværende miljø
azd down

# Tving sletting uten bekreftelse og fjern mykt slettede ressurser
azd down --force --purge

# Slett spesifikt miljø
azd env select staging
azd down --force --purge
```

## Hva Du Har Lært

Gratulerer! Du har med suksess:
- ✅ Initialisert et azd-prosjekt fra en mal
- ✅ Utforsket prosjektstrukturen og viktige filer
- ✅ Distribuert en full-stack-applikasjon til Azure
- ✅ Gjort kodeendringer og distribuert på nytt
- ✅ Administrert flere miljøer
- ✅ Ryddet opp ressurser

## 🎯 Ferdighetsvalideringsøvelser

### Øvelse 1: Distribuer en Annen Mal (15 minutter)
**Mål**: Demonstrere mestring av azd init og distribusjonsarbeidsflyt

```bash
# Prøv Python + MongoDB-stakken
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifiser distribusjonen
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Rydd opp
azd down --force --purge
```

**Suksesskriterier:**
- [ ] Applikasjonen distribueres uten feil
- [ ] Kan få tilgang til applikasjons-URL i nettleseren
- [ ] Applikasjonen fungerer korrekt (legg til/fjern todos)
- [ ] Ryddet opp alle ressurser med suksess

### Øvelse 2: Tilpass Konfigurasjon (20 minutter)
**Mål**: Øv på konfigurasjon av miljøvariabler

```bash
cd my-first-azd-app

# Opprett tilpasset miljø
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
- [ ] Tilpasset miljø opprettet med suksess
- [ ] Miljøvariabler satt og tilgjengelige
- [ ] Applikasjonen distribueres med tilpasset konfigurasjon
- [ ] Kan verifisere tilpassede innstillinger i distribuert app

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
- [ ] To miljøer opprettet med forskjellige konfigurasjoner
- [ ] Begge miljøer distribuert med suksess
- [ ] Kan bytte mellom miljøer ved bruk av `azd env select`
- [ ] Miljøvariabler varierer mellom miljøene
- [ ] Ryddet opp begge miljøer med suksess

## 📊 Din Fremgang

**Tidsbruk**: ~60-90 minutter  
**Ferdigheter Tilegnet**:
- ✅ Malbasert prosjektinitialisering
- ✅ Provisjonering av Azure-ressurser
- ✅ Applikasjonsdistribusjonsarbeidsflyter
- ✅ Miljøadministrasjon
- ✅ Konfigurasjonsadministrasjon
- ✅ Ressursopprydding og kostnadsstyring

**Neste Nivå**: Du er klar for [Konfigurasjonsveiledning](configuration.md) for å lære avanserte konfigurasjonsmønstre!

## Feilsøking av Vanlige Problemer

### Autentiseringsfeil
```bash
# Re-autentiser med Azure
az login

# Verifiser abonnementstilgang
az account show
```

### Distribusjonsfeil
```bash
# Aktiver feillogging
export AZD_DEBUG=true
azd up --debug

# Vis detaljerte logger
azd logs --service api
azd logs --service web
```

### Konflikter med Ressursnavn
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
- [Infrastruktur som kode](../deployment/provisioning.md)
- [Legg til databaser, lagring og andre tjenester](../deployment/provisioning.md#adding-services)

### 2. Sett Opp CI/CD
- [GitHub Actions Integrasjon](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Beste Praksis for Produksjon
- [Sikkerhetskonfigurasjoner](../deployment/best-practices.md#security)
- [Ytelsesoptimalisering](../deployment/best-practices.md#performance)
- [Overvåking og logging](../deployment/best-practices.md#monitoring)

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

## Tilleggsressurser

### Læringsmateriale
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitektursenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Fellesskap & Støtte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Maler & Eksempler
- [Offisiell Malgalleri](https://azure.github.io/awesome-azd/)
- [Fellesskapsmaler](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Mønstre](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gratulerer med å fullføre ditt første azd-prosjekt!** Du er nå klar til å bygge og distribuere fantastiske applikasjoner på Azure med selvtillit.

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Hurtigstart
- **⬅️ Forrige**: [Installasjon & Oppsett](installation.md)
- **➡️ Neste**: [Konfigurasjon](configuration.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-First Utvikling](../microsoft-foundry/microsoft-foundry-integration.md)
- **Neste Leksjon**: [Distribusjonsveiledning](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->