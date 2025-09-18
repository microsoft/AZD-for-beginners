<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-17T23:14:55+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "sv"
}
-->
# AZD Grunder - Förstå Azure Developer CLI

# AZD Grunder - Kärnkoncept och Grundläggande Principer

**Kapitelnavigation:**
- **📚 Kursens Startsida**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 1 - Grundläggande & Snabbstart
- **⬅️ Föregående**: [Kursöversikt](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Nästa**: [Installation & Konfiguration](installation.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-Driven Utveckling](../ai-foundry/azure-ai-foundry-integration.md)

## Introduktion

Den här lektionen introducerar dig till Azure Developer CLI (azd), ett kraftfullt kommandoradsverktyg som påskyndar din resa från lokal utveckling till Azure-distribution. Du kommer att lära dig de grundläggande koncepten, kärnfunktionerna och förstå hur azd förenklar distributionen av molnbaserade applikationer.

## Lärandemål

I slutet av denna lektion kommer du att:
- Förstå vad Azure Developer CLI är och dess huvudsakliga syfte
- Lära dig kärnkoncepten kring mallar, miljöer och tjänster
- Utforska nyckelfunktioner som mallbaserad utveckling och Infrastruktur som Kod
- Förstå azd-projektets struktur och arbetsflöde
- Vara redo att installera och konfigurera azd för din utvecklingsmiljö

## Läranderesultat

Efter att ha avslutat denna lektion kommer du att kunna:
- Förklara azd:s roll i moderna arbetsflöden för molnutveckling
- Identifiera komponenterna i en azd-projektstruktur
- Beskriva hur mallar, miljöer och tjänster samverkar
- Förstå fördelarna med Infrastruktur som Kod med azd
- Känna igen olika azd-kommandon och deras syften

## Vad är Azure Developer CLI (azd)?

Azure Developer CLI (azd) är ett kommandoradsverktyg som är utformat för att påskynda din resa från lokal utveckling till Azure-distribution. Det förenklar processen att bygga, distribuera och hantera molnbaserade applikationer på Azure.

## Kärnkoncept

### Mallar
Mallar är grunden för azd. De innehåller:
- **Applikationskod** - Din källkod och beroenden
- **Infrastrukturdefinitioner** - Azure-resurser definierade i Bicep eller Terraform
- **Konfigurationsfiler** - Inställningar och miljövariabler
- **Distributionsskript** - Automatiserade distributionsarbetsflöden

### Miljöer
Miljöer representerar olika distributionsmål:
- **Utveckling** - För testning och utveckling
- **Staging** - Förproduktionsmiljö
- **Produktion** - Live-produktionsmiljö

Varje miljö har sin egen:
- Azure-resursgrupp
- Konfigurationsinställningar
- Distributionsstatus

### Tjänster
Tjänster är byggstenarna i din applikation:
- **Frontend** - Webbapplikationer, SPAs
- **Backend** - API:er, mikrotjänster
- **Databas** - Databaslösningar
- **Lagring** - Fil- och bloblagring

## Nyckelfunktioner

### 1. Mallbaserad Utveckling
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastruktur som Kod
- **Bicep** - Azures domänspecifika språk
- **Terraform** - Multimolninfrastrukturverktyg
- **ARM-mallar** - Azure Resource Manager-mallar

### 3. Integrerade Arbetsflöden
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Miljöhantering
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
Huvudkonfigurationsfilen för projektet:
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
Miljöspecifik konfiguration:
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

## 🎪 Vanliga Arbetsflöden

### Starta ett Nytt Projekt
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Utvecklingscykel
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

## Förstå `azd down --force --purge`
Kommandot `azd down --force --purge` är ett kraftfullt sätt att helt ta bort din azd-miljö och alla associerade resurser. Här är en genomgång av vad varje flagga gör:
```
--force
```
- Hoppar över bekräftelsefrågor.
- Användbart för automatisering eller skript där manuell inmatning inte är möjlig.
- Säkerställer att nedmonteringen fortsätter utan avbrott, även om CLI upptäcker inkonsekvenser.

```
--purge
```
Raderar **all associerad metadata**, inklusive:
Miljöstatus
Lokal `.azure`-mapp
Cachelagrad distributionsinformation
Förhindrar att azd "kommer ihåg" tidigare distributioner, vilket kan orsaka problem som felaktiga resursgrupper eller föråldrade registerreferenser.

### Varför använda båda?
När du har stött på problem med `azd up` på grund av kvarvarande status eller delvisa distributioner, säkerställer denna kombination en **ren start**.

Det är särskilt användbart efter manuella resursborttagningar i Azure-portalen eller vid byte av mallar, miljöer eller namngivningskonventioner för resursgrupper.

### Hantera Flera Miljöer
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

## 🧭 Navigationskommandon

### Upptäckt
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Projektledning
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Övervakning
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Bästa Praxis

### 1. Använd Meningsfulla Namn
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Utnyttja Mallar
- Börja med befintliga mallar
- Anpassa efter dina behov
- Skapa återanvändbara mallar för din organisation

### 3. Miljöisolering
- Använd separata miljöer för utveckling/staging/produktion
- Distribuera aldrig direkt till produktion från lokal maskin
- Använd CI/CD-pipelines för produktionsdistributioner

### 4. Konfigurationshantering
- Använd miljövariabler för känslig data
- Håll konfigurationen under versionskontroll
- Dokumentera miljöspecifika inställningar

## Lärandeprogression

### Nybörjare (Vecka 1-2)
1. Installera azd och autentisera
2. Distribuera en enkel mall
3. Förstå projektstruktur
4. Lär dig grundläggande kommandon (up, down, deploy)

### Mellannivå (Vecka 3-4)
1. Anpassa mallar
2. Hantera flera miljöer
3. Förstå infrastrukturkod
4. Ställ in CI/CD-pipelines

### Avancerad (Vecka 5+)
1. Skapa egna mallar
2. Avancerade infrastrukturmönster
3. Multiregiondistributioner
4. Konfigurationer för företag

## Nästa Steg

**📖 Fortsätt Kapitel 1 Lärande:**
- [Installation & Konfiguration](installation.md) - Installera och konfigurera azd
- [Ditt Första Projekt](first-project.md) - Komplett praktisk handledning
- [Konfigurationsguide](configuration.md) - Avancerade konfigurationsalternativ

**🎯 Redo för Nästa Kapitel?**
- [Kapitel 2: AI-Driven Utveckling](../ai-foundry/azure-ai-foundry-integration.md) - Börja bygga AI-applikationer

## Ytterligare Resurser

- [Översikt över Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Mallgalleri](https://azure.github.io/awesome-azd/)
- [Community-exempel](https://github.com/Azure-Samples)

---

**Kapitelnavigation:**
- **📚 Kursens Startsida**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 1 - Grundläggande & Snabbstart  
- **⬅️ Föregående**: [Kursöversikt](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Nästa**: [Installation & Konfiguration](installation.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-Driven Utveckling](../ai-foundry/azure-ai-foundry-integration.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.