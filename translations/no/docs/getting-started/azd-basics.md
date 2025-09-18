<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-18T06:16:43+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "no"
}
-->
# AZD Grunnleggende - Forstå Azure Developer CLI

# AZD Grunnleggende - Kjernebegreper og Fundament

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Hurtigstart
- **⬅️ Forrige**: [Kursoversikt](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Neste**: [Installasjon & Oppsett](installation.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-First Utvikling](../ai-foundry/azure-ai-foundry-integration.md)

## Introduksjon

Denne leksjonen introduserer deg til Azure Developer CLI (azd), et kraftig kommandolinjeverktøy som akselererer reisen fra lokal utvikling til Azure-deployering. Du vil lære de grunnleggende konseptene, kjernefunksjonene, og forstå hvordan azd forenkler deployering av skybaserte applikasjoner.

## Læringsmål

Ved slutten av denne leksjonen vil du:
- Forstå hva Azure Developer CLI er og dets hovedformål
- Lære kjernebegrepene som maler, miljøer og tjenester
- Utforske nøkkelfunksjoner som malbasert utvikling og Infrastructure as Code
- Forstå azd-prosjektstrukturen og arbeidsflyten
- Være klar til å installere og konfigurere azd for ditt utviklingsmiljø

## Læringsutbytte

Etter å ha fullført denne leksjonen vil du kunne:
- Forklare rollen til azd i moderne skyutviklingsarbeidsflyter
- Identifisere komponentene i en azd-prosjektstruktur
- Beskrive hvordan maler, miljøer og tjenester fungerer sammen
- Forstå fordelene med Infrastructure as Code med azd
- Gjenkjenne ulike azd-kommandoer og deres formål

## Hva er Azure Developer CLI (azd)?

Azure Developer CLI (azd) er et kommandolinjeverktøy designet for å akselerere reisen fra lokal utvikling til Azure-deployering. Det forenkler prosessen med å bygge, deployere og administrere skybaserte applikasjoner på Azure.

## Kjernebegreper

### Maler
Maler er grunnlaget for azd. De inneholder:
- **Applikasjonskode** - Kildekode og avhengigheter
- **Infrastrukturdefinisjoner** - Azure-ressurser definert i Bicep eller Terraform
- **Konfigurasjonsfiler** - Innstillinger og miljøvariabler
- **Deployeringsskript** - Automatiserte deployeringsarbeidsflyter

### Miljøer
Miljøer representerer ulike deployeringsmål:
- **Utvikling** - For testing og utvikling
- **Staging** - Pre-produksjonsmiljø
- **Produksjon** - Live produksjonsmiljø

Hvert miljø har sitt eget:
- Azure ressursgruppe
- Konfigurasjonsinnstillinger
- Deployeringstilstand

### Tjenester
Tjenester er byggesteinene i applikasjonen din:
- **Frontend** - Webapplikasjoner, SPAs
- **Backend** - API-er, mikrotjenester
- **Database** - Databaseløsninger
- **Lagring** - Fil- og bloblagring

## Nøkkelfunksjoner

### 1. Malbasert Utvikling
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azure sitt domene-spesifikke språk
- **Terraform** - Multi-sky infrastrukturverktøy
- **ARM-maler** - Azure Resource Manager-maler

### 3. Integrerte Arbeidsflyter
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Miljøadministrasjon
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Prosjektstruktur

En typisk azd-prosjektstruktur:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Konfigurasjonsfiler

### azure.yaml
Hovedkonfigurasjonsfilen for prosjektet:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Miljøspesifikk konfigurasjon:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Vanlige Arbeidsflyter

### Starte et Nytt Prosjekt
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Utviklingssyklus
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Forstå `azd down --force --purge`
Kommandoen `azd down --force --purge` er en kraftig måte å fullstendig rive ned azd-miljøet og alle tilknyttede ressurser. Her er en oversikt over hva hver flagg gjør:
```
--force
```
- Hopper over bekreftelsesprompter.
- Nyttig for automatisering eller skripting der manuell input ikke er mulig.
- Sikrer at nedrivningen fortsetter uten avbrudd, selv om CLI oppdager inkonsistenser.

```
--purge
```
Sletter **all tilknyttet metadata**, inkludert:
Miljøtilstand  
Lokal `.azure`-mappe  
Bufret deployeringsinformasjon  
Forhindrer azd fra å "huske" tidligere deployeringer, som kan forårsake problemer som feil ressursgrupper eller utdaterte registerreferanser.

### Hvorfor bruke begge?
Når du har støtt på problemer med `azd up` på grunn av gjenværende tilstand eller delvise deployeringer, sikrer denne kombinasjonen en **ren start**.

Det er spesielt nyttig etter manuelle ressurs-slettinger i Azure-portalen eller når du bytter maler, miljøer eller ressursgruppenavn.

### Administrere Flere Miljøer
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Navigasjonskommandoer

### Oppdagelse
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Prosjektadministrasjon
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Overvåking
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Beste Praksis

### 1. Bruk Meningsfulle Navn
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Utnytt Maler
- Start med eksisterende maler
- Tilpass etter behov
- Lag gjenbrukbare maler for organisasjonen din

### 3. Miljøisolasjon
- Bruk separate miljøer for utvikling/staging/produksjon
- Aldri deploy direkte til produksjon fra lokal maskin
- Bruk CI/CD-pipelines for produksjonsdeployeringer

### 4. Konfigurasjonsadministrasjon
- Bruk miljøvariabler for sensitiv data
- Hold konfigurasjonen i versjonskontroll
- Dokumenter miljøspesifikke innstillinger

## Læringsprogresjon

### Nybegynner (Uke 1-2)
1. Installer azd og autentiser
2. Deploy en enkel mal
3. Forstå prosjektstrukturen
4. Lær grunnleggende kommandoer (up, down, deploy)

### Middels Erfaren (Uke 3-4)
1. Tilpass maler
2. Administrer flere miljøer
3. Forstå infrastrukturkode
4. Sett opp CI/CD-pipelines

### Avansert (Uke 5+)
1. Lag egne maler
2. Avanserte infrastrukturmønstre
3. Deployeringer på tvers av regioner
4. Konfigurasjoner for bedrifter

## Neste Steg

**📖 Fortsett Kapittel 1 Læring:**
- [Installasjon & Oppsett](installation.md) - Installer og konfigurer azd
- [Ditt Første Prosjekt](first-project.md) - Fullfør praktisk opplæring
- [Konfigurasjonsguide](configuration.md) - Avanserte konfigurasjonsalternativer

**🎯 Klar for Neste Kapittel?**
- [Kapittel 2: AI-First Utvikling](../ai-foundry/azure-ai-foundry-integration.md) - Begynn å bygge AI-applikasjoner

## Ekstra Ressurser

- [Azure Developer CLI Oversikt](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Malbibliotek](https://azure.github.io/awesome-azd/)
- [Community Eksempler](https://github.com/Azure-Samples)

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 1 - Grunnlag & Hurtigstart  
- **⬅️ Forrige**: [Kursoversikt](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Neste**: [Installasjon & Oppsett](installation.md)
- **🚀 Neste Kapittel**: [Kapittel 2: AI-First Utvikling](../ai-foundry/azure-ai-foundry-integration.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.