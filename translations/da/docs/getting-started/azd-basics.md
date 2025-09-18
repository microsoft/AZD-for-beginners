<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-17T23:29:26+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "da"
}
-->
# AZD Grundlæggende - Forstå Azure Developer CLI

# AZD Grundlæggende - Kernekoncepter og Fundament

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Fundament & Hurtig Start
- **⬅️ Forrige**: [Kursusoversigt](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Næste**: [Installation & Opsætning](installation.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-First Udvikling](../ai-foundry/azure-ai-foundry-integration.md)

## Introduktion

Denne lektion introducerer dig til Azure Developer CLI (azd), et kraftfuldt kommandolinjeværktøj, der accelererer din rejse fra lokal udvikling til Azure-implementering. Du vil lære de grundlæggende koncepter, kernefunktioner og forstå, hvordan azd forenkler implementeringen af cloud-native applikationer.

## Læringsmål

Ved afslutningen af denne lektion vil du:
- Forstå, hvad Azure Developer CLI er, og dets primære formål
- Lære kernekoncepterne om skabeloner, miljøer og tjenester
- Udforske nøglefunktioner som skabelonbaseret udvikling og Infrastructure as Code
- Forstå azd-projektstrukturen og arbejdsgangen
- Være klar til at installere og konfigurere azd til din udviklingsmiljø

## Læringsresultater

Efter at have gennemført denne lektion vil du kunne:
- Forklare azd's rolle i moderne cloud-udviklingsarbejdsgange
- Identificere komponenterne i en azd-projektstruktur
- Beskrive, hvordan skabeloner, miljøer og tjenester arbejder sammen
- Forstå fordelene ved Infrastructure as Code med azd
- Genkende forskellige azd-kommandoer og deres formål

## Hvad er Azure Developer CLI (azd)?

Azure Developer CLI (azd) er et kommandolinjeværktøj designet til at accelerere din rejse fra lokal udvikling til Azure-implementering. Det forenkler processen med at bygge, implementere og administrere cloud-native applikationer på Azure.

## Kernekoncepter

### Skabeloner
Skabeloner er fundamentet for azd. De indeholder:
- **Applikationskode** - Din kildekode og afhængigheder
- **Infrastrukturdefinitioner** - Azure-ressourcer defineret i Bicep eller Terraform
- **Konfigurationsfiler** - Indstillinger og miljøvariabler
- **Implementeringsscripts** - Automatiserede implementeringsarbejdsgange

### Miljøer
Miljøer repræsenterer forskellige implementeringsmål:
- **Udvikling** - Til test og udvikling
- **Staging** - Pre-produktionsmiljø
- **Produktion** - Live produktionsmiljø

Hvert miljø opretholder sin egen:
- Azure resource group
- Konfigurationsindstillinger
- Implementeringstilstand

### Tjenester
Tjenester er byggestenene i din applikation:
- **Frontend** - Webapplikationer, SPAs
- **Backend** - API'er, mikrotjenester
- **Database** - Databaseløsninger
- **Lagring** - Fil- og bloblagring

## Nøglefunktioner

### 1. Skabelonbaseret Udvikling
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Azure's domænespecifikke sprog
- **Terraform** - Multi-cloud infrastrukturværktøj
- **ARM Templates** - Azure Resource Manager skabeloner

### 3. Integrerede Arbejdsgange
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Miljøhåndtering
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Projektstruktur

En typisk azd-projektstruktur:
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

## 🔧 Konfigurationsfiler

### azure.yaml
Den primære projektkonfigurationsfil:
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
Miljøspecifik konfiguration:
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

## 🎪 Almindelige Arbejdsgange

### Starte et Nyt Projekt
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Udviklingscyklus
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
Kommandoen `azd down --force --purge` er en kraftfuld måde at fuldstændigt nedlægge dit azd-miljø og alle tilknyttede ressourcer. Her er en oversigt over, hvad hver flag gør:
```
--force
```
- Springer bekræftelsesprompter over.
- Nyttig til automatisering eller scripting, hvor manuel input ikke er muligt.
- Sikrer, at nedlæggelsen fortsætter uden afbrydelse, selv hvis CLI registrerer uoverensstemmelser.

```
--purge
```
Sletter **alle tilknyttede metadata**, inklusive:
Miljøtilstand
Lokal `.azure` mappe
Cachelagret implementeringsinfo
Forhindrer azd i at "huske" tidligere implementeringer, hvilket kan forårsage problemer som uoverensstemmende resource groups eller forældede registreringsreferencer.

### Hvorfor bruge begge?
Når du er stødt på problemer med `azd up` på grund af resterende tilstand eller delvise implementeringer, sikrer denne kombination en **ren start**.

Det er især nyttigt efter manuelle ressource-sletninger i Azure-portalen eller ved skift af skabeloner, miljøer eller navnekonventioner for resource groups.

### Håndtering af Flere Miljøer
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

## 🧭 Navigationskommandoer

### Opdagelse
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Projektstyring
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Overvågning
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Bedste Fremgangsmåder

### 1. Brug Meningsfulde Navne
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Udnyt Skabeloner
- Start med eksisterende skabeloner
- Tilpas til dine behov
- Opret genanvendelige skabeloner til din organisation

### 3. Miljøisolering
- Brug separate miljøer til udvikling/staging/produktion
- Implementer aldrig direkte til produktion fra lokal maskine
- Brug CI/CD-pipelines til produktionsimplementeringer

### 4. Konfigurationsstyring
- Brug miljøvariabler til følsomme data
- Hold konfiguration i versionskontrol
- Dokumentér miljøspecifikke indstillinger

## Læringsprogression

### Begynder (Uge 1-2)
1. Installer azd og autentificer
2. Implementer en simpel skabelon
3. Forstå projektstruktur
4. Lær grundlæggende kommandoer (up, down, deploy)

### Mellemstadie (Uge 3-4)
1. Tilpas skabeloner
2. Håndter flere miljøer
3. Forstå infrastrukturkode
4. Opsæt CI/CD-pipelines

### Avanceret (Uge 5+)
1. Opret brugerdefinerede skabeloner
2. Avancerede infrastrukturmønstre
3. Multi-region implementeringer
4. Konfigurationer i virksomhedsklasse

## Næste Skridt

**📖 Fortsæt Kapitel 1 Læring:**
- [Installation & Opsætning](installation.md) - Få azd installeret og konfigureret
- [Dit Første Projekt](first-project.md) - Fuldfør praktisk tutorial
- [Konfigurationsguide](configuration.md) - Avancerede konfigurationsmuligheder

**🎯 Klar til Næste Kapitel?**
- [Kapitel 2: AI-First Udvikling](../ai-foundry/azure-ai-foundry-integration.md) - Begynd at bygge AI-applikationer

## Yderligere Ressourcer

- [Azure Developer CLI Oversigt](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Skabelongalleri](https://azure.github.io/awesome-azd/)
- [Community Eksempler](https://github.com/Azure-Samples)

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Fundament & Hurtig Start  
- **⬅️ Forrige**: [Kursusoversigt](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Næste**: [Installation & Opsætning](installation.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-First Udvikling](../ai-foundry/azure-ai-foundry-integration.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.