# AZD Grunder - Kärnkoncept och Grunder

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För Nybörjare](../../README.md)
- **📖 Aktuellt Kapitel**: Kapitel 1 - Grundläggande & Snabbstart
- **⬅️ Föregående**: [Kursöversikt](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Nästa**: [Installation & Konfiguration](installation.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-First Utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

> Granskad mot `azd 1.37.2` (november 2026). Bash-kommandon använder citerade platshållare som du måste ersätta. Mallarbetsflöden använder `.` för att initiera aktuell katalog; utan argument för katalog skapar mallinitiering en undermapp och ändrar inte ditt shells arbetskatalog. Avancerade kodsnuttar är illustrativa, inte kompletta projekt.

Den här lektionen introducerar dig för Azure Developer CLI (azd), ett kraftfullt kommandoradsverktyg som snabbar upp din resa från lokal utveckling till Azure-distribution. Du kommer att lära dig grundläggande begrepp, kärnfunktioner och förstå hur azd förenklar molnbaserad applikationsdistribution.

## Lärandemål

I slutet av denna lektion kommer du att:
- Förstå vad Azure Developer CLI är och dess huvudsakliga syfte
- Lära dig kärnkoncepten mallar, miljöer och tjänster
- Utforska nyckelfunktioner inklusive mallstyrd utveckling och Infrastructure as Code
- Förstå azd-projektstruktur och arbetsflöde
- Vara förberedd på att installera och konfigurera azd för din utvecklingsmiljö

## Läranderesultat

Efter avslutad lektion kommer du kunna:
- Förklara azds roll i moderna molnutvecklingsarbetsflöden
- Identifiera komponenterna i en azd-projektstruktur
- Beskriva hur mallar, miljöer och tjänster fungerar tillsammans
- Förstå fördelarna med Infrastructure as Code med azd
- Känna igen olika azd-kommandon och deras syften

## Vad är Azure Developer CLI (azd)?

Azure Developer CLI (azd) är ett kommandoradsverktyg designat för att påskynda din resa från lokal utveckling till Azure-distribution. Det förenklar processen att bygga, distribuera och hantera molnbaserade applikationer på Azure.

### Vad kan du distribuera med azd?

azd stödjer ett brett spektrum av arbetsbelastningar—och listan växer hela tiden. Idag kan du använda azd för att distribuera:

| Typ av arbetsbelastning | Exempel | Samma arbetsflöde? |
|---------------|----------|----------------|
| **Traditionella applikationer** | Webbappar, REST API:er, statiska sajter | ✅ `azd up` |
| **Tjänster och mikrotjänster** | Container-apps, Funktionsappar, multifunktions-backends | ✅ `azd up` |
| **AI-driven applikationer** | Chattappar med Microsoft Foundry Models, RAG-lösningar med AI-sökning | ✅ `azd up` |
| **Intelligenta agenter** | Foundry-hostade agenter, multi-agent orkestringar | ✅ `azd up` |

Den viktiga insikten är att **azds livscykel förblir densamma oavsett vad du distribuerar**. Du initierar ett projekt, provisionerar infrastruktur, distribuerar din kod, övervakar din app och städar upp—oavsett om det är en enkel webbplats eller en sofistikerad AI-agent.

Denna kontinuitet är avsiktlig. azd behandlar AI-funktioner som en annan typ av tjänst din applikation kan använda, inte som något fundamentalt annorlunda. En chat-endpunkt som stöds av Microsoft Foundry Models är, ur azds perspektiv, bara en annan tjänst att konfigurera och distribuera.

### 🎯 Varför använda AZD? En verklig jämförelse

Låt oss jämföra distributionen av en enkel webbapp med databas:

#### ❌ UTAN AZD: Manuell Azure-distribution (30+ minuter)

**Illustrativ Bash-jämförelse, inte en körbar applikationsstartare.** Antar befintlig applikationskod, unika resursnamn, Azure CLI-autentisering och eventuella nödvändiga CLI-tillägg. Använd mallövningen nedan för det stödjade ända-till-ända-scenariot.

```bash
# Step 1: Create resource group
az group create --name myapp-rg --location eastus

# Step 2: Create App Service Plan
az appservice plan create --name myapp-plan \
  --resource-group myapp-rg \
  --sku B1 --is-linux

# Step 3: Create Web App
az webapp create --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --plan myapp-plan \
  --runtime "NODE:22-lts"

# Step 4: Create Cosmos DB account (10-15 minutes)
az cosmosdb create --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --kind MongoDB

# Step 5: Create database
az cosmosdb mongodb database create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --name tododb

# Step 6: Create collection
az cosmosdb mongodb collection create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --database-name tododb \
  --name todos

# Step 7: Get connection string
CONN_STR=$(az cosmosdb keys list \
  --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --type connection-strings \
  --query "connectionStrings[0].connectionString" -o tsv)

# Step 8: Configure app settings
az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings MONGODB_URI="$CONN_STR"

# Step 9: Enable logging
az webapp log config --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --application-logging filesystem \
  --detailed-error-messages true

# Step 10: Set up Application Insights
az monitor app-insights component create \
  --app myapp-insights \
  --location eastus \
  --resource-group myapp-rg

# Step 11: Link App Insights to Web App
INSTRUMENTATION_KEY=$(az monitor app-insights component show \
  --app myapp-insights \
  --resource-group myapp-rg \
  --query "instrumentationKey" -o tsv)

az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings APPINSIGHTS_INSTRUMENTATIONKEY="$INSTRUMENTATION_KEY"

# Step 12: Build application locally
npm install
npm run build

# Step 13: Create deployment package
zip -r app.zip . -x "*.git*" "node_modules/*"

# Step 14: Deploy application
az webapp deployment source config-zip \
  --resource-group myapp-rg \
  --name myapp-web-unique123 \
  --src app.zip

# Step 15: Wait and pray it works 🙏
# (No automated validation, manual testing required)
```

**Problem:**
- ❌ 15+ kommandon att komma ihåg och köra i ordning
- ❌ 30-45 minuters manuellt arbete
- ❌ Lätt att göra misstag (stavfel, fel parametrar)
- ❌ Uppgifter kräver uttrycklig hantering; felsökningsloggar och shellspårning kan exponera dem
- ❌ Ingen automatisk återgång om något misslyckas
- ❌ Svårt att reproducera för teammedlemmar
- ❌ Varierar varje gång (inte reproducerbart)

#### ✅ MED AZD: Automatiserad distribution (5 kommandon, 10-15 minuter)

```bash
# Step 1: Initialize from template
azd init --template todo-nodejs-mongo .

# Step 2: Authenticate
azd auth login

# Step 3: Select the environment created during init
azd env select dev

# Step 4: Preview changes (optional but recommended)
azd provision --preview

# Step 5: Deploy everything
azd up

# ✨ Done! Everything is deployed, configured, and monitored
```

**Fördelar:**
- ✅ **5 kommandon** vs. 15+ manuella steg
- ✅ **10-15 minuter** totalt (mest väntetid på Azure)
- ✅ **Färre manuella misstag** - konsekvent, mallstyrt arbetsflöde
- ✅ **Säker hantering av hemligheter** - många mallar använder Azure-hanterad hemlagring
- ✅ **Repeterbara distributioner** - samma arbetsflöde varje gång
- ✅ **Repeterbara infrastrukturbeskrivningar** - beroende på kvoter, regiontillgänglighet och mallversioner
- ✅ **Teamredo** - vem som helst kan distribuera med samma kommandon
- ✅ **Infrastructure as Code** - versionskontrollerade Bicep-mallar
- ✅ **Mall-definierad övervakning** - Application Insights om det ingår i mallen

### Tid och Tillförlitlighet

Tidsuppskattningarna ovan är inte riktmärken. azd minskar antalet kommandon du måste koordinera men garanterar inte distributionslängd, eliminerar inte fel eller ger automatisk återställning av applikation/databas. Behåll fungerande versioner i källkontroll och testa återställningsprocedurer.

## Kärnkoncept

### Mallar
Mallar är grunden för azd. De innehåller:
- **Applikationskod** - Din källkod och beroenden
- **Infrastrukturbeskrivningar** - Azure-resurser definierade i Bicep eller Terraform
- **Konfigurationsfiler** - Inställningar och miljövariabler
- **Distributionsskript** - Automatiserade distributionsarbetsflöden

### Miljöer
Miljöer representerar olika distributionsmål:
- **Utveckling** - För testning och utveckling
- **Staging** - Förproduktionsmiljö
- **Produktion** - Live produktionsmiljö

Varje miljö har sin egen:
- Miljönamn och värden; resursisolering beror på infrastrukturmallen
- Konfigurationsinställningar
- Distributionsstatus

### Tjänster
Tjänster i `azure.yaml` beskriver distribuerbara applikationskomponenter:
- **Frontend** - Webbapplikationer, SPA:er
- **Backend** - API:er, mikrotjänster

Databaser och lagring provisioneras normalt som infrastruktursresurser, inte som påhittade tjänsthosts såsom `host: postgres`.

## Nyckelfunktioner

### 1. Mallstyrd Utveckling
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template "<template-name>" .
```

### 2. Infrastructure as Code
- **Bicep** - Azures domänspecifika språk
- **Terraform** - Multi-molninfrastrukturverktyg
- Bicep kompileras till ARM-mallar; rå ARM JSON är inte en separat inbyggd `infra.provider`.

### 3. Integrerade Arbetsflöden
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup

# 🧪 NEW: Preview infrastructure changes before deployment (SAFE)
azd provision --preview    # Simulate infrastructure deployment without making changes

azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

#### 🛡️ Säker Infrastrukturplanering med Preview
Kommandot `azd provision --preview` är en revolutionerande funktion för säkra distributioner:
- **Dry-run-analys** - Visar vad som kommer skapas, modifieras eller tas bort
- **Ingen tillämpning av infrastruktur** - Granskar ändringar; inspektera projektkrokar först, då krokar kan köra kommandon med sidoeffekter
- **Samarbete i team** - Dela previewresultat före distribution
- **Kostnadsplanering** - Inspektera föreslagna SKU:er, sedan prissätt med Azure Pricing Calculator; preview räknar inte ut priser

```bash
# Example preview workflow
azd provision --preview           # See what will change
# Review the output, discuss with team
azd provision                     # Apply changes with confidence
```

### 📊 Visualisering: AZD Utvecklingsarbetsflöde

```mermaid
graph LR
    %% Initialization Phase
    subgraph Setup & Init
        A[azd init] -->|Initialize project| B[azd auth login]
        B -->|Authenticate| C[azd env new]
        C -->|Create environment| D{First deployment?}
    end

    %% Deployment Phase
    D -->|Yes| E[azd up]
    D -->|No| F[azd provision --preview]
    
    F -->|Review changes| G[azd provision]
    
    %% Operational Phase
    E -->|Provisions & deploys| H((Resources running))
    G -->|Updates infrastructure| H
    
    H -->|Monitor logs/metrics| I[azd monitor]
    
    %% Daily Dev Loop
    J[azd deploy] -->|Redeploy code only| H
    H -->|Make code changes| J
    
    %% Cleanup
    H -->|Teardown resources| K[azd down]

    %% Styling
    style A fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    style E fill:#c8e6c9,stroke:#2e7d32,stroke-width:2px
    style F fill:#fff9c4,stroke:#fbc02d,stroke-width:2px
    style H fill:#d1c4e9,stroke:#512da8,stroke-width:2px
    style J fill:#e1f5fe,stroke:#01579b,stroke-width:1px
    style K fill:#ffcdd2,stroke:#c62828,stroke-width:2px
```

**Arbetsflödesförklaring:**
1. **Initiera** - Starta med mall eller nytt projekt
2. **Auth** - Autentisera med Azure
3. **Miljö** - Skapa isolerad distributionsmiljö
4. **Preview** - 🆕 Förhandsgranska alltid infrastrukturändringar först (säker praxis)
5. **Provision** - Skapa/uppdatera Azure-resurser
6. **Distribuera** - Skicka din applikationskod
7. **Övervaka** - Följ applikationsprestanda
8. **Iterera** - Gör ändringar och distribuera om koden
9. **Rensa upp** - Ta bort resurser när klara

### 4. Miljöhantering
```bash
# Create and manage environments
azd env new "<environment-name>"
azd env select "<environment-name>"
azd env list
```

### 5. Tillägg och AI-kommandon

azd använder ett tilläggssystem för att lägga till funktioner utöver kärn-CLI:n. Detta är särskilt användbart för AI-arbetsbelastningar:

```bash
# List available extensions
azd extension list

# Install the GA Foundry bundle (requires azd >= 1.37.0)
azd ext install microsoft.foundry

# Initialize an AI agent project interactively
azd ai agent init

# Test a deployed agent (shows latency and time-to-first-byte)
azd ai agent invoke

# Start the MCP server for AI-assisted development (Alpha)
azd mcp start
```

**Agentens livscykel, från början till slut.** GA `microsoft.foundry`-paketet inkluderar `azure.ai.agents` och sex andra kärntillägg. Installera `azure.ai.evaluations` separat för utvärdering. Använd `azd >= 1.37.0` för detta arbetsflöde. Du behöver inte alla dessa vid dag ett:

| Steg | Kommando | Vad det gör |
|-------|---------|--------------|
| **Skapa grundmall** | `azd ai agent init --template <path-to-azure.yaml>` | Anta en aktuell agentprojektmall |
| **Kör lokalt** | `azd ai agent run`, sedan `azd ai agent invoke --local "Test prompt"` i en annan terminal | Inspektera lokal aktivitet i Agent Inspector; modellanrop använder fortfarande Azure |
| **Distribuera** | `azd deploy` | För kodlägehostade agenter, ladda upp källkod för en fjärrbyggnad i Foundry |
| **Testa** | `azd ai agent invoke` | Anropa agenten och visa svarstid |
| **Mät** | `azd ai eval init`, `generate`, `run start` | Konfigurera, distribuera och kör utvärderingar med separata tillägget |
| **Förbättra** | `azd ai agent optimize --eval <evaluation-name> --optimize-model <optimizer-deployment>` | Återanvänd kompatibel utvärdering för att optimera agenten |
| **Inspektera** | `azd ai agent endpoint show` | Visa livekonfiguration av endpoint |
| **Rensa upp** | `azd ai agent delete` | Ta bort en hostad agent och alla dess versioner |

> Börja med [GA hosted-agent genomgång](../chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga), som täcker förutsättningar, provisionering och säker uppstädning. Tillägg behandlas mer i [AZD AI CLI-kommandon](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) referensen.

## 📁 Projektstruktur

En typisk azd-projektstruktur:
```
my-app/
├── .azure/                  # Local environments and selected-environment config
│   ├── config.json
│   └── dev/.env
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
Projektlokal val av standardmiljö (illustrativ; hanteras av azd):
```json
{
  "defaultEnvironment": "dev"
}
```

## 🎪 Vanliga Arbetsflöden med Praktiska Övningar

> **💡 Lärtips:** Följ dessa övningar i ordning för att successivt bygga upp dina AZD-kunskaper.

### 🎯 Övning 1: Initiera ditt Första Projekt

**Mål:** Skapa ett AZD-projekt och utforska dess struktur

**Steg:**
```bash
# Use a proven template
mkdir azd-basics-practice
cd azd-basics-practice
# Choose "dev" for the environment name when prompted
azd init --template todo-nodejs-mongo .

# Explore the generated files
ls -la  # View all files including hidden ones

# Key files created:
# - azure.yaml (main config)
# - infra/ (infrastructure code)
# - src/ (application code)
```

**✅ Framgång:** Du har azure.yaml, infra/ och src/ kataloger

---

### 🎯 Övning 2: Distribuera till Azure

**Mål:** Slutför ända-till-ända-distribution

**Steg:**
```bash
# 1. Authenticate
azd auth login

# 2. Select the dev environment created in Exercise 1
azd env select dev
azd env set AZURE_LOCATION eastus

# 3. Preview changes (RECOMMENDED)
azd provision --preview

# 4. Deploy everything
azd up

# 5. Verify deployment
azd show    # View your app URL
```

**Förväntad tid:** 10-15 minuter  
**✅ Framgång:** Applikations-URL öppnas i webbläsare

---

### 🎯 Övning 3: Flera Miljöer

**Mål:** Distribuera till dev och staging

**Steg:**
```bash
# Already have dev, create staging
azd env new staging
azd env set AZURE_LOCATION westus2
azd up

# Switch between them
azd env list
azd env select dev
```

**✅ Framgång:** Två separata resursgrupper i Azure Portal

**Rensa upp:** Övning 3 skapar en andra debiterbar distribution. Ta bort båda när klara:

```bash
azd down --environment dev
azd down --environment staging
```

---

### 🛡️ Destruktiv Uppstädning: `azd down --force --purge`

När du avsiktligt vill ta bort valda miljöns Azure-resurser:

```bash
azd down --force --purge
```

**Vad den gör:**
- `--force`: Inga bekräftelsepromptar
- `--purge`: Tar även bort permanent stödda mjukborttagna resurser (t.ex. Key Vaults), där rensningsskydd tillåter. Tar inte bort lokal `.azure/` katalog.

**Använd när:** du är klar med en engångsmiljö. Använd inte destruktiv uppstädning som första svar på autentiserings-, kvot- eller konfigurationsfel.

---

## 🎪 Original Arbetsflödesreferens

### Starta ett Nytt Projekt
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo .

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
azd down --force --purge # Deletes this environment's discovered Azure resources; review before forcing deletion.
```

## Förstå `azd down --force --purge`
Kommandot `azd down --force --purge` är ett kraftfullt sätt att fullständigt riva ner din azd-miljö och alla tillhörande resurser. Här är en genomgång av vad varje flagga gör:
```
--force
```
- Hoppar över bekräftelsepromptar.
- Användbart för automatisering eller skript där manuell input inte är möjlig.
- Bypassar inte behörigheter, rensningsskydd eller borttagningsfel.

```
--purge
```
Tar permanent bort stödja mjukborttagna Azure-resurser utan ytterligare bekräftelse. Rensningsskydd och behörigheter gäller fortfarande. Tar **inte** bort lokala miljöer eller `.azure/` mappen.


### Varför använda båda?
Använd båda endast när du avser att ta bort valda miljöns Azure-resurser och rensa återhämtningsbara resurser. Detta är destruktiv uppstädning, inte allmän reparation eller återställning av lokalt tillstånd.

Det är särskilt användbart efter manuella borttagningar i Azure-portalen eller vid byte av mallar, miljöer eller namnkonventioner för resursgrupper.


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

## 🔐 Autentisering och Uppgifter

Skilj på distributionsautentisering (`azd auth login`) och applikations-SDK-autentisering (`DefaultAzureCredential`). De är separata. azd använder inte Azure CLI-uppgifter som standard.

### Azure CLI-autentisering (`az login`)

Kör `azd auth login` för azd. Följande Azure CLI-kommandon är valfria och autentiserar `az` kommandon separat:

```bash
# Interactive login (opens browser)
az login

# Login with specific tenant
az login --tenant "<tenant-id>"

# Login with service principal
az login --service-principal -u "<app-id>" -p "<password>" --tenant "<tenant-id>"

# Check current login status
az account show

# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Autentiseringsflöde
1. **Interaktiv inloggning**: Öppnar din standardwebbläsare för autentisering
2. **Device Code Flow**: För miljöer utan webbläsaråtkomst
3. **Service Principal**: För automatisering och CI/CD-scenarier
4. **Managed Identity**: För Azure-hostade applikationer

### DefaultAzureCredential Chain

`DefaultAzureCredential` är en behörighetstyp som erbjuder en förenklad autentiseringsupplevelse genom att automatiskt försöka flera behörighetskällor i en specifik ordning:

#### Application SDK Credential Chain

Den exakta kedjan beror på Azure Identity SDK-språk, version, installerade tillägg och alternativ. Denna diagram är konceptuell, inte en fast azd-autentiseringssekvens; nyare SDK:er kan också inkludera Azure Developer CLI-behörigheter.
```mermaid
graph TD
    A[DefaultAzureCredential] --> B[Environment Variables]
    B --> C[Workload Identity]
    C --> D[Managed Identity]
    D --> E[Visual Studio]
    E --> F[Visual Studio Code]
    F --> G[Azure CLI]
    G --> H[Azure PowerShell]
    H --> I[Interactive Browser]
```

#### 1. Miljövariabler
```bash
# Set environment variables for service principal
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. Workload Identity (Kubernetes/GitHub Actions)
Används automatiskt i:
- Azure Kubernetes Service (AKS) med Workload Identity
- GitHub Actions med OIDC-federation
- Andra federerade identitetsscenarier

#### 3. Managed Identity
För Azure-resurser som:
- Virtuella maskiner
- App Service
- Azure Functions
- Container Instances

```bash
# Inspect a deployed Container App's configured identity (requires az login)
az containerapp show --name "<app-name>" --resource-group "<rg-name>" --query identity
```

#### 4. Integration med utvecklingsverktyg
- **Visual Studio**: Använder automatiskt inloggad användare
- **VS Code**: Stöd beror på SDK och dess stödda broker/plugin-uppsättning
- **Azure CLI**: Använder `az login`-behörigheter (vanligast för lokal utveckling)

### AZD Autentiseringsupplägg

```bash
# Method 1: Direct azd authentication (recommended)
azd auth login

# Method 2: Direct azd authentication
azd auth login --use-device-code  # For headless environments

# Method 3: Check authentication status
azd auth login --check-status

# Method 4: Logout and re-authenticate
azd auth logout
azd auth login
```

### Bästa praxis för autentisering

#### För lokal utveckling
```bash
# 1. Log in to azd
azd auth login

# 2. Select the subscription for this initialized environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 3. Check azd sign-in details (read the status message)
azd auth login --check-status
```

#### För CI/CD-pipelines
```yaml
# Partial GitHub Actions steps: assumes checkout, azd installation,
# required AZURE_* environment values, and pipeline secret configuration.
- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### För produktionsmiljöer
- Använd **Managed Identity** när du kör på Azure-resurser
- Använd **Service Principal** för automatiseringsscenarier
- Undvik att lagra behörigheter i kod eller konfigurationsfiler
- Använd **Azure Key Vault** för känslig konfiguration

### Vanliga problem och lösningar vid autentisering

#### Problem: "Ingen prenumeration hittades"
```bash
# Solution: Set default subscription
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### Problem: "Otillräckliga behörigheter"
```bash
# Solution: Check and assign required roles
az role assignment list --assignee $(az account show --query user.name --output tsv)

# Common required roles:
# - Contributor (for resource management)
# - User Access Administrator (for role assignments)
```

#### Problem: "Token är utgången"
```bash
# Solution: Re-authenticate
az logout
az login
azd auth logout
azd auth login
```

### Autentisering i olika scenarier

#### Lokal utveckling
```bash
# Personal development account
az login
azd auth login
```

#### Teamutveckling
```bash
# Use specific tenant for organization
az login --tenant contoso.onmicrosoft.com
azd auth login --tenant-id "<tenant-id>"
```

#### Multi-tenant-scenarier
```bash
# Switch between tenants
az login --tenant tenant1.onmicrosoft.com
azd auth login --tenant-id "<tenant-1-id>"
# Select an environment configured with tenant 1's subscription
azd env select tenant1-dev
# Deploy to tenant 1
azd up

az login --tenant tenant2.onmicrosoft.com  
azd auth login --tenant-id "<tenant-2-id>"
azd env select tenant2-dev
# Deploy to tenant 2
azd up
```

### Säkerhetshänsyn

1. **Lagring av behörigheter**: Lagra aldrig behörigheter i källkod
2. **Begränsning av behörigheter**: Använd minst möjliga privilegier för service principals
3. **Rotering av token**: Rotera service principal-hemligheter regelbundet
4. **Revisionsspår**: Övervaka autentiserings- och distributionsaktiviteter
5. **Nätverkssäkerhet**: Använd privata ändpunkter när det är möjligt

### Felsökning vid autentisering

```bash
# Debug authentication issues
azd auth login --check-status
az account show
az account get-access-token

# Common diagnostic commands
whoami                          # Current user context
az ad signed-in-user show      # Microsoft Entra ID user details
az group list                  # Test resource access
```

## Kommando Upptäckt

### Upptäckt
```bash
azd template list              # Browse templates
azd template list --help       # Template discovery options
azd init --help               # Initialization options
```

### Projektledning
```bash
azd show                     # Project overview
azd env list                # Available environments and selected default
azd config show            # Configuration settings
```

### Övervakning
```bash
azd monitor                  # Open Azure portal monitoring
azd monitor --logs           # View application logs
azd monitor --live           # View live metrics
azd pipeline config          # Set up CI/CD
```

## Bästa praxis

### 1. Använd Meningfulla Namn
```bash
# Good
azd env new production-east
azd init --template todo-nodejs-mongo .

# Avoid
azd env new env1
azd init --template template1 .
```

### 2. Använd Mallar
- Börja med befintliga mallar
- Anpassa efter dina behov
- Skapa återanvändbara mallar för din organisation

### 3. Miljöisolation
- Använd separata miljöer för utveckling/test/produktion
- Distribuera aldrig direkt till produktion från lokal maskin
- Använd CI/CD-pipelines för produktionsdistribution

### 4. Konfigurationshantering
- Använd managed identity och Key Vault för hemligheter; vanliga `azd env set` värden är lokalt klartext
- Håll konfigurationen i versionskontroll
- Dokumentera miljöspecifika inställningar

## Lärande Progression

### Nybörjare (Vecka 1-2)
1. Installera azd och autentisera
2. Distribuera en enkel mall
3. Förstå projektstruktur
4. Lära sig grundläggande kommandon (up, down, deploy)

### Mellannivå (Vecka 3-4)
1. Anpassa mallar
2. Hantera flera miljöer
3. Förstå infrastrukturkod
4. Sätt upp CI/CD-pipelines

### Avancerad (Vecka 5+)
1. Skapa egna mallar
2. Avancerade infrastrukturmönster
3. Multi-region-distributioner
4. Företagsklass-konfigurationer

## Nästa Steg

**📖 Fortsätt Kapitel 1 Lärande:**
- [Installation & Setup](installation.md) - Få azd installerat och konfigurerat
- [Ditt Första Projekt](first-project.md) - Slutför praktisk handledning
- [Konfigurationsguide](../chapter-03-configuration/configuration.md) - Avancerade konfigurationsalternativ

**🎯 Redo för nästa kapitel?**
- [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md) - Börja bygga AI-applikationer

## Ytterligare Resurser

- [Azure Developer CLI Översikt](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Mallgalleri](https://azure.github.io/awesome-azd/)
- [Community Exempel](https://github.com/Azure-Samples)

---

## 🙋 Vanliga Frågor

### Generella Frågor

**F: Vad är skillnaden mellan AZD och Azure CLI?**

S: Azure CLI (`az`) är för att hantera individuella Azure-resurser. AZD (`azd`) är för att hantera hela applikationer:

```bash
# Azure CLI - Low-level resource management
az webapp create --name myapp --resource-group rg
az sql server create --name myserver --resource-group rg
# ...many more commands needed

# AZD - Application-level management
azd up  # Deploys entire app with all resources
```

**Tänk på det så här:**
- `az` = Arbeta med enskilda Legobitar
- `azd` = Arbeta med kompletta Lego-set

---

**F: Måste jag kunna Bicep eller Terraform för att använda AZD?**

S: Nej! Börja med mallar:
```bash
# Use existing template - no IaC knowledge needed
azd init --template todo-nodejs-mongo .
azd up
```

Du kan lära dig Bicep senare för att anpassa infrastrukturen. Mallar ger fungerande exempel att lära sig från.

---

**F: Hur mycket kostar det att köra AZD-mallar?**

S: Kostnader varierar beroende på region, SKU, upptid, databasmode och modellanvändning. En utvecklingsmiljö kan medföra betydande månatliga kostnader även när den är inaktiv; anta inte ett generellt spann på 50-150 USD:

```bash
# Preview resource changes (not prices)
azd provision --preview

# Always cleanup when not using
azd down --force --purge  # Removes all resources
```

**Proffstips:** Använd gratisnivåer där de finns:
- App Service: F1 (Gratis) nivå
- Azure OpenAI: ingen generell garanterad månadsfri tokenskvot; kontrollera nuvarande modell och erbjudandepriser
- Cosmos DB: berättigade konton med provisionerad kapacitet kan välja gratisnivå; serverlösa mallar kvalificerar sig inte automatiskt

---

**F: Kan jag använda AZD med befintliga Azure-resurser?**

S: Ja, men det är enklare att börja från början. AZD fungerar bäst när det hanterar hela livscykeln. För befintliga resurser:

```bash
# Option 1: Import existing resources (advanced)
azd init
# Then modify infra/ to reference existing resources

# Option 2: Start fresh (recommended)
azd init --template "<verified-template-name>" .
azd up  # Creates new environment
```

---

**F: Hur delar jag mitt projekt med teammedlemmar?**

S: Commit:a AZD-projektet till Git (men INTE .azure-mappen):

```bash
# Already in .gitignore by default
.azure/        # Contains secrets and environment data
*.env          # Environment variables

# Team members then:
git clone "<your-repo>"
# Change into the cloned repository before running the remaining commands.
azd auth login
azd env new "<their-name>-dev"
azd up
```

Alla får identisk infrastruktur från samma mallar.

---

### Felsökningsfrågor

**F: "azd up" misslyckades halvvägs. Vad gör jag?**

S: Kontrollera felet, åtgärda det och försök igen:

```bash
# Capture detailed diagnostics (redact sensitive values before sharing)
azd up --debug

# Common fixes:

# 1. If quota exceeded:
azd env set AZURE_LOCATION "westus2"  # Try different region

# 2. If resource name conflict:
azd down --force --purge  # Clean slate
azd up  # Retry

# 3. If auth expired:
az login
azd auth login
azd up
```

**Vanligaste problemet:** Fel Azure-prenumeration vald
```bash
az account list --output table
az account set --subscription "<correct-subscription>"
azd env set AZURE_SUBSCRIPTION_ID "<correct-subscription-id>"
```

---

**F: Hur distribuerar jag bara kodändringar utan reprovisionering?**

S: Använd `azd deploy` istället för `azd up`:

```bash
azd up          # First time: provision + deploy (slow)

# Make code changes...

azd deploy      # Subsequent times: deploy only (fast)
```

Jämförelse av hastighet:
- `azd up`: 10-15 minuter (provisionerar infrastruktur)
- `azd deploy`: 2-5 minuter (bara kod)

---

**F: Kan jag anpassa infrastrukturmallarna?**

S: Ja! Redigera Bicep-filerna i `infra/`:

```bash
# After azd init
cd infra/
code main.bicep  # Edit in VS Code

# Preview changes
azd provision --preview

# Apply changes
azd provision
```

**Tips:** Börja smått - ändra SKU:er först:
```bicep
// infra/main.bicep
sku: {
  name: 'B1'  // Change to 'P1V2' for production
}
```

---

**F: Hur tar jag bort allt som AZD har skapat?**

S: Ett kommando tar bort alla resurser:

```bash
azd down --force --purge

# This deletes:
# - Azure resources/resource groups discovered for the selected environment
# - Supported soft-deleted resources, if purge protection allows
# Local .azure files remain; shared/external resources may remain too.
```

**Kör alltid detta när:**
- Du är klar med att testa en mall
- Byter till ett annat projekt
- Vill börja om från början

**Kostnadskontroll:** Bekräfta borttagning i Azure och kontrollera för kvarhållna/delade resurser. Tidigare uppkomna kostnader gäller fortfarande.

---

**F: Vad händer om jag råkade ta bort resurser i Azure Portal?**

S: AZD-tillstånd kan hamna i osynk. Använd "Clean slate"-metoden:

```bash
# 1. Delete remaining resources only if that is your intent
azd down --force --purge

# 2. Start fresh
azd up

# Alternative: Let AZD detect and fix
azd provision  # Will create missing resources
```

---

### Avancerade frågor

**F: Kan jag använda AZD i CI/CD-pipelines?**

S: Ja! Exempel med GitHub Actions:

```yaml
# .github/workflows/deploy.yml
name: Deploy with AZD

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Install azd
        run: curl -fsSL https://aka.ms/install-azd.sh | bash
      
      - name: Azure Login
        run: |
          azd auth login \
            --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        env:
          AZURE_ENV_NAME: dev
          AZURE_LOCATION: ${{ vars.AZURE_LOCATION }}
          AZURE_SUBSCRIPTION_ID: ${{ vars.AZURE_SUBSCRIPTION_ID }}
        run: azd up --no-prompt
```

---

**F: Hur hanterar jag hemligheter och känsliga data?**

S: Använd Key Vault explicit. `azd env set` skriver vanliga värden till lokal miljöfil; den skapar inte automatiskt en vault, tilldelar roller eller injicerar hemligheter i din applikation.

```bash
# Interactive: create/select a Key Vault secret and save its reference
azd env set-secret DATABASE_PASSWORD
```

Du behöver lämpliga behörigheter för vaulten. Din infrastruktur/applikation måste fortfarande koppla hemligheten till dess konsument och ge runtime-identiteten åtkomst. Skriv inte ut upplösta hemlighetsvärden i loggar.

**Spara aldrig till:**
- `.azure/`-mappen (innehåller miljödata)
- `.env`-filer (lokala hemligheter)
- Anslutningssträngar

---

**F: Kan jag distribuera till flera regioner?**

S: Ja, skapa en miljö per region:

```bash
# East US environment
azd env new prod-eastus
azd env set AZURE_LOCATION eastus
azd up

# West Europe environment
azd env new prod-westeurope
azd env set AZURE_LOCATION westeurope
azd up

# Each environment is independent
azd env list
```

För verkliga multi-region-appar, anpassa Bicep-mallar för samtidig distribution till flera regioner.

---

**F: Var kan jag få hjälp om jag fastnar?**

1. **AZD Dokumentation:** https://learn.microsoft.com/azure/developer/azure-developer-cli/
2. **GitHub Issues:** https://github.com/Azure/azure-dev/issues
3. **Discord:** [Azure Discord](https://discord.gg/microsoft-azure) - #azure-developer-cli kanal
4. **Stack Overflow:** Tagg `azure-developer-cli`
5. **Denna Kurs:** [Felsökningsguide](../chapter-07-troubleshooting/common-issues.md)

**Proffstips:** Innan du frågar, kör:
```bash
azd show       # Shows current state
azd version    # Shows your version
```
Inkludera denna info i din fråga för snabbare hjälp.

---

## 🎓 Vad är nästa?

Du förstår nu grunderna i AZD. Välj din väg:

### 🎯 För nybörjare:
1. **Nästa:** [Installation & Setup](installation.md) - Installera AZD på din maskin
2. **Sen:** [Ditt Första Projekt](first-project.md) - Distribuera din första app
3. **Öva:** Slutför alla 3 övningarna i denna lektion

### 🚀 För AI-utvecklare:
1. **Hoppa till:** [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
2. **Distribuera:** I en tom projektmapp, börja med `azd init --template get-started-with-ai-chat .`
3. **Lär:** Bygg medan du distribuerar

### 🏗️ För erfarna utvecklare:
1. **Granska:** [Konfigurationsguide](../chapter-03-configuration/configuration.md) - Avancerade inställningar
2. **Utforska:** [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md) - Djupdykning i Bicep
3. **Bygg:** Skapa egna mallar för din stack

---

**Kapitelnavigering:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 1 - Grund & Snabbstart  
- **⬅️ Föregående**: [Kursöversikt](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Nästa**: [Installation & Setup](installation.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->